require "splatter/init"
require "splatter/service"
require "splatter/version"

module Splatter

  def self.included(base)
    base.include(Splatter::Service)
    base.include(Splatter::Init)
  end

end
