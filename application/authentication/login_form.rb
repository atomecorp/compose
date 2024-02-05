
#Création du formulaire
form = box({ width: 500, height: 350, left: 550, top: 200, color: :green, border: {thickness: 2, color: color(:blue), pattern: :solid}})

#Input email
email_box = form.box( {data: :hello,width: 400, height: 50, left: 50, top: 50, color: :white, border: {thickness: 1, color: color(:black), pattern: :solid}, id: :email_box})

#Nouvel objet email_text, enfant de la box email
email_text = email_box.text({data: 'Tapez votre email', left: 25, edit: true, id: :email_text_id})

#Input Password
password_box = form.box({width: 400, height: 50, left: 50, top: 150, color: :white, border: {thickness: 1, color: color(:black), pattern: :solid}, id: :password})

#Nouvel objet password_text, enfant de la box password
password_text = password_box.text({data: :Password, left: 25, edit: true, id: :password_text_id, })

#Bouton envoyer
validation = form.box({width: 100, height: 50, left: 350, top: 250, color: :blue, border: {thickness: 1, color: color(:black), pattern: :solid}, text: {data: :Valider, left: 10}, id: :validation})

# A.connection('localhost:9292') do |params|
#   puts 'Connected!!!!!!!!!!'
#   alert " the connection is : #{params}"
# end

validation.touch(true) do
  A.message({action: :authentification, value: { mail: email_text.data, pass: password_text.data } })
end

