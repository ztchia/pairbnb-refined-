class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 # after_database_authentication :after_logged_in

 #  def after_logged_in(id)
 #    @id = User.find(params[:id])
 #    redirect_to edit_user_registration_path
 #  end

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?

    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to edit_user_registration_path
    end
  end

  def failure
    redirect_to root_path 
  end
end