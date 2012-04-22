class AddInitialStrategies < ActiveRecord::Migration
  def change
    Strategy::Sample::RandomConjunctive.create
    Strategy::Collect::LowestFrequency.create
    Strategy::Match::Exact.create
  end
end
