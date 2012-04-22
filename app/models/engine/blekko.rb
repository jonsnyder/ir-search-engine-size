class Engine::Blekko < Engine


  def search( query, page = 1)

    agent = Mechanize.new
    doc = agent.get 'http://blekko.com/ws/' + query + ( page > 1 ? '?p=' + (page - 1).to_s : "")

    doc.search('li.result a.UrlTitleLine').each do |link|
      yield parse_link( link['href'])
    end
  end

  protected

  def parse_link( link)
    link
  end

end
