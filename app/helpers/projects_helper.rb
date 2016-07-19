module ProjectsHelper

  PROJECT_TYPES = [ :ordinance, :decree, :resolution, :communication, :document ]

  def project_title(project_type_params)
    if project_type_params && PROJECT_TYPES.include?(project_type_params.to_sym)
      t("projects.new.#{project_type_params}")
    else
      t("projects.new.title")
    end
  end

end
