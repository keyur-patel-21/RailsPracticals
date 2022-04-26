class AddCommentToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :acomments, :article, foreign_key: true
  end
end
