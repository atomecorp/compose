class TemplateManager

  def self.anonymous_id
    JS.global[:localStorage].getItem('anonymous_id')
  end

  def self.current_user
    JS.global[:localStorage].getItem('current_user')
  end

  def self.set_current_user(user_id)
    JS.global[:localStorage].setItem('current_user', user_id)
  end

  def self.set_anonymous_id(anonymous_id)
    JS.global[:localStorage].setItem('anonymous_id', anonymous_id)
  end

  def self.reset_to_anonymous
    anonymous_id = anonymous_id()
    JS.global[:localStorage].clear
    set_anonymous_id(anonymous_id)
    set_current_user(anonymous_id)
    JS.global[:localStorage].setItem('logged', 'false')
  end

  def self.initialize_user
    unless anonymous_id
      anonymous_id = Universe.current_user
      JS.global[:localStorage].setItem('anonymous_id', anonymous_id)
    end

    unless current_user
      current_user = Universe.current_user
      set_current_user(current_user)
    end
  end

end