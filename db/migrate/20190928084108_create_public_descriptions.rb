class CreatePublicDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :public_descriptions do |t|
      t.references :tag_content, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
