class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
before_filter :configure_permitted_parameters, only: [:create, :update]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    if @user.destroy 
      redirect_to root_path
    end
  end


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  private
  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :first_name, :last_name, :email, :password,
      :password_confirmation, :image, :avatar ) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :first_name, :last_name, :image, :avatar) }
  end



  # def sign_up_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  # end

  # def account_update_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
