class RemoveHowKnowFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :how_know
  end

  def down
    add_column :projects, :how_know, :string
  end
end
