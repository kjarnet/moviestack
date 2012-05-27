class CreateVideoSeries < ActiveRecord::Migration
  def change
    create_table :video_series do |t|
      t.integer :current_season

      t.timestamps
    end
  end
end
