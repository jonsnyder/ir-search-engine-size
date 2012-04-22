class Analysis::Stats
  extend ActiveSupport::Memoizable
  
  def initialize( sample_strategy, collect_strategy, match_strategy)
    @sample_strategy = sample_strategy
    @collect_strategy = collect_strategy
    @match_strategy = match_strategy
  end
  
  def sampled( a)
    SampledUrls.where( :engine => a, :sample_strategy => @sample_strategy).
      collect_queries.where( :collect_strategy => @collect_strategy).count
  end
  memoize :sampled

  def matching_collected_urls( a, b)
    SampledUrls.where( :engine => a, :sample_strategy => @sample_strategy).
      collect_queries.where( :collect_strategy => @collect_strategy).
      collected_urls.where( :engine => b).group( "collected_urls.collect_queries_id").
      collected_match.where( :is_match => true, :match_strategy => @match_strategy).count
  end
  memoize :matching_collected_urls
  
  def measured_overlap( a, b)
    matching_collected_urls( a, b) / sampled( a)
  end
  memoize :measured_overlap

  def inferred_relative_size( a, b)
    measured_overlap( b, a) / measured_overlap( a, b)
  end
  memoize :inferred_relative_size

end
