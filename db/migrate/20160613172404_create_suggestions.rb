class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :content
      t.string :name
      t.string :email
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
