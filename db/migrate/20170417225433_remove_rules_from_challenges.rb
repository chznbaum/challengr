class RemoveRulesFromChallenges < ActiveRecord::Migration[5.0]
  def change
    remove_column :challenges, :rules, :text
  end
end
