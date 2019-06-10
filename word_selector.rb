class WordSelector
  attr_reader :word

  def initialize
    @word = get_word_from_file
  end

  def get_word_from_file
    current_path = File.dirname(__FILE__)

    file_path = current_path + '/data/words.txt'

    lines = []
    if File.exist?(file_path)
      new_file = File.new(file_path, 'r:UTF-8')
      lines = new_file.readlines
      new_file.close
    end

    word = if !lines.empty?
             lines.sample.strip
           else
             ''
           end

    word
  end
end
