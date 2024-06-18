class AddStatusToConsultants < ActiveRecord::Migration[7.1]
  def change
    add_column :consultants, :status, :string
  end
end
