class ApplicationController < ActionController::Base
    def hello
        render html: "hello from ecomaid "
    end
end
