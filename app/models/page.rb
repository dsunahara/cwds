class Page < ApplicationRecord
    after_save :reload_routes
    
    #reload routes when active record is saved
    def reload_routes
        
        CwdsApp::Application.routes_reloader.reload!
    
    end
    
    
end
