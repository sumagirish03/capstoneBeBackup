class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :jobTitle
      t.string :jobDescription
      t.string :companyName
      t.string :location
      t.string :jobType
      t.integer :salary
      t.date :postedDate
      t.string :domain
      t.string :jobCode
      t.string :skillsRequired, array: true, default: []
      t.string :applicationStatus

      t.timestamps
    end
  end
end
