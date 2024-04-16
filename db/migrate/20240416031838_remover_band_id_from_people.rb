class RemoverBandIdFromPeople < ActiveRecord::Migration[7.1]
  def change
   
    remove_column :people,:band_id 
 
  end
end
