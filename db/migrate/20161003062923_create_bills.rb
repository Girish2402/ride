class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
    	t.integer "user_id"
    	t.integer "offerride_id"
    	t.string "first_name"
    	t.string "last_name"
    	t.string "Address"
        t.integer "seats"
    	t.integer "zip_code"
        t.string "contry"
        t.string "state"
    	t.string "email"  	

     	t.timestamps null: false
    end
    add_index("bills","user_id")
    add_index("bills","offerride_id")
  end
end
