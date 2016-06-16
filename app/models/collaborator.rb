class Collaborator < Person
  enum status: { pending_approval: 0, active: 1, inactive: 2 }
end
