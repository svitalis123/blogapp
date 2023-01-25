class AddAuthorIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :AuthorId, null: false, foreign_key: true
  end
end
