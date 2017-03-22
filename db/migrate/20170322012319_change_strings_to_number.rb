class ChangeStringsToNumber < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :price, 'integer USING CAST(price AS integer)'
  end

end
