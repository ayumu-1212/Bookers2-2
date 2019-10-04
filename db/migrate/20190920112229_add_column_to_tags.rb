class AddColumnToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :tag_content, index: true
  end
end
