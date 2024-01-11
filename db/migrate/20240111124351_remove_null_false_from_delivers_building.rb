class RemoveNullFalseFromDeliversBuilding < ActiveRecord::Migration[7.0]
  def change
    change_column_null :delivers, :building, true
  end
end
