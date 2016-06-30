admin = User.create(email: "maira.diaz.73@gmail.com", password: '11111111', roles: "admin", status: "enable")
admin.confirm! # user account confirmed
