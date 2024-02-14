# encoding: UTF-8

# Création du formulaire
form = box({
             width: 500,
             height: 350,
             left: 550,
             top: 200,
             color: :green,
             border: { thickness: 2,
                       color: color(:blue),
                       pattern: :solid } })

# Input email
email_box = form.box({ data: :hello,
                       width: 400,
                       height: 50,
                       left: 50,
                       top: 50,
                       color: :white,
                       border: { thickness: 1,
                                 color: color(:black),
                                 pattern: :solid },
                       id: :email_box })

# Nouvel objet email_text, enfant de la box email
email_text = email_box.text({ data: 'Email',
                              left: 25,
                              color: :black,
                              edit: true,
                              id: :email_text_id })

# Input Password
password_box = form.box({ width: 400,
                          height: 50,
                          left: 50,
                          top: 150,
                          color: :white,
                          border: { thickness: 1,
                                    color: color(:black),
                                    pattern: :solid },
                          id: :password })

# Nouvel objet password_text, enfant de la box password
password_text = password_box.text({ data: :Password,
                                    left: 25,
                                    edit: true,
                                    color: :black,
                                    id: :password_text_id, })

# Bouton connexion
connection = form.box({ width: 100,
                        height: 50,
                        left: 50,
                        top: 250,
                        color: :blue,
                        border: { thickness: 1,
                                  color: color(:black),
                                  pattern: :solid },
                        text: { data: "Se connecter",
                                left: 10,
                                color: :black },
                        id: :connection_btn })

email_box.touch(true) do
  email_text.component({selected: true})
end

password_box.touch(true) do
  password_text.component({selected: true})
end

connection.touch(true) do
  # Vérification que les champs email et password ne sont pas envoyés vides :
  if (email_text.data.nil? || email_text.data.strip.empty?) && (password_text.data.nil? || password_text.data.strip.empty?)
    puts "Veuillez renseigner votre adresse email et votre mot de passe."
  elsif email_text.data.nil? || email_text.data.strip.empty?
    puts "Veuillez renseigner votre adresse email."
  elsif password_text.data.nil? || password_text.data.strip.empty?
    puts "Veuillez renseigner votre mot de passe."
  else
    # Envoi des données du formulaire au serveur :
    # hashed_password = A.calculate_sha(password_text.data)
    # hashed_password = Black_matter.encode(password_text.data)
    # puts hashed_password
    # A.message({ action: :authentification, value: { mail: email_text.data, pass: hashed_password } })

    mail = email_text.data
    puts 'mail : ' + mail
    pass = Black_matter.encode(password_text.data)
    puts 'pass : ' + pass
    # puts Universe.current_user
    # puts grab("anonymous").inspect
    # grab("anonymous").password( { global: :nptkoi, read: { atome: :stahhhr_wars }, write: { atome: :starll_wars } })
    #
    # puts grab("anonymous").inspect
    A.message({ action: :authentication, data: { table: :identity, particle: :email, email: mail } }) do |response|
      puts "-2 #{response}"
    end
    A.message({ action: :authorization, data: { table: :security, particle: :password, password: pass } }) do |response|
      puts "-1 #{response}"
    end
  end
end

# Bouton création compte
creation = form.box({ width: 110,
                      height: 50,
                      left: 340,
                      top: 250,
                      color: :yellow,
                      border: { thickness: 1,
                                color: color(:black),
                                pattern: :solid },
                      text: { data: "Créer un compte",
                              left: 10, color: :black },
                      id: :creation_btn })

creation.touch(true) do
  # Vérification que les champs email et password ne sont pas envoyés vides :
  if (email_text.data.nil? || email_text.data.strip.empty?) && (password_text.data.nil? || password_text.data.strip.empty?)
    puts "Veuillez renseigner votre adresse email et votre mot de passe."
  elsif email_text.data.nil? || email_text.data.strip.empty?
    puts "Veuillez renseigner votre adresse email."
  elsif password_text.data.nil? || password_text.data.strip.empty?
    puts "Veuillez renseigner votre mot de passe."
  else
    # hashed_password = A.calculate_sha(password_text.data)
    mail = email_text.data
    puts 'mail : ' + mail
    pass = Black_matter.encode(password_text.data)
    puts 'pass : ' + pass
    # A.message({ action: :account_creation, value: { mail: email_text.data, pass: hashed_password } }) # renvoie la donnée ou une chaine de caractères vide si aucune donnée n'est renseignée
    A.message({action: :insert, data: {table: :identity, particle: :email, data: mail}})
    A.message({action: :insert, data: {table: :security, particle: :password, data: pass}})
  end
end