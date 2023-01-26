class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
        t.string :userID
        t.string :jobID
        t.string :jobCode
        t.date :appliedDate
        t.string :candidateApplicationStatus
        t.string :location
        
      t.timestamps
    end
  end
end
