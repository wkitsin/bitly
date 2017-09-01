class AddColumnAllZero < ActiveRecord::Migration[5.0]
	def change
		# create_table :urls do |t|
		# 	t.string :long_url
		# 	t.string :short_url

			add_column :urls, :url_click_count, :integer , default: 0 
	end 
end 