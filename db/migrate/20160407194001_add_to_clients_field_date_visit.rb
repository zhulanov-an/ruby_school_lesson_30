class AddToClientsFieldDateVisit < ActiveRecord::Migration
  def change
  	add_column :Clients, :datestamp_visit, :string
  end
end