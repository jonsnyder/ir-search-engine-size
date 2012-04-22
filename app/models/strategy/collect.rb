class Strategy::Collect < Strategy
  has_many :collect_queries

  def run( sample_strategy)
    engines = sample_strategy.sampled_urls.engine.group("sampled_urls.engine_id")

    sample_strategy.sampled_urls.all do |sampled_url|
      if sampled_url.collect_queries.where( :strategy => self).count() == 0
        sample( sampled_url, engines.collect { |engine| engine.id != sampled_url.engine.id } )
      end
    end
  end
end
