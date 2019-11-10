class MakePostsPolymorphic < ActiveRecord::Migration[6.0]
  class Post < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextPost < ApplicationRecord; end

  def change
    change_table(:posts) do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]
    end

    reversible do |dir|
      Post.reset_column_information
      Post.find_each do |post|
        dir.up do
          text_post = TextPost.create(body: post.body)
          post.update(content_id: text_post.id, content_type: "TextPost")
        end
        dir.down do
          post.update(body: post.content.body)
          post.content.destroy
        end
      end
    end

    remove_column :posts, :body, :string
  end
end
