#
# author: fernandoguillen.info
# date: 2008.05.12
#


class AlertsController < ApplicationController
  
  # comprobar usuario en sesion
  before_filter :check_user_session

  def list
    @migas_pan = 'ver alertas'
    
    @alerts = Alert.find( :all, :order => 'updated_at DESC', :conditions => { :user_id => session[:user_id] } )
    
    if @alerts.size == 0
      flash[:notice] = 'Todavía no has creado ninguna alerta. Crea una.'
      redirect_to :action => 'new'
    end
  end

  def new
    @migas_pan = 'nueva alerta'

    @alert = Alert.new
    @alert.status = Alert::STATUS_ACTIVE
  end

  def create
    @alert = Alert.new(params[:alert])
    @alert.created_at = Time.now
    @alert.updated_at = Time.now
    @alert.user_id = session[:user_id]
    
    #
    # cargar las coordenadas
    #
    gg = GoogleGeocode.new GOOGLE_GEO_API
    begin
      location = gg.locate @alert.address
    rescue
      flash[:error] = 'Tenemos algún problema para reconocer la dirección indicada, por favor utiliza una dirección que pueda ser entendida por googlemaps.'
      @migas_pan = 'nueva alerta'
      render :action => "new"
      return
    end
    @alert.latitude = location.latitude
    @alert.longitude = location.longitude
    

    if @alert.save
      flash[:notice] = 'Alerta creada correctamente.'
      redirect_to :action => 'list'
    else
      flash[:error] = 'Algún error se ha producido, vuelve a intentarlo.'
      @migas_pan = 'nueva alerta'
      render :action => "new"
    end
  end

  def edit
    @migas_pan = 'actualizar alerta'

    @alert = Alert.find(params[:id])
  end

  def update
    @alert = Alert.find(params[:alert][:id])
    @alert.updated_at = Time.now
    
    @alert.attributes= params[:alert]
    
    #
    # cargar las coordenadas
    #
    gg = GoogleGeocode.new GOOGLE_GEO_API
    
    begin
      location = gg.locate params[:alert][:address]
    rescue
      flash[:error] = 'Tenemos algún problema para reconocer la dirección indicada, por favor utiliza una dirección que pueda ser entendida por googlemaps.'
      @migas_pan = 'actualizar alerta'
      render :action => "edit"
      return
    end
    
    @alert.latitude = location.latitude
    @alert.longitude = location.longitude

    if @alert.save
      flash[:notice] = 'Alerta actualizada correctamente.'
      redirect_to :action => 'list'
    else
      flash[:error] = 'Algún error se ha producido, vuelve a intentarlo.'
      @migas_pan = 'actualizar alerta'
      render :action => "edit"
    end
  end

end
