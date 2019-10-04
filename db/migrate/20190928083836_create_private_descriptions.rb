class CreatePrivateDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :private_descriptions do |t|
      t.references :tag, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
