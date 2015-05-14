THREE = require "three"
require "../libs/OrbitControls"


class Scene
  constructor: (config) ->
    config = {} unless config

    # Scene config
    @width  = config.width    or 400
    @height = config.height   or 300
    @bgColor = config.bgColor or 0x000000

    # Camera config
    @viewAngle = config.viewAngle or 90
    @near      = config.near      or 0.1
    @far       = config.far       or 10000
    @aspect    = @width / @height

    # Create the THREE Elements
    @renderer = new THREE.WebGLRenderer({alpha: yes})
    @camera   = new THREE.PerspectiveCamera(@viewAngle, @aspect, @near, @far)
    @scene    = new THREE.Scene()

    # Add camera to scene
    @scene.add @camera
    @camera.position.set 0, 0, 8

    # Set background
    @renderer.setClearColor @bgColor
    @renderer.setPixelRatio window.devicePixelRatio


  # Add an element to the scene.
  add: (element) ->
    @scene.add element


  # Draw the scene onto a given element based on its id.
  appendTo: (canvasId) ->
    @renderer.setSize @width, @height

    canvas = document.getElementById canvasId
    canvas.appendChild @renderer.domElement


  # Set controls enable state.
  enableControls: (state) ->
    @controls.enabled = state


  # Return the instance's camera.
  getCamera: ->
    @camera


  # Get the children elements from the scene.
  getChildren: ->
    @scene.children

  # Get scene height.
  getHeight: ->
    @renderer.domElement.height


  # Get scene width.
  getWidth: ->
    @renderer.domElement.width


  # Render the scene using requestAnimationFrame.
  render: ->
	  @renderer.render(@scene, @camera)


  # Resize the viewport and update the scene matrix.
  resize: (width, height) ->
    @renderer.setSize(width, height)
    @camera.aspect = width / height
    @camera.updateProjectionMatrix()
    # @camera.position.set 0, 0, 200



  # Add controls to the scene based on a given callback.
  setControls: (config) ->
    if config.renderCallback?
      @controls = new THREE.OrbitControls(@camera)
      @controls.damping = config.damping or 0.2
      @controls.addEventListener "change", config.renderCallback
    else
      console.error "No render callback specified to controls"



module.exports = Scene
