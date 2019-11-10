class CreateTextPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :text_posts do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end
