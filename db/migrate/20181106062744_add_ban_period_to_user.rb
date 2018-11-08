class AddBanPeriodToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ban_period, :datetime
  end
end
