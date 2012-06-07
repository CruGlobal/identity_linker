require "identity_linker/version"
require "identity_linker/linker"
require "identity_linker/config"


module IdentityLinker
  extend self

  def configure
    yield config
  end

  def config
    @config ||= Config.default
  end

  attr_writer :config
end
