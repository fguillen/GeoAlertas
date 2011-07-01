class GeoAlertsUtil
  
  #
  # ruby fork of:
  # http://snipplr.com/view/2531/calculate-the-distance-between-two-coordinates-latitude-longitude/
  #
  # recive dos posiciones (lat1, lng1) y (lat2, lng2) 
  # en formato: lat: 40.390757, lng: -3.732715
  #
  # probar con: http://www.gpsies.com/coordinate.do
  # o con: http://pagesperso-orange.fr/universimmedia/geo/loc.htm
  #
  # retorna la distancia entre los puntos en METROS
  #
  # ej: GeoAlertsUtil.distance(40.390754,-3.732509, 40.387506, -3.668138)
  #
  def self.distance( lat1, lng1, lat2, lng2 )
    pi80 = Math::PI / 180
    lat1 *= pi80
    lng1 *= pi80
    lat2 *= pi80
    lng2 *= pi80

    r = 6372.797;            # mean radius of Earth in km
    dlat = lat2 - lat1
    dlng = lng2 - lng1
    a = Math.sin(dlat / 2) * Math.sin(dlat / 2) + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dlng / 2) * Math.sin(dlng / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    km = r * c
    m = km * 1000
  end
  
  #
  # comprueba la colisión entre dos coordenadas.
  # en formato: lat: 40.390757, lng: -3.732715
  #
  # el radio es en metros
  #
  def self.collision( lat1, lng1, lat2, lng2, radius )
    m = GeoAlertsUtil.distance( lat1, lng1, lat2, lng2 )
    m <= radius
  end
  
  def self.send_alert( alert )
    logger = Logger.new( STDOUT )
    begin
      mss = MovistarSmsSender.new( alert.user.phone, alert.user.password_sms )
      mss.send( alert.user.phone, alert.text )
      logger.info( "alerta enviada, phone: #{alert.user.phone}, text: #{alert.text}")

      #
      # informamos del envío
      #
      delivery = 
        Delivery.new(
          :alert_id => alert.id ,
          :date => Time.now
        )
      delivery.save 
    rescue
      logger.error( "Error al enviar sms, #{$!}" )
    end
  end
    
end