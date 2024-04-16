class RemoverPersonIdFromPeople < ActiveRecord::Migration[7.1]
  def change
    remove_column :people,:person_id
  end
end
