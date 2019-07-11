class WordSelector
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def self.from_file(current_path)

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

    new(word)
  end
end
