class Analysis::Stats
  extend ActiveSupport::Memoizable
  
  def sampled( a)
    SampledUrls.where( :engine => a).count
  end
  memoize :sampled

  def matching_collected_urls( a, b)
    SampledUrls.where( :engine => a).collect_queries.collected_urls.where( :engine => b, :is_match => true).count
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
