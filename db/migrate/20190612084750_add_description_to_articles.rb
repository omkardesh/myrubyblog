class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
	  add_column :articles, :description, :text #name of table, name of attribute,type
	  add_column :articles, :created_at, :datetime
	  add_column :articles, :updated_at, :datetime
  end
end
