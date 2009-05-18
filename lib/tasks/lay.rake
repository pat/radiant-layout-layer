namespace :layouts do
  desc "Update layouts"
  task :lay => :environment do
    LayoutLayer.lay
    Radiant::Cache.clear
  end
end