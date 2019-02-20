class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_first
      t.string :author_last
      t.integer :genre_id
      t.timestamps
    end
  end
end
