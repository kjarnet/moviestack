class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :short
      t.text :long

      t.timestamps
    end
  end
end
