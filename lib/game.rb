class Game
  attr_reader :status, :good_letters, :bad_letters, :letters, :errors, :word

  MAX_ERRORS = 7

  def initialize(word)
    @good_letters = []
    @bad_letters  = []
    @letters      = get_letters(word)
    @errors       = 0
    @status       = 0
    @word         = word
  end

  # Получаем слово для игры
  def get_letters(word)
    letters = word.split('').map(&:upcase)
  end

  def letter_has_been_entered?(user_letter)
    @good_letters.include?(user_letter) || @bad_letters.include?(user_letter)
  end

  def check_user_letter(user_letter)
    return if letter_has_been_entered?(user_letter)

    if @letters.include?(user_letter)
      @good_letters << user_letter
    else
      @bad_letters << user_letter
      @errors += 1
      @status = :loose if @errors >= MAX_ERRORS
    end

    @status = :win if @good_letters.uniq.size == @letters.uniq.size
  end
end
