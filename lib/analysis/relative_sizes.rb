class Analysis::RelativeSizes

  def initialize( stats) 
    @stats = stats
  end

  def calculate

    size = @stats.size
    b = []
    m = []
    (1..size-1).each do |i|
      b << (@stats[i][0] + @stats[0][i])
      (1..size-1).each do |ii|
        if i == ii
          value = size-1
          (0..size-1).each do |iii|
            if ii != iii
              value += (@stats[iii][ii])**2
            end
          end
        else
          value = 0 - @stats[i][ii] - @stats[ii][i]
        end
        m << value
      end
    end

    b = GSL::Vector::Col.alloc( b)
    m = GSL::Matrix.alloc( m, size-1, size-1)

    x = m / b
    [1.0] + x.to_a
  end
end
