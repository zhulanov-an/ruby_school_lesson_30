class InsertBarbers < ActiveRecord::Migration
  def change
    Barber.create(:name => 'Walter White')
    Barber.create(:name => 'Johny Noxvill')
    Barber.create(:name => 'Gus Fulton')
  end
end
