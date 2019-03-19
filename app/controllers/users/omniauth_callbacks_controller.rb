class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_facebook(request.env['omniauth.auth'])
    # "from_facebook" ==> a private methode
    # "request.env['omniauth.auth'] ==> retrieve informations related to connexion with facebook"

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      # "event: :authentication ==> create an event which send an errors if the user don't sign_in"

    else
      redirect_to new_user_registration_url
    end
  end

end
