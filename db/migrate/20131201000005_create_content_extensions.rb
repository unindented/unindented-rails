class CreateContentExtensions < ActiveRecord::Migration

  def change
    create_table :content_extensions do |t|
      t.belongs_to :content,   null: false, index: true
      t.belongs_to :extension, null: false, index: true
    end
  end

end
