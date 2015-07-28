class AddLinkToLinks < ActiveRecord::Migration
  def change
    add_column :links, :link, :string
  end
end
