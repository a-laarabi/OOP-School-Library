require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  menu = Menu.new
  puts 'Welcome to School Library App!'
  menu.list_actions

  app.run
end

main
