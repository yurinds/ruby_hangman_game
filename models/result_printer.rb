class ResultPrinter
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
    case errors
    when 0
      puts "
            _______
            |/
            |
            |
            |
            |
            |
            |
            |
          __|________
          |         |
          "
    when 1
      puts "
          _______
          |/
          |     ( )
          |
          |
          |
          |
          |
          |
        __|________
        |         |
        "
    when 2
      puts "
          _______
          |/
          |     ( )
          |      |
          |
          |
          |
          |
          |
        __|________
        |         |
        "
    when 3
      puts "
          _______
          |/
          |     ( )
          |      |_
          |        \\
          |
          |
          |
          |
        __|________
        |         |
        "
    when 4
      puts "
          _______
          |/
          |     ( )
          |     _|_
          |    /   \\
          |
          |
          |
          |
        __|________
        |         |
        "
    when 5
      puts "
          _______
          |/
          |     ( )
          |     _|_
          |    / | \\
          |      |
          |
          |
          |
        __|________
        |         |
        "

    when 6
      puts "
          _______
          |/
          |     ( )
          |     _|_
          |    / | \\
          |      |
          |     / \\
          |    /   \\
          |
        __|________
        |         |
        "
    when 7
      puts "
          _______
          |/     |
          |     (_)
          |     _|_
          |    / | \\
          |      |
          |     / \\
          |    /   \\
          |
        __|________
        |         |
        "

    end
  end
end
