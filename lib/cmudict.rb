require "cmudict/version"
require "cmudict/dictionary"

module CMUDict
  extend self

  def dictionary
    Dictionary.instance
  end

end
