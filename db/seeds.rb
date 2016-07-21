Profile.destroy_all
profile = JSON.parse(File.read("db/profile.data.json"))
Profile.create!(profile)

User.destroy_all
User.create!(email:'barb@example.com', password:'pizzajammy')
User.create!(email:'bob@example.com', password:'pizzajammy')
