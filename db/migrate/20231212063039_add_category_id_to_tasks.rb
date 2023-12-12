class AddCategoryIdToTasks < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :category, null: false, foreign_key: true, default: 1
    change_column_default :tasks, :category_id, nil
  end
end
