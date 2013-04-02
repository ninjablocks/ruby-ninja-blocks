require "ninja_blocks/version"
module NinjaBlocks
  require 'ninja_blocks/abstruct'
  require 'ninja_blocks/device'
  require 'ninja_blocks/user'
  require 'ninja_blocks/rule'
  
  def self.token
    @token
  end
  def self.token=(token)
    @token = token
  end
end


