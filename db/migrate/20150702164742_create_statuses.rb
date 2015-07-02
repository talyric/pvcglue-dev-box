class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :state
      t.string :desc

      t.timestamps
    end
  end
end
