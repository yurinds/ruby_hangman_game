class Game
  attr_reader :status, :good_letters, :bad_letters, :letters_to_show, :letters_to_status, :errors, :word

  MAX_ERRORS = 7
  SPECIAL_LETTERS = { 'Й' => 'И', 'И' => 'Й', 'Ё' => 'Е', 'Е' => 'Ё' }.freeze

  def initialize(word)
    @good_letters = []
    @bad_letters  = []
    @letters_to_show   = get_letters(word)
    @letters_to_status = get_letters_with_special_symbols
    @errors       = 0
    @status       = :in_progress
    @word         = word
  end

  def max_errors
    MAX_ERRORS
  end

  def get_letters(word)
    letters = word.split('').map(&:upcase)
  end

  def get_letters_with_special_symbols
    all_letters = []

    @letters_to_show.each do |letter|
      all_letters << letter
      all_letters << SPECIAL_LETTERS[letter] if SPECIAL_LETTERS[letter]
    end

    all_letters
  end

  def letter_has_been_entered?(user_letter)
    @good_letters.include?(user_letter) || @bad_letters.include?(user_letter)
  end

  def over?
    %i[win loose].include?(@status)
  end

  def win?
    @status == :win
  end

  def loose?
    @status == :loose
  end

  def check_user_letter(user_letter)
    user_letter.upcase!
    return if letter_has_been_entered?(user_letter)

    if @letters_to_status.include?(user_letter)
      add_to_good_letters(user_letter)
    else
      add_to_bad_letters(user_letter)
      @errors += 1
    end

    set_status
  end

  def set_status
    @status = :loose if @errors >= MAX_ERRORS
    @status = :win if @good_letters.uniq.size == @letters_to_status.uniq.size
  end

  def add_to_good_letters(user_letter)
    @good_letters << user_letter
    @good_letters << SPECIAL_LETTERS[user_letter] if SPECIAL_LETTERS[user_letter]
  end

  def add_to_bad_letters(user_letter)
    @bad_letters << user_letter
    @bad_letters << SPECIAL_LETTERS[user_letter] if SPECIAL_LETTERS[user_letter]
  end
end
