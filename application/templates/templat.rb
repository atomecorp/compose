# On récupère le user_id déjà stocké en local storage
user_stocked = JS.global[:localStorage].getItem('user_id')
puts "user stocked : #{user_stocked}"

# Si aucun user_id n'est stocké localement
if !user_stocked
  # On récupère le user_id généré à l'ouverture de l'application
  user_id = Universe.current_user
  puts "new user_id : #{user_id}"
  # On stocke ce user_id dans le local storage
  JS.global[:localStorage].setItem('user_id', user_id)
else
  # Sinon on récupère celui déjà stocké en local storage
  user_id = user_stocked
  puts "user_id du else : #{user_id}"
end

# Bouton pour créer un nouvel atome et lui attribuer l'id du current_user
box1 = box(creator: user_id, width: 300)
box1.text("Creer un atome").center(true)

puts 'createur : ' + box1.creator

box1.touch(true) do
  box1.color(:red)
  # On crée un nouvel atome et on lui attribue l'id du current_user comme creator
  c = circle(creator: user_id, color: :green, top: 200, left: 200, width: 250, height: 80)
  c.text('creator : ' + user_id)
  puts 'createur de c : ' + c.creator
end


navigation_button = box(creator: user_id, width: 300, height: 100, top: 500, left: 50)
navigation_button.text("Aller au formulaire d'inscription").center(true)

# Apparition du formulaire d'inscription quand on appuie sur le bouton correspondant
navigation_button.touch(true) do
  require_relative '../authentication/login_form'
  # On appelle la fonction authent_form du fichier 'login_form.rb' pour afficher le formulaire d'inscription
  authent_form
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