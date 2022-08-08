class ChangeRationaleToWorkPerformed < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :rationale, :work_performed
  end
end
