class AddCurrentPoliticalPartyToPeople < ActiveRecord::Migration
  def change
    add_reference   :people, :current_political_party, index: true
    add_foreign_key :people, :political_parties, column: :current_political_party_id
  end
end
