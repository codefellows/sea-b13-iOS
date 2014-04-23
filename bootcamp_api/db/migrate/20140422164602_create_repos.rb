class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :html_url
      t.string :description

      t.timestamps
    end
  end
end
