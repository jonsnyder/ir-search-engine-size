class Strategy::Sample::RandomConjunctive < Strategy

  after_initialize :init
  def init
    options[:query_size] ||= 2
    options[:freq_lower] ||= 10000
    options[:freq_upper] ||= 20000
    options[:results_size] ||= 100

    self.name ||= "Conjunctive query of size #{options[:query_size]} from terms in the frequency range of #{options[:freq_lower]} to #{options[:freq_upper]} and a random result from the top #{options[:results_size]}"
  end

  def sample( engine)
    term_generator = Sample::RandomTerm.new( options[:freq_lower], options[:freq_upper])

    query = []
    options[:query_size].times { query << term_generator.term }
    query = query.join(" ")

    page = 1 + Random.rand( options[:results_size] / 10)
    urls = Enumerator.new do |e|
      @engine.search( query, page) do |url|
        e << url
      end
    end
    i = Random.rand( urls.length)
    url = urls[i]

    SampledUrl.create( :engine => @engine,
                       :url => url,
                       :query => query,
                       :result_number => (page-1)*10 + i + 1,
                       :strategy => self)
  end
end
