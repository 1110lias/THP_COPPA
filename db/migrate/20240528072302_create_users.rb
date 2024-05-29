class CreateUsers < ActiveRecord::Migration[7.1]
  def change #ERREUR CETTE MIGRATION AURAIT DU ETRE FAITE AVEC DEVISE! DES CORRECTIONS ONT ETE FAITE DANS UNE AUTRE MIGRATION
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :billing_address
      t.string :delivery_address
      t.string :password_digest # Pour Devise MDP
      t.boolean :isadmin
      t.timestamps
    end
  end
end
