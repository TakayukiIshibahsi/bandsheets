class CreateBandPersonRbs < ActiveRecord::Migration[7.1]
  def change
    create_table :band_person_rbs do |t|
      t.integer :band_id
      t.integer :person_id

      t.timestamps
    end
  end
end
