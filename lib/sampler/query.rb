class Sampler::Query

  def initialize( engine, queries)
    @engine = engine
    @queries = queries
  end

  def sample
    query = @queries.random
    page = 1 + Random.rand(10)
    Enumerator.new do |e|
      @engine.search( query, page) do |url|
        e << url
      end
    end
    
end
