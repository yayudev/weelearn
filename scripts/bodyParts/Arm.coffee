BodyPart = require "./BodyPart"
Hand     = require "./Hand"


class Arm extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Setup the config object.
    config.message   ?= "Brazo"
    config.audioUrl  ?= "./assets/audio/Brazo.m4a"

    # Parent constructor
    super config



# Export the class.
module.exports = Arm
