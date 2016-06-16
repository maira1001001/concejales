class Term < ActiveRecord::Base
  belongs_to :councilor
  belongs_to :district
  belongs_to :political_party
end
