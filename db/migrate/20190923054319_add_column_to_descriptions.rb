class AddColumnToDescriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :descriptions, :private_content, :text
    add_column :descriptions, :pablic_content, :text
  end
end
