class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :watched
      t.integer :external_rating
      t.integer :my_rating
      t.integer :current_season
      t.string :type

      t.timestamps
    end
  end
end
