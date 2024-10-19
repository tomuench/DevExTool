# This migration comes from rapidfire (originally 20190701274749)
if Rails::VERSION::MAJOR >= 5
  version = [Rails::VERSION::MAJOR, Rails::VERSION::MINOR].join('.').to_f
  base = ActiveRecord::Migration[version]
else
  base = ActiveRecord::Migration
end

class AddActiveToSurveys < base
  def change
    add_column :rapidfire_surveys, :active, :boolean
  end
end
