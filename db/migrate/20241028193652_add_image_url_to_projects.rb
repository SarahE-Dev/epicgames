class AddImageUrlToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :image_url, :string
  end
end
