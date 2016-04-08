class CreateContacts < ActiveRecord::Migration
  def change
    create_table :Contacts do |t|
      t.text :email
      t.text :content
      t.timestamps
    end
  end
end