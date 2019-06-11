class WordSelector
  attr_reader :word

  def initialize
    @word = get_word_from_file
  end

  def get_word_from_file
    current_path = File.dirname(__FILE__)

    file_path = current_path + '/data/words.txt'

    begin
      new_file = File.new(file_path, 'r:UTF-8')
    rescue SystemCallError => exception
      puts 'Не удалось прочитать файл ' + exception.message
      return nil
    end

    lines = new_file.readlines
    new_file.close

    word = if !lines.empty?
             lines.sample.strip
           else
             ''
           end

    word
  end
end
