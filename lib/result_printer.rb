class ResultPrinter
  attr_reader :error_images

  def initialize(current_path)
    @error_images = set_images(current_path)
  end

  def set_images(current_path)
    counter = 0
    images = []
    while counter <= 7
      file_path = current_path + "/data/#{counter}.txt"

      begin
        images << File.readlines(file_path)
      rescue SystemCallError => exception
        images << "\n [ изображение не найдено ] \n"
      end

      counter += 1
    end

    images
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

    puts "Слово: #{get_letters_for_print(game.good_letters, game.letters_to_show)}"
    puts print_hangman(game.errors)
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(', ')}"

    if game.loose?
      puts 'Попытки закончились. Вы проиграли!'
      puts "Загаданное слово: #{game.word.upcase}"
      puts
    elsif game.win?
      puts 'Вы выиграли!'
      puts
    else
      puts "У вас осталось попыток: #{(game.max_errors - game.errors)}"
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
