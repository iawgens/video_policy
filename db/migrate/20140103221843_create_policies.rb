class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.integer :video_id
      t.integer :policy_code_id
      t.integer :country_code_id

      t.timestamps
    end
  end
end
