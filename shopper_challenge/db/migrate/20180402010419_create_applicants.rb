class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :email,      null: false, unique: true
      t.string :phone,      null: false, unique: true
      t.string :zip_code,   null: false
      t.string :workflow_state

      t.timestamps
    end
  end
end
