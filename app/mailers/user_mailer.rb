class UserMailer < ApplicationMailer

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'corsairethp@gmail.com'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email,
      subject: 'Welcome to My Site',
      delivary_method_options: { version: 'v3.1',
      api_key: ENV['MAIL_JET_API_PUBLIQUE'],
      secret_key: ENV['MAIL_JET_API_SECRET']
      })
  end
end
