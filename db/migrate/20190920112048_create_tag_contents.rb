class CreateTagContents < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_contents do |t|
      t.text :genre

      t.timestamps
    end
  end
end
