class Checking::TextHandler < Nokogiri::XML::SAX::Document

  def initialize
    @words = {}
    @inside_body = false
  end

  def unique_words
    @words.keys
  end

  def start_element( name, attrs=[])
    if name.downcase == "body"
      @inside_body = true
    end
  end

  def end_element( name)
    if name.downcase == "body"
      @inside_body = false
    end
  end

  def characters( string)
    if @inside_body
      begin
        string.scan(/\b[a-zA-Z]+\b/) do |word|
          @words[word.downcase] = true
        end
      rescue
      end
    end
  end
  
end
