class Game
  attr_reader :status, :good_letters, :bad_letters, :letters, :errors

  def initialize(word)
    @good_letters = []
    @bad_letters  = []
    @letters      = get_letters(word)
    @errors       = 0
    @status       = 0
  end

  # Получаем слово для игры
  def get_letters(word)
    letters = word.split('').collect(&:upcase)
  end

  def get_next_letter_from_user
    puts
    print 'Введите следующую букву: '

    letter = ''
    letter = STDIN.gets.strip.upcase while letter == ''

    letter
  end

  def check_user_letter
    user_letter = get_next_letter_from_user

    return if @good_letters.include?(user_letter) || @bad_letters.include?(user_letter) # пользователь ввел уже известный символ

    special_letters = if %w[И Й].include?(user_letter)
                        %w[И Й]
                      elsif %w[Е Ё].include?(user_letter)
                        %w[Е Ё]
                      end

    if !special_letters.nil?
      special_letters.each do |special_letter|
        @good_letters << special_letter if @letters.include?(special_letter)
      end
    elsif @letters.include?(user_letter)
      @good_letters << user_letter
    else
      @bad_letters << user_letter
      @errors += 1
      @status = -1 if @errors >= 7
  end

    @status = 1 if @good_letters.uniq.size == @letters.uniq.size
  end
end
