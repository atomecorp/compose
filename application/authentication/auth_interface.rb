require './authentication/auth_manager'

class AuthInterface

  DARK_GREY_TRANSPARENT = { red: 0.125, green: 0.125, blue: 0.125, alpha: 0.7 }
  GREY = { red: 0.208, green: 0.208, blue: 0.208 }
  EASTERN_BLUE = { red: 0.118, green: 0.596, blue: 0.596 }

  def initialize
    #   methods to use
    create_view
    connection
    account_creation
  end

  def create_view
    @view = box({ id: :poipoi,
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  height: :auto,
                  width: :auto,
                  color: DARK_GREY_TRANSPARENT
                })

    @form = @view.box({ width: 500,
                        height: 350,
                        center: true,
                        color: GREY,
                        smooth: 10
                      })

    @cancel = @form.box({
                          width: 25,
                          height: 25,
                          top: 25,
                          left: 450
                        })

    @cancel.touch(true) do
      @view.delete(true)
      @connection.delete(true)
      @creation.delete(true)
      # On supprime tous les éléments pour ne pas interférer avec les nouveaux éléments créés lors d'une nouvelle instanciation de la vue du formulaire
    end

    @email_box = @form.input({ width: 400,
                               height: 50,
                               top: 50,
                               left: 10,
                               color: GREY,
                               smooth: 0,
                               text: :white,
                               default: 'Email'
                             })

    @email_box.border({ thickness: 2,
                        red: 0.1, green: 0.8, blue: 0.8, alpha: 1,
                        pattern: :solid
                      })

    @email_error_message = @form.text({ data: "",
                                        left: 20,
                                        top: 115,
                                        color: :red, })
    @password_box = @form.input({
                                  width: 400,
                                  height: 50,
                                  top: 150,
                                  left: 10,
                                  position: :absolute,
                                  color: GREY,
                                  smooth: 0,
                                  text: :white,
                                  default: 'Password'
                                })

    @password_box.border({ thickness: 2,
                           red: 0.1, green: 0.8, blue: 0.8, alpha: 1,
                           pattern: :solid
                         })

    @password_error_message = @form.text({ data: "",
                                           left: 10,
                                           top: 210,
                                           color: :red })

    @global_message = @form.text({ data: "",
                                   left: 10,
                                   top: 230,
                                   color: :red })

    @connection = @form.box({ width: 100,
                              height: 50,
                              left: 50,
                              top: 250,
                              color: :white,
                              smooth: 5,
                              border: { thickness: 2,
                                        color: EASTERN_BLUE,
                                        pattern: :solid },
                              text: { int8: { francais: "Se connecter",
                                              english: "Login" },
                                      color: :black,
                                      center: { x: 30, y: -1 }
                              },
                              id: :connection_btn
                            })

    @creation = @form.box({ width: 110,
                            height: 50,
                            left: 340,
                            top: 250,
                            color: GREY,
                            smooth: 5,
                            border: { thickness: 2,
                                      color: EASTERN_BLUE,
                                      pattern: :solid },
                            text: { int8: { francais: "Créer un compte",
                                            english: "Create account" },
                                    left: 10,
                                    color: :white },
                            id: :creation_btn
                          })
  end

  def connection
    @connection.touch(true) do
      # On efface le message d'erreur de l'input email s'il y en a un
      @email_error_message.data = ""
      @password_error_message.data = ""
      @global_message.data = ""
      # Vérification que les champs email et password ne sont pas envoyés vides :
      if (@email_box.data.nil? || @email_box.data.strip.empty?) && (@password_box.data.nil? || @password_box.data.strip.empty?)
        @email_error_message.data = "Veuillez renseigner votre adresse email"
        @password_error_message.data = "Veuillez renseigner votre mot de passe"
        puts "Veuillez renseigner votre adresse email et votre mot de passe."
      elsif @email_box.data.nil? || @email_box.data.strip.empty?
        @email_error_message.data = "Veuillez renseigner votre adresse email"
        puts "Veuillez renseigner votre adresse email."
      elsif @password_box.data.nil? || @password_box.data.strip.empty?
        @password_error_message.data = "Veuillez renseigner votre mot de passe"
        puts "Veuillez renseigner votre mot de passe."
      else

        mail = @email_box.data
        puts 'mail : ' + mail
        pass = Black_matter.encode(@password_box.data)
        puts 'pass : ' + pass

        mail_message = false
        mail_response = nil
        password_message = false
        password_response = nil

        AuthManager.connect(mail, pass) do |error_message|
          if error_message
            @global_message.data = error_message
          end
        end
      end
    end
  end

  def account_creation
    @creation.touch(true) do
      # On efface le message d'erreur de l'input email s'il y en a un
      @email_error_message.data = ""
      @password_error_message.data = ""
      # Vérification que les champs email et password ne sont pas envoyés vides :
      if (@email_box.data.nil? || @email_box.data.strip.empty?) && (@password_box.data.nil? || @password_box.data.strip.empty?)
        @email_error_message.data = "Veuillez renseigner votre adresse email"
        @password_error_message.data = "Veuillez renseigner votre mot de passe"
        puts "Veuillez renseigner votre adresse email et votre mot de passe."
      elsif @email_box.data.nil? || @email_box.data.strip.empty?
        @email_error_message.data = "Veuillez renseigner votre adresse email"
        puts "Veuillez renseigner votre adresse email."
      elsif @password_box.data.nil? || @password_box.data.strip.empty?
        @password_error_message.data = "Veuillez renseigner votre mot de passe"
        puts "Veuillez renseigner votre mot de passe."
      else
        mail = @email_box.data
        puts 'mail : ' + mail

        # On vérifie le format de l'email
        if !AuthManager.valid_email_format?(mail)
          # Gérez l'erreur de format d'email ici (afficher un message à l'utilisateur, par exemple)
          @email_error_message.data = "L'adresse email n'est pas valide"
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
                # if response['data']['email_exist'] == true
                #   @email_error_message.data = "L' email est déjà utilisé.Veuillez en choisir un autre "
                #   puts " L 'email existe déjà. Veuillez en choisir un autre."
                # else
                #   L' email n 'existe pas en base, on peut insert les données
                pass = Black_matter.encode(@password_box.data)
                puts ' pass : ' + pass
                anon_id = JS.global[:localStorage].getItem('anonymous_id')
                # On insère le nouveau user en base
                begin
                  A.message({ action: :insert, data: { table: :user, particles: { email: mail, password: pass, user_id: anon_id } } })
                  # On log le user
                  AuthManager.connect(mail, pass)
                  # On génère un nouvel id pour l' anonyme.
                  JS.global[:localStorage].setItem('anonymous_id', identity_generator)
                  # end
                rescue Sequel::UniqueConstraintViolation
                  puts "Erreur: L'email existe déjà."
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
  end

end