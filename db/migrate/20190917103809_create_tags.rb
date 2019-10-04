class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :book, foreign_key: true
      t.string :genre

      t.timestamps
    end
  end
end
