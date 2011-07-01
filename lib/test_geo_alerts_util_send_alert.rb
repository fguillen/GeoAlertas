require File.dirname(__FILE__) + '/../test/test_helper'

puts( '--------------------------' )
puts( 'enviar alerta' )
puts( '--------------------------' )
GeoAlertsUtil.send_alert( Alert.new )