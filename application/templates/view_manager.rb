module ViewManager
  @view = nil

  def self.initialize_view
    @view ||= box({
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    height: :auto,
                    width: :auto,
                    color: { red: 0.125, green: 0.125, blue: 0.125, alpha: 0.7 },
                    z_index: 10
                  })
  end

  def self.show_view
    @view.opacity(1) if view
  end

  def self.hide_view
    @view.opacity(0) if view
  end

  def self.view
    @view
  end

  def self.add_child(child)
    @view.add(child) if @view && child
  end

  def self.remove_child(child)
    @view.remove(child) if @view && child
  end

end