class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    binding.pry
    @user = User.find_for_facebook(request.env["omniauth.auth"], current_user)
    binding.pry
    if @user.persisted?
      binding.pry
      sign_in_and_redirect @user,
        :event => :authentication

      set_flash_message(:notice, :success, :kind => "facebook")

    else
      binding.pry
      redirect_to new_user_registration_url
    end

  end


  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
