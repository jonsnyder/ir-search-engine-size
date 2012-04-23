class Analysis::Stats
  extend ActiveSupport::Memoizable
  
  def initialize( sample_strategy, collect_strategy, match_strategy)
    @sample_strategy = sample_strategy
    @collect_strategy = collect_strategy
    @match_strategy = match_strategy
  end
  
  def sampled( a)
    CollectQuery
      .includes( :sampled_url)
      .where( :collect_queries => { :engine_id => a.id, :strategy_id => @collect_strategy.id},
              :sampled_urls => { :strategy_id => @sample_strategy.id})
      .count
  end
  memoize :sampled

  def matching_collected_urls( a, b)
    CollectedMatch
      .includes( :collected_urls => { :collect_queries => [ :sampled_urls ] })
      .where( :sampled_urls => { :engine_id => a.id, :strategy_id => @sample_strategy.id},
              :collect_queries => { :strategy_id => @collect_strategy.id},
              :collected_urls => { :engine_id => b.id },
              :collected_matches => { :is_match => true, :strategy_id => @match_strategy.id})
      .group( "collect_queries.id, collected_matches.is_match")
      .count
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
