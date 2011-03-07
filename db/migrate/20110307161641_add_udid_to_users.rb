class AddUdidToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :udid
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
