#
# author: fernandoguillen.info
# date: 2008.05.12
#

#
# Implementación Ruby de la API Localizame de Movistar España
# 
# http://open.movilforum.com/node/308
#

#
# Esta clase accede vía https a la web de localizame
# Se autentifica y solicita la localización del teléfono del propio usuario
# 

#
# Para que funcione este servicio hay que enviar un SMS al 424 con la palabra 'clave'
# el servicio retornará un SMS con la clave y el servicio estará disponible
# durante 30 minutos.
#

#
# Tiene método para retornar el bloque rollo:
#
# “ANA está en MADRID en los Barrios de LA PAZ y ALMENARA cerca de CL DE SINESIO DELGADO, PO DE LA CASTELLANA, CP 28029. Precisión +/- 528 mts”
# “ANA está cerca de las carreteras M-103 Km 9, M-106 Km 2, M-111 Km 18 en ALGETE, MADRID, CP28110, Precisión +/- 780 mts”
# “ANA está cerca de las carreteras A-301 Km 7, en SANTA ELENA, JAEN, CP.23220, Precisión +/- 12.1 Kms” 
#
# ó directamente el Código Postal encontrado
#

class MovistarLocalizame
  
  #
  # recibe el login = teléfono y la pass = clave del servicio
  # localizame movistar y devuelve sólo el texto rollo:
  #
  # “ANA está en MADRID en los Barrios de LA PAZ y ALMENARA cerca de CL DE SINESIO DELGADO, PO DE LA CASTELLANA, CP 28029. Precisión +/- 528 mts”
  # “ANA está cerca de las carreteras M-103 Km 9, M-106 Km 2, M-111 Km 18 en ALGETE, MADRID, CP28110, Precisión +/- 780 mts”
  # “ANA está cerca de las carreteras A-301 Km 7, en SANTA ELENA, JAEN, CP.23220, Precisión +/- 12.1 Kms” 
  #
  def self.get_location(login, pass)
    logger = Logger.new( STDOUT )
    logger.level = Logger::INFO
    logger.debug( "iniciamos localizame, login:#{login}, pass:#{pass}")
    
    # urlS 
    url = "www.localizame.movistar.es"
    url_login = "/login.do"
    url_buscar = "/buscar.do"
  
    ## iniciamos conexión
    http = Net::HTTP.new(url, 443)
    http.use_ssl = true
  
    ## nos logueamos
    logger.debug( "login..." )
    data = "&usuario=#{login}&clave=#{pass}" 
    headers = {
      'User-Agent'    => 'Mozilla/4.0',
      'Content-Type'  => 'application/x-www-form-urlencoded',
      'Connection'    => 'Keep-Alive'
    }
    resp, data = http.post(url_login, data, headers)
    cookie = resp.response['set-cookie']
    cookie = cookie.sub(" Path=/, "," ")
    cookie = cookie.sub("; Domain=.movistar.es; Path=/","")
    cookie = cookie.rstrip
    
#    logger.debug( "resp:" + resp.to_s )
#    logger.debug( "data:" + data.to_s )
#    logger.debug( "cookie:" + cookie.to_s )

    ## buscamos nuestro número
    logger.debug( "buscando..." )
    data = "&telefono=#{login}" 
    headers = {
      'Cookie'        => cookie,
      'User-Agent'    => 'Mozilla/4.0',
      'Content-Type'  => 'application/x-www-form-urlencoded',
      'Connection'    => 'Keep-Alive'
    }
    resp, data = http.post(url_buscar, data, headers)
    
    logger.debug( "resp:" + resp.to_s )
    logger.debug( "resp.response.body:" + resp.response.body )
    logger.debug( "data:" + data.to_s )
    logger.debug( "cookie:" + cookie.to_s )
    
    MovistarLocalizame.parse_location( data )
  end

  #
  # recibe el html de la web del resultado del buscador de 
  # localizame movistar y devuelve sólo el texto rollo:
  #
  # “ANA está en MADRID en los Barrios de LA PAZ y ALMENARA cerca de CL DE SINESIO DELGADO, PO DE LA CASTELLANA, CP 28029. Precisión +/- 528 mts”
  # “ANA está cerca de las carreteras M-103 Km 9, M-106 Km 2, M-111 Km 18 en ALGETE, MADRID, CP28110, Precisión +/- 780 mts”
  # “ANA está cerca de las carreteras A-301 Km 7, en SANTA ELENA, JAEN, CP.23220, Precisión +/- 12.1 Kms” 
  #
  def self.parse_location( data )
    logger = Logger.new( STDOUT )
    logger.level = Logger::INFO
    logger.debug( 'parseando data...' )
    logger.debug( 'data:' + data )
    doc = Hpricot( data )
    location = nil
    if( not doc.search( "//input[@name='punto1']" ).first.nil? )
      location = doc.search( "//input[@name='punto1']" ).first.attributes['value']
      logger.debug( 'location:' + location )
    else
      logger.error( 'No hay bloque location. Esto es un error' )
    end
    
    #
    # excepción si no hay bloque location
    #
    raise "Error en acceso a Localizame" unless not location.nil?
    
    #
    # retornamos el bloque location
    #
    location
  end
  
  #
  # recibe una localizacón cogida de localizame movistar tipo:
  # 
  # “ANA está en MADRID en los Barrios de LA PAZ y ALMENARA cerca de CL DE SINESIO DELGADO, PO DE LA CASTELLANA, CP 28029. Precisión +/- 528 mts”
  # “ANA está cerca de las carreteras M-103 Km 9, M-106 Km 2, M-111 Km 18 en ALGETE, MADRID, CP28110, Precisión +/- 780 mts”
  # “ANA está cerca de las carreteras A-301 Km 7, en SANTA ELENA, JAEN, CP.23220, Precisión +/- 12.1 Kms” 
  #
  # y retorna sólo los 5 dígitos del códito postal
  #
  def self.parse_cp( location )
    logger = Logger.new( STDOUT )
    logger.level = Logger::INFO
    logger.debug( 'parseando cp...' )
    logger.debug( 'location:' + location )
    cp = location.match( /CP(.)?[0-9]+/ )[0]
    logger.debug( 'cp1:' + cp )
    cp = cp[-5..-1]                             # nos quedamos sólo con el codigo postal
    logger.debug( 'cp2:' + cp )
    cp
  end

end