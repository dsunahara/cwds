class Page < ApplicationRecord
    after_save :reload_routes
    
    #reload routes when active record is saved
    def reload_routes
        puts "testing reload2"
        CwdsApp::Application.routes_reloader.reload!
    
    end
    
    
end
