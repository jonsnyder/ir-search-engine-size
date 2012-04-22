class Sampler::RandomTerm

  def initialize( freq_lower, freq_upper)
    @freq_lower = freq_lower
    @freq_upper = freq_upper
  end
  
  def term
    where = "freq > #{@freq_lower} AND freq < #{@freq_upper}"
    size = Term.where( where).count()
    Term.where( where).offset(Random.rand(size)).limit(1).first.term
  end

end
