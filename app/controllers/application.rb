# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'layout_geoalertas'
  
  GOOGLE_GEO_API = 'ABQIAAAAlqHVgda1Vyq8JQWd9v1BVRQ_qjPAjoT_JgKhBcWvK4R7KHDklxSaxm8hBwS6VLhr_YORMCUu3nrqjQ'
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '06af74866ed45d0f9d998a2a62e0d031'
  
  #
  # comprobación de usuario
  #
  def check_user_session
    if session[:user_id].nil?
      flash[:error] = 'Debes estar autentificado para acceder a esta opción.'
      redirect_to login_url
      return false
    end
  end
end
