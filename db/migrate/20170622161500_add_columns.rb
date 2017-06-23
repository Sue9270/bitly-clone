class AddColumns < ActiveRecord::Migration[4.2]
	def change
   add_column :urls, :click_count, :integer
   end
end
	