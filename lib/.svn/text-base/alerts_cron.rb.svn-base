class AlertsCron
  def run
    logger = Logger.new( STDOUT )
    logger.level = Logger::DEBUG
    
    #
    # recogemos todos los usuarios
    #
    users = User.find(:all)

    # recorremos los usuarios
    users.each do |user|
      
      logger.debug( 'localizando al usuario:' + user.id.to_s )
      
      # preguntamos por su localización actual
      # y ya de paso la almacenamos
      location = Location.new
      
      begin
        #
        # usamos la api de localizame de movistar
        #
        localizame_location =
          MovistarLocalizame.get_location( 
            user.phone,
            user.password_localizame
          )
          
        location.address = localizame_location
        
        #
        # apartir del cp conseguimos sus coordenadas
        # usando la gema google-geocode
        # 
        # TODO: afinar esta localización
        #
        cp = MovistarLocalizame.parse_cp( localizame_location )
        gg = GoogleGeocode.new ApplicationController::GOOGLE_GEO_API
        geo_location = gg.locate( cp + ", spain" )    # codigo postal de españa
        
        location.latitude = geo_location.latitude.to_s
        location.longitude = geo_location.longitude.to_s
        location.error = false
        logger.debug( "localización correcta del usuario: #{user.id}" )
      rescue
        logger.error( "algún error se ha producido al localizar al usuario: #{user.id}, #{$!}" )
        location.address = $!
        location.latitude = '-1'
        location.longitude = '-1'
        location.error = true
      end

      location.user_id = user.id
      location.date = Time.now
      location.save
      
      # si no ha habido ningún error al conseguir la localización del usuario
      # recorremos todas sus alertas activas
      # buscamos colisiones con su localización actual
      # y enviamos las alertas pertinentes
      if( not location.error )
        logger.debug( "comprobando alertas/colisiones del usuario: #{user.id}" )
        user.alerts.find(:all, :conditions => { :status => Alert::STATUS_ACTIVE } ).each do |alert|
          collision = 
            GeoAlertsUtil.collision(
              location.latitude.to_f,
              location.longitude.to_f,
              alert.latitude.to_f,
              alert.longitude.to_f,
              alert.radius
            )
          if collision
            logger.info( "enviando alerta de colisión al usuario: #{user.id} de la alerta: #{alert.id}" )
            GeoAlertsUtil.send_alert( alert )
          end
        end
      end
    end
  end
end