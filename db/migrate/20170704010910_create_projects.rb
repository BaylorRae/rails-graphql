class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
