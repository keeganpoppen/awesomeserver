class BindUsersToCompositions < ActiveRecord::Migration
  def self.up
    change_table :compositions do |t|
      t.references :user
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
