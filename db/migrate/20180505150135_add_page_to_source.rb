class AddPageToSource < ActiveRecord::Migration[5.1]
  def change
    add_reference :sources, :page, foreign_key: true
  end
end
