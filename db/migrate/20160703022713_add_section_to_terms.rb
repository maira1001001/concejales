class AddSectionToTerms < ActiveRecord::Migration
  def change
    add_reference :terms, :section, index: true, foreign_key: true
  end
end
