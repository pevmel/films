class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :mark, default: 0
      t.references :user
      t.references :movie

      t.timestamps
    end
  end
end
