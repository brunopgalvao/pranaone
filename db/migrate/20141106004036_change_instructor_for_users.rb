class ChangeInstructorForUsers < ActiveRecord::Migration
  def change
    change_column :users, :instructor, :boolean, default: false
  end
end
