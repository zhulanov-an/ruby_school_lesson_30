class CreateClients < ActiveRecord::Migration
  def change
    create_table :Clients do |t|
      t.text :name_user
      t.text :phone
      t.text :datestamp
      t.text :barber
      t.text :color
    end
  end
end
