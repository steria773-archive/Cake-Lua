-- Created By Rabia Alhaffar In 19/March/2020
local js = require("js")
local window = js.global
local document = window.document
local console = window.console
local navigator = window.navigator
local localStorage = window.localStorage
local JSON = window.JSON

window:addEventListener("load",function()
    AddJavaScript("https://cdn.jsdelivr.net/gh/Rabios/lightgl.js/lightgl.js")
end)

window:addEventListener("online",function()
    AddJavaScript("https://cdn.jsdelivr.net/gh/Rabios/lightgl.js/lightgl.js")
end)

-- NOTES: It Uses LightGL As 3rd Party
cakepen = 0
cakecanvas = 0
cake_webgl_debugger = 0
TRIANGLES = 0
LINES = 0
FAN = 0
LINELOOP = 0
POINTS = 0
LINESTRIP = 0
VERTEX = 0
FRAGMENT = 0
TRISTRIP = 0
program = 0
buffer = 0
shader = 0
GPU = 0
GLSL_VER = 0
VENDOR = 0
GL_VER = 0
UNMASKED = 0
cakecanvas2d = 0
cakepen2d = 0
current_program = 0
current_buffer = 0
current_vertex_shader = 0
current_fragment_shader = 0

-- Starting
InitializeWebGL = function(c)
    if Unknown(c) then c = 0 end
    cakecanvas = document:getElementsByTagName("canvas")[c]
    cakepen = cakecanvas:getContext('webgl2')
    if cakepen then console:info("CAKE GAME ENGINE: INITIALIZING WebGLRenderingContext...") end
    if not cakepen then console:error("WEBGL NOT SUPPORTED!!!") end
    TRIANGLES = cakepen.TRIANGLES
    LINES = cakepen.LINES
    POINTS = cakepen.POINTS
    TRIFAN = cakepen.TRIANGLE_FAN
    TRISTRIP = cakepen.TRIANGLE_STRIP
    LINELOOP = cakepen.LINE_LOOP
    LINESTRIP = cakepen.LINE_STRIP
    GL_VER = cakepen:getExtension(cakepen.VERSION)
    GLSL_VER = cakepen:getParameter(cakepen.SHADING_LANGUAGE_VERSION)
    VENDOR = cakepen:getParameter(cakepen.VENDOR)
end

InitializeLightGL = function() 
    cakepen = window:eval("GL.create()");
    cakecanvas = cakepen.canvas
    EnableScissor(true)
    TRIANGLES = cakepen.TRIANGLES
    LINES = cakepen.LINES
    POINTS = cakepen.POINTS
    VERTEX = cakepen.VERTEX_SHADER
    FRAGMENT = cakepen.FRAGMENT_SHADER
    TRIFAN = cakepen.TRIANGLE_FAN
    TRISTRIP = cakepen.TRIANGLE_STRIP
    LINELOOP = cakepen.LINE_LOOP
    LINESTRIP = cakepen.LINE_STRIP
    GL_VER = cakepen:getExtension(cakepen.VERSION)
    GLSL_VER = cakepen:getParameter(cakepen.SHADING_LANGUAGE_VERSION)
    VENDOR = cakepen:getParameter(cakepen.VENDOR)
end


-- Drawing
ClearCanvasFully = function()
    cakepen:clearColor(0,0,0,0)
    cakepen:clearDepth(1.0)
    cakepen:clear(cakepen.COLOR_BUFFER_BIT)
    cakepen:clear(cakepen.DEPTH_BUFFER_BIT)
end

WebGLClearCanvas = function(r,g,b,a)
    if Unknown(r) then r = 0 end
    if Unknown(g) then g = 0 end
    if Unknown(b) then b = 0 end
    if Unknown(a) then a = 0 end
    cakepen:clearColor(r,g,b,a)
    cakepen:clear(cakepen.COLOR_BUFFER_BIT)
end

