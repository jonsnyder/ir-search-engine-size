class Strategy::Match < Strategy

  def run( sample_strategy, collect_strategy) 
    sample_strategy.sampled_urls.each do |sampled_url|
      sampled_url.collect_queries.where( :strategy_id => collect_strategy.id).each do |collect_query|
          collect_query.collected_urls.each do |collected_url|
          if collected_url.collected_matches.where( :strategy_id => self.id).count == 0
            match( collected_url)
          end
        end
      end
    end
    true
  end
end
