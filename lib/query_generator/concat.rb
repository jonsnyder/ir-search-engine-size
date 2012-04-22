class QueryGenerator::Concat

  def initialize(size)
    @size = size
  end

  def random
    query = []
    @size.times do
      query.push random_single_term
    end
    query.join("+")
  end

  protected

  def random_single_term
    size = Term.where( "freq > 10000 AND freq < 20000").count()
    Term.where( "freq > 10000 AND freq < 20000").offset(Random.rand(size)).limit(1).first.term
  end
end
