require 'sinatra'
require 'sinatra/contrib/all' if development? 
require 'pry-byebug'
require_relative '../models/group'
require_relative '../models/match'
require_relative '../models/team'