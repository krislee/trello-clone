class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name # title of the individual items that will belong to that list (e.g. under Things To Do will be  work on models, work on routers, work on controllers; under Doing will be users set up; under Done will be finishing setting up the repo)
      t.string :description # description of each items
      t.string :priority # e.g. high, medium, low
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
