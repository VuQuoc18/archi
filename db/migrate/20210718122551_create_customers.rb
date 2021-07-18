class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :authentication_token

      t.timestamps
    end
  end
end
