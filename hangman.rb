require_relative './game.rb'
require_relative './result_printer.rb'

current_path = File.dirname(__FILE__)

file_path = current_path + '/data/words.txt'

if File.exist?(file_path)
  new_file = File.new(file_path, 'r:UTF-8')
  lines = new_file.readlines
  abort 'В текстовом файле (./data/words.txt) отсутствуют слова для игры!' if lines.empty?
else
  puts 'Программа принудительно закрыта. В пути ./data/words.txt отсутствует файл'
  exit
end

word = lines.sample.strip

result_printer = ResultPrinter.new
game           = Game.new(word)

result_printer.print_status(game)

until [-1, 1].include?(game.status)

  puts game.status

  game.check_user_letter

  result_printer.print_status(game)

end
