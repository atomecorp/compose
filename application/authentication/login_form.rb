# encoding: UTF-8


# Création du formulaire
def authent_form

  dark_grey = { red: 0.125, green: 0.125, blue: 0.125 }
  grey = { red: 0.208, green: 0.208, blue: 0.208 }
  light_grey = { red: 0.5, green: 0.5, blue: 0.5 }
  eastern_blue = { red: 0.118, green: 0.596, blue: 0.596 }

  view = box({ id: :poipoi,
               left: 0,
               right: 0,
               top: 0,
               bottom: 0,
               height: :auto,
               width: :auto,
               # color: dark_grey
               color: dark_grey
             })

  form = view.box({ width: 500,
                    height: 350,
                    center: true,
                    color: grey,
                    smooth: 10
                  })
  # form.drag({restrict: view.id})

  # Input email
  email_box = form.box({ width: 400,
                         height: 50,
                         center: true,
                         top: 50,
                         color: grey,
                         # border: { thickness: 2,
                         #           color: color(red: 0.118, green: 0.596, blue: 0.596),
                         #           pattern: :solid },
                         id: :email_box
                       })

  email_bordure_bas = email_box.box({ width: :inherit, # La bordure prend la pleine largeur de l'élément principal
                                      height: 2, # Épaisseur de la bordure du bas
                                      bottom: 0, # Positionnement au bas de l'élément principal
                                      top: :auto,
                                      color: eastern_blue
                                    })

  # Nouvel objet email_text, enfant de la box email
  email_text = email_box.text({ data: :Email,
                                # left: 25,
                                left: 10,
                                component: { size: 16 },
                                color: :white,
                                edit: true,
                                id: :email_text_id
                              })

  # Input Password
  password_box = form.box({ width: 400,
                            height: 50,
                            center: true,
                            top: 150,
                            color: grey,
                            # border: { thickness: 1,
                            #           color: color(:black),
                            #           pattern: :solid },
                            id: :password })

  password_bordure_bas = password_box.box({ width: :inherit, # La bordure prend la pleine largeur de l'élément principal
                                            height: 2, # Épaisseur de la bordure du bas
                                            bottom: 0, # Positionnement au bas de l'élément principal
                                            top: :auto,
                                            color: eastern_blue
                                          })

  # Nouvel objet password_text, enfant de la box password
  password_text = password_box.text({ data: :Password,
                                      # left: 25,
                                      edit: true,
                                      left: 10,
                                      component: { size: 16 },
                                      color: :white,
                                      id: :password_text_id,
                                    })

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
                          text: { int8: {francais: "Se connecter",
                                         english: "Login"},
                                  # left: 10,
                                  color: :black,
                                  center: { x: 30 , y: -1}
                          },
                          id: :connection_btn
                        })

  email_box.touch(true) do
    email_text.component({ selected: true })
  end

  password_box.touch(true) do
    password_text.component({ selected: true })
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

      # view = grab(:view).add(html_code)

      # require './template.rb'
      # end

    #   form.delete(true)
    #   require './templates/template'
    #   layout
    end
  end

  # Bouton création compte
  creation = form.box({ width: 110,
                        height: 50,
                        left: 340,
                        top: 250,
                        color: grey,
                        smooth: 5,
                        # border: { thickness: 1,
                        #           color: color(:black),
                        #           pattern: :solid },
                        border: { thickness: 2,
                                  color: eastern_blue,
                                  pattern: :solid },
                        text: { int8: { francais: "Créer un compte",
                                        english: "Create account"},
                                left: 10,
                                color: :white },
                        id: :creation_btn
                      })

  creation.touch(true) do
    # Vérification que les champs email et password ne sont pas envoyés vides :
    if (email_text.data.nil? || email_text.data.strip.empty?) && (password_text.data.nil? || password_text.data.strip.empty?)
      puts "Veuillez renseigner votre adresse email et votre mot de passe."
    elsif email_text.data.nil? || email_text.data.strip.empty?
      puts "Veuillez renseigner votre adresse email."
    elsif password_text.data.nil? || password_text.data.strip.empty?
      puts "Veuillez renseigner votre mot de passe."
    else
      mail = email_text.data
      puts 'mail : ' + mail
      pass = Black_matter.encode(password_text.data)
      puts 'pass : ' + pass
      
      A.message({ action: :insert, data: { table: :user, particles: {email: mail, password: pass, user_id: Universe.current_user} } })
    end
  end

end

# text.language = :francais

# authent_form
