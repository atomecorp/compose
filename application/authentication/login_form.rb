# encoding: UTF-8

# require_relative '../../../server/eDen.rb'

# Création du formulaire
def authent_form

  dark_grey_transparent = { red: 0.125, green: 0.125, blue: 0.125, alpha: 0.7 }
  grey = { red: 0.208, green: 0.208, blue: 0.208 }
  eastern_blue = { red: 0.118, green: 0.596, blue: 0.596 }

  view = box({ id: :poipoi,
               left: 0,
               right: 0,
               top: 0,
               bottom: 0,
               height: :auto,
               width: :auto,
               color: dark_grey_transparent
             })

  form = view.box({ width: 500,
                    height: 350,
                    center: true,
                    color: grey,
                    smooth: 10
                  })
  # form.drag({restrict: view.id})

  cancel = form.box({
                      width: 25,
                      height: 25,
                      top: 25,
                      left: 450
                    })

  cancel.touch(true) do
    view.delete(true)
  end

  # # Label de l'input email
  # email_box_text = form.text({ left: 10, top: 20, data: 'Email', id: :email})
  # Input email
  email_box = form.input({width: 400,
                          height: 50,
                          top: 50,
                          left: 10,
                          color: grey,
                          smooth: 0,
                          text: :white,
                          default: 'Email'
                         })

  email_box.border({ thickness: 2,
                     red: 0.1, green: 0.8, blue: 0.8, alpha: 1,
                     pattern: :solid
                   })
  # email_box = form.box({ width: 400,
  #                        height: 50,
  #                        center: true,
  #                        top: 50,
  #                        color: grey,
  #                        # border: { thickness: 2,
  #                        #           color: color(red: 0.118, green: 0.596, blue: 0.596),
  #                        #           pattern: :solid },
  #                        id: :email_box
  #                      })
  #
  # email_bordure_bas = email_box.box({ width: :inherit, # La bordure prend la pleine largeur de l'élément principal
  #                                     height: 2, # Épaisseur de la bordure du bas
  #                                     bottom: 0, # Positionnement au bas de l'élément principal
  #                                     top: :auto,
  #                                     color: eastern_blue
  #                                   })
  #
  # # Nouvel objet email_text, enfant de la box email
  # email_text = email_box.text({ data: :Email,
  #                               # left: 25,
  #                               left: 10,
  #                               component: { size: 16 },
  #                               color: :white,
  #                               edit: true,
  #                               id: :email_text_id
  #                             })

  email_error_message = form.text({ data: "",
                                    left: 20,
                                    top: 115,
                                    color: :red, })
  puts "input email error text : #{email_error_message.data}"

  # # Label de l'input password
  # password_box_text = form.text({ left: 10, top: 120, data: 'Password', id: :password})
  # Input password
  password_box = form.input({
                             width: 400,
                             height: 50,
                             top: 150,
                             left: 10,
                             position: :absolute,
                             color: grey,
                             smooth: 0,
                             text: :white,
                             default: 'Password'
                            })

  password_box.border({ thickness: 2,
                     red: 0.1, green: 0.8, blue: 0.8, alpha: 1,
                     pattern: :solid
                   })

  password_error_message = form.text({ data: "",
                                       left: 10,
                                       top: 210,
                                       color: :red, })
  puts "input password error text : #{password_error_message.data}"

  # Bouton connexion
  connection = form.box({ width: 100,
                          height: 50,
                          left: 50,
                          top: 250,
                          color: :white,
                          smooth: 5,
                          border: { thickness: 2,
                                    color: eastern_blue,
                                    pattern: :solid },
                          text: { int8: { francais: "Se connecter",
                                          english: "Login" },
                                  # left: 10,
                                  color: :black,
                                  center: { x: 30, y: -1 }
                          },
                          id: :connection_btn
                        })

  # email_box.touch(true) do
  #   email_text.component({ selected: true })
  # end
  #
  # password_box.touch(true) do
  #   password_text.component({ selected: true })
  # end

  def connect(mail, pass)
    A.message({ action: :authentication, data: { table: :user, particles: { email: mail } } }) do |response|
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
        user_items = db[:atome].where(creator: user_id)
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

  # def display_user_items
  #
  # end

  connection.touch(true) do
    # On efface le message d'erreur de l'input email s'il y en a un
    email_error_message.data = ""
    password_error_message.data = ""
    # Vérification que les champs email et password ne sont pas envoyés vides :
    if (email_box.data.nil? || email_box.data.strip.empty?) && (password_box.data.nil? || password_box.data.strip.empty?)
      email_error_message.data = "Veuillez renseigner votre adresse email"
      password_error_message.data = "Veuillez renseigner votre mot de passe"
      puts "Veuillez renseigner votre adresse email et votre mot de passe."
    elsif email_box.data.nil? || email_box.data.strip.empty?
      email_error_message.data = "Veuillez renseigner votre adresse email"
      puts "Veuillez renseigner votre adresse email."
    elsif password_box.data.nil? || password_box.data.strip.empty?
      password_error_message.data = "Veuillez renseigner votre mot de passe"
      puts "Veuillez renseigner votre mot de passe."
    else

      mail = email_box.data
      puts 'mail : ' + mail
      pass = Black_matter.encode(password_box.data)
      puts 'pass : ' + pass

      # A.message({ action: :authentication, data: { table: :user, particles: {email: mail, password: pass} } }) do |response|
      #   puts "authentication : #{response}"
      # end

      mail_message = false
      mail_response = nil
      password_message = false
      password_response = nil

      connect(mail, pass)

      # A.message({ action: :authentication, data: { table: :user, particles: {email: mail} } }) do |response|
      #   puts "Full authentication response: #{response.inspect}"
      #   if response.key?('mail_authorized') && response['mail_authorized'] == true
      #     # Logique si 'authorized' est présent dans la réponse
      #     puts "response mail authorized: #{response['mail_authorized']}"
      #     # Si le mail et le password sont ok, on log le user et on stocke l'info en local storage
      #     mail_message = JS.global[:localStorage].setItem('logged', response['mail_authorized'])
      #     mail_response = response['mail_authorized']
      #     puts "mail_response : #{mail_response}"
      #     # On efface le formulaire si le serveur renvoie que l'user est loggé
      #     view.delete(true)
      #     JS.global[:localStorage].setItem('user_id', response['user_id'])
      #   else
      #     # Gestion du cas où 'authorized' est absent
      #   end
      #
      # end

      # A.message({ action: :authorization, data: { table: :user, particles: {password: pass} } }) do |response|
      #   puts "authorization : #{response}"
      #   if response.key?('password_authorized')
      #   authorized = response['password_authorized'] || false  # On utilise false comme valeur par défaut si 'authorized' est absent
      #   puts "response password : #{response['password_authorized']}"
      #   # Si le mail et le password sont ok, on log le user et on stocke l'info en local storage
      #   password_message = JS.global[:localStorage].setItem('logged', response['password_authorized'])
      #   password_response = response['password_authorized']
      #   puts "password_response : #{password_response}"
      #   # On efface le formulaire si le serveur renvoie que l'user est loggé
      #   view.delete(true)
      #   JS.global[:localStorage].setItem('user_id', response['user_id'])
      #   else
      #     # Gestion du cas où 'authorized' est absent
      #   end
      # end

      # # On efface le formulaire si le serveur renvoie que l'user est loggé
      # logged = JS.global[:localStorage].getItem('logged')
      # puts "logged : #{logged}"
      #
      # if logged == "true"
      #   view.delete(true)
      #   puts 'deleted!'
      #   # JS.global[:localStorage].setItem('user_id',response['user_id'])
      #   # puts "response user_id : #{response['user_id']}"
      # end
    end
  end

  # Bouton création compte
  creation = form.box({ width: 110,
                        height: 50,
                        left: 340,
                        top: 250,
                        color: grey,
                        smooth: 5,
                        border: { thickness: 2,
                                  color: eastern_blue,
                                  pattern: :solid },
                        text: { int8: { francais: "Créer un compte",
                                        english: "Create account" },
                                left: 10,
                                color: :white },
                        id: :creation_btn
                      })

  creation.touch(true) do
    # On efface le message d'erreur de l'input email s'il y en a un
    email_error_message.data = ""
    password_error_message.data = ""
    # Vérification que les champs email et password ne sont pas envoyés vides :
    if (email_box.data.nil? || email_box.data.strip.empty?) && (password_box.data.nil? || password_box.data.strip.empty?)
      email_error_message.data = "Veuillez renseigner votre adresse email"
      password_error_message.data = "Veuillez renseigner votre mot de passe"
      puts "Veuillez renseigner votre adresse email et votre mot de passe."
    elsif email_box.data.nil? || email_box.data.strip.empty?
      email_error_message.data = "Veuillez renseigner votre adresse email"
      puts "Veuillez renseigner votre adresse email."
    elsif password_box.data.nil? || password_box.data.strip.empty?
      password_error_message.data = "Veuillez renseigner votre mot de passe"
      puts "Veuillez renseigner votre mot de passe."
    else
      mail = email_box.data
      puts 'mail : ' + mail

      # On vérifie le format de l'email
      if !valid_email_format?(mail)
        # Gérez l'erreur de format d'email ici (afficher un message à l'utilisateur, par exemple)
        email_error_message.data = "L'adresse email n'est pas valide"
        puts "L'adresse email n'est pas valide."
      else
        # Si le format de l'email est valide,
        # On vérifie si l'email existe déjà en base
        # email_exists = email_exist?(mail)

        A.message({ action: :email_exist, data: { email: mail } }) do |response|
          begin
            puts "response['data']['email_exist'] : #{response['data']['email_exist']}"
            # if response.is_a?(Hash) && response.key?('email_exist')
            if response.is_a?(Hash)
              puts ' hi '
              if response['data']['email_exist'] == true
                email_error_message.data = "L' email est déjà utilisé.Veuillez en choisir un autre "
                puts " L 'email existe déjà. Veuillez en choisir un autre."
              else
                #   L' email n 'existe pas en base, on peut insert les données
                pass = Black_matter.encode(password_box.data)
                puts ' pass : ' + pass
                anon_id = JS.global[:localStorage].getItem('anonymous_id')
                # On insère le nouveau user en base
                A.message({ action: :insert, data: { table: :user, particles: { email: mail, password: pass, user_id: anon_id } } })
                # On log le user
                connect(mail, pass)
                # On génère un nouvel id pour l' anonyme.
                JS.global[:localStorage].setItem('anonymous_id', identity_generator)
              end
            else
              puts "Réponse inattendue du serveur : #{response.inspect}"
            end
          rescue => e
            puts "Une erreur est survenue lors de la vérification de l'email : #{e.message}"
          end
        end
      end
    end
  end

  def valid_email_format?(email)
    email_pattern = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email_pattern.match?(email)
  end

  def email_exist?(mail)
    db = db_access
    user_table = db[:user]
    sanitized_email = sanitized_email(mail)
    user = user_table.where(email: sanitized_email).first
    !user.nil? # Retourne true si l'email existe déjà
  end

end

# text.language = :francais

# authent_form
