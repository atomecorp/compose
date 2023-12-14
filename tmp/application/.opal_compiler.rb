# frozen_string_literal: true

require 'opal'
application_js = "../../src/js/application.js"
builder = Opal::Builder.new
builder.append_paths("./")
application_content = builder.build("./index.rb").to_s
File.open(application_js, 'w') do |f|
  f.puts application_content
end
