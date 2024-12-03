class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :project
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end