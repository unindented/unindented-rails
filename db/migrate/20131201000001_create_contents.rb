class CreateContents < ActiveRecord::Migration

  def change
    create_table :contents do |t|
      t.string  :title,         null: false
      t.string  :author
      t.boolean :published,     null: false, default: true
      t.boolean :featured,      null: false, default: false
      t.string  :abstract
      t.string  :abstract_html
      t.text    :body,          null: false
      t.text    :body_html,     null: false

      t.string  :path,          null: false, index: true
      t.string  :locator,       null: false, index: true
      t.string  :category,      null: false, index: true
      t.date    :date
    end
  end

end
