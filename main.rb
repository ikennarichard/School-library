require_relative 'app'
require_relative 'select'

class Main
  include Select
  def initialize
    run
  end

  def run
    app = App.new
    loop do
      options
      num = gets.chomp
      break if num == '7'

      select_option(app, num)
      puts "\n"
    end
  end
end

main = Main.new
main
