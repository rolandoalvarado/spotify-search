class CreateArtist < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.integer :artist_id
      t.string :external_url
      t.string :genres
      t.string :href
      t.string :name
      t.boolean :favourite
    end
  end
end
