class CreateMappedValues < ActiveRecord::Migration
  def change
    create_table :mapped_values do |t|
      t.text :value
      t.references :tag

      t.timestamps
    end
    add_index :mapped_values, :tag_id
  end
end
