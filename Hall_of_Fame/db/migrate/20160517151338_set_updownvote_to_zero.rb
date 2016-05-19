class SetUpdownvoteToZero < ActiveRecord::Migration
  def change
  	change_column_default :posts ,:up_vote ,0
  	change_column_default :posts ,:down_vote,0
  end
end
