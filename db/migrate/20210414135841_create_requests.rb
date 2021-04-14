class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.belongs_to :user
      t.belongs_to :booking
      t.boolean :approved, default: false
    end
  end
end
