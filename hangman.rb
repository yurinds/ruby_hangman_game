require './models/game.rb'
require './models/result_printer.rb'

word = ARGV[0]

if [nil, ''].include?(word)
  puts 'Программа принудительно закрыта.    Введите слово в качестве параметра при запуске программы!'
  exit
end

result_printer = ResultPrinter.new
game           = Game.new(word)

result_printer.print_status(game)

until [-1, 1].include?(game.status)

  puts game.status

  game.check_user_letter

  result_printer.print_status(game)

end
