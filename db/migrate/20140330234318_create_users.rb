class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hospitalname
      t.string :hospitaladdress
      t.string :phone

      t.timestamps
    end
  end
end
