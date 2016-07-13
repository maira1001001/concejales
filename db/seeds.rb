#Create First User account
admin = User.create(email: "concejales-bsas@yopmail.com", password: '77777777', roles: "admin", status: "enabled")
admin.confirm! # user account confirmed

#Populate ddbb with Districts
District.create([{name: "La Plata"}, {name: "Ensenada"}, {name: "Berisso"}])

#Populate ddbb with Sections
Section.create([
  {name: "Sección I"},
  {name: "Sección II"},
  {name: "Sección III"},
  {name: "Seccion IV"},
  {name: "Seccion V"},
  {name: "Seccion VI"},
  {name: "Seccion VII"},
  {name: "Seccion VIII"}
])

PoliticalParty.create([
  {name: "FPV"},
  {name: "Frente Social"}
])
