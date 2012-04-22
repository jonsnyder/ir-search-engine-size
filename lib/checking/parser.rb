class Checking::Parser

  def initialize
  end

  def parse( url)
    agent = Mechanize.new
    doc = agent.get url
    th = Checking::TextHandler.new
    parser = Nokogiri::HTML::SAX::Parser.new( th)
    parser.parse( doc.content)
    th.unique_words
  end
end
