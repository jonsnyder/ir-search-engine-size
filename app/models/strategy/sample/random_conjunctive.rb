class Strategy::Sample::RandomConjunctive < Strategy::Sample

  after_initialize :init
  def init
    options[:query_size] ||= 2
    options[:freq_lower] ||= 10000
    options[:freq_upper] ||= 20000
    options[:results_size] ||= 100

    self.name ||= "Conjunctive query of size #{options[:query_size]} from terms in the frequency range of #{options[:freq_lower]} to #{options[:freq_upper]} and a random result from the top #{options[:results_size]}"
  end

  def sample( engine)

    difference = options[:freq_upper] - options[:freq_lower]
    delta = (difference / 200).to_i
    lower = options[:freq_lower] + Random.rand(200) * delta
    upper = lower + delta
    
    term_generator = Sampler::RandomTerm.new( lower, upper)

    query = []
    options[:query_size].times { query << term_generator.term }
    query = query.join(" ")

    page = 1 + Random.rand( options[:results_size] / 10)
    urls = []
    engine.search( query, page) do |url|
      urls << url
    end
    i = Random.rand( urls.size)
    url = urls[i]

    if url.blank?
      raise "Blank URL"
    end

    agent = Mechanize.new
    head = agent.head url
    if !(head.is_a? Mechanize::Page) || head.content_type != "text/html"
      raise "Not Text/HTML Content"
    end
    
    SampledUrl.create( :engine => engine,
                       :url => url,
                       :query => query,
                       :result_number => (page-1)*10 + i + 1,
                       :strategy => self)
  rescue
    retry  
  end
end
