require 'pry'
class ApplicationController < ActionController::Base
    add_flash_types :error, :alert
    include ApplicationHelper
end
