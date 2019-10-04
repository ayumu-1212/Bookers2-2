class RemoveGenreFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :genre, :string
  end
end
