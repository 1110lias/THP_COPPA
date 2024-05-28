class UserMailer < ApplicationMailer
    default from: 'no-reply@coppagabana.fr'

    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://coppa&gabana.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: "Bienvenu sur Coppa & Gabana, la meilleure plateforme d'achat de produit Italien, ma-ma-mia!") 
    end
end
