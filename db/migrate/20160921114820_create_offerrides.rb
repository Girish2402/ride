class CreateOfferrides < ActiveRecord::Migration
  def change
    create_table :offerrides do |t|
    	t.integer "user_id"
    	t.string "from_point"
    	t.string "to_point"
    	t.string "Stop_over_point"
    	t.date "d_date"
    	t.date "r_date"
    	t.integer "price"
    	t.text "description"
    	t.string "luggage_size"
    	t.string "i_will_leave"
    	t.string "detour"
    	t.string "ride_type"
    	t.timestamps null: false
      t.timestamps null: false
    end
     add_index("offerrides","user_id")
  end
end
