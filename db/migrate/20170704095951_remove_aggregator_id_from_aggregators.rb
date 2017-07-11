class RemoveAggregatorIdFromAggregators < ActiveRecord::Migration[5.0]
  def change
    remove_column :aggregators, :aggregator_id, :integer
  end
end
