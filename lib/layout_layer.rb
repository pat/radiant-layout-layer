class LayoutLayer
  LayoutsPath = File.join RAILS_ROOT, "vendor", "extensions", "*", "layouts"
  
  def self.lay
    ActionController::Base.logger.add(
      Logger::DEBUG, "\n  LayoutLayer: Laying down some layouts"
    )
    
    Dir[LayoutsPath].each do |layouts|
      Dir[File.join(layouts, "**", "*.html")].each do |html|
        name = file_name_to_layout_name(layouts, html)
        layout = Layout.find_by_name(name) || Layout.new(:name => name)
        
        layout.content = open(html) { |file| file.read }
        layout.save
      end
    end
  end
  
  private
  
  def self.file_name_to_layout_name(path, name)
    name.gsub(/^#{path}\//, '').gsub(/\.html$/, '').camelize
  end
end
