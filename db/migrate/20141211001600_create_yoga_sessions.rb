class CreateYogaSessions < ActiveRecord::Migration
  def change
    create_table :yoga_sessions do |t|
      t.date :session_date
      t.string :session_time
      t.references :yoga_class, index: true

      t.timestamps null: false
    end
    add_foreign_key :yoga_sessions, :yoga_classes
  end
end
