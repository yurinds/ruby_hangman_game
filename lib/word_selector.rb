class WordSelector
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def self.from_file(current_path)
    file_path = current_path + '/data/words.txt'

    begin
      lines = File.readlines(file_path, chomp: true)
    rescue SystemCallError => exception
      return nil
    end

    word = if lines.empty?
             ''
           else
             lines.sample.strip
           end

    new(word)
  end
end
