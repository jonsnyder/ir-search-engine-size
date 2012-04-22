class Engine::Google < Engine

  after_initialize :init
  def init
    self.name ||= "Google"
  end

  def search( query, page = 1)

    agent = Mechanize.new
    doc = agent.get 'http://www.google.com/search?q=' + query + ( page > 1 ? '&start=' + ((page - 1) * 10).to_s : "")

    doc.search('h3.r a').each do |link|
      yield parse_link( link['href'])
    end
  end

  protected

  def parse_link( link) 
    if m = /\/url\?q=(.*?)&/.match( link)
      m[1]
    end
  end

end
