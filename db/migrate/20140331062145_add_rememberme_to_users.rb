class AddRemembermeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :rememberme, :string
  end
end
