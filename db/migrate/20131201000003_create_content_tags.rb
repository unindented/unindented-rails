class CreateContentTags < ActiveRecord::Migration

  def change
    create_table :content_tags do |t|
      t.belongs_to :content, null: false, index: true
      t.belongs_to :tag,     null: false, index: true
    end
  end

end
