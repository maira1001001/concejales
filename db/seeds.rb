#Create First User account
admin = User.create(email: "concejales-bsas@yopmail.com", password: '77777777', role: "councilor", status: "enabled", name: "Admin", last_name: "Admin")
admin.confirm! # user account confirmed

#Populate ddbb with Districts
District.create([{name: "La Plata"}, {name: "Ensenada"}, {name: "Berisso"}])

PoliticalParty.create([
  {name: "FPV"},
  {name: "Frente Social"}
])
