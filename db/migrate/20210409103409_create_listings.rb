class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.integer :ppn
    end
  end
end
