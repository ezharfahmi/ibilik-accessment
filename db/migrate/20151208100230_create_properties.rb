class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :location
			t.string :title
			t.string :description
			t.integer :rental
			t.integer :user_id
			t.integer :comment_id

			t.timestamps null: false
		end
	end
end
