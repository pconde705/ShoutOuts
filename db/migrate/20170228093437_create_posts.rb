class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.boolean :is_shoutout
      t.boolean :is_antishoutout
      t.references :school, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
