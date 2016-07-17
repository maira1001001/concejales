module ProjectsHelper

  PROJECT_TYPES = { ordinance: 0, decree: 1, resolution: 2, communication: 3, document: 4  }

  def project_title(project_type_params)
    if project_type_params && PROJECT_TYPES.has_value?(project_type_params.to_sym)
      t("projects.new.#{PROJECT_TYPES[project_type_params.to_sym]}")
    else
      t("projects.new.title")
    end
  end

end
