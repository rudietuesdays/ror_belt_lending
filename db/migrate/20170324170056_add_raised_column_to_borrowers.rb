class AddRaisedColumnToBorrowers < ActiveRecord::Migration[5.0]
  def change
    add_column :borrowers, :amt_raised, :integer
  end
end
