#  On récupère le current_user généré automatiquementau lancement de l'application
current_user = Universe.current_user
puts "current_user : #{current_user}"

anonymous_id = JS.global[:localStorage].getItem('anonymous_id')
puts "anonymous_id : #{anonymous_id}"

# On récupère le current_user déjà stocké en local storage
current_user = JS.global[:localStorage].getItem('current_user')
puts "current_user : #{current_user}"

# Si l’id du compte anonyme égale celui du current user, ça veut dire que l’utilisateur précédent était un utilisateur anonyme, donc il faut supprimer son historique.
# Mais il faut garder l’historique des utilisateurs qui auraient pu se connecter et se déconnecter entre-temps!!!
if current_user == anonymous_id
  JS.global[:localStorage].clear
  puts "local storage cleared!"
end

# Si aucun current_user n'est stocké localement
if !anonymous_id
  # On récupère le current_user généré à l'ouverture de l'application
  anonymous_id = Universe.current_user
  puts "new anonymous_id : #{anonymous_id}"
  # On stocke ce current_user dans le local storage
  JS.global[:localStorage].setItem('anonymous_id', anonymous_id)
end

# Si aucun current_user n'est stocké localement
if !current_user
  # On récupère le current_user généré à l'ouverture de l'application
  current_user = Universe.current_user
  puts "new current_user : #{current_user}"
  # On stocke ce current_user dans le local storage
  JS.global[:localStorage].setItem('current_user', current_user)
# else
#   # Sinon on récupère celui déjà stocké en local storage
#   current_user = user_stocked
#   puts "current_user du else : #{current_user}"
end

# Bouton pour créer un nouvel atome et lui attribuer l'id du current_user
box1 = box(creator: current_user, width: 300)
box1.text("Creer un atome").center(true)

puts 'createur : ' + box1.creator

box1.touch(true) do
  box1.color(:red)
  current_user = JS.global[:localStorage].getItem('current_user')
  # On crée un nouvel atome et on lui attribue l'id du current_user comme creator
  c = circle(creator: current_user, color: :green, top: 200, left: 200, width: 250, height: 80)
  c.text('creator : ' + current_user)
  puts 'createur de c : ' + c.creator
end


navigation_button = box(creator: current_user, width: 300, height: 100, top: 500, left: 50)
navigation_button.text("Aller au formulaire d'inscription").center(true)

# Apparition du formulaire d'inscription quand on appuie sur le bouton correspondant
navigation_button.touch(true) do
  require_relative '../authentication/login_form'
  # On appelle la fonction authent_form du fichier 'login_form.rb' pour afficher le formulaire d'inscription
  authent_form
end

logout_button = box(width: 150,
                    height: 80,
                    top: 50,
                    left: 500,
                    color: :red)

logout_button.text({text: "Log out",
                       color: :black})

logout_button.touch(true) do
  JS.global[:localStorage].setItem('logged', 'false')
  JS.global[:localStorage].setItem('current_user', anonymous_id)
  # JS.global[:localStorage].setItem('current_user', current_user)
end











# JS.global[:localStorage].setItem('myKey',"{toto: :titi}")
# JS.global[:localStorage].setItem('myKey','tretre')
# JS.global[:localStorage].setItem('myyyyyKey','gfd')
# JS.global[:localStorage].setItem('myjhgfjhgfjhgfKey','oiuyoi')
# JS.global[:localStorage].setItem('m',"nhgfhgfd")

# puts "tretretre : #{Universe.current_user}"
# storage= JS.global[:localStorage]
# storage=storage.to_s
# storage_array= storage.to_a
# alert storage_array.length
# storage_items={}
# storage_array.each_with_index do |_i, index|
#   key = JS.global[:localStorage].key(index)
#   #
#   #     # Récupération de la valeur associée à cette clé
#   value = JS.global[:localStorage].getItem(key)
#   #
#   #     # Stockage de la paire clé/valeur dans le hash
#   storage_items[key] = value
#   puts value


# checkOrCreateUserId
#
# def form
#   form1 = box
#   form1.text(:login)
#
#   form1.touch(true) do
#     form1.delete(true)
#     layout
#   end
#
# end
#
# form