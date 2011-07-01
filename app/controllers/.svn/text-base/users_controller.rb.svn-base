#
# author: fernandoguillen.info
# date: 2008.05.12
#



class UsersController < ApplicationController
  
  # comprobar usuario en sesión en aciones críticas
  before_filter :check_user_session, :only => [ :update, :edit ]
  
  def login
    @migas_pan = 'login'
    
    @user = User.new 
  end
  
  def login_check
    @user = User.find( :first, :conditions => { :phone => params[:user][:phone], :password => params[:user][:password]} )
    if @user.nil?
      flash[:error] = 'Error al autentificarse, porfavor, comprueba el teléfono y la contraseña'
      
      @user = User.new 
      @user.phone = params[:user][:phone]
      @user.password = params[:user][:password]
      
      @migas_pan = 'login'
      
      render :action => 'login'
    else
      flash[:notice] = 'Acceso correcto, ya puedes gestionar tus alertas. Recuerda que esta aplicación es un experimento, está todo operativo pero no están activadas las localizaciones ni los envíos de SMS, pues todo eso cuesta dinero :)'
      session[:user_id] = @user.id
      redirect_to :controller => 'alerts', :action => 'list'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Sesion cerrada correctamente.'
    redirect_to login_url
  end
  
  def new
    @migas_pan = 'nueva cuenta'
    
    @user = User.new
  end
  
  def create
    @user = User.new( params[:user] )
    @user.created_at = Time.now
    @user.updated_at = Time.now
    @user.role = User::ROLE_USER    # por ahora todos los usuarios son 'users'

    if @user.save
      flash[:notice] = 'Has creado la cuenta correctamente, ya puedes gestionar tus alertas.'
      
      # automáticamente autentificamos al usuario
      session[:user_id] = @user.id
      
      redirect_to :controller => 'alerts', :action => 'new'
    else
      flash[:error] = 'Algún error se ha producido, vuelve a intentarlo.'
      redirect_to :action => "new"
    end
  end
  
  def edit
    @migas_pan = 'actualizar cuenta'
    
    @user = User.find(session[:user_id])
  end

  def update
    if session[:user_id] == 1
      flash[:error] = 'El usuario de prueba no se puede modificar.'
      redirect_to :action => "edit"
      return
    end
    
    
    @user = User.find(session[:user_id])
    @user.updated_at = Time.now

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Has actualizado tu cuenta correctamente.'
      redirect_to :action => 'edit'
    else
      flash[:error] = 'Algún error se ha producido, vuelve a intentarlo.'
      redirect_to :action => "edit"
    end
  end
end
