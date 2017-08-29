class Authentication::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def omniauth
    @user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = t('devise.omniauth_callbacks.success', kind: request.env["omniauth.auth"].provider)
      @user.authentications.try :save
      sign_in_and_redirect @user
    elsif @user.save
      flash[:notice] = "Account created and signed in successfully."
      sign_in_and_redirect(@user)
    else
      flash[:notice] = "Please create a password for your account."
      session['devise.user_attributes'] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :github, :omniauth
  alias_method :twitter, :omniauth
  alias_method :facebook, :omniauth
  alias_method :google_oauth2, :omniauth
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

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
