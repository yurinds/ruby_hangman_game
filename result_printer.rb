class ResultPrinter
  attr_reader :error_images

  def initialize
    current_path = File.dirname(__FILE__)
    @error_images = []

    x = 0
    while x <= 7
      file_path = current_path + "/data/#{x}.txt"
      puts file_path
      if File.exist?(file_path)
        new_file = File.new(file_path, 'r:UTF-8')
        @error_images << new_file.read
        new_file.close
      else
        @error_images << "\n [ изображение не найдено ] \n"
        end

      x += 1
    end
  end

  def get_letters_for_print(good_letters, letters)
    result = ''

    letters.each do |letter|
      result += if good_letters.include?(letter)
                  letter + ' '
                else
                  '__ '
                end
    end

    result
    end

  def print_status(game)
    cls

    puts "Слово: #{get_letters_for_print(game.good_letters, game.letters)}"
    puts print_hangman(game.errors)
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(', ')}"

    if game.status == -1
      puts 'Попытки закончились. Вы проиграли!'
      puts "Загаданное слово: #{game.word.upcase}"
      puts
    elsif game.status == 1
      puts 'Вы выиграли!'
      puts
    else
      puts "У вас осталось попыток: #{(7 - game.errors)}"
    end
  end

  # очищаем экран консоли
  def cls
    system('cls') || system('clear')
  end

  def print_hangman(errors)
    @error_images[errors]
  end
end