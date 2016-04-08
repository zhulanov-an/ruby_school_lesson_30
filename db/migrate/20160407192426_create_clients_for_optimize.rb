class CreateClientsForOptimize < ActiveRecord::Migration
  def change
  	create_table :Clients do |t|
  	  t.text :name_user
      t.text :phone
      t.text :barber
      t.text :color

			t.timestamps
		end

  end
end