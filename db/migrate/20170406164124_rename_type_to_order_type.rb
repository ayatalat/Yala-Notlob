class RenameTypeToOrderType < ActiveRecord::Migration[5.0]
  def change
  	    rename_column :orders, :type, :orderType

  end
end