DrawCube = function(shaders,position,rotation,size,options)
    cube_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(size,size,-size)
    cube_shaders:draw(window:eval("GL.Mesh.cube("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-size,-size,size)
end

DrawSphere = function(shaders,position,rotation,scalation,options) 
    sphere_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[2],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[2])
    sphere_shaders:draw(window:eval("GL.Mesh.sphere("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[2],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[2])
end

DrawPlane = function(shaders,position,rotation,scalation,options)
    plane_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[3])
    plane_shaders:draw(window:eval("GL.Mesh.plane("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[3])
end

DrawCuboid = function(shaders,position,rotation,scalation,options)
    cuboid_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[3])
    cuboid_shaders:draw(window:eval("GL.Mesh.cube("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[3])
end

DrawBall = function(shaders,position,rotation,size,options) 
    ball_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[2],rotation[4])
    cakepen:scale(size,size,-size)
    ball_shaders:draw(window:eval("GL.Mesh.sphere("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[2],-rotation[4])
    cakepen:scale(-size,-size,size)
end

DrawField = function(shaders,position,rotation,scalation,options)
    field_shaders = window:eval([[new GL.Shader(]]..shaders[1]..[[,]]..shaders[2]..[[);]])
    cakepen:loadIdentity()
    cakepen:translate(position[1],position[2],position[3])
    cakepen:rotate(rotation[1],rotation[2],rotation[3],rotation[4])
    cakepen:scale(scalation[1],scalation[2],-scalation[3])
    field_shaders:draw(window:eval("GL.Mesh.plane("..options..");"))
    cakepen:translate(-position[1],-position[2],-position[3])
    cakepen:rotate(-rotation[1],-rotation[2],-rotation[3],-rotation[4])
    cakepen:scale(-scalation[1],-scalation[2],scalation[3])
end

DrawArrays = function(mode,pos_arr)
    cakepen:drawArrays(mode,0,pos_arr.length / 2)
end

BEGIN = function(mode)
    cakepen:begin(mode)
end

END = function()
    cakepen:flush()
    window:eval("cakepen.end();")
end

FINISH = function()
    cakepen:finish()
end

WebGLDrawContent = function(mode,content)
    cakepen:begin(mode)
    for l in pairs(content) do
        cakepen:color(content[l][4],content[l][5],content[l][6],content[l][7])
        cakepen:vertex(content[l][1],content[l][2],content[l][3])
    end
    window:eval("cakepen:end();") -- Better Than Nothing
end


-- Shaders
Shader = function(vertex,frag)
    window:eval([[GL.Shader(]]..vertex..[[,]]..frag..[[);]])
end

ShaderParameter = function(shader,param)
    cakepen:getShaderParameter(shader,param)
end

RemoveShader = function(shader)
    cakepen:deleteShader(shader)
end

ShaderSourceCode = function(shader)
    cakepen:getShaderSource(shader)
end

SHADER = function(shader) 
    cakepen:isShader(shader)
end

CreateShader = function(type,src,current_vertex_shader,current_fragment_shader)
    if type == VERTEX then
        current_vertex_shader = cakepen:createShader(VERTEX)
        cakepen:shaderSource(current_vertex_shader,src)
        cakepen:compileShader(current_vertex_shader)
        console:info(cakepen:getShaderInfoLog(current_vertex_shader))
        console:info(cakepen:getShaderSource(current_vertex_shader))
        if cakepen:getShaderParameter(current_vertex_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILED SUCCESSFULLY!!!")
        end
        if not cakepen:getShaderParameter(current_vertex_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILATION FAILED!!!")
        end
    end
    if type == FRAGMENT then
        current_fragment_shader = cakepen:createShader(FRAGMENT)
        cakepen:shaderSource(current_fragment_shader,src)
        cakepen:compileShader(current_fragment_shader)
        console:info(cakepen:getShaderInfoLog(current_fragment_shader))
        console:info(cakepen:getShaderSource(current_fragment_shader))
        if cakepen:getShaderParameter(current_fragment_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILED SUCCESSFULLY!!!")
        end
        if not cakepen:getShaderParameter(current_fragment_shader,cakepen.COMPILE_STATUS) then
            console:info("CAKE GAME ENGINE: SHADER COMPILATION FAILED!!!")
        end
    end
end


-- Buffers
BUFFER = function(buffer)
    cakepen:isBuffer(buffer)
end

RemoveBuffer = function(buffer)
    cakepen:deleteBuffer(buffer)
end

RemoveFrameBuffer = function(buffer)
    cakepen:deleteFrameBuffer(buffer)
end

RemoveRenderBuffer = function(buffer)
    cakepen:deleteRenderBuffer(buffer)
end

BindBuffer = function(buffer)
    cakepen:bindBuffer(cakepen.ARRAY_BUFFER,buffer)
end

CreateFrameBuffer = function(buffer)
    buffer = cakepen:createFrameBuffer()
end

CreateRenderBuffer = function(buffer)
    buffer = cakepen:createRenderBuffer()
end

CreateBuffer = function(current_buffer,arr)
    current_buffer = cakepen:createBuffer()
    cakepen:bindBuffer(cakepen.ARRAY_BUFFER, current_buffer)
    cakepen:bufferData(cakepen.ARRAY_BUFFER, window:eval("new Float32Array("..arr..")"), cakepen.DYNAMIC_DRAW);
end


-- Programs
ProgramParameter = function(program,param)
    cakepen:getProgramParameter(program,param)
end

RemoveProgram = function(program)
    cakepen:deleteProgram(program)
end

UseProgram = function(program)
    cakepen:useProgram(program)
end

PROGRAM = function(program)
    cakepen:isProgram(program)
end

DisableAttribute = function(program,att)
    cakepen:disableVertexAttribArray(cakepen:getAttribLocation(program,att))
end

EnableAttribute = function(program,att)
    cakepen:enableVertexAttribArray(cakepen:getAttribLocation(program, att))
end

CreateProgram = function(current_program,vertex,frag)
    current_program = cakepen:createProgram()
    cakepen:attachShader(current_program,vertex)
    cakepen:attachShader(current_program,frag)
    cakepen:linkProgram(current_program)
    cakepen:validateProgram(current_program)
    console:info(cakepen:getAttachedShaders(current_program))
    console:info(cakepen:getShaderSource(vertex))
    console:info(cakepen:getShaderSource(frag))
    console:info(cakepen:getShaderInfoLog(vertex))
    console:info(cakepen:getShaderInfoLog(frag))
    if cakepen:getProgramParameter(cakepen.LINK_STATUS) then
        console:info("CAKE GAME ENGINE: PROGRAM CREATED SUCCESSFULLY!!!")
    end
    if not cakepen:getProgramParameter(cakepen.LINK_STATUS) then
        console:info("CAKE GAME ENGINE: PROGRAM CREATION FAILED!!!")
    end
    console:info(cakepen:getProgramInfoLog(current_program))
end


-- Transformations
WebGLTranslate = function(x,y,z)
    cakepen:translate(x,y,z)
end

WebGLRotate = function(angle,x,y,z)
    cakepen:rotate(angle,x,y,z)
end

WebGLScale = function(x,y,z)
    cakepen:scale(x,y,z)
end

WebGLViewport = function(x,y,width,height)
    cakepen:viewport(x,y,width,height)
end

WebGLScissor = function(x,y,width,height)
    cakepen:scissor(x,y,width,height)
end

WebGLPerspective = function(fov,aspect,near,far)
    cakepen:perspective(fov,aspect,near,far)
end

WebGLOrthographic = function(left,right,bottom,top,near,far)
    cakepen:ortho(left,right,bottom,top,near,far)
end

WebGLFrustum = function(left,right,bottom,top,near,far)
    cakepen:frustum(left,right,bottom,top,near,far)
end

WebGLLookAt = function(eye_x,eye_y,eye_z,center_x,center_y,center_z,uniform_x,uniform_y,uniform_z)
    cakepen:lookAt(eye_x,eye_y,eye_z,center_x,center_y,center_z,uniform_x,uniform_y,uniform_z)
end

WebGLMatrixMode = function(mode)
    cakepen:matrixMode(mode)
end

-- Meshes
Cube = function()
   return window:eval("GL.Mesh.cube();")
end

Sphere = function()
    return window:eval("GL.Mesh.sphere();")
end

Plane = function()
    return window:eval("GL.Mesh.plane();")
end

LoadMesh = function(json,options)
    window:eval([[GL.Mesh.load(]]..json..[[,]]..options..[[);]])
    return window:eval([[GL.Mesh.load(]]..json..[[,]]..options..[[);]])
end

-- Options
EnableDebugger = function() 
    cake_webgl_debugger = (cakepen:getExtension("WEBGL_debug_renderer_info") or cakepen:getExtension("WEBGL_debug_shaders"))
    GPU = cakepen:getParameter(cake_webgl_debugger.UNMASKED_VENDOR_WEBGL)
    UNMASKED = cakepen:getParameter(cake_webgl_debugger.UNMASKED_RENDERER_WEBGL)
    cakepen:getError()
end

Multisample = function(enabled,value,invert)
    if enabled then 
        cakepen:enable(cakepen.SAMPLE_COVERAGE)
        cakepen:sampleCoverage(value,invert)
    end
    if not enabled then cakepen:disable(cakepen.SAMPLE_COVERAGE) end
end

EnableScissor = function(m)
    if m then cakepen:enable(cakepen.SCISSOR_TEST) end
    if not m then cakepen:disable(cakepen.SCISSOR_TEST) end
end

LoadGLID = function()
end

SetLineSize = function(size)
    cakepen:lineWidth(size)
end

SetClearDepth = function(d)
    cakepen:clearDepth(d)
end

CompatibleCanvas = function()
    if not cakecanvas.width == cakecanvas.clientWidth or not cakecanvas.height == cakecanvas.clientHeight then
        cakecanvas.width = cakecanvas.clientWidth
        cakecanvas.height = cakecanvas.clientHeight
    end
    cakepen:viewport(0,0,cakecanvas.width,cakecanvas.height)
end


-- Misc
WebGLSupportedExtensions = function()
    cakepen:getSupportedExtensions()
end

WebGLExtension = function(ext)
    cakepen:getExtension(ext)
end

WebGLParameter = function(param)
    cakepen:getParameter(param)
end

WebGLFeatureEnable = function(feature)
    cakepen:isEnabled(feature)
end

EnableWebGLFeature = function(feature)
    cakepen:enable(feature)
end

DisableWebGLFeature = function(feature)
    cakepen:disable(feature)
end

GetWebGLFullInfo = function()
    console:info("GPU: "..GPU.."\nWEBGL VERSION: "..GL_VER.."\nGLSL VERSION: "..GLSL_VER.."\nVENDOR: "..VENDOR.."\nUNMASKED RENDERER: "..UNMASKED.."\n")
end

GetWebGLErrors = function()
    cakepen:getError()
end

Update = function()
    cakepen:animate()
end

WebGLFullscreen = function(c)
    cakepen:fullscreen(c)
end

Enable2D = function()
    cakecanvas2d = document:createElement("canvas")
    cakecanvas2d.style.position = "absolute"
    cakecanvas2d.style.backgroundColor = "transparent"
    cakecanvas2d.style.left = "0px"
    cakecanvas2d.style.right = "0px"
    cakecanvas2d.style.zIndex = 1
    cakecanvas2d:getElementsByTagName("body")[document:getElementsByTagName("body").length]:appendChild(cakecanvas2d)
    cakepen2d = cakecanvas2d:getContext("2d")
end