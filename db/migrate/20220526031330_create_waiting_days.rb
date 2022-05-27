class CreateWaitingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :waiting_day do |t|

      t.timestamps
    end
  end
end
