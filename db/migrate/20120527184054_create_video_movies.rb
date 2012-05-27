class CreateVideoMovies < ActiveRecord::Migration
  def change
    create_table :video_movies do |t|
      t.string :title
      t.text :description
      t.integer :watched
      t.integer :external_rating
      t.integer :my_rating
      t.string :type

      t.timestamps
    end
  end
end
