class DeleteDoubleWalterWhite < ActiveRecord::Migration
  def change
    Barber.destroy(4)
  end
end
