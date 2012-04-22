class Checking::Fingerprint

  def top_words( words)
    Term.where( :term => words).order( :freq).limit(10).map(&:term)
  end
end
