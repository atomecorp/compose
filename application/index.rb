require './authentication/login_form'

# frozen_string_literal: true

c = box({ color: :yellow, left: 333 })

c.touch(true) do
  c.message('****************************************')
  # c = box({ color: :red, left: 333 })
end