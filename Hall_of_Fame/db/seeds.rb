# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create({id_post: '1', id_auteur: '1', up_vote: '0', down_vote: '0', date: '03052014', contenu: 'test', titre: 'test_titre'})
