class AddCouncilorToTerms < ActiveRecord::Migration
  def change
    add_reference :terms, :councilor, index: true
    add_foreign_key :terms, :participations, column: :councilor_id
  end
end
