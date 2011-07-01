require 'logger'
require 'net/https'
require 'rubygems'
require 'hpricot'
require 'movistar_wrappers/movistar_localizame'

puts( "-------------------------------" )
puts( "accediendo a API" )
puts( "-------------------------------" )
location = MovistarLocalizame.get_location( '600600600', 'xxx' )
puts( "LOCATION:" + location )

cp = MovistarLocalizame.parse_cp( location )
puts( "CP:" + cp )

##
## testeando el parser usando un html estático
##
#puts( "-------------------------------" )
#puts( "parseando localizacion desde html estático" )
#puts( "-------------------------------" )
#html = IO::readlines( '../doc/localizame/buscar.do.html', nil )[0]
#location = MovistarLocalizame.parse_location( html )
#puts( 'location:' + location )
#
##
## testeando el parser de codigo postal usando un html estático
##
#puts( "-------------------------------" )
#puts( "parseando localizacion desde html estático" )
#puts( "-------------------------------" )
#html = IO::readlines( '../doc/localizame/buscar.do.html', nil )[0]
#cp = MovistarLocalizame.parse_cp( location )
#puts( 'cp:' + cp )



