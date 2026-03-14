#!/usr/bin/env ruby

# frozen_string_literal: true

class Router
  def initialize(&block)
    instance_eval(&block)
  end

  def match(route)
    puts route
  end
end

routes = Router.new do
  match '/about' => 'home#about'
  match '/users' => 'users#index'
end

puts routes
