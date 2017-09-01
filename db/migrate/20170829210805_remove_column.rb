class RemoveColumn < ActiveRecord::Migration[5.0]
	def change
		# create_table :urls do |t|
		# 	t.string :long_url
		# 	t.string :short_url

			remove_column :urls, :url_click_count
	end 
end 