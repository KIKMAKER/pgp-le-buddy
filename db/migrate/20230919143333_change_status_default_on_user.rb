class ChangeStatusDefaultOnUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :status, nil
  end
end
