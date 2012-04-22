class Engine::Bing


  def search( query, page = 1)

    agent = Mechanize.new
    doc = agent.get 'http://www.bing.com/search?q=' + query + ( page > 1 ? '&first=' + ((page - 1) * 10 + 1).to_s : "")

    doc.search('li.sa_wr div.sb_tlst h3 a').each do |link|
      yield parse_link( link['href'])
    end
  end

  protected

  def parse_link( link)
    link
  end

end
