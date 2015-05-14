BodyPart = require "./BodyPart"


class Hand extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Setup config object.
    config.message  ?= "Mano"
    config.audioUrl ?= "./assets/audio/Mano.m4a"

    # Parent constructor
    super config



# Export the class.
module.exports = Hand
