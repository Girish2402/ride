class CreateCardetails < ActiveRecord::Migration
  def change
    create_table :cardetails do |t|
    	t.integer "offerride_id"
    	t.string "title"
    	t.integer "seats"
    	t.string "comfort"
    	t.string "image"
    	t.string "model"
    	t.string "color"
      t.timestamps null: false
    end
    add_index("cardetails","offerride_id")

  end
end
