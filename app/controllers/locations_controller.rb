#
# author: fernandoguillen.info
# date: 2008.05.12
#

class LocationsController < ApplicationController
  
  # comprobar usuario en sesión en aciones críticas
  before_filter :check_user_session
  
  #
  # solo retorna las localizaciones que no han tenido error
  #
  def list
    @migas_pan = 'ver localizaciones'
    
    @locations = 
      Location.find( 
        :all, 
        :order => 'date DESC', 
        :conditions => { :user_id => session[:user_id], :error => false } 
      )
    
    if @locations.size == 0
      flash[:notice] = 'Todavía no has sido localizado ninguna vez.'
    end
  end
  
end
