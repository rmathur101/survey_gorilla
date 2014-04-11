class ChangeChoiceIdInResponsesToInteger < ActiveRecord::Migration
  def change
    remove_column :responses, :choice_id, :integer
  end
end
