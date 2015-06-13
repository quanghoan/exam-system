# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 ActiveRecord::Base.transaction do
      User.create!(name:  "Quang Hoan",
                   email: "a@gmail.com",
                   password:              "foobar",
                   password_confirmation: "foobar",
                   role:     "admin")

      User.create!(name:  "hoan examiner",
                   email: "b@gmail.com",
                   password:              "foobar",
                   password_confirmation: "foobar",
                   role:   "examiner"  )
            
      User.create!(name:  "hoan",
                   email: "c@gmail.com",
                   password:              "foobar",
                   password_confirmation: "foobar",
                   )    
end
