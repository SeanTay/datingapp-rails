profile = JSON.parse(File.read("db/profile.data.json"))
Profile.destroy_all
Profile.create!(profile)
