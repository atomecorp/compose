require './templates/templat_manager'

class TemplateInterface
  def initialize
    TemplateManager.initialize_user
    create_ui_elements
  end

  def create_ui_elements
    create_anonymous_box
    create_second_box
    create_navigation_button
    create_logout_button
  end

  def create_anonymous_box
    box1 = box(creator: TemplateManager.current_user, width: 300, height: 100, color: :green)
    box1.text("Creer un atome").center(true)

    box1.touch(true) do
      box1.color(:red)
      # Ici, vous pouvez insérer la logique pour créer de nouveaux atomes
      current_user = box1.creator
      c = circle(creator: current_user, color: :green, top: 200, left: 200, width: 250, height: 80)
      c.text('creator : ' + current_user)
    end
  end

  def create_second_box
    box2 = box(creator: TemplateManager.current_user, width: 200, left: 350)

    box2.touch(true) do
      box2.color(:red)
      b = box(top: 400, left: 200)
      current_user = box1.creator
      b.text('creator : ' + current_user)
      A.message({ action: :insert, data: { table: :atome, particles: { creator: b.creator,
                                                                       # color: c.color,
                                                                       top: b.top,
                                                                       left: b.left,
                                                                       width: b.width,
                                                                       height: b.height } } })
    end
  end

  def create_navigation_button
    navigation_button = box(creator: TemplateManager.current_user, width: 300, height: 100, top: 500, left: 50)
    navigation_button.text("Aller au formulaire d'inscription").center(true)

    # Apparition du formulaire d'inscription quand on appuie sur le bouton correspondant
    navigation_button.touch(true) do
      require_relative '../authentication/login_form'
      # On appelle la fonction authent_form du fichier 'login_form.rb' pour afficher le formulaire d'inscription
      authent_form
    end
  end

  def create_logout_button
    logout_button = box(width: 150, height: 80, top: 50, left: 500, color: :red)
    logout_button.text({ text: "Log out", color: :black })

    logout_button.touch(true) do
      TemplateManager.reset_to_anonymous
    end
  end
end