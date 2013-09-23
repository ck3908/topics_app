class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :sector
      t.text :content
      t.string :made_by

      t.timestamps
    end
  end
end
