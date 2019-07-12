class CreateChecks < ActiveRecord::Migration[4.2]
    def change
        create_table :checks do |t|
        t.integer :price
        t.integer :user_id
        t.integer :restaurant_id
        end
    end
end