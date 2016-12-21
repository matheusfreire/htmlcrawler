class RenameColumnTypeFromTags < ActiveRecord::Migration[5.0]
  def change
    rename_column :tags, :type, :element
  end
end
