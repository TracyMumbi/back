class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.integer :weight
      t.integer :age

      t.timestamps
    end
  end
end
