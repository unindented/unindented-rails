class CreateExtensions < ActiveRecord::Migration

  def change
    create_table :extensions do |t|
      t.string :name,    null: false
      t.string :locator, null: false, index: true
    end
  end

end
