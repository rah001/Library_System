# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100409073023) do

  create_table "books", :force => true do |t|
    t.integer "BookID"
    t.string  "Subject"
    t.string  "Title"
    t.string  "Author"
    t.string  "Publisher"
    t.integer "Copyright"
    t.integer "Edition"
    t.integer "Pages"
    t.string  "ISBN"
    t.integer "NumberOfBooks"
    t.integer "NumberOfAvailbleBooks"
    t.integer "NumberOfBorrowedBooks"
    t.string  "Library"
    t.boolean "Availble"
  end

  create_table "borrows", :force => true do |t|
    t.integer "BookID"
    t.integer "MemberID"
    t.date    "DayOfBorrowed"
    t.date    "DayOfReturn"
  end

  create_table "members", :force => true do |t|
    t.integer  "MemberID"
    t.string   "MemberName"
    t.string   "Password"
    t.string   "FirstName"
    t.string   "Email"
    t.string   "Major"
    t.integer  "NumberOfBooks"
    t.integer  "Mony",          :limit => 10, :precision => 10, :scale => 0
    t.datetime "Expired"
  end

end
