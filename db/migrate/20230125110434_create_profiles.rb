class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :contact
      t.string :address
      t.string :about
      t.string :profilePic
      t.string :currentCompany
      t.integer :ctc
      t.string :currentRole
      t.integer :experience
      t.string :skills, array: true, default: []
      t.string :resumeLink
      t.integer :expectedSalary
      t.string :preferredLocation
      
      t.timestamps
    end
  end
end
