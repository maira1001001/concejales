module UsersHelper
  def collection_roles
    User::Roles.all.collect { |role| [I18n.t("users.roles.#{role}"), role] }
  end
end
