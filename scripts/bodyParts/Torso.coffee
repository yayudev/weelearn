BodyPart = require "./BodyPart"


class Torso extends BodyPart
  # Constructor
  # @params {Object} config List of the instance's properties.
  constructor: (config) ->
    config ?= {}

    # Set up config object.
    config.message  ?= "Torso"
    config.audioUrl ?= "./assets/audio/Torso.m4a"

    # Parent constructor
    super config



# Export the class.
module.exports = Torso
