class OrderMailer < ApplicationMailer
  default from: 'no-reply@coppagabana.fr'

  def order_user_email(order)
    # On récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @order = order
    @user = order.user
    puts "order user mailer executed"
    #@order_number = order_number - to add for V2
    #@total_price = total_price

    # On définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://coppa&gabana.fr/login' 

    # C'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: "Merci pour votre achat sur Coppa & Gabana, vos papilles vous remercient") 
    admin_notification_email() # Envoyer une notification à l'administrateur
  end

  def admin_notification_email
    admin_email = "admin@coppagabana.fr" # Adresse e-mail de l'administrateur
    puts "admin notification mailer executed"
    
    # Définir l'URL pour l'e-mail
    @url = 'http://coppa&gabana.fr/login' 

    # Appeler la méthode mail() pour envoyer l'e-mail à l'administrateur
    mail(to: admin_email, subject: "Une nouvelle commande a été passée sur Coppa&Gabana") 
  end
end
