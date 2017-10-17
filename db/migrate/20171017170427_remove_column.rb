class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_reference :categories, :job, index: true, foreign_key: true
  end
end
