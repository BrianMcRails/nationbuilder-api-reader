class CreateNbUsers < ActiveRecord::Migration
  def change
    create_table :nb_users do |t|
      t.string :email
      t.string :lastname
      t.string :firstname
      t.boolean :emailoptin
      t.string :externalid
      t.datetime :updatedat

      t.timestamps
    end
  end
end
