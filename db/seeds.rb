#Create First User account
admin_1 = User.create(email: "admin1.redlegislativa@yopmail.com", password: 'admin_01', role: "admin", status: "enabled", name: "Alberto", last_name: "Rodriguez")
admin_1.confirm! # user account confirmed

admin_2 = User.create(email: "admin2.redlegislativa@yopmail.com", password: 'admin_02', role: "admin", status: "enabled", name: "Rosario", last_name: "Montes")
admin_2.confirm! # user account confirmed

admin_3 = User.create(email: "admin3.redlegislativa@yopmail.com", password: 'admin_03', role: "admin", status: "enabled", name: "Carolina", last_name: "De la Torre")
admin_3.confirm! # user account confirmed

#Populate ddbb with Districts
District.create([
  { name: "La Plata" },
  { name: "Ensenada" },
  { name: "Berisso" },
  { name: "Berazategui" }
])

PoliticalParty.create([
  {name: "FPV"},
  {name: "Frente Social"}
])


## create Participation

participation_1 = Participation.create(start_date: Date.today, end_date: nil, in_function: true, district_id: 1, political_party_id: 1)
participation_2 = Participation.create(start_date: Date.today, end_date: nil, in_function: true, district_id: 2, political_party_id: 1)
participation_3 = Participation.create(start_date: Date.today, end_date: nil, in_function: true, district_id: 3, political_party_id: 2)
participation_4 = Participation.create(start_date: Date.today, end_date: nil, in_function: true, district_id: 4, political_party_id: 2)

councilor_1 = User.create(email: "concejal1.redlegislativa@yopmail.com", password: 'concejal_01', role: "councilor", status: "enabled", name: "Mercedes", last_name: "Sosa", participation: participation_1)
councilor_1.confirm! # user account confirmed

councilor_2 = User.create(email: "concejal2.redlegislativa@yopmail.com", password: 'concejal_02', role: "councilor", status: "enabled", name: "Bob", last_name: "Marley", participation: participation_2)
councilor_2.confirm! # user account confirmed

councilor_3 = User.create(email: "concejal3.redlegislativa@yopmail.com", password: 'concejal_03', role: "councilor", status: "enabled", name: "Albert", last_name: "Einstein", participation: participation_3)
councilor_3.confirm! # user account confirmed

councilor_4 = User.create(email: "concejal4.redlegislativa@yopmail.com", password: 'concejal_04', role: "councilor", status: "enabled", name: "Domingo", last_name: "Marraffini", participation: participation_4)
councilor_4.confirm! # user account confirmed

collaborator_1 = User.create(email: "asesor1.redlegislativa@yopmail.com", password: 'asesor_01', role: "collaborator", status: "enabled", name: "Gottfried", last_name: "Leibniz", collaborator: participation_1)
collaborator_1.confirm! # user account confirmed

collaborator_2 = User.create(email: "asesor2.redlegislativa@yopmail.com", password: 'asesor_02', role: "collaborator", status: "enabled", name: "Quino", last_name: "Mafalda", collaborator: participation_1)
collaborator_2.confirm! # user account confirmed

collaborator_3 = User.create(email: "asesor3.redlegislativa@yopmail.com", password: 'asesor_03', role: "collaborator", status: "enabled", name: "Facundo", last_name: "Gonzales", collaborator: participation_1)
collaborator_3.confirm! # user account confirmed

collaborator_4 = User.create(email: "asesor4.redlegislativa@yopmail.com", password: 'asesor_04', role: "collaborator", status: "enabled", name: "Melisa", last_name: "Diaz", collaborator: participation_2)
collaborator_4.confirm! # user account confirmed

collaborator_5 = User.create(email: "asesor5.redlegislativa@yopmail.com", password: 'asesor_05', role: "collaborator", status: "enabled", name: "Sofia", last_name: "Fontela", collaborator: participation_3)
collaborator_5.confirm! # user account confirmed

collaborator_6 = User.create(email: "asesor6.redlegislativa@yopmail.com", password: 'asesor_06', role: "collaborator", status: "enabled", name: "Lorena", last_name: "Othaz", collaborator: participation_3)
collaborator_6.confirm! # user account confirmed

collaborator_7 = User.create(email: "asesor7.redlegislativa@yopmail.com", password: 'asesor_07', role: "collaborator", status: "enabled", name: "Martina", last_name: "Forte", collaborator: participation_3)
collaborator_7.confirm! # user account confirmed
