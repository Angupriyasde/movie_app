class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :imdbID
      t.string :movie_type
      t.string :poster
      t.boolean :favorite

      t.timestamps
    end
  end
end
