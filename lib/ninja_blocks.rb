require "ninja_blocks/version"
module NinjaBlocks
  require 'ninja_blocks/abstruct'
  require 'ninja_blocks/device'
  require 'ninja_blocks/user'
  def self.token
    @token
  end
  def self.token=(token)
    @token = token
  end
end


