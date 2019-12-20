class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :votes, default: 0
      t.float :rating, scale: 1, default: 0.0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :movies, :title
    add_index :movies, :rating
  end
end
