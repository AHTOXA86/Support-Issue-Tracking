# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
statuses = Status.create([
                         {name: "Waiting for Staff Response", id: 1},
                         {name: "Waiting for Customer"},
                         {name: "On Hold"},
                         {name: "Cancelled"},
                         {name: "Completed"},
                         ])
departments = Department.create([{name: "First", description: "First", id: 0}, {name: "Second"}])
users = User.create([{email: "admin@admin.admin", encrypted_password: "$2a$10$D0l63ZhAcjGxHUVq7OQnJOUz.5RskuS0svpFgoqGkWVMOVmbkxhcS"}])