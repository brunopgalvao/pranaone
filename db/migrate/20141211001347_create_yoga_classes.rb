class CreateYogaClasses < ActiveRecord::Migration
  def change
    create_table :yoga_classes do |t|
      t.string :name
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :yoga_classes, :users
  end
end
