class AddBandIdToPeople < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :band_id, :integer
    
  end
end
