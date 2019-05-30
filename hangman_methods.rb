# очищаем экран консоли
def cls
  system('cls') || system('clear')
end

# Получаем слово для игры
def get_letters
  word = 'ёжик'

  if [nil, ''].include?(word)
    puts 'Введите слово в качестве параметра при запуске программы'
    exit
  end

  correct_letters = { 'Ё' => 'Е', 'Й' => 'И' }

  best_letters_arr = []

  word.upcase.split('').each do |letter|
    best_letter = correct_letters[letter] || letter
    best_word_arr << best_letter
  end

  best_word_arr
end

def get_user_input
  letter = ''

  letter = STDIN.gets.strip.upcase while letter == ''

  correct_letters = { 'Ё' => 'Е', 'Й' => 'И' }

  letter = correct_letters[letter] if correct_letters[letter]

  letter
end

def check_user_input(user_input, params)
  good_letters = params[:good_letters]
  bad_letters  = params[:bad_letters]
  letters      = params[:letters]

  return 0 if good_letters.include?(user_input) || bad_letters.include?(user_input) # пользователь ввел уже известный символ

  if letters.include?(user_input)
    good_letters << user_input

    if good_letters.uniq.sort == letters.uniq.sort
      return 1
    else
      return 0
    end
  else
    bad_letters << user_input
    return -1
  end
end

def get_letters_for_print(params)
  result = ''

  good_letters = params[:good_letters]
  letters      = params[:letters]

  letters.each do |letter|
    result += if good_letters.include?(letter)
                letter + ' '
              else
                '__ '
              end
  end

  result
end

def print_status(params)
  good_letters = params[:good_letters]
  bad_letters  = params[:bad_letters]
  letters      = params[:letters]
  errors       = params[:errors]

  cls

  puts 'Игра виселица.'
  puts
  puts "Слово: #{get_letters_for_print(params)}"

  puts "Ошибки (#{errors}): #{bad_letters.join(', ')}"

  if errors >= 7
    puts 'Попытки закончились. Вы проиграли!'
  else
    if good_letters.uniq.sort == letters.uniq.sort
      puts 'Вы выиграли!'
      puts
    else
      puts "У вас осталось попыток: #{(7 - errors)}"
    end
  end
end

get_letters
