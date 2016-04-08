class DropClients < ActiveRecord::Migration
  def change
    drop_table :Clients
  end
end
