
namespace :googlebooks do
  desc "load the frequency and term information into the database"
  task :import, [:filename] => :environment do |t, args|

    parser = Googlebooks::Parser.new( File.open( args.filename))
    parser.each_word_in_batches( 10000) do |batch|
      puts batch.first.first
      ActiveRecord::Base.transaction do
        batch.each do |term, freq|
          rec = Term.find_by_term( term)
          if rec
            rec.freq += freq
            rec.save
          else
            Term.create( :term => term, :freq => freq)
          end
        end
      end
    end
  end
end
    
