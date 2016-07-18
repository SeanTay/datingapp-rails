class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :location
      t.string :work
      t.string :school
      t.text :description
      t.string :profile_pic_url

      t.timestamps
    end
  end
end
