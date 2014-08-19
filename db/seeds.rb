# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(name: 'test', email: 'test@test.com', password: '1qaz2wsx')
role = Role.create(name: 'author')
UserRole.create(user_id: user.id, role_id: role.id)
user = User.create(name: 'admin', email: 'admin@test.com', password: '1qaz2wsx')
role = Role.create(name: 'admin')
UserRole.create(user_id: user.id, role_id: role.id)

