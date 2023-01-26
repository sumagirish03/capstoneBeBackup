# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_25_110434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.bigint "phone_number"
    t.date "creationDate"
    t.string "userType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.string "userID"
    t.string "jobID"
    t.string "jobCode"
    t.date "appliedDate"
    t.string "candidateApplicationStatus"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "jobTitle"
    t.string "jobDescription"
    t.string "companyName"
    t.string "location"
    t.string "jobType"
    t.integer "salary"
    t.date "postedDate"
    t.string "domain"
    t.string "jobCode"
    t.string "skillsRequired", default: [], array: true
    t.string "applicationStatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "contact"
    t.string "address"
    t.string "about"
    t.string "profilePic"
    t.string "currentCompany"
    t.integer "ctc"
    t.string "currentRole"
    t.integer "experience"
    t.string "skills", default: [], array: true
    t.string "resumeLink"
    t.integer "expectedSalary"
    t.string "preferredLocation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
