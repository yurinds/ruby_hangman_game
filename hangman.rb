require_relative './game.rb'
require_relative './result_printer.rb'
require_relative './word_selector.rb'

selector = WordSelector.new

word = selector.word

if word == ''
  puts 'В текстовом файле (./data/words.txt) отсутствуют слова для игры либо файла не существует!'
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
