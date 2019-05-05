module Admin
  class BaseController < ApplicationController

    http_basic_authenticate_with name: "admin", password: "password"
    
    layout "admin"
    
  end
end