class Engine::Ask < Engine


  def search( query, page = 1)

    agent = Mechanize.new
    doc = agent.get 'http://www.ask.com/web?q=' + query + ( page > 1 ? '&page=' + page.to_s : "")

    doc.search('div.ptbs > div > a').each do |link|
      yield parse_link( link['href'])
    end
  end

  protected

  def parse_link( link)
    link
  end

end
