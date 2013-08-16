class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :session_token
      t.string :password_digest
      t.string :name

      t.timestamps
    end
      add_index :users, :id
  end
end
