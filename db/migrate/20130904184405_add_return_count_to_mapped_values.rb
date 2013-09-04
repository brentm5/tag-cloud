class AddReturnCountToMappedValues < ActiveRecord::Migration
  def change
    add_column :mapped_values, :return_count, :int, default: 0
  end
end
