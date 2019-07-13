require_relative 'lib/game'
require_relative 'lib/result_printer'
require_relative 'lib/word_selector'

current_path = File.dirname(__FILE__)

selector = WordSelector.from_file(current_path)
abort 'Не удалось прочитать слово для игры!' unless selector

word = selector.word

if word == ''
  puts 'В текстовом файле (./data/words.txt) отсутствуют слова для игры!'
  exit
elsif word.nil?
  puts 'Не удалось открыть файл (./data/words.txt)!'
  exit
end

result_printer = ResultPrinter.new(current_path)
game           = Game.new(word)

result_printer.print_status(game)

until game.over?

  puts
  print 'Введите следующую букву:  '

  letter = ''
  letter = STDIN.gets.strip.upcase while letter == ''

  game.check_user_letter(letter)

  result_printer.print_status(game)

end
