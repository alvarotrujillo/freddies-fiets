class UserIdToBike < ActiveRecord::Migration[7.0]
  def change
    add_reference :bikes, :user, foreing_key: true, null: false
  end
end
