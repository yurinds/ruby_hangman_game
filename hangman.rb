require './hangman_methods.rb'

cls # очистка экрана

puts 'Игра виселица.'
puts
sleep 1

letters = get_letters

program_params = { letters: letters, errors: 0, good_letters: [], bad_letters: [] }

while errors < 7
  print_status(program_params)

  puts
  print 'Введите следующую букву: '
  user_input = get_user_input

  result = check_user_input(user_input, program_params)

  if result == -1
    program_params[:errors] += 1
  elsif result == 1
    break
  end
end

print_status(program_params)
