class Deletepassworddigest < ActiveRecord::Migration[7.1]
      def change 
        remove_column :users, :password_digest # Car installation devise
      end
end
