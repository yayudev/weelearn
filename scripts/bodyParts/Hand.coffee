BodyPart = require "./BodyPart"


class Hand extends BodyPart
  constructor: (config) ->
    config ?= {}

    # Setup config object.
    config.message  ?= "Mano"
    config.audioUrl ?= "./assets/audio/Mano.m4a"

    # Parent constructor
    super config


module.exports = Hand
