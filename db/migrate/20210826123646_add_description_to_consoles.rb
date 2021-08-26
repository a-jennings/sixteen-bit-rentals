class AddDescriptionToConsoles < ActiveRecord::Migration[6.0]
  def change
    add_column :consoles, :description, :text
  end
end
