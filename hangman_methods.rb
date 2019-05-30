# очищаем экран консоли
def cls
  system('cls') || system('clear')
end

# Получаем слово для игры
def get_letters
  word = ARGV[0]

  if [nil, ''].include?(word)
    puts 'Введите слово в качестве параметра при запуске программы'
    exit
  end

  word.split('') # разбиваем слово на массив букв
end

def get_user_input
  letter = ''

  letter = STDIN.gets.strip while letter == ''
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
end

def print_status(params)
  puts
  puts "Слово: #{get_letters_for_print(params)}"

  puts "Ошибки (#{params[:errors]}): #{params[:bad_letters].join(', ')}"

  if params[:errors] >= 7
    puts 'Попытки закончились. Вы проиграли!'
  else
    if params[:good_letters].uniq.sort == params[:letters].uniq.sort
      puts 'Вы выиграли!'
      puts
    else
      puts "У вас осталось попыток: #{(7 - params[:errors])}"
    end
  end
end
