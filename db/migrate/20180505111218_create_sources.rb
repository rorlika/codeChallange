class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.text :h1, array: true, default: []
      t.text :h2, array: true, default: []
      t.text :h3, array: true, default: []
      t.text :links, array: true, defaul: []

      t.timestamps
    end
  end
end
