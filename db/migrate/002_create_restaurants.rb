class CreateRestaurants < ActiveRecord::Migration[4.2]
    def change
        create_table :restaurants do |t|
        t.string :name
        t.float :rating
        t.string :zipcode
        t.string :category
        end
    end
end