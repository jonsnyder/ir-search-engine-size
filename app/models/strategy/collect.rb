class Strategy::Collect < Strategy

  def run( sample_strategy)
    engines = sample_strategy.sampled_urls.group("sampled_urls.engine_id").map(&:engine)

    sample_strategy.sampled_urls.all.each do |sampled_url|
      if sampled_url.collect_queries.where( :strategy_id => self.id).count() == 0
        collect( sampled_url, engines)
      end
    end

    true
  end
end
