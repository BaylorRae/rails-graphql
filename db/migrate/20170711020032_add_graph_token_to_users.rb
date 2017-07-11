class AddGraphTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :graph_token, :string
    add_index :users, :graph_token, unique: true

    User.find_each do |user|
      user.update(graph_token: SecureRandom.hex(8))
    end

    change_column :users, :graph_token, :string, null: false
  end
end
