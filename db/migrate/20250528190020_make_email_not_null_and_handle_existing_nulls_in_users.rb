class MakeEmailNotNullAndHandleExistingNullsInUsers < ActiveRecord::Migration[8.0]
  def up
    User.where(email: nil).find_each.with_index do |user, index|
      user.update!(email: "placeholder_#{Time.now.to_i}_#{index}@example.com")
    end
    change_column_null :users, :email, false
  end
  def down
    # Revert the null constraint.
    change_column_null :users, :email, true

    # Optional: Revert the default if you added one.
    # change_column_default :users, :email, nil

    # Note: Reverting the placeholder emails is tricky and usually not done
    # in a down migration unless you have a specific strategy.
    puts "Email column can now be NULL. Placeholder emails (if any) remain."
  end
end
