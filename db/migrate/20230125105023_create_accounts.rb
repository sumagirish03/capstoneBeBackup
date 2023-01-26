class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password_digest
      t.bigint :phone_number
      t.date :creationDate
      t.string :userType
      
      t.timestamps
    end
  end
end
