class AddAudiotarToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :audiotar, :string
  end
end
