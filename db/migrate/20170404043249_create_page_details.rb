class CreatePageDetails < ActiveRecord::Migration
  def change
    create_table :page_details do |t|
      t.string :h1_tags, array: true, default: []
      t.string :h2_tags, array: true, default: []
      t.string :h3_tags, array: true, default: []
      t.string :url

      t.timestamps null: false
    end
  end
end
