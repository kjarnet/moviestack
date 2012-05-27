class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :url
      t.string :short
      t.text :long

      t.timestamps
    end
  end
end
