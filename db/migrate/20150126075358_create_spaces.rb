class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :planet
      t.text :des

      t.timestamps
    end
  end
end
