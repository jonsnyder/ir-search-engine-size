class Strategy::Match < Strategy

  def run( sample_strategy, collect_strategy) 
    sample_strategy.sampled_urls.collect_queries.where( :strategy => collect_strategy).collected_urls do |collected_url|
      if collected_url.collected_matches.where( :strategy => self).count == 0
        match( collected_url)
      end
    end    
  end
end
