class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end

    add_index :listings, [:movie_id, :list_id], unique: true
  end
end
