class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :show_id
      t.string :genre
      t.string :title
      t.string :director
      t.string :cast
      t.string :country
      t.string :string
      t.string :date_added
      t.string :release_year
      t.string :rating
      t.string :duration
      t.string :listed_in
      t.string :description

      t.timestamps
    end
  end
end
