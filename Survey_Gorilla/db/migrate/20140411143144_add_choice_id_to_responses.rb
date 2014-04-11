class AddChoiceIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :choice_id, :integer
  end
end
