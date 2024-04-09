class AuthManager 
  
  def self.valid_email_format?(mail)
    email_pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email_pattern.match?(mail)
  end

  def self.email_exist?(mail)
    @@db = db_access
    user_table = @@db[:user]
    sanitized_email = sanitized_email(mail)
    user = user_table.where(email: sanitized_email).first
    !user.nil? # Retourne true si l'email existe déjà
  end
  
  def self.connect(mail, pass)
    A.message({ action: :authentication, data: { table: :user, particles: { email: mail } } }) do |response|
      puts "on est dans le connect"
      if response.key?('mail_authorized') && response['mail_authorized'] == true
        # Logique si 'authorized' est présent dans la réponse
        puts "response mail authorized: #{response['mail_authorized']}"
        # Si le mail et le password sont ok, on log le user et on stocke l'info en local storage
        mail_message = JS.global[:localStorage].setItem('logged', response['mail_authorized'])
        mail_response = response['mail_authorized']
        puts "mail_response : #{mail_response}"
        # On efface le formulaire si le serveur renvoie que l'user est loggé
        # view.delete(true)
        JS.global[:localStorage].setItem('current_user', response['user_id'])

        #   Récupération des objets de l'utilisateur
        puts "Récupération des items du user"
        user_id = response['user_id']
        puts "user_id: #{user_id}"
        user_items = @@db[:atome].where(creator: user_id)
        puts " user_items: #{user_items}"
      else
        # Gestion du cas où 'authorized' est absent
      end
    end

    A.message({ action: :authorization, data: { table: :user, particles: { password: pass } } }) do |response|
      puts "authorization : #{response}"
      if response.key?('password_authorized')
        authorized = response['password_authorized'] || false # On utilise false comme valeur par défaut si 'authorized' est absent
        puts "response password : #{response['password_authorized']}"
        # Si le mail et le password sont ok, on log le user et on stocke l'info en local storage
        password_message = JS.global[:localStorage].setItem('logged', response['password_authorized'])
        password_response = response['password_authorized']
        puts "password_response : #{password_response}"
        # On efface le formulaire si le serveur renvoie que l'user est loggé
        # view.delete(true)
        JS.global[:localStorage].setItem('current_user', response['user_id'])

        #   Récupération des objets de l'utilisateur
        puts "Récupération des items du user"
        user_id = response['user_id']
        puts "user_id: #{user_id}"
        puts "user_items : #{response['user_items']}"
        # db = db_access
        # items = db[:atome]
        # user_items = items.where(creator: user_id)
        # puts " user_items: #{user_items}"
      else
        # Gestion du cas où 'authorized' est absent
      end
    end
  end
  
end