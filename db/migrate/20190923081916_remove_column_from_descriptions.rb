class RemoveColumnFromDescriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :descriptions, :content, :text
  end
end
