class Strategy::Collect::LowestFrequency < Strategy::Collect

  after_initialize :init
  def init
    options[:query_size] ||= 8
    self.name = "Query of size #{options[:query_size]} of the lowest Frequency words from terms in the document"
  end

  def collect( sampled_url, engines)
    parser = Checking::Parser.new
    words = parser.parse( sampled_url.url)
    f = Checking::Fingerprint.new( options[:query_size])
    query = f.top_words( words).join(" ")
    
    collected_query = sampled_url.collect_queries.create( :query => query, :strategy => self)
    
    engines.each do |engine|
      engine.search( query) do |url|
        collected_query.collected_urls.create( :engine => engine, :url => url)
      end
    end

    collected_query
  end    
end
