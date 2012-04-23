class Strategy::Sample < Strategy

  def run( engines, i)
    engines.each do |engine|
      count = sampled_urls.where( :engine_id => engine.id).count
      if count < i
        (i - count).times do 
          sample( engine)
        end
      end
    end
  end
end
    
