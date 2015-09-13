class CreateGithubers < ActiveRecord::Migration
  def change
    create_table :githubers do |t|

      t.timestamps null: false
    end
  end
end
