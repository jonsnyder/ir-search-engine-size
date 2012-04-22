class Googlebooks::Parser

  def initialize( file_handle)
    @file_handle = file_handle
  end

  def each_word_in_batches( batch_size = 1000)
    last_word = ""
    last_word_freq = 0
    batch = []
    @file_handle.each_line do |line|
      word, year, freq, pages, books = line.split("\t")
      if /^[a-zA-Z]*$/ =~ word
        word = word.downcase
        if word != last_word && last_word_freq > 0
          batch << [last_word, last_word_freq]
          last_word_freq = 0
          if batch.size >= batch_size
            yield batch
            batch = []
          end
        end
        last_word = word
        
        if year.to_i > 1995
          last_word_freq += freq.to_i
        end
      end
    end
    if last_word_freq > 0
      batch << [last_word, last_word_freq]
    end
    if batch.size > 0
      yield batch
    end
  end
  
end
