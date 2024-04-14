class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.integer :person_id
      t.text :person_name
      t.integer :band_id

      t.timestamps
    end
  end
end
