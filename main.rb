require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  app.list_actions

  app.run
end

main
