class InsertDevelopData < ActiveRecord::Migration
  def self.up
    #
    # users
    #
    User.delete_all
    
    user = 
      User.new(
        :id => 1,
        :phone => '600600600',
        :password_localizame => 'xxx', 
        :password_sms => 'xxx', 
        :email => 'user1000@email.com',
        :password => 'clave',
        :role => 'user'
      )
      
    user.save
    
    user = 
      User.new(
        :id => 2,
        :phone => '600600600',
        :password_localizame => 'xxx', 
        :password_sms => 'xxx', 
        :email => 'user1000@email.com',
        :password => 'xxx',
        :role => 'admin'
      )
      
    user.save
    
    #
    # alerts
    #
    Alert.delete_all
    
    alert = 
      Alert.new(
        :id => 1,
        :address => 'Nicolás Morales 34, 28019, Madrid',
        :latitude => '40.39075',
        :longitude => '-3.73210',
        :radius => '100',
        :text => 'Estás cerca de la panadería, acuérdate de comprar una hogaza',
        :status => Alert::STATUS_ACTIVE,
        :user_id => 1
      )
    alert.save
    
    alert = 
      Alert.new(
        :id => 2,
        :address => 'Plaza de España, Madrid',
        :latitude => '40.42355',
        :longitude => '-3.71334',
        :radius => '100',
        :text => 'Estás cerca de casa de Juan, ¿por qué no le hacemos una visita?',
        :status => Alert::STATUS_ACTIVE,
        :user_id => 1
      )
    alert.save
    
    alert = 
      Alert.new(
        :id => 3,
        :address => 'plaza antón martín, Madrid',
        :latitude => '40.41238',
        :longitude => '-3.69963',
        :radius => '100',
        :text => 'Mira a ver que ponen en el cine ya que estás ahí',
        :status => Alert::STATUS_NOT_ACTIVE,
        :user_id => 1
      )
    alert.save
    
    #
    # deliveries
    #
    Delivery.delete_all
    
    delivery = 
      Delivery.new(
        :alert_id => 1,
        :date => Time.now
      )
      
    delivery.save
    
    delivery = 
      Delivery.new(
        :alert_id => 1,
        :date => Time.now
      )
      
    delivery.save
    
    delivery = 
      Delivery.new(
        :alert_id => 1,
        :date => Time.now
      )
      
    delivery.save
    
    delivery = 
      Delivery.new(
        :alert_id => 2,
        :date => Time.now
      )
      
    delivery.save
    
    #
    # locations
    #
    Location.delete_all
    
    location = 
      Location.new(
        :id => 1,
        :latitude => '40.39075',
        :longitude => '-3.73251',
        :address => 'Nicolás Morales 38, 28019, Madrid',
        :date => Time.now,
        :user_id => 1,
        :error => false
      )
    
    location.save
    
    location = 
      Location.new(
        :id => 2,
        :latitude => '40.39076',
        :longitude => '-3.73271',
        :address => 'Nicolás Morales 40, 28019, Madrid',
        :date => Time.now,
        :user_id => 1,
        :error => false
      )
    
    location.save
    
    location = 
      Location.new(
        :id => 3,
        :latitude => '40.39077',
        :longitude => '-3.73374',
        :address => 'Nicolás Morales 50, 28019, Madrid',
        :date => Time.now,
        :user_id => 1,
        :error => false
      )
    
    location.save
    
    location = 
      Location.new(
        :id => 4,
        :latitude => '40.39074',
        :longitude => '-3.73169',
        :address => 'Nicolás Morales 30, 28019, Madrid',
        :date => Time.now,
        :user_id => 1,
        :error => false
      )
    
    location.save
    
    
  end

  def self.down
    Location.delete_all
    Delivery.delete_all
    Alert.delete_all
    User.delete_all
  end
end
