class CreateConsultants < ActiveRecord::Migration[7.1]
  def change
    create_table :consultants do |t|
      t.string :name
      t.string :image
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
