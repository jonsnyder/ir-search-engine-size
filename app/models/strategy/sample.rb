class Strategy::Collect < Strategy
  has_many :sampled_urls

  def run( engines, i)
    engines.each do |engine|
      count = sampled_urls.where( :engine => engine)
      if count < i
        (i - count).times do 
          sample( engine)
        end
      end
    end
  end
end
    
