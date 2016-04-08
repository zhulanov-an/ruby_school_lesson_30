class CreateClientsWithTimestamp < ActiveRecord::Migration
  def change
    create_table :Clients do |t|
      t.text :name_user
      t.text :phone
      t.text :barber
      t.text :color
      t.timestamp
    end
  end
end
