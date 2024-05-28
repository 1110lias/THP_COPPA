class OrderMailer < ApplicationMailer
    default from: 'no-reply@coppagabana.fr'

    def order_user_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
      #@order_number = order_number - to add for V2
      #@total_price = total_price
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://coppa&gabana.fr/login' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: "Merci pour votre achat sur Coppa & Gabana, vos papilles vous remercient") 
    end

    def order_admin_email(admin)
        #on récupère l'instance admin et user pour renseigner le nom de l'utilisateur a l'admin dans l'email de confirmation.
        @admin = admin
        #@user = user
        #@total_price = total_price
    
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'http://coppa&gabana.fr/login' 
    
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @admin.email, subject: "Un nouvel achat sur la plateforme") 
      end
    
end
