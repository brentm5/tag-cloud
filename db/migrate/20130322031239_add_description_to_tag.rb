class AddDescriptionToTag < ActiveRecord::Migration
  def change
    add_column :tags, :description, :text, default: ''
  end
end
