# app/controllers/admin/admin_controller.rb
module Admin
  class AdminController < ApplicationController
    http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  end
end