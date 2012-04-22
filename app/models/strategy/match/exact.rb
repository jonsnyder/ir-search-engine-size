class Strategy::Match::Exact < Strategy::Match

  after_initialize :init
  def init
    self.name ||= "Exact Match"
  end

  def match( collected_url) 
    is_match = (collected_url.collect_query.sampled_url.url == collected_url.url)
    collected_url.collected_matches.create( :strategy => self, :is_match => is_match)
  end
  
end
