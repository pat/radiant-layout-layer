require 'action_controller/dispatcher'
require 'layout_layer'

class LayoutLayerExtension < Radiant::Extension
  version "1.1"
  description "Automatically create layouts and snippets based on HTML files in other extensions"
  url "http://github.com/freelancing-god/radiant-layout-layer"
  
  def activate
    return unless ActiveRecord::Base.connection.tables.include?("layouts")
    
    ActionController::Dispatcher.to_prepare :layout_layer do
      LayoutLayer.lay
    end
  end
end