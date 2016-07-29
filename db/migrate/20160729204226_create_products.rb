class CreateProducts < ActiveRecord::Migration
    def change
        create_table :products do |t|
            t.text :title
            t.text :description
            t.text :price
            t.text :size
            t.text :is_spicy
            t.text :is_veg
            t.text :is_best_offer
            t.text :path_to_image
        end

        Product.create ({
            title: 'Hawaiian',
            description: 'This is Hawaiian pizza',
            price: 350,
            size: 30,
            is_spicy: false,
            is_veg: false,
            is_best_offer: false,
            path_to_image: '/images/hawaiian.jpg'
        })

        Product.create ({
            title: 'Pepperoni',
            description: 'Nice Pepperoni pizza',
            price: 450,
            size: 30,
            is_spicy: false,
            is_veg: false,
            is_best_offer: false,
            path_to_image: '/images/pepperoni.jpg'
        })

        Product.create ({
            title: 'Vegeterian',
            description: 'Amazing Vegeterian pizza',
            price: 400,
            size: 30,
            is_spicy: false,
            is_veg: true,
            is_best_offer: false,
            path_to_image: '/images/veg.jpg'
        })
    end
end
