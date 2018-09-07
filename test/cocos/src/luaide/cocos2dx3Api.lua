--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCAnimation3D.h
]]
cc.Animation3D = {}
--[[
	init Animation3D with file name and animation nam
	@return bool
]]
function cc.Animation3D:initWithFile(const_std_string_filename,const_std_string_animationName) end
--[[
	init Animation3D from bundle dat
	@return bool
]]
function cc.Animation3D:init(const_Animation3DData_data) end
--[[
	get duratio
	@return float
]]
function cc.Animation3D:getDuration() end
--[[
	read all animation or only the animation with given animationName? animationName == "" read the first
	@return [luaIde#cc.Animation3D]
]]
function cc.Animation3D:create(const_std_string_filename,const_std_string_animationName) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCAnimate3D.h
]]
cc.Animate3D = {}
function cc.Animate3D:setKeyFrameUserInfo(int_keyFrame,const_ValueMap_userInfo) end
--[[
	get & set speed, negative speed means playing reverse
	@return float
]]
function cc.Animate3D:getSpeed() end
--[[
	set animate qualit
]]
function cc.Animate3D:setQuality(Animate3DQuality_quality) end
function cc.Animate3D:setWeight(float_weight) end
function cc.Animate3D:removeFromMap() end
--[[
	@return bool
]]
function cc.Animate3D:initWithFrames(Animation3D_animation,int_startFrame,int_endFrame,float_frameRate) end
--[[
	@return float
]]
function cc.Animate3D:getOriginInterval() end
function cc.Animate3D:setSpeed(float_speed) end
--[[
	init method
	@return bool
]]
function cc.Animate3D:init(Animation3D_animation) end
--[[
	get & set origin interva
]]
function cc.Animate3D:setOriginInterval(float_interval) end
--[[
	get & set blend weight, weight must positiv
	@return float
]]
function cc.Animate3D:getWeight() end
--[[
	get animate qualit
	@return [luaIde#Animate3DQuality]
]]
function cc.Animate3D:getQuality() end
--[[
	create Animate3D using Animation
	@return [luaIde#cc.Animate3D]
]]
function cc.Animate3D:create(Animation3D_animation) end
--[[
	create Animate3D
	@param animation used to generate animate3D
	@param fromTime
	@param duration Time the Animate3D lasts
	@return [luaIde#cc.Animate3D]   Animate3D created using animate
]]
function cc.Animate3D:create(Animation3D_animation,float_fromTime,float_duration) end
--[[
	get animate transition time between 3d animations
	@return float
]]
function cc.Animate3D:getTransitionTime() end
--[[
	create Animate3D by frame section, [startFrame, endFrame)
	@param animation used to generate animate3D
	@param startFrame
	@param endFrame
	@param frameRate default is 30 per second
	@return [luaIde#cc.Animate3D]   Animate3D created using animate
]]
function cc.Animate3D:createWithFrames(Animation3D_animation,int_startFrame,int_endFrame,float_frameRate) end
--[[
	set animate transition time between 3d animations
]]
function cc.Animate3D:setTransitionTime(float_transTime) end

--[[
	@SuperType[luaIde#cc.Texture2D]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCTextureCube.h
]]
cc.TextureCube = {}
--[[
	reload texture cube after GLESContext reconstructed
	@return bool
]]
function cc.TextureCube:reloadTexture() end
--[[
	Sets the min filter, mag filter, wrap s and wrap t texture parameters.
	If the texture size is NPOT (non power of 2), then in can only use GL_CLAMP_TO_EDGE in GL_TEXTURE_WRAP_{S,T}.
]]
function cc.TextureCube:setTexParameters(const_TexParams) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCAttachNode.h
]]
cc.AttachNode = {}
--[[
	creates an AttachNode
	@param attachBone The bone to which the AttachNode is going to attach, the attacheBone must be a bone of the AttachNode's parent
	@return [luaIde#cc.AttachNode]
]]
function cc.AttachNode:create(Bone3D_attachBone) end

--[[
	@SuperType[luaIde#cc.Sprite]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCBillBoard.h
]]
cc.BillBoard = {}
--[[
	Get the billboard rotation mode.
	@return [luaIde#Mode]
]]
function cc.BillBoard:getMode() end
--[[
	Set the billboard rotation mode.
]]
function cc.BillBoard:setMode(Mode_mode) end
--[[
	Creates an empty BillBoard without texture. You can call setTexture method subsequently.
	@return [luaIde#cc.BillBoard]   An autoreleased BillBoard object.
]]
function cc.BillBoard:create(Mode_mode) end
--[[
	Creates a BillBoard with an image filename.
	After creation, the rect of BillBoard will be the size of the image,
	and the offset will be (0,0).
	@param   filename A path to image file, e.g., "scene1/monster.png"
	@return [luaIde#cc.BillBoard]    An autoreleased BillBoard object.
]]
function cc.BillBoard:create(const_std_string_filename,Mode_mode) end
--[[
	Creates a BillBoard with an image filename and a rect.
	@param   filename A path to image file, e.g., "scene1/monster.png"
	@param   rect     A subrect of the image file
	@return [luaIde#cc.BillBoard]    An autoreleased BillBoard object
]]
function cc.BillBoard:create(const_std_string_filename,const_Rect_rect,Mode_mode) end
--[[
	Creates a BillBoard with a Texture2D object.
	After creation, the rect will be the size of the texture, and the offset will be (0,0).
	@param   texture    A pointer to a Texture2D object.
	@return [luaIde#cc.BillBoard]    An autoreleased BillBoard object
]]
function cc.BillBoard:createWithTexture(Texture2D_texture,Mode_mode) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCMesh.h
]]
cc.Mesh = {}
--[[
	Returns the Material being used by the Mesh
	@return [luaIde#cc.Material]
]]
function cc.Mesh:getMaterial() end
--[[
	get per vertex size in byte
	@return int
]]
function cc.Mesh:getVertexSizeInBytes() end
--[[
	Sets a new Material to the Mesh
]]
function cc.Mesh:setMaterial(Material_material) end
--[[
	name getter
	@return std_string
]]
function cc.Mesh:getName() end
--[[
	get MeshVertexAttribute by inde
	@return [luaIde#cc.MeshVertexAttrib]
]]
function cc.Mesh:getMeshVertexAttribute(int_idx) end
--[[
	calculate the AABB of the mesh
	@note the AABB is in the local space, not the world space
]]
function cc.Mesh:calculateAABB() end
function cc.Mesh:draw(Renderer_renderer,float_globalZ,const_Mat4_transform,uint32_t_flags,unsigned_int_lightMask,const_Vec4_color,bool_forceDepthWrite) end
--[[
	name sette
]]
function cc.Mesh:setName(const_std_string_name) end
--[[
	Mesh index data sette
]]
function cc.Mesh:setMeshIndexData(MeshIndexData_indexdata) end
--[[
	get mesh vertex attribute coun
	@return ssize_t
]]
function cc.Mesh:getMeshVertexAttribCount() end
function cc.Mesh:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	force set this Sprite3D to 2D render queue
]]
function cc.Mesh:setForce2DQueue(bool_force2D) end
--[[
	skin sette
]]
function cc.Mesh:setSkin(MeshSkin_skin) end
--[[
	@return bool
]]
function cc.Mesh:isVisible() end
--[[
	Sets a new GLProgramState for the Mesh
	A new Material will be created for it
]]
function cc.Mesh:setGLProgramState(GLProgramState_glProgramState) end
--[[
	visible getter and sette
]]
function cc.Mesh:setVisible(bool_visible) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCSkeleton3D.h
]]
cc.Skeleton3D = {}
--[[
	remove all bone
]]
function cc.Skeleton3D:removeAllBones() end
--[[
	add bon
]]
function cc.Skeleton3D:addBone(Bone3D_bone) end
--[[
	@return [luaIde#Bone3D]
]]
function cc.Skeleton3D:getBoneByName(const_std_string_id) end
--[[
	@return [luaIde#Bone3D]
]]
function cc.Skeleton3D:getRootBone(int_index) end
--[[
	refresh bone world matri
]]
function cc.Skeleton3D:updateBoneMatrix() end
--[[
	get bon
	@return [luaIde#Bone3D]
]]
function cc.Skeleton3D:getBoneByIndex(unsigned_int_index) end
--[[
	get & set root bon
	@return ssize_t
]]
function cc.Skeleton3D:getRootCount() end
--[[
	get bone inde
	@return int
]]
function cc.Skeleton3D:getBoneIndex(Bone3D_bone) end
--[[
	get total bone coun
	@return ssize_t
]]
function cc.Skeleton3D:getBoneCount() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCSkybox.h
]]
cc.Skybox = {}
--[[
	reload sky box after GLESContext reconstructed
]]
function cc.Skybox:reload() end
--[[
	init Skybox.
	@return bool
]]
function cc.Skybox:init() end
--[[
	texture getter and sette
]]
function cc.Skybox:setTexture(TextureCube) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCSprite3D.h
]]
cc.Sprite3D = {}
--[[
	set cull face enable or not
]]
function cc.Sprite3D:setCullFaceEnabled(bool_enable) end
--[[
	set diffuse texture, set the first if multiple textures exis
]]
function cc.Sprite3D:setTexture(const_std_string_texFile) end
--[[
	@return int
]]
function cc.Sprite3D:getLightMask() end
--[[
	Adds a new material to a particular mesh of the sprite.
	meshIndex is the mesh that will be applied to.
	if meshIndex == -1, then it will be applied to all the meshes that belong to the sprite.
	@return [luaIde#cc.Material]
]]
function cc.Sprite3D:getMaterial(int_meshIndex) end
--[[
	set which face is going to cull, GL_BACK, GL_FRONT, GL_FRONT_AND_BACK, default GL_BACK
]]
function cc.Sprite3D:setCullFace(GLenum_cullFace) end
--[[
	Get meshes used in sprite 3d
	@return [luaIde#Vector__Mesh__]
]]
function cc.Sprite3D:getMeshes() end
--[[
	remove all attach node
]]
function cc.Sprite3D:removeAllAttachNode() end
--[[
	Adds a new material to the sprite.
	The Material will be applied to all the meshes that belong to the sprite.
	Internally it will call `setMaterial(material,-1)`
]]
function cc.Sprite3D:setMaterial(Material_material) end
--[[
	Adds a new material to a particular mesh of the sprite.
	meshIndex is the mesh that will be applied to.
	if meshIndex == -1, then it will be applied to all the meshes that belong to the sprite.
]]
function cc.Sprite3D:setMaterial(Material_material,int_meshIndex) end
--[[
	get mes
	@return [luaIde#cc.Mesh]
]]
function cc.Sprite3D:getMesh() end
--[[
	get mesh count
	@return ssize_t
]]
function cc.Sprite3D:getMeshCount() end
--[[
	get Mesh by inde
	@return [luaIde#cc.Mesh]
]]
function cc.Sprite3D:getMeshByIndex(int_index) end
--[[
	@return bool
]]
function cc.Sprite3D:isForceDepthWrite() end
--[[
	light mask getter & setter, light works only when _lightmask & light's flag is true, default value of _lightmask is 0xffff
]]
function cc.Sprite3D:setLightMask(unsigned_int_mask) end
--[[
	get AttachNode by bone name, return nullptr if not exis
	@return [luaIde#cc.AttachNode]
]]
function cc.Sprite3D:getAttachNode(const_std_string_boneName) end
--[[
	overrides
]]
function cc.Sprite3D:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	force set this Sprite3D to 2D render queue
]]
function cc.Sprite3D:setForce2DQueue(bool_force2D) end
--[[
	generate default materia
]]
function cc.Sprite3D:genMaterial(bool_useLight) end
--[[
	remove attach nod
]]
function cc.Sprite3D:removeAttachNode(const_std_string_boneName) end
--[[
	@return [luaIde#cc.Skeleton3D]
]]
function cc.Sprite3D:getSkeleton() end
--[[
	Force to write to depth buffer, this is useful if you want to achieve effects like fading.
]]
function cc.Sprite3D:setForceDepthWrite(bool_value) end
--[[
	get Mesh by Name, it returns the first one if there are more than one mesh with the same name
	@return [luaIde#cc.Mesh]
]]
function cc.Sprite3D:getMeshByName(const_std_string_name) end
--[[
	Creates an empty sprite3D without 3D model and texture.
	@return [luaIde#cc.Sprite3D]   An autoreleased sprite3D object.
]]
function cc.Sprite3D:create() end
--[[
	creates a Sprite3
	@return [luaIde#cc.Sprite3D]
]]
function cc.Sprite3D:create(const_std_string_modelPath) end
--[[
	@return [luaIde#cc.Sprite3D]
]]
function cc.Sprite3D:create(const_std_string_modelPath,const_std_string_texturePath) end

cc.Sprite3DCache = {}
--[[
	remove the SpriteData from Sprite3D by given the specified ke
]]
function cc.Sprite3DCache:removeSprite3DData(const_std_string_key) end
--[[
	remove all the SpriteData from Sprite3
]]
function cc.Sprite3DCache:removeAllSprite3DData() end
function cc.Sprite3DCache:destroyInstance() end
--[[
	get & destro
	@return [luaIde#cc.Sprite3DCache]
]]
function cc.Sprite3DCache:getInstance() end

--[[
	@SuperType[luaIde#cc.Material]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCSprite3DMaterial.h
]]
cc.Sprite3DMaterial = {}
--[[
	Get material type
	@return [luaIde#MaterialType]   Material type
]]
function cc.Sprite3DMaterial:getMaterialType() end
--[[
	Create material with file name, it creates material from cache if it is previously loaded
	@param path Path of material file
	@return [luaIde#cc.Sprite3DMaterial]   Created material
]]
function cc.Sprite3DMaterial:createWithFilename(const_std_string_path) end
--[[
	Release all cached materials
]]
function cc.Sprite3DMaterial:releaseCachedMaterial() end
--[[
	Create built in material from material type
	@param type Material type
	@param skinned Has skin?
	@return [luaIde#cc.Sprite3DMaterial]   Created material
]]
function cc.Sprite3DMaterial:createBuiltInMaterial(MaterialType_type,bool_skinned) end
--[[
	Create all build in materials
]]
function cc.Sprite3DMaterial:createBuiltInMaterial() end
--[[
	Create material with GLProgramState
	@param programState GLProgramState instance
	@return [luaIde#cc.Sprite3DMaterial]   Created material
]]
function cc.Sprite3DMaterial:createWithGLStateProgram(GLProgramState_programState) end
--[[
	Release all built in materials
]]
function cc.Sprite3DMaterial:releaseBuiltInMaterial() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCTerrain.h
]]
cc.Terrain = {}
--[[
	initialize heightMap data
	@return bool
]]
function cc.Terrain:initHeightMap(const_std_string_heightMap) end
--[[
	set the MaxDetailAmount.
]]
function cc.Terrain:setMaxDetailMapAmount(int_maxValue) end
--[[
	show the wireline instead of the surface,Debug Use only.
	@Note only support desktop platform
]]
function cc.Terrain:setDrawWire(bool_boolValue) end
--[[
	get the terrain's height data
	@return [luaIde#std_vector__float__]
]]
function cc.Terrain:getHeightData() end
--[[
	set the Detail Map
]]
function cc.Terrain:setDetailMap(unsigned_int_index,DetailMap_detailMap) end
--[[
	reset the heightmap data.
]]
function cc.Terrain:resetHeightMap(const_std_string_heightMap) end
--[[
	set directional light for the terrain
	@param lightDir The direction of directional light, Note that lightDir is in the terrain's local space. Most of the time terrain is placed at (0,0,0) and without rotation, so lightDir is also in the world space.
]]
function cc.Terrain:setLightDir(const_Vec3_lightDir) end
--[[
	set the alpha ma
]]
function cc.Terrain:setAlphaMap(cocos2d_Texture2D__newAlphaMapTexture) end
--[[
	set the skirt height ratio
]]
function cc.Terrain:setSkirtHeightRatio(float_ratio) end
--[[
	Convert a world Space position (X,Z) to terrain space position (X,Z)
	@return [luaIde#cc.Vec2]
]]
function cc.Terrain:convertToTerrainSpace(const_Vec2_worldSpace) end
--[[
	initialize alphaMap ,detailMaps texture
	@return bool
]]
function cc.Terrain:initTextures() end
--[[
	initialize all Properties which terrain need
	@return bool
]]
function cc.Terrain:initProperties() end
--[[
	@return bool
]]
function cc.Terrain:initWithTerrainData(TerrainData_parameter,CrackFixedType_fixedType) end
--[[
	Set threshold distance of each LOD level,must equal or greater than the chunk size
	@Note when invoke initHeightMap, the LOD distance will be automatic calculated.
]]
function cc.Terrain:setLODDistance(float_lod1,float_lod2,float_lod3) end
--[[
	get the terrain's size
	@return [luaIde#cc.Size]
]]
function cc.Terrain:getTerrainSize() end
--[[
	get the normal of the specified position in terrain
	@return [luaIde#cc.Vec3]   the normal vector of the specified position of the terrain.
	@note the fast normal calculation may not get precise normal vector.
]]
function cc.Terrain:getNormal(int_pixelX,int_pixelY) end
function cc.Terrain:reload() end
--[[
	get height from the raw height file
	@return float
]]
function cc.Terrain:getImageHeight(int_pixelX,int_pixelY) end
--[[
	set light map texture
]]
function cc.Terrain:setLightMap(const_std_string_fileName) end
--[[
	Switch frustum Culling Flag
	@Note frustum culling will remarkable improve your terrain rendering performance.
]]
function cc.Terrain:setIsEnableFrustumCull(bool_boolValue) end
--[[
	get the terrain's minimal height.
	@return float
]]
function cc.Terrain:getMinHeight() end
--[[
	get the terrain's maximal height.
	@return float
]]
function cc.Terrain:getMaxHeight() end

cc.Bundle3D = {}
--[[
	load a file. You must load a file first, then call loadMeshData, loadSkinData, and so on
	@param path File to be loaded
	@return bool   result of load
]]
function cc.Bundle3D:load(const_std_string_path) end
--[[
	load skin data from bundle
	@param id The ID of the skin, load the first Skin in the bundle if it is empty
	@return bool
]]
function cc.Bundle3D:loadSkinData(const_std_string_id,SkinData_skindata) end
function cc.Bundle3D:clear() end
--[[
	@return bool
]]
function cc.Bundle3D:loadMaterials(MaterialDatas_materialdatas) end
--[[
	@return bool
]]
function cc.Bundle3D:loadNodes(NodeDatas_nodedatas) end
--[[
	load material data from bundle
	@param id The ID of the animation, load the first animation in the bundle if it is empty
	@return bool
]]
function cc.Bundle3D:loadAnimationData(const_std_string_id,Animation3DData_animationdata) end
--[[
	create a new bundle, destroy it when finish using it
	@return [luaIde#cc.Bundle3D]
]]
function cc.Bundle3D:createBundle() end
function cc.Bundle3D:destroyBundle(Bundle3D_bundle) end

ccexp.AudioProfile = {}
function ccexp.AudioProfile:new() end 


ccexp.AudioEngine = {}
--[[
	@return bool
]]
function ccexp.AudioEngine:lazyInit() end
--[[
	Sets the current playback position of an audio instance.
	@param audioID   An audioID returned by the play2d function.
	@param sec       The offset in seconds from the start to seek to.
	@return bool  
]]
function ccexp.AudioEngine:setCurrentTime(int_audioID,float_sec) end
--[[
	Gets the volume value of an audio instance.
	@param audioID An audioID returned by the play2d function.
	@return float   Volume value (range from 0.0 to 1.0).
]]
function ccexp.AudioEngine:getVolume(int_audioID) end
--[[
	Uncache the audio data from internal buffer.
	AudioEngine cache audio data on ios,mac, and win32 platform.
	@warning This can lead to stop related audio first.
	@param filePath Audio file path.
]]
function ccexp.AudioEngine:uncache(const_std_string_filePath) end
--[[
	Resume all suspended audio instances.
]]
function ccexp.AudioEngine:resumeAll() end
--[[
	Stop all audio instances.
]]
function ccexp.AudioEngine:stopAll() end
--[[
	Pause an audio instance.
	@param audioID An audioID returned by the play2d function.
]]
function ccexp.AudioEngine:pause(int_audioID) end
--[[
	Gets the maximum number of simultaneous audio instance of AudioEngine.
	@return int
]]
function ccexp.AudioEngine:getMaxAudioInstance() end
--[[
	Check whether AudioEngine is enabled.
	@return bool
]]
function ccexp.AudioEngine:isEnabled() end
--[[
	Gets the current playback position of an audio instance.
	@param audioID An audioID returned by the play2d function.
	@return float   The current playback position of an audio instance.
]]
function ccexp.AudioEngine:getCurrentTime(int_audioID) end
--[[
	Sets the maximum number of simultaneous audio instance for AudioEngine.
	@param maxInstances The maximum number of simultaneous audio instance.
	@return bool
]]
function ccexp.AudioEngine:setMaxAudioInstance(int_maxInstances) end
--[[
	Checks whether an audio instance is loop.
	@param audioID An audioID returned by the play2d function.
	@return bool   Whether or not an audio instance is loop.
]]
function ccexp.AudioEngine:isLoop(int_audioID) end
--[[
	Pause all playing audio instances.
]]
function ccexp.AudioEngine:pauseAll() end
--[[
	Uncache all audio data from internal buffer.
	@warning All audio will be stopped first.
]]
function ccexp.AudioEngine:uncacheAll() end
--[[
	Sets volume for an audio instance.
	@param audioID An audioID returned by the play2d function.
	@param volume Volume value (range from 0.0 to 1.0).
]]
function ccexp.AudioEngine:setVolume(int_audioID,float_volume) end
--[[
	Preload audio file.
	@param filePath The file path of an audio.
]]
function ccexp.AudioEngine:preload(const_std_string_filePath) end
--[[
	Preload audio file.
	@param filePath The file path of an audio.
	@param callback A callback which will be called after loading is finished.
]]
function ccexp.AudioEngine:preload(const_std_string_filePath) end
--[[
	Whether to enable playing audios
	@note If it's disabled, current playing audios will be stopped and the later 'preload', 'play2d' methods will take no effects.
]]
function ccexp.AudioEngine:setEnabled(bool_isEnabled) end
--[[
	Play 2d sound.
	@param filePath The path of an audio file.
	@param loop Whether audio instance loop or not.
	@param volume Volume value (range from 0.0 to 1.0).
	@param profile A profile for audio instance. When profile is not specified, default profile will be used.
	@return int   An audio ID. It allows you to dynamically change the behavior of an audio instance on the fly.
	@see `AudioProfile`
]]
function ccexp.AudioEngine:play2d(const_std_string_filePath,bool_loop,float_volume,const_AudioProfile_profile) end
--[[
	Returns the state of an audio instance.
	@param audioID An audioID returned by the play2d function.
	@return [luaIde#AudioState]   The status of an audio instance.
]]
function ccexp.AudioEngine:getState(int_audioID) end
--[[
	Resume an audio instance.
	@param audioID An audioID returned by the play2d function.
]]
function ccexp.AudioEngine:resume(int_audioID) end
--[[
	Stop an audio instance.
	@param audioID An audioID returned by the play2d function.
]]
function ccexp.AudioEngine:stop(int_audioID) end
--[[
	Gets the duration of an audio instance.
	@param audioID An audioID returned by the play2d function.
	@return float   The duration of an audio instance.
]]
function ccexp.AudioEngine:getDuration(int_audioID) end
--[[
	Sets whether an audio instance loop or not.
	@param audioID An audioID returned by the play2d function.
	@param loop Whether audio instance loop or not.
]]
function ccexp.AudioEngine:setLoop(int_audioID,bool_loop) end
--[[
	Gets the default profile of audio instances.
	@return [luaIde#ccexp.AudioProfile]   The default profile of audio instances.
]]
function ccexp.AudioEngine:getDefaultProfile() end
--[[
	Gets the audio profile by id of audio instance.
	@param audioID An audioID returned by the play2d function.
	@return [luaIde#ccexp.AudioProfile]   The audio profile.
]]
function ccexp.AudioEngine:getProfile(int_audioID) end
--[[
	Gets an audio profile by name.
	@param profileName A name of audio profile.
	@return [luaIde#ccexp.AudioProfile]   The audio profile.
]]
function ccexp.AudioEngine:getProfile(const_std_string_profileName) end
--[[
	Gets playing audio count.
	@return int
]]
function ccexp.AudioEngine:getPlayingAudioCount() end

cc.Ref = {}
--[[
	Releases the ownership immediately.
	This decrements the Ref's reference count.
	If the reference count reaches 0 after the decrement, this Ref is
	destructed.
	@see retain, autorelease
	@js NA
]]
function cc.Ref:release() end
--[[
	Retains the ownership.
	This increases the Ref's reference count.
	@see release, autorelease
	@js NA
]]
function cc.Ref:retain() end
--[[
	Returns the Ref's current reference count.
	@return int  s The Ref's reference count.
	@js NA
]]
function cc.Ref:getReferenceCount() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCConsole.h
]]
cc.Console = {}
--[[
	add sub command
]]
function cc.Console:addSubCommand(const_Command_subCmd) end
--[[
	get sub command
	@return [luaIde#cc.Console]
]]
function cc.Console:getSubCommand(const_std_string_subCmdName) end
--[[
	delete sub command
]]
function cc.Console:delSubCommand(const_std_string_subCmdName) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCTexture2D.h
]]
cc.Texture2D = {}
--[[
	Gets max T.
	@return GLfloat
]]
function cc.Texture2D:getMaxT() end
function cc.Texture2D:setAlphaTexture(Texture2D_alphaTexture) end
--[[
	Returns the pixel format.
	@since v2.0
	@return char
]]
function cc.Texture2D:getStringForFormat() end
--[[
	Initializes a texture from a UIImage object.
	We will use the format you specified with setDefaultAlphaPixelFormat to convert the image for texture.
	NOTE: It will not convert the pvr image file.
	@param image An UIImage object.
	@return bool
]]
function cc.Texture2D:initWithImage(Image__image) end
--[[
	Initializes a texture from a UIImage object.
	We will use the format you passed to the function to convert the image format to the texture format.
	If you pass PixelFormat::Automatic, we will auto detect the image render type and use that type for texture to render.
	@param image An UIImage object.
	@param format Texture pixel formats.
	@return bool
]]
function cc.Texture2D:initWithImage(Image__image,PixelFormat_format) end
--[[
	Gets max S.
	@return GLfloat
]]
function cc.Texture2D:getMaxS() end
--[[
	Release only the gl texture.
	@js NA
	@lua NA
]]
function cc.Texture2D:releaseGLTexture() end
--[[
	Whether or not the texture has their Alpha premultiplied.
	@return bool
]]
function cc.Texture2D:hasPremultipliedAlpha() end
--[[
	Gets the height of the texture in pixels.
	@return int
]]
function cc.Texture2D:getPixelsHigh() end
--[[
	@return GLuint
]]
function cc.Texture2D:getAlphaTextureName() end
--[[
	Returns the bits-per-pixel of the in-memory OpenGL texture
	@since v1.0
	@return int
]]
function cc.Texture2D:getBitsPerPixelForFormat() end
--[[
	Helper functions that returns bits per pixels for a given format.
	@since v2.0
	@return int
]]
function cc.Texture2D:getBitsPerPixelForFormat(Texture2D_PixelFormat_format) end
--[[
	Gets the texture name.
	@return GLuint
]]
function cc.Texture2D:getName() end
--[[
	Initializes a texture from a string with dimensions, alignment, font name and font size.
	@param text A null terminated string.
	@param fontName The font name.
	@param fontSize The font size.
	@param dimensions The font dimension.
	@param hAlignment The font horizontal text alignment type.
	@param vAlignment The font vertical text alignment type.
	@param enableWrap Whether enable text wrap or not.
	@param overflow Whether shrink font size when content larger than the dimensions.
	@return bool
]]
function cc.Texture2D:initWithString(const_char_text,const_std_string_fontName,float_fontSize,const_Size_dimensions,TextHAlignment_hAlignment,TextVAlignment_vAlignment,bool_enableWrap,int_overflow) end
--[[
	Initializes a texture from a string using a text definition.
	@param text A null terminated string.
	@param textDefinition A FontDefinition object contains font attributes.
	@return bool
]]
function cc.Texture2D:initWithString(const_char_text,const_FontDefinition_textDefinition) end
--[[
	Sets max T.
]]
function cc.Texture2D:setMaxT(GLfloat_maxT) end
--[[
	@return std_string
]]
function cc.Texture2D:getPath() end
--[[
	Draws a texture inside a rect
]]
function cc.Texture2D:drawInRect(const_Rect_rect) end
--[[
	Get the texture content size
	@return [luaIde#cc.Size]
]]
function cc.Texture2D:getContentSize() end
--[[
	Sets alias texture parameters:
	- GL_TEXTURE_MIN_FILTER = GL_NEAREST
	- GL_TEXTURE_MAG_FILTER = GL_NEAREST
	@warning Calling this method could allocate additional texture memory.
	@since v0.8
]]
function cc.Texture2D:setAliasTexParameters() end
--[[
	Sets antialias texture parameters:
	- GL_TEXTURE_MIN_FILTER = GL_LINEAR
	- GL_TEXTURE_MAG_FILTER = GL_LINEAR
	@warning Calling this method could allocate additional texture memory.
	@since v0.8
]]
function cc.Texture2D:setAntiAliasTexParameters() end
--[[
	Generates mipmap images for the texture.
	It only works if the texture size is POT (power of 2).
	@since v0.99.0
]]
function cc.Texture2D:generateMipmap() end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.Texture2D:getAlphaTexture() end
--[[
	Get texture name, dimensions and coordinates message by a string.
	@js NA
	@lua NA
	@return std_string
]]
function cc.Texture2D:getDescription() end
--[[
	Gets the pixel format of the texture.
	@return [luaIde#Texture2D_PixelFormat]
]]
function cc.Texture2D:getPixelFormat() end
--[[
	Set a shader program to the texture.
	It's used by drawAtPoint and drawInRect
]]
function cc.Texture2D:setGLProgram(GLProgram_program) end
--[[
	Get content size.
	@return [luaIde#cc.Size]
]]
function cc.Texture2D:getContentSizeInPixels() end
--[[
	Gets the width of the texture in pixels.
	@return int
]]
function cc.Texture2D:getPixelsWide() end
--[[
	Draws a texture at a given point.
]]
function cc.Texture2D:drawAtPoint(const_Vec2_point) end
--[[
	Get a shader program from the texture
	@return [luaIde#cc.GLProgram]
]]
function cc.Texture2D:getGLProgram() end
--[[
	Whether or not the texture has mip maps
	@return bool
]]
function cc.Texture2D:hasMipmaps() end
--[[
	Sets max S.
]]
function cc.Texture2D:setMaxS(GLfloat_maxS) end
--[[
	sets the default pixel format for UIImagescontains alpha channel.
	@param format
	If the UIImage contains alpha channel, then the options are:
	- generate 32-bit textures: Texture2D::PixelFormat::RGBA8888 (default one)
	- generate 24-bit textures: Texture2D::PixelFormat::RGB888
	- generate 16-bit textures: Texture2D::PixelFormat::RGBA4444
	- generate 16-bit textures: Texture2D::PixelFormat::RGB5A1
	- generate 16-bit textures: Texture2D::PixelFormat::RGB565
	- generate 8-bit textures: Texture2D::PixelFormat::A8 (only use it if you use just 1 color)
	How does it work ?
	- If the image is an RGBA (with Alpha) then the default pixel format will be used (it can be a 8-bit, 16-bit or 32-bit texture)
	- If the image is an RGB (without Alpha) then: If the default pixel format is RGBA8888 then a RGBA8888 (32-bit) will be used. Otherwise a RGB565 (16-bit texture) will be used.
	This parameter is not valid for PVR / PVR.CCZ images.
	@since v0.8
]]
function cc.Texture2D:setDefaultAlphaPixelFormat(Texture2D_PixelFormat_format) end
--[[
	Returns the alpha pixel format.
	@since v0.8
	@return [luaIde#Texture2D_PixelFormat]
]]
function cc.Texture2D:getDefaultAlphaPixelFormat() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCTouch.h
]]
cc.Touch = {}
--[[
	Returns the previous touch location in screen coordinates.
	@return [luaIde#cc.Vec2]   The previous touch location in screen coordinates.
]]
function cc.Touch:getPreviousLocationInView() end
--[[
	Returns the current touch location in OpenGL coordinates.
	@return [luaIde#cc.Vec2]   The current touch location in OpenGL coordinates.
]]
function cc.Touch:getLocation() end
--[[
	Returns the delta of 2 current touches locations in screen coordinates.
	@return [luaIde#cc.Vec2]   The delta of 2 current touches locations in screen coordinates.
]]
function cc.Touch:getDelta() end
--[[
	Returns the start touch location in screen coordinates.
	@return [luaIde#cc.Vec2]   The start touch location in screen coordinates.
]]
function cc.Touch:getStartLocationInView() end
--[[
	Returns the current touch force for 3d touch.
	@return float   The current touch force for 3d touch.
]]
function cc.Touch:getCurrentForce() end
--[[
	Returns the start touch location in OpenGL coordinates.
	@return [luaIde#cc.Vec2]   The start touch location in OpenGL coordinates.
]]
function cc.Touch:getStartLocation() end
--[[
	Set the touch information. It always used to monitor touch event.
	@param id A given id
	@param x A given x coordinate.
	@param y A given y coordinate.
]]
function cc.Touch:setTouchInfo(int_id,float_x,float_y) end
--[[
	Set the touch information. It always used to monitor touch event.
	@param id A given id
	@param x A given x coordinate.
	@param y A given y coordinate.
	@param force Current force for 3d touch.
	@param maxForce maximum possible force for 3d touch.
]]
function cc.Touch:setTouchInfo(int_id,float_x,float_y,float_force,float_maxForce) end
--[[
	Returns the maximum touch force for 3d touch.
	@return float   The maximum touch force for 3d touch.
]]
function cc.Touch:getMaxForce() end
--[[
	Returns the current touch location in screen coordinates.
	@return [luaIde#cc.Vec2]   The current touch location in screen coordinates.
]]
function cc.Touch:getLocationInView() end
--[[
	Returns the previous touch location in OpenGL coordinates.
	@return [luaIde#cc.Vec2]   The previous touch location in OpenGL coordinates.
]]
function cc.Touch:getPreviousLocation() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEvent.h
]]
cc.Event = {}
--[[
	Checks whether the event has been stopped.
	@return bool   True if the event has been stopped.
]]
function cc.Event:isStopped() end
--[[
	Gets the event type.
	@return [luaIde#Type]   The event type.
]]
function cc.Event:getType() end
--[[
	Gets current target of the event.
	@return [luaIde#cc.Node]   The target with which the event associates.
	@note It's only available when the event listener is associated with node.
	It returns 0 when the listener is associated with fixed priority.
]]
function cc.Event:getCurrentTarget() end
--[[
	Stops propagation for current event.
]]
function cc.Event:stopPropagation() end

--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventTouch.h
]]
cc.EventTouch = {}
--[[
	Get event code.
	@return [luaIde#EventCode]   The code of the event.
]]
function cc.EventTouch:getEventCode() end
--[[
	Set the event code.
	@param eventCode A given EventCode.
]]
function cc.EventTouch:setEventCode(EventCode_eventCode) end

--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventKeyboard.h
]]
cc.EventKeyboard = {}
function cc.EventKeyboard:new() end 


--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCComponent.h
]]
cc.Component = {}
function cc.Component:setEnabled(bool_enabled) end
function cc.Component:onRemove() end
function cc.Component:setName(const_std_string_name) end
--[[
	@return bool
]]
function cc.Component:isEnabled() end
function cc.Component:update(float_delta) end
--[[
	@return [luaIde#cc.Node]
]]
function cc.Component:getOwner() end
--[[
	@return bool
]]
function cc.Component:init() end
function cc.Component:setOwner(Node_owner) end
--[[
	@return std_string
]]
function cc.Component:getName() end
function cc.Component:onAdd() end
--[[
	@return [luaIde#cc.Component]
]]
function cc.Component:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCNode.h
]]
cc.Node = {}
--[[
	Adds a child to the container with z-order as 0.
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child A child node.
]]
function cc.Node:addChild(Node__child) end
--[[
	Adds a child to the container with a local z-order.
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child     A child node.
	@param localZOrder    Z order for drawing priority. Please refer to `setLocalZOrder(int)`.
]]
function cc.Node:addChild(Node__child,int_localZOrder) end
--[[
	Adds a child to the container with z order and tag.
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child         A child node.
	@param localZOrder   Z order for drawing priority. Please refer to `setLocalZOrder(int)`.
	@param tag           An integer to identify the node easily. Please refer to `setTag(int)`.
	Please use `addChild(Node* child, int localZOrder, const std::string &name)` instead.
]]
function cc.Node:addChild(Node_child,int_localZOrder,int_tag) end
--[[
	Adds a child to the container with z order and tag
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child     A child node.
	@param localZOrder    Z order for drawing priority. Please refer to `setLocalZOrder(int)`.
	@param name      A string to identify the node easily. Please refer to `setName(int)`.
]]
function cc.Node:addChild(Node_child,int_localZOrder,const_std_string_name) end
--[[
	Gets the description string. It makes debugging easier.
	@return std_string   A string
	@js NA
	@lua NA
]]
function cc.Node:getDescription() end
--[[
	Sets the Y rotation (angle) of the node in degrees which performs a vertical rotational skew.
	The difference between `setRotationalSkew()` and `setSkew()` is that the first one simulate Flash's skew functionality,
	while the second one uses the real skew function.
	0 is the default rotation angle.
	Positive values rotate node clockwise, and negative values for anti-clockwise.
	@param rotationY    The Y rotation in degrees.
	@warning The physics body doesn't support this.
	@js setRotationY
]]
function cc.Node:setRotationSkewY(float_rotationY) end
--[[
	Returns the array of the node's children.
	@return [luaIde#Vector__Node__]   the array the node's children.
]]
function cc.Node:getChildren() end
--[[
	Gets whether the anchor point will be (0,0) when you position this node.
	@see `setIgnoreAnchorPointForPosition(bool)`
	@return bool   true if the anchor point will be (0,0) when you position this node.
]]
function cc.Node:isIgnoreAnchorPointForPosition() end
--[[
	Gets a child from the container with its name.
	@param name   An identifier to find the child node.
	@return [luaIde#cc.Node]   a Node object whose name equals to the input parameter.
	@since v3.2
]]
function cc.Node:getChildByName(const_std_string_name) end
--[[
	@return [luaIde#T]
]]
function cc.Node:getChildByName(const_std_string_name) end
--[[
	Sets the rotation (angle) of the node in degrees.
	0 is the default rotation angle.
	Positive values rotate node clockwise, and negative values for anti-clockwise.
	@param rotation     The rotation of the node in degrees.
]]
function cc.Node:setRotation(float_rotation) end
--[[
	Changes the scale factor on Z axis of this node
	The Default value is 1.0 if you haven't changed it before.
	@param scaleZ   The scale factor on Z axis.
	@warning The physics body doesn't support this.
]]
function cc.Node:setScaleZ(float_scaleZ) end
--[[
	Sets the scale (y) of the node.
	It is a scaling factor that multiplies the height of the node and its children.
	@param scaleY   The scale factor on Y axis.
	@warning The physics body doesn't support this.
]]
function cc.Node:setScaleY(float_scaleY) end
--[[
	Sets the scale (x) of the node.
	It is a scaling factor that multiplies the width of the node and its children.
	@param scaleX   The scale factor on X axis.
	@warning The physics body doesn't support this.
]]
function cc.Node:setScaleX(float_scaleX) end
--[[
	Sets the X rotation (angle) of the node in degrees which performs a horizontal rotational skew.
	The difference between `setRotationalSkew()` and `setSkew()` is that the first one simulate Flash's skew functionality,
	while the second one uses the real skew function.
	0 is the default rotation angle.
	Positive values rotate node clockwise, and negative values for anti-clockwise.
	@param rotationX    The X rotation in degrees which performs a horizontal rotational skew.
	@warning The physics body doesn't support this.
	@js setRotationX
]]
function cc.Node:setRotationSkewX(float_rotationX) end
--[[
	Helper function used by `setLocalZOrder`. Don't use it unless you know what you are doing.
	@js NA
]]
function cc.Node:_setLocalZOrder(int_z) end
--[[
	Returns a tag that is used to identify the node easily.
	@return int   An integer that identifies the node.
	Please use `getTag()` instead.
]]
function cc.Node:getTag() end
--[[
	Return the GLProgram (shader) currently used for this node.
	@return [luaIde#cc.GLProgram]   The GLProgram (shader) currently used for this node.
]]
function cc.Node:getGLProgram() end
--[[
	Returns the position (X,Y,Z) in its parent's coordinate system.
	@return [luaIde#cc.Vec3]   The position (X, Y, and Z) in its parent's coordinate system.
	@js NA
]]
function cc.Node:getPosition3D() end
--[[
	Removes a child from the container. It will also cleanup all running actions depending on the cleanup parameter.
	@param child     The child node which will be removed.
	@param cleanup   True if all running actions and callbacks on the child node will be cleanup, false otherwise.
]]
function cc.Node:removeChild(Node_child,bool_cleanup) end
--[[
	Changes the X skew angle of the node in degrees.
	The difference between `setRotationalSkew()` and `setSkew()` is that the first one simulate Flash's skew functionality
	while the second one uses the real skew function.
	This angle describes the shear distortion in the X direction.
	Thus, it is the angle between the Y coordinate and the left edge of the shape
	The default skewX angle is 0. Positive values distort the node in a CW direction.
	@param skewX The X skew angle of the node in degrees.
	@warning The physics body doesn't support this.
]]
function cc.Node:setSkewX(float_skewX) end
--[[
	Set the GLProgramState for this node.
	@param glProgramState The GLProgramState for this node.
]]
function cc.Node:setGLProgramState(GLProgramState_glProgramState) end
--[[
	FIXME: should get deprecated in v4.0
]]
function cc.Node:setNormalizedPosition(const_Vec2_position) end
--[[
	Removes all children from the container with a cleanup.
	@see `removeAllChildrenWithCleanup(bool)`
]]
function cc.Node:removeAllChildren() end
--[[
	Sets the parent node.
	@param parent    A pointer to the parent node.
]]
function cc.Node:setParent(Node_parent) end
--[[
	Returns a string that is used to identify the node.
	@return std_string   A string that identifies the node.
	@since v3.2
]]
function cc.Node:getName() end
--[[
	Returns the rotation (X,Y,Z) in degrees.
	@return [luaIde#cc.Vec3]   The rotation of the node in 3d.
	@js NA
]]
function cc.Node:getRotation3D() end
--[[
	Sets the position (x,y) using values between 0 and 1.
	The positions in pixels is calculated like the following:
	@code
	// pseudo code
	void setNormalizedPosition(Vec2 pos) {
	Size s = getParent()->getContentSize();
	_position = pos * s;
	}
	@endcode
	@param position The normalized position (x,y) of the node, using value between 0 and 1.
]]
function cc.Node:setPositionNormalized(const_Vec2_position) end
--[[
	Sets the position (x,y) of the node in its parent's coordinate system.
	Usually we use `Vec2(x,y)` to compose Vec2 object.
	This code snippet sets the node in the center of screen.
	@code
	Size size = Director::getInstance()->getWinSize();
	node->setPosition(size.width/2, size.height/2);
	@endcode
	@param position  The position (x,y) of the node in OpenGL coordinates.
]]
function cc.Node:setPosition(const_Vec2_position) end
--[[
	Sets the position (x,y) of the node in its parent's coordinate system.
	Passing two numbers (x,y) is much efficient than passing Vec2 object.
	This method is bound to Lua and JavaScript.
	Passing a number is 10 times faster than passing a object from Lua to c++.
	@code
	// sample code in Lua
	local pos  = node::getPosition()  -- returns Vec2 object from C++.
	node:setPosition(x, y)            -- pass x, y coordinate to C++.
	@endcode
	@param x     X coordinate for position.
	@param y     Y coordinate for position.
]]
function cc.Node:setPosition(float_x,float_y) end
--[[
	Reorders a child according to a new z value.
	@param child     An already added child node. It MUST be already added.
	@param localZOrder Z order for drawing priority. Please refer to setLocalZOrder(int).
]]
function cc.Node:reorderChild(Node__child,int_localZOrder) end
--[[
	Changes the Y skew angle of the node in degrees.
	The difference between `setRotationalSkew()` and `setSkew()` is that the first one simulate Flash's skew functionality
	while the second one uses the real skew function.
	This angle describes the shear distortion in the Y direction.
	Thus, it is the angle between the X coordinate and the bottom edge of the shape.
	The default skewY angle is 0. Positive values distort the node in a CCW direction.
	@param skewY    The Y skew angle of the node in degrees.
	@warning The physics body doesn't support this.
]]
function cc.Node:setSkewY(float_skewY) end
--[[
	Sets the 'z' coordinate in the position. It is the OpenGL Z vertex value.
	The OpenGL depth buffer and depth testing are disabled by default. You need to turn them on.
	In order to use this property correctly.
	`setPositionZ()` also sets the `setGlobalZValue()` with the positionZ as value.
	@see `setGlobalZValue()`
	@param positionZ  OpenGL Z vertex of this node.
	@js setVertexZ
]]
function cc.Node:setPositionZ(float_positionZ) end
--[[
	Sets the rotation (X,Y,Z) in degrees.
	Useful for 3d rotations.
	@warning The physics body doesn't support this.
	@param rotation The rotation of the node in 3d.
	@js NA
]]
function cc.Node:setRotation3D(const_Vec3_rotation) end
--[[
	Sets the x coordinate of the node in its parent's coordinate system.
	@param x The x coordinate of the node.
]]
function cc.Node:setPositionX(float_x) end
--[[
	Returns the anchor point in percent.
	@see `setAnchorPoint(const Vec2&)`
	@return [luaIde#cc.Vec2]   The anchor point of node.
]]
function cc.Node:getAnchorPoint() end
--[[
	Sets the shader program for this node
	Since v2.0, each rendering node must set its shader program.
	It should be set in initialize phase.
	@code
	node->setGLProgram(GLProgramCache::getInstance()->getProgram(GLProgram::SHADER_NAME_POSITION_TEXTURE_COLOR));
	@endcode
	@param glprogram The shader program.
]]
function cc.Node:setGLProgram(GLProgram_glprogram) end
--[[
	Determines if the node is visible.
	@see `setVisible(bool)`
	@return bool   true if the node is visible, false if the node is hidden.
]]
function cc.Node:isVisible() end
--[[
	Returns the amount of children.
	@return ssize_t   The amount of children.
]]
function cc.Node:getChildrenCount() end
--[[
	Returns the rotation of the node in degrees.
	@see `setRotation(float)`
	@return float   The rotation of the node in degrees.
]]
function cc.Node:getRotation() end
--[[
	Returns the anchorPoint in absolute pixels.
	@warning You can only read it. If you wish to modify it, use anchorPoint instead.
	@see `getAnchorPoint()`
	@return [luaIde#cc.Vec2]   The anchor point in absolute pixels.
]]
function cc.Node:getAnchorPointInPoints() end
--[[
	Removes a child from the container by tag value. It will also cleanup all running actions depending on the cleanup parameter.
	@param name       A string that identifies a child node.
	@param cleanup   True if all running actions and callbacks on the child node will be cleanup, false otherwise.
]]
function cc.Node:removeChildByName(const_std_string_name,bool_cleanup) end
--[[
	Return the GLProgramState currently used for this node.
	@return [luaIde#cc.GLProgramState]   The GLProgramState currently used for this node.
]]
function cc.Node:getGLProgramState() end
--[[
	Returns the X skew angle of the node in degrees.
	@see `setSkewX(float)`
	@return float   The X skew angle of the node in degrees.
]]
function cc.Node:getSkewX() end
--[[
	Returns the Y skew angle of the node in degrees.
	@see `setSkewY(float)`
	@return float   The Y skew angle of the node in degrees.
]]
function cc.Node:getSkewY() end
--[[
	Changes the name that is used to identify the node easily.
	@param name A string that identifies the node.
	@since v3.2
]]
function cc.Node:setName(const_std_string_name) end
--[[
	Gets the local Z order of this node.
	@see `setLocalZOrder(int)`
	@return int   The local (relative to its siblings) Z order.
]]
function cc.Node:getLocalZOrder() end
--[[
	Returns the normalized position.
	@return [luaIde#cc.Vec2]   The normalized position.
]]
function cc.Node:getPositionNormalized() end
--[[
	Returns whether or not the node is "running".
	If the node is running it will accept event callbacks like onEnter(), onExit(), update().
	@return bool   Whether or not the node is running.
]]
function cc.Node:isRunning() end
--[[
	Returns a pointer to the parent node.
	@see `setParent(Node*)`
	@return [luaIde#cc.Node]  s A pointer to the parent node.
]]
function cc.Node:getParent() end
--[[
	Gets position Z coordinate of this node.
	@see setPositionZ(float)
	@return float   The position Z coordinate of this node.
	@js getVertexZ
]]
function cc.Node:getPositionZ() end
--[[
	Gets the y coordinate of the node in its parent's coordinate system.
	@return float   The y coordinate of the node.
]]
function cc.Node:getPositionY() end
--[[
	Gets the x coordinate of the node in its parent's coordinate system.
	@return float   The x coordinate of the node.
]]
function cc.Node:getPositionX() end
--[[
	Removes a child from the container by tag value. It will also cleanup all running actions depending on the cleanup parameter.
	@param tag       An integer number that identifies a child node.
	@param cleanup   True if all running actions and callbacks on the child node will be cleanup, false otherwise.
	Please use `removeChildByName` instead.
]]
function cc.Node:removeChildByTag(int_tag,bool_cleanup) end
--[[
	Sets the y coordinate of the node in its parent's coordinate system.
	@param y The y coordinate of the node.
]]
function cc.Node:setPositionY(float_y) end
--[[
	Sets whether the node is visible.
	The default value is true, a node is default to visible.
	@param visible   true if the node is visible, false if the node is hidden.
]]
function cc.Node:setVisible(bool_visible) end
--[[
	Defines the order in which the nodes are renderer.
	Nodes that have a Global Z Order lower, are renderer first.
	In case two or more nodes have the same Global Z Order, the order is not guaranteed.
	The only exception if the Nodes have a Global Z Order == 0. In that case, the Scene Graph order is used.
	By default, all nodes have a Global Z Order = 0. That means that by default, the Scene Graph order is used to render the nodes.
	Global Z Order is useful when you need to render nodes in an order different than the Scene Graph order.
	Limitations: Global Z Order can't be used by Nodes that have SpriteBatchNode as one of their ancestors.
	And if ClippingNode is one of the ancestors, then "global Z order" will be relative to the ClippingNode.
	@see `setLocalZOrder()`
	@see `setVertexZ()`
	@since v3.0
	@param globalZOrder The global Z order value.
]]
function cc.Node:setGlobalZOrder(float_globalZOrder) end
--[[
	Sets the scale (x,y,z) of the node.
	It is a scaling factor that multiplies the width, height and depth of the node and its children.
	@param scale     The scale factor for both X and Y axis.
	@warning The physics body doesn't support this.
]]
function cc.Node:setScale(float_scale) end
--[[
	Sets the scale (x,y) of the node.
	It is a scaling factor that multiplies the width and height of the node and its children.
	@param scaleX     The scale factor on X axis.
	@param scaleY     The scale factor on Y axis.
	@warning The physics body doesn't support this.
]]
function cc.Node:setScale(float_scaleX,float_scaleY) end
--[[
	Gets a child from the container with its tag.
	@param tag   An identifier to find the child node.
	@return [luaIde#cc.Node]   a Node object whose tag equals to the input parameter.
	Please use `getChildByName()` instead.
]]
function cc.Node:getChildByTag(int_tag) end
--[[
	@return [luaIde#T]
]]
function cc.Node:getChildByTag(int_tag) end
--[[
	Returns the scale factor on Z axis of this node
	@see `setScaleZ(float)`
	@return float   The scale factor on Z axis.
]]
function cc.Node:getScaleZ() end
--[[
	Returns the scale factor on Y axis of this node
	@see `setScaleY(float)`
	@return float   The scale factor on Y axis.
]]
function cc.Node:getScaleY() end
--[[
	Returns the scale factor on X axis of this node
	@see setScaleX(float)
	@return float   The scale factor on X axis.
]]
function cc.Node:getScaleX() end
--[[
	LocalZOrder is the 'key' used to sort the node relative to its siblings.
	The Node's parent will sort all its children based on the LocalZOrder value.
	If two nodes have the same LocalZOrder, then the node that was added first to the children's array will be in front of the other node in the array.
	Also, the Scene Graph is traversed using the "In-Order" tree traversal algorithm ( http://en.wikipedia.org/wiki/Tree_traversal#In-order )
	And Nodes that have LocalZOrder values < 0 are the "left" subtree
	While Nodes with LocalZOrder >=0 are the "right" subtree.
	@see `setGlobalZOrder`
	@see `setVertexZ`
	@param localZOrder The local Z order value.
]]
function cc.Node:setLocalZOrder(int_localZOrder) end
--[[
	Returns the untransformed size of the node.
	@see `setContentSize(const Size&)`
	@return [luaIde#cc.Size]   The untransformed size of the node.
]]
function cc.Node:getContentSize() end
--[[
	Sets whether the anchor point will be (0,0) when you position this node.
	This is an internal method, only used by Layer and Scene. Don't call it outside framework.
	The default value is false, while in Layer and Scene are true.
	@param ignore    true if anchor point will be (0,0) when you position this node.
]]
function cc.Node:setIgnoreAnchorPointForPosition(bool_ignore) end
--[[
	Returns the Node's Global Z Order.
	@see `setGlobalZOrder(int)`
	@return float   The node's global Z order
]]
function cc.Node:getGlobalZOrder() end
--[[
	Returns a user assigned Object.
	Similar to UserData, but instead of holding a void* it holds an object.
	The UserObject will be retained once in this method,
	and the previous UserObject (if existed) will be released.
	The UserObject will be released in Node's destructor.
	@param userObject    A user assigned Object.
]]
function cc.Node:setUserObject(Ref_userObject) end
--[[
	Removes this node itself from its parent node with a cleanup.
	If the node orphan, then nothing happens.
	@see `removeFromParentAndCleanup(bool)`
]]
function cc.Node:removeFromParent() end
--[[
	Sets the position (X, Y, and Z) in its parent's coordinate system.
	@param position The position (X, Y, and Z) in its parent's coordinate system.
	@js NA
]]
function cc.Node:setPosition3D(const_Vec3_position) end
--[[
	Sorts the children array once before drawing, instead of every time when a child is added or reordered.
	This approach can improves the performance massively.
	@note Don't call this manually unless a child added needs to be removed in the same frame.
]]
function cc.Node:sortAllChildren() end
--[[
	Gets the scale factor of the node,  when X and Y have the same scale factor.
	@warning Assert when `_scaleX != _scaleY`
	@see setScale(float)
	@return float   The scale factor of the node.
]]
function cc.Node:getScale() end
--[[
	!!! ONLY FOR INTERNAL USE
	Sets the arrival order when this node has a same ZOrder with other children.
	A node which called addChild subsequently will take a larger arrival order,
	If two children have the same Z order, the child with larger arrival order will be drawn later.
	@warning This method is used internally for localZOrder sorting, don't change this manually
	@param orderOfArrival   The arrival order.
]]
function cc.Node:updateOrderOfArrival() end
--[[
	@return [luaIde#cc.Vec2]
]]
function cc.Node:getNormalizedPosition() end
--[[
	Gets the X rotation (angle) of the node in degrees which performs a horizontal rotation skew.
	@see `setRotationSkewX(float)`
	@return float   The X rotation in degrees.
	@js getRotationX
]]
function cc.Node:getRotationSkewX() end
--[[
	Gets the Y rotation (angle) of the node in degrees which performs a vertical rotational skew.
	@see `setRotationSkewY(float)`
	@return float   The Y rotation in degrees.
	@js getRotationY
]]
function cc.Node:getRotationSkewY() end
--[[
	Changes the tag that is used to identify the node easily.
	Please refer to getTag for the sample code.
	@param tag   A integer that identifies the node.
	Please use `setName()` instead.
]]
function cc.Node:setTag(int_tag) end
--[[
	Allocates and initializes a node.
	@return [luaIde#cc.Node]   A initialized node which is marked as "autorelease".
]]
function cc.Node:create() end
--[[
	Gets count of nodes those are attached to scene graph.
	@return int
]]
function cc.Node:getAttachedNodeCount() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCScene.h
]]
cc.Scene = {}
--[[
	@return bool
]]
function cc.Scene:initWithPhysics() end
function cc.Scene:setCameraOrderDirty() end
--[[
	Render the scene.
	@param renderer The renderer use to render the scene.
	@param eyeTransform The AdditionalTransform of camera.
	@param eyeProjection The projection matrix of camera.
	@js NA
]]
function cc.Scene:render(Renderer_renderer,const_Mat4_eyeTransform,const_Mat4_eyeProjection) end
--[[
	Render the scene.
	@param renderer The renderer use to render the scene.
	@param eyeTransforms The AdditionalTransform List of camera of multiView.
	@param eyeProjections The projection matrix List of camera of multiView.
	@param multiViewCount The number of multiView.
	@js NA
]]
function cc.Scene:render(Renderer_renderer,const_Mat4_eyeTransforms,const_Mat4_eyeProjections,unsigned_int_multiViewCount) end
function cc.Scene:stepPhysicsAndNavigation(float_deltaTime) end
function cc.Scene:onProjectionChanged(EventCustom_event) end
--[[
	Get the physics world of the scene.
	@return [luaIde#cc.PhysicsWorld]   The physics world of the scene.
	@js NA
]]
function cc.Scene:getPhysicsWorld() end
--[[
	@return bool
]]
function cc.Scene:initWithSize(const_Size_size) end
--[[
	Get the default camera.
	@js NA
	@return [luaIde#cc.Camera]   The default camera of scene.
]]
function cc.Scene:getDefaultCamera() end
--[[
	Creates a new Scene object with a predefined Size.
	@param size The predefined size of scene.
	@return [luaIde#cc.Scene]   An autoreleased Scene object.
	@js NA
]]
function cc.Scene:createWithSize(const_Size_size) end
--[[
	Creates a new Scene object.
	@return [luaIde#cc.Scene]   An autoreleased Scene object.
]]
function cc.Scene:create() end
--[[
	Create a scene with physics.
	@return [luaIde#cc.Scene]   An autoreleased Scene object with physics.
	@js NA
]]
function cc.Scene:createWithPhysics() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/platform/CCGLView.h
]]
cc.GLView = {}
--[[
	Set the frame size of EGL view.
	@param width The width of the fram size.
	@param height The height of the fram size.
]]
function cc.GLView:setFrameSize(float_width,float_height) end
--[[
	Get the opengl view port rectangle.
	@return [luaIde#cc.Rect]   Return the opengl view port rectangle.
]]
function cc.GLView:getViewPortRect() end
--[[
	@return bool
]]
function cc.GLView:setContentScaleFactor(float_scaleFactor) end
--[[
	Only works on ios platform. Get Content Scale of the Factor.
	@return float
]]
function cc.GLView:getContentScaleFactor() end
--[[
	Open or close IME keyboard , subclass must implement this method.
	@param open Open or close IME keyboard.
]]
function cc.GLView:setIMEKeyboardState(bool_open) end
--[[
	@return [luaIde#VRIRenderer]
]]
function cc.GLView:getVR() end
--[[
	Set Scissor rectangle with points.
	@param x Set the points of x.
	@param y Set the points of y.
	@param w Set the width of  the view port
	@param h Set the Height of the view port.
]]
function cc.GLView:setScissorInPoints(float_x,float_y,float_w,float_h) end
--[[
	Get the view name.
	@return std_string   The view name.
]]
function cc.GLView:getViewName() end
--[[
	Get whether opengl render system is ready, subclass must implement this method.
	@return bool
]]
function cc.GLView:isOpenGLReady() end
function cc.GLView:setCursorVisible(bool_isVisible) end
--[[
	Get the frame size of EGL view.
	In general, it returns the screen size since the EGL view is a fullscreen view.
	@return [luaIde#cc.Size]   The frame size of EGL view.
]]
function cc.GLView:getFrameSize() end
--[[
	Get scale factor of the vertical direction.
	@return float   Scale factor of the vertical direction.
]]
function cc.GLView:getScaleY() end
--[[
	Get scale factor of the horizontal direction.
	@return float   Scale factor of the horizontal direction.
]]
function cc.GLView:getScaleX() end
--[[
	Get the visible origin point of opengl viewport.
	@return [luaIde#cc.Vec2]   The visible origin point of opengl viewport.
]]
function cc.GLView:getVisibleOrigin() end
function cc.GLView:setFrameZoomFactor(float_zoomFactor) end
--[[
	Get zoom factor for frame. This methods are for
	debugging big resolution (e.g.new ipad) app on desktop.
	@return float   The zoom factor for frame.
]]
function cc.GLView:getFrameZoomFactor() end
--[[
	Get design resolution size.
	Default resolution size is the same as 'getFrameSize'.
	@return [luaIde#cc.Size]   The design resolution size.
]]
function cc.GLView:getDesignResolutionSize() end
--[[
	When the window is closed, it will return false if the platforms is Ios or Android.
	If the platforms is windows or Mac,it will return true.
	@return bool   In ios and android it will return false,if in windows or Mac it will return true.
]]
function cc.GLView:windowShouldClose() end
--[[
	Exchanges the front and back buffers, subclass must implement this method.
]]
function cc.GLView:swapBuffers() end
--[[
	Set the design resolution size.
	@param width Design resolution width.
	@param height Design resolution height.
	@param resolutionPolicy The resolution policy desired, you may choose:
	[1] EXACT_FIT Fill screen by stretch-to-fit: if the design resolution ratio of width to height is different from the screen resolution ratio, your game view will be stretched.
	[2] NO_BORDER Full screen without black border: if the design resolution ratio of width to height is different from the screen resolution ratio, two areas of your game view will be cut.
	[3] SHOW_ALL  Full screen with black border: if the design resolution ratio of width to height is different from the screen resolution ratio, two black borders will be shown.
]]
function cc.GLView:setDesignResolutionSize(float_width,float_height,ResolutionPolicy_resolutionPolicy) end
--[[
	Returns the current Resolution policy.
	@return [luaIde#ResolutionPolicy]   The current Resolution policy.
]]
function cc.GLView:getResolutionPolicy() end
--[[
	Returns whether or not the view is in Retina Display mode.
	@return bool   Returns whether or not the view is in Retina Display mode.
]]
function cc.GLView:isRetinaDisplay() end
--[[
	Renders a Scene with a Renderer
	This method is called directly by the Director
]]
function cc.GLView:renderScene(Scene_scene,Renderer_renderer) end
--[[
	Sets a VR renderer.
	if `vrrenderer` is `nullptr` VR will be disabled
]]
function cc.GLView:setVR(VRIRenderer_vrrenderer) end
--[[
	Set opengl view port rectangle with points.
	@param x Set the points of x.
	@param y Set the points of y.
	@param w Set the width of  the view port
	@param h Set the Height of the view port.
]]
function cc.GLView:setViewPortInPoints(float_x,float_y,float_w,float_h) end
--[[
	Get the current scissor rectangle.
	@return [luaIde#cc.Rect]   The current scissor rectangle.
]]
function cc.GLView:getScissorRect() end
--[[
	Get retina factor.
	@return int   The retina factor.
]]
function cc.GLView:getRetinaFactor() end
--[[
	Set the view name.
	@param viewname A string will be set to the view as name.
]]
function cc.GLView:setViewName(const_std_string_viewname) end
--[[
	Get the visible rectangle of opengl viewport.
	@return [luaIde#cc.Rect]   The visible rectangle of opengl viewport.
]]
function cc.GLView:getVisibleRect() end
--[[
	Get the visible area size of opengl viewport.
	@return [luaIde#cc.Size]   The visible area size of opengl viewport.
]]
function cc.GLView:getVisibleSize() end
--[[
	Get whether GL_SCISSOR_TEST is enable.
	@return bool   Whether GL_SCISSOR_TEST is enable.
]]
function cc.GLView:isScissorEnabled() end
--[[
	Polls the events.
]]
function cc.GLView:pollEvents() end
--[[
	Static method and member so that we can modify it on all platforms before create OpenGL context.
	@param glContextAttrs The OpenGL context attrs.
]]
function cc.GLView:setGLContextAttrs(GLContextAttrs_glContextAttrs) end
--[[
	Return the OpenGL context attrs.
	@return [luaIde#GLContextAttrs]   Return the OpenGL context attrs.
]]
function cc.GLView:getGLContextAttrs() end

cc.Director = {}
--[[
	Pauses the running scene.
	The running scene will be _drawed_ but all scheduled timers will be paused.
	While paused, the draw rate will be 4 FPS to reduce CPU consumption.
]]
function cc.Director:pause() end
--[[
	Clones a projection matrix and put it to the top of projection matrix stack.
	@param index The index of projection matrix stack.
	@js NA
]]
function cc.Director:pushProjectionMatrix(size_t_index) end
--[[
	Pops the top matrix of the projection matrix stack.
	@param index The index of projection matrix stack.
	@js NA
]]
function cc.Director:popProjectionMatrix(size_t_index) end
--[[
	Sets the EventDispatcher associated with this director.
	@since v3.0
	@js NA
]]
function cc.Director:setEventDispatcher(EventDispatcher_dispatcher) end
--[[
	Adds an identity matrix to the top of projection matrix stack.
	@param index The index of projection matrix stack.
	@js NA
]]
function cc.Director:loadProjectionIdentityMatrix(size_t_index) end
--[[
	The size in pixels of the surface. It could be different than the screen size.
	High-res devices might have a higher surface size than the screen size.
	Only available when compiled using SDK >= 4.0.
	@since v0.99.4
]]
function cc.Director:setContentScaleFactor(float_scaleFactor) end
--[[
	Gets content scale factor.
	@see Director::setContentScaleFactor()
	@return float
]]
function cc.Director:getContentScaleFactor() end
--[[
	Returns the size of the OpenGL view in pixels.
	@return [luaIde#cc.Size]
]]
function cc.Director:getWinSizeInPixels() end
--[[
	Gets delta time since last tick to main loop.
	@return float
]]
function cc.Director:getDeltaTime() end
--[[
	Sets the OpenGL default values.
	It will enable alpha blending, disable depth test.
	@js NA
]]
function cc.Director:setGLDefaultValues() end
--[[
	Sets the ActionManager associated with this director.
	@since v2.0
]]
function cc.Director:setActionManager(ActionManager_actionManager) end
--[[
	Enables/disables OpenGL alpha blending.
]]
function cc.Director:setAlphaBlending(bool_on) end
--[[
	Pops out all scenes from the stack until the root scene in the queue.
	This scene will replace the running one.
	Internally it will call `popToSceneStackLevel(1)`.
]]
function cc.Director:popToRootScene() end
--[[
	Adds a matrix to the top of specified type of matrix stack.
	@param type Matrix type.
	@param mat The matrix that to be added.
	@js NA
]]
function cc.Director:loadMatrix(MATRIX_STACK_TYPE_type,const_Mat4_mat) end
--[[
	This object will be visited after the main scene is visited.
	This object MUST implement the "visit" function.
	Useful to hook a notification object, like Notifications (http://github.com/manucorporat/CCNotifications)
	@since v0.99.5
	@return [luaIde#cc.Node]
]]
function cc.Director:getNotificationNode() end
--[[
	Returns the size of the OpenGL view in points.
	@return [luaIde#cc.Size]
]]
function cc.Director:getWinSize() end
--[[
	Gets singleton of TextureCache.
	@js NA
	@return [luaIde#cc.TextureCache]
]]
function cc.Director:getTextureCache() end
--[[
	Whether or not the replaced scene will receive the cleanup message.
	If the new scene is pushed, then the old scene won't receive the "cleanup" message.
	If the new scene replaces the old one, the it will receive the "cleanup" message.
	@since v0.99.0
	@return bool
]]
function cc.Director:isSendCleanupToScene() end
--[[
	Returns visible origin coordinate of the OpenGL view in points.
	@return [luaIde#cc.Vec2]
]]
function cc.Director:getVisibleOrigin() end
function cc.Director:mainLoop() end
--[[
	Invoke main loop with delta time. Then `calculateDeltaTime` can just use the delta time directly.
	The delta time paseed may include vsync time. See issue #17806
	@since 3.16
]]
function cc.Director:mainLoop(float_dt) end
--[[
	Enables/disables OpenGL depth test.
]]
function cc.Director:setDepthTest(bool_on) end
--[[
	Gets Frame Rate.
	@js NA
	@return float
]]
function cc.Director:getFrameRate() end
--[[
	Get seconds per frame.
	@return float
]]
function cc.Director:getSecondsPerFrame() end
--[[
	Clear all types of matrix stack, and add identity matrix to these matrix stacks.
	@js NA
]]
function cc.Director:resetMatrixStack() end
--[[
	Converts an OpenGL coordinate to a screen coordinate.
	Useful to convert node points to window points for calls such as glScissor.
	@return [luaIde#cc.Vec2]
]]
function cc.Director:convertToUI(const_Vec2_point) end
--[[
	Clones a specified type matrix and put it to the top of specified type of matrix stack.
	@js NA
]]
function cc.Director:pushMatrix(MATRIX_STACK_TYPE_type) end
--[[
	Sets the default values based on the Configuration info.
]]
function cc.Director:setDefaultValues() end
--[[
	@return bool
]]
function cc.Director:init() end
--[[
	Sets the Scheduler associated with this director.
	@since v2.0
]]
function cc.Director:setScheduler(Scheduler_scheduler) end
--[[
	Multiplies a matrix to the top of projection matrix stack.
	@param mat The matrix that to be multiplied.
	@param index The index of projection matrix stack.
	@js NA
]]
function cc.Director:multiplyProjectionMatrix(const_Mat4_mat,size_t_index) end
--[[
	Gets the top matrix of specified type of matrix stack.
	@js NA
	@return [luaIde#Mat4]
]]
function cc.Director:getMatrix(MATRIX_STACK_TYPE_type) end
--[[
	returns whether or not the Director is in a valid state
	@return bool
]]
function cc.Director:isValid() end
--[[
	The main loop is triggered again.
	Call this function only if [stopAnimation] was called earlier.
	@warning Don't call this function to start the main loop. To run the main loop call runWithScene.
]]
function cc.Director:startAnimation() end
function cc.Director:startAnimation(SetIntervalReason_reason) end
--[[
	Get the GLView.
	@lua NA
	@return [luaIde#cc.GLView]
]]
function cc.Director:getOpenGLView() end
--[[
	Gets current running Scene. Director can only run one Scene at a time.
	@return [luaIde#cc.Scene]
]]
function cc.Director:getRunningScene() end
--[[
	Sets the glViewport
]]
function cc.Director:setViewport() end
--[[
	Stops the animation. Nothing will be drawn. The main loop won't be triggered anymore.
	If you don't want to pause your animation call [pause] instead.
]]
function cc.Director:stopAnimation() end
--[[
	Pops out all scenes from the stack until it reaches `level`.
	If level is 0, it will end the director.
	If level is 1, it will pop all scenes until it reaches to root scene.
	If level is <= than the current stack level, it won't do anything.
]]
function cc.Director:popToSceneStackLevel(int_level) end
--[[
	Resumes the paused scene.
	The scheduled timers will be activated again.
	The "delta time" will be 0 (as if the game wasn't paused).
]]
function cc.Director:resume() end
--[[
	Whether or not `_nextDeltaTimeZero` is set to 0.
	@return bool
]]
function cc.Director:isNextDeltaTimeZero() end
--[[
	Sets clear values for the color buffers,
	value range of each element is [0.0, 1.0].
	@js NA
]]
function cc.Director:setClearColor(const_Color4F_clearColor) end
--[[
	Sets the GLView.
	@lua NA
]]
function cc.Director:setOpenGLView(GLView_openGLView) end
--[[
	Converts a screen coordinate to an OpenGL coordinate.
	Useful to convert (multi) touch coordinates to the current layout (portrait or landscape).
	@return [luaIde#cc.Vec2]
]]
function cc.Director:convertToGL(const_Vec2_point) end
--[[
	Removes all cocos2d cached data.
	It will purge the TextureCache, SpriteFrameCache, LabelBMFont cache
	@since v0.99.3
]]
function cc.Director:purgeCachedData() end
--[[
	How many frames were called since the director started
	@return int
]]
function cc.Director:getTotalFrames() end
--[[
	Enters the Director's main loop with the given Scene.
	Call it to run only your FIRST scene.
	Don't call it if there is already a running scene.
	It will call pushScene: and then it will call startAnimation
	@js NA
]]
function cc.Director:runWithScene(Scene_scene) end
--[[
	Sets the notification node.
	@see Director::getNotificationNode()
]]
function cc.Director:setNotificationNode(Node_node) end
--[[
	Draw the scene.
	This method is called every frame. Don't call it manually.
]]
function cc.Director:drawScene() end
--[[
	Restart the director.
	@js NA
]]
function cc.Director:restart() end
--[[
	Pops out a scene from the stack.
	This scene will replace the running one.
	The running scene will be deleted. If there are no more scenes in the stack the execution is terminated.
	ONLY call it if there is a running scene.
]]
function cc.Director:popScene() end
--[[
	Adds an identity matrix to the top of specified type of matrix stack.
	@js NA
]]
function cc.Director:loadIdentityMatrix(MATRIX_STACK_TYPE_type) end
--[[
	Whether or not displaying the FPS on the bottom-left corner of the screen.
	@return bool
]]
function cc.Director:isDisplayStats() end
--[[
	Sets OpenGL projection.
]]
function cc.Director:setProjection(Projection_projection) end
--[[
	Returns the Console associated with this director.
	@since v3.0
	@js NA
	@return [luaIde#Console]
]]
function cc.Director:getConsole() end
--[[
	Multiplies a matrix to the top of specified type of matrix stack.
	@param type Matrix type.
	@param mat The matrix that to be multiplied.
	@js NA
]]
function cc.Director:multiplyMatrix(MATRIX_STACK_TYPE_type,const_Mat4_mat) end
--[[
	Gets the distance between camera and near clipping frame.
	It is correct for default camera that near clipping frame is same as the screen.
	@return float
]]
function cc.Director:getZEye() end
--[[
	Sets the delta time between current frame and next frame is 0.
	This value will be used in Schedule, and will affect all functions that are using frame delta time, such as Actions.
	This value will take effect only one time.
]]
function cc.Director:setNextDeltaTimeZero(bool_nextDeltaTimeZero) end
--[[
	Pops the top matrix of the specified type of matrix stack.
	@js NA
]]
function cc.Director:popMatrix(MATRIX_STACK_TYPE_type) end
--[[
	Returns visible size of the OpenGL view in points.
	The value is equal to `Director::getWinSize()` if don't invoke `GLView::setDesignResolutionSize()`.
	@return [luaIde#cc.Size]
]]
function cc.Director:getVisibleSize() end
--[[
	Adds a matrix to the top of projection matrix stack.
	@param mat The matrix that to be added.
	@param index The index of projection matrix stack.
	@js NA
]]
function cc.Director:loadProjectionMatrix(const_Mat4_mat,size_t_index) end
--[[
	Init the projection matrix stack.
	@param stackCount The size of projection matrix stack.
	@js NA
]]
function cc.Director:initProjectionMatrixStack(size_t_stackCount) end
--[[
	Gets the Scheduler associated with this director.
	@since v2.0
	@return [luaIde#cc.Scheduler]
]]
function cc.Director:getScheduler() end
--[[
	Suspends the execution of the running scene, pushing it on the stack of suspended scenes.
	The new scene will be executed.
	Try to avoid big stacks of pushed scenes to reduce memory allocation.
	ONLY call it if there is a running scene.
]]
function cc.Director:pushScene(Scene_scene) end
--[[
	Gets the FPS value.
	@return float
]]
function cc.Director:getAnimationInterval() end
--[[
	Whether or not the Director is paused.
	@return bool
]]
function cc.Director:isPaused() end
--[[
	Display the FPS on the bottom-left corner of the screen.
]]
function cc.Director:setDisplayStats(bool_displayStats) end
--[[
	Gets the EventDispatcher associated with this director.
	@since v3.0
	@js NA
	@return [luaIde#cc.EventDispatcher]
]]
function cc.Director:getEventDispatcher() end
--[[
	Replaces the running scene with a new one. The running scene is terminated.
	ONLY call it if there is a running scene.
	@js NA
]]
function cc.Director:replaceScene(Scene_scene) end
--[[
	Sets the FPS value. FPS = 1/interval.
]]
function cc.Director:setAnimationInterval(float_interval) end
function cc.Director:setAnimationInterval(float_interval,SetIntervalReason_reason) end
--[[
	Gets the ActionManager associated with this director.
	@since v2.0
	@return [luaIde#cc.ActionManager]
]]
function cc.Director:getActionManager() end
--[[
	Returns a shared instance of the director.
	@js _getInstance
	@return [luaIde#cc.Director]
]]
function cc.Director:getInstance() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCScheduler.h
]]
cc.Timer = {}
function cc.Timer:setupTimerWithInterval(float_seconds,unsigned_int_repeat,float_delay) end
--[[
	triggers the timer
]]
function cc.Timer:update(float_dt) end
--[[
	@return bool
]]
function cc.Timer:isAborted() end
--[[
	@return bool
]]
function cc.Timer:isExhausted() end
function cc.Timer:trigger(float_dt) end
function cc.Timer:cancel() end
function cc.Timer:setAborted() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCScheduler.h
]]
cc.Scheduler = {}
--[[
	Modifies the time of all scheduled callbacks.
	You can use this property to create a 'slow motion' or 'fast forward' effect.
	Default is 1.0. To create a 'slow motion' effect, use values below 1.0.
	To create a 'fast forward' effect, use values higher than 1.0.
	@since v0.8
	@warning It will affect EVERY scheduled selector / action.
]]
function cc.Scheduler:setTimeScale(float_timeScale) end
--[[
	Remove all pending functions queued to be performed with Scheduler::performFunctionInCocosThread
	Functions unscheduled in this manner will not be executed
	This function is thread safe
	@since v3.14
	@js NA
]]
function cc.Scheduler:removeAllFunctionsToBePerformedInCocosThread() end
--[[
	Gets the time scale of schedule callbacks.
	@see Scheduler::setTimeScale()
	@return float
]]
function cc.Scheduler:getTimeScale() end

cc.AsyncTaskPool = {}
--[[
	Enqueue a asynchronous task.
	@param type task type is io task, network task or others, each type of task has a thread to deal with it.
	@param callback callback when the task is finished. The callback is called in the main thread instead of task thread.
	@param callbackParam parameter used by the callback.
	@param task: task can be lambda function to be performed off thread.
	@lua NA
]]
function cc.AsyncTaskPool:enqueue(TaskType_type,TaskCallBack_callback,void_callbackParam) end
--[[
	Enqueue a asynchronous task.
	@param type task type is io task, network task or others, each type of task has a thread to deal with it.
	@param task: task can be lambda function to be performed off thread.
	@lua NA
]]
function cc.AsyncTaskPool:enqueue(AsyncTaskPool_TaskType_type) end
function cc.AsyncTaskPool:enqueue(TaskCallBack_callback,void_callbackParam) end
--[[
	Stop tasks.
	@param type Task type you want to stop.
]]
function cc.AsyncTaskPool:stopTasks(TaskType_type) end
--[[
	Destroys the async task pool.
]]
function cc.AsyncTaskPool:destroyInstance() end
--[[
	Returns the shared instance of the async task pool.
	@return [luaIde#cc.AsyncTaskPool]
]]
function cc.AsyncTaskPool:getInstance() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAction.h
]]
cc.Action = {}
--[[
	Called before the action start. It will also set the target.
	@param target A certain target.
]]
function cc.Action:startWithTarget(Node_target) end
--[[
	Set the original target, since target can be nil.
	Is the target that were used to run the action. Unless you are doing something complex, like ActionManager, you should NOT call this method.
	The target is 'assigned', it is not 'retained'.
	@since v0.8.2
	@param originalTarget Is 'assigned', it is not 'retained'.
]]
function cc.Action:setOriginalTarget(Node_originalTarget) end
--[[
	Returns a clone of action.
	@return [luaIde#cc.Action]   A clone action.
]]
function cc.Action:clone() end
--[[
	Return a original Target.
	@return [luaIde#cc.Node]   A original Target.
]]
function cc.Action:getOriginalTarget() end
--[[
	Called after the action has finished. It will set the 'target' to nil.
	IMPORTANT: You should never call "Action::stop()" manually. Instead, use: "target->stopAction(action);".
]]
function cc.Action:stop() end
--[[
	Called once per frame. time a value between 0 and 1.
	For example:
	- 0 Means that the action just started.
	- 0.5 Means that the action is in the middle.
	- 1 Means that the action is over.
	@param time A value between 0 and 1.
]]
function cc.Action:update(float_time) end
--[[
	Return certain target.
	@return [luaIde#cc.Node]   A certain target.
]]
function cc.Action:getTarget() end
--[[
	Returns a flag field that is used to group the actions easily.
	@return int   A tag.
]]
function cc.Action:getFlags() end
--[[
	Called every frame with it's delta time, dt in seconds. DON'T override unless you know what you are doing.
	@param dt In seconds.
]]
function cc.Action:step(float_dt) end
--[[
	Changes the tag that is used to identify the action easily.
	@param tag Used to identify the action easily.
]]
function cc.Action:setTag(int_tag) end
--[[
	Changes the flag field that is used to group the actions easily.
	@param flags Used to group the actions easily.
]]
function cc.Action:setFlags(unsigned_int_flags) end
--[[
	Returns a tag that is used to identify the action easily.
	@return int   A tag.
]]
function cc.Action:getTag() end
--[[
	The action will modify the target properties.
	@param target A certain target.
]]
function cc.Action:setTarget(Node_target) end
--[[
	Return true if the action has finished.
	@return bool   Is true if the action has finished.
]]
function cc.Action:isDone() end
--[[
	Returns a new action that performs the exact reverse of the action.
	@return [luaIde#cc.Action]   A new action that performs the exact reverse of the action.
	@js NA
]]
function cc.Action:reverse() end

--[[
	@SuperType[luaIde#cc.Action]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAction.h
]]
cc.FiniteTimeAction = {}
--[[
	Set duration in seconds of the action.
	@param duration In seconds of the action.
]]
function cc.FiniteTimeAction:setDuration(float_duration) end
--[[
	Get duration in seconds of the action.
	@return float   The duration in seconds of the action.
]]
function cc.FiniteTimeAction:getDuration() end

--[[
	@SuperType[luaIde#cc.Action]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAction.h
]]
cc.Speed = {}
--[[
	Replace the interior action.
	@param action The new action, it will replace the running action.
]]
function cc.Speed:setInnerAction(ActionInterval_action) end
--[[
	Return the speed.
	@return float   The action speed.
]]
function cc.Speed:getSpeed() end
--[[
	Alter the speed of the inner function in runtime.
	@param speed Alter the speed of the inner function in runtime.
]]
function cc.Speed:setSpeed(float_speed) end
--[[
	Initializes the action.
	@return bool
]]
function cc.Speed:initWithAction(ActionInterval_action,float_speed) end
--[[
	Return the interior action.
	@return [luaIde#cc.ActionInterval]   The interior action.
]]
function cc.Speed:getInnerAction() end
--[[
	Create the action and set the speed.
	@param action An action.
	@param speed The action speed.
	@return [luaIde#cc.Speed]
]]
function cc.Speed:create(ActionInterval_action,float_speed) end

--[[
	@SuperType[luaIde#cc.Action]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAction.h
]]
cc.Follow = {}
--[[
	Alter behavior - turn on/off boundary.
	@param value Turn on/off boundary.
]]
function cc.Follow:setBoundarySet(bool_value) end
--[[
	Initializes the action with a set boundary or with no boundary.
	@param followedNode  The node to be followed.
	@param rect  The boundary. If \p rect is equal to Rect::ZERO, it'll work
	with no boundary.
	@return bool
]]
function cc.Follow:initWithTarget(Node_followedNode,const_Rect_rect) end
--[[
	Initializes the action with a set boundary or with no boundary with offsets.
	@param followedNode  The node to be followed.
	@param rect  The boundary. If \p rect is equal to Rect::ZERO, it'll work
	with no boundary.
	@param xOffset The horizontal offset from the center of the screen from which the
	node  is to be followed.It can be positive,negative or zero.If
	set to zero the node will be horizontally centered followed.
	@param yOffset The vertical offset from the center of the screen from which the
	node is to be followed.It can be positive,negative or zero.
	If set to zero the node will be vertically centered followed.
	If both xOffset and yOffset are set to zero,then the node will be horizontally and vertically centered followed.
	@return bool
]]
function cc.Follow:initWithTargetAndOffset(Node_followedNode,float_xOffset,float_yOffset,const_Rect_rect) end
--[[
	Return boundarySet.
	@return bool   Return boundarySet.
]]
function cc.Follow:isBoundarySet() end
--[[
	Creates the action with a set boundary or with no boundary.
	@param followedNode  The node to be followed.
	@param rect  The boundary. If \p rect is equal to Rect::ZERO, it'll work
	with no boundary.
	@return [luaIde#cc.Follow]
]]
function cc.Follow:create(Node_followedNode,const_Rect_rect) end
--[[
	Creates the action with a set boundary or with no boundary with offsets.
	@param followedNode  The node to be followed.
	@param rect  The boundary. If \p rect is equal to Rect::ZERO, it'll work
	with no boundary.
	@param xOffset The horizontal offset from the center of the screen from which the
	node  is to be followed.It can be positive,negative or zero.If
	set to zero the node will be horizontally centered followed.
	@param yOffset The vertical offset from the center of the screen from which the
	node is to be followed.It can be positive,negative or zero.
	If set to zero the node will be vertically centered followed.
	If both xOffset and yOffset are set to zero,then the node will be horizontally and vertically centered followed.
	@return [luaIde#cc.Follow]
]]
function cc.Follow:createWithOffset(Node_followedNode,float_xOffset,float_yOffset,const_Rect_rect) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/platform/CCImage.h
]]
cc.Image = {}
--[[
	@return bool
]]
function cc.Image:hasPremultipliedAlpha() end
--[[
	@brief    Save Image data to the specified file, with specified format.
	@param    filePath        the file's absolute path, including file suffix.
	@param    isToRGB        whether the image is saved as RGB format.
	@return bool
]]
function cc.Image:saveToFile(const_std_string_filename,bool_isToRGB) end
--[[
	@return bool
]]
function cc.Image:hasAlpha() end
--[[
	@return bool
]]
function cc.Image:isCompressed() end
--[[
	@return int
]]
function cc.Image:getHeight() end
--[[
	@brief Load the image from the specified path.
	@param path   the absolute file path.
	@return bool   true if loaded correctly.
]]
function cc.Image:initWithImageFile(const_std_string_path) end
--[[
	@return int
]]
function cc.Image:getWidth() end
--[[
	@return int
]]
function cc.Image:getBitPerPixel() end
--[[
	@return [luaIde#Format]
]]
function cc.Image:getFileType() end
--[[
	@return std_string
]]
function cc.Image:getFilePath() end
--[[
	@return int
]]
function cc.Image:getNumberOfMipmaps() end
--[[
	@return [luaIde#Texture2D_PixelFormat]
]]
function cc.Image:getRenderFormat() end
--[[
	treats (or not) PVR files as if they have alpha premultiplied.
	Since it is impossible to know at runtime if the PVR images have the alpha channel premultiplied, it is
	possible load them as if they have (or not) the alpha channel premultiplied.
	By default it is disabled.
]]
function cc.Image:setPVRImagesHavePremultipliedAlpha(bool_haveAlphaPremultiplied) end
--[[
	Enables or disables premultiplied alpha for PNG files.
	@param enabled (default: true)
]]
function cc.Image:setPNGPremultipliedAlphaEnabled(bool_enabled) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCGLProgramState.h
]]
cc.GLProgramState = {}
--[[
	Get the flag of vertex attribs used by OR operation
	@return [luaIde#uint32_t]
]]
function cc.GLProgramState:getVertexAttribsFlags() end
function cc.GLProgramState:setUniformVec4(const_std_string_uniformName,const_Vec4_value) end
function cc.GLProgramState:setUniformVec4(GLint_uniformLocation,const_Vec4_value) end
--[[
	Applies the specified custom auto-binding.
	@param uniformName Name of the shader uniform.
	@param autoBinding Name of the auto binding.
]]
function cc.GLProgramState:applyAutoBinding(const_std_string_uniformName,const_std_string_autoBinding) end
function cc.GLProgramState:setUniformVec2(const_std_string_uniformName,const_Vec2_value) end
function cc.GLProgramState:setUniformVec2(GLint_uniformLocation,const_Vec2_value) end
function cc.GLProgramState:setUniformVec3(const_std_string_uniformName,const_Vec3_value) end
function cc.GLProgramState:setUniformVec3(GLint_uniformLocation,const_Vec3_value) end
--[[
	Apply GLProgram, attributes and uniforms.
	@param modelView The applied modelView matrix to shader.
]]
function cc.GLProgramState:apply(const_Mat4_modelView) end
--[[
	Returns the Node bound to the GLProgramState
	@return [luaIde#cc.Node]
]]
function cc.GLProgramState:getNodeBinding() end
function cc.GLProgramState:setUniformVec4v(const_std_string_uniformName,ssize_t_size,const_Vec4_pointer) end
function cc.GLProgramState:setUniformVec4v(GLint_uniformLocation,ssize_t_size,const_Vec4_pointer) end
--[[
	Apply GLProgram, and built in uniforms.
	@param modelView The applied modelView matrix to shader.
]]
function cc.GLProgramState:applyGLProgram(const_Mat4_modelView) end
--[[
	Sets the node that this render state is bound to.
	The specified node is used to apply auto-bindings for the render state.
	This is typically set to the node of the model that a material is
	applied to.
	@param node The node to use for applying auto-bindings.
]]
function cc.GLProgramState:setNodeBinding(Node_node) end
--[[
	@{
	Setting user defined uniforms by uniform string name in the shader.
]]
function cc.GLProgramState:setUniformInt(const_std_string_uniformName,int_value) end
--[[
	@{
	Setting user defined uniforms by uniform location in the shader.
]]
function cc.GLProgramState:setUniformInt(GLint_uniformLocation,int_value) end
--[[
	Sets a uniform auto-binding.
	This method parses the passed in autoBinding string and attempts to convert it
	to an enumeration value. If it matches to one of the predefined strings, it will create a
	callback to get the correct value at runtime.
	@param uniformName The name of the material parameter to store an auto-binding for.
	@param autoBinding A string matching one of the built-in AutoBinding enum constants.
]]
function cc.GLProgramState:setParameterAutoBinding(const_std_string_uniformName,const_std_string_autoBinding) end
function cc.GLProgramState:setUniformVec2v(const_std_string_uniformName,ssize_t_size,const_Vec2_pointer) end
function cc.GLProgramState:setUniformVec2v(GLint_uniformLocation,ssize_t_size,const_Vec2_pointer) end
--[[
	Get the number of user defined uniform count
	@return ssize_t
]]
function cc.GLProgramState:getUniformCount() end
--[[
	Apply attributes.
	@param applyAttribFlags Call GL::enableVertexAttribs(_vertexAttribsFlags) or not.
]]
function cc.GLProgramState:applyAttributes(bool_applyAttribFlags) end
--[[
	Returns a new copy of the GLProgramState. The GLProgram is reused
	@return [luaIde#cc.GLProgramState]
]]
function cc.GLProgramState:clone() end
--[[
	@{
	Setter and Getter of the owner GLProgram binded in this program state.
]]
function cc.GLProgramState:setGLProgram(GLProgram_glprogram) end
function cc.GLProgramState:setUniformFloatv(const_std_string_uniformName,ssize_t_size,const_float_pointer) end
function cc.GLProgramState:setUniformFloatv(GLint_uniformLocation,ssize_t_size,const_float_pointer) end
--[[
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgramState:getGLProgram() end
function cc.GLProgramState:setUniformTexture(const_std_string_uniformName,Texture2D_texture) end
--[[
	@deprecated, please use setUniformTexture(const std::string& uniformName, Texture2D *texture) instead,
	Passing a `textureId` may trigger texture lost issue (https://github.com/cocos2d/cocos2d-x/issues/16871).
]]
function cc.GLProgramState:setUniformTexture(const_std_string_uniformName,GLuint_textureId) end
function cc.GLProgramState:setUniformTexture(GLint_uniformLocation,Texture2D_texture) end
--[[
	@deprecated, please use setUniformTexture(GLint uniformLocation, Texture2D *texture) instead,
	Passing a `textureId` may trigger texture lost issue (https://github.com/cocos2d/cocos2d-x/issues/16871).
]]
function cc.GLProgramState:setUniformTexture(GLint_uniformLocation,GLuint_textureId) end
--[[
	Apply user defined uniforms.
]]
function cc.GLProgramState:applyUniforms() end
function cc.GLProgramState:setUniformFloat(const_std_string_uniformName,float_value) end
function cc.GLProgramState:setUniformFloat(GLint_uniformLocation,float_value) end
function cc.GLProgramState:setUniformMat4(const_std_string_uniformName,const_Mat4_value) end
function cc.GLProgramState:setUniformMat4(GLint_uniformLocation,const_Mat4_value) end
function cc.GLProgramState:setUniformVec3v(const_std_string_uniformName,ssize_t_size,const_Vec3_pointer) end
function cc.GLProgramState:setUniformVec3v(GLint_uniformLocation,ssize_t_size,const_Vec3_pointer) end
--[[
	Get the number of vertex attributes
	@return ssize_t
]]
function cc.GLProgramState:getVertexAttribCount() end
--[[
	returns a new instance of GLProgramState for a given GLProgram
	@return [luaIde#cc.GLProgramState]
]]
function cc.GLProgramState:create(GLProgram_glprogram) end
--[[
	gets-or-creates an instance of GLProgramState for a given GLProgramName
	@return [luaIde#cc.GLProgramState]
]]
function cc.GLProgramState:getOrCreateWithGLProgramName(const_std_string_glProgramName) end
--[[
	gets-or-creates an instance of GLProgramState for the given GLProgramName & texture
	@return [luaIde#cc.GLProgramState]
]]
function cc.GLProgramState:getOrCreateWithGLProgramName(const_std_string_glProgramName,Texture2D_texture) end
--[[
	gets-or-creates an instance of GLProgramState for a given GLProgram
	@return [luaIde#cc.GLProgramState]
]]
function cc.GLProgramState:getOrCreateWithGLProgram(GLProgram_glprogram) end
--[[
	gets-or-creates an instance of GLProgramState for given shaders
	@return [luaIde#cc.GLProgramState]
]]
function cc.GLProgramState:getOrCreateWithShaders(const_std_string_vertexShader,const_std_string_fragShader,const_std_string_compileTimeDefines) end

cc.PolygonInfo = {}
--[[
	@return std_string
]]
function cc.PolygonInfo:getFilename() end
--[[
	get sum of all triangle area size
	@return float   sum of all triangle area size
]]
function cc.PolygonInfo:getArea() end
--[[
	@return [luaIde#cc.Rect]
]]
function cc.PolygonInfo:getRect() end
function cc.PolygonInfo:setFilename(const_std_string_filename) end
--[[
	set the data to be a pointer to a number of Quads
	the member verts will not be released when this PolygonInfo destructs
	as the verts memory are managed by other objects
	@param quad  a pointer to the V3F_C4B_T2F_Quad quads
]]
function cc.PolygonInfo:setQuads(V3F_C4B_T2F_Quad_quads,int_numberOfQuads) end
--[[
	get vertex count
	@return int   number of vertices
]]
function cc.PolygonInfo:getVertCount() end
--[[
	get triangles count
	@return int   number of triangles
]]
function cc.PolygonInfo:getTrianglesCount() end
--[[
	set the data to be a pointer to a quad
	the member verts will not be released when this PolygonInfo destructs
	as the verts memory are managed by other objects
	@param quad  a pointer to the V3F_C4B_T2F_Quad object
]]
function cc.PolygonInfo:setQuad(V3F_C4B_T2F_Quad_quad) end
--[[
	set the data to be a pointer to a triangles
	the member verts will not be released when this PolygonInfo destructs
	as the verts memory are managed by other objects
	@param triangles  a pointer to the TrianglesCommand::Triangles object
]]
function cc.PolygonInfo:setTriangles(const_TrianglesCommand_Triangles_triangles) end
function cc.PolygonInfo:setRect(const_Rect_rect) end

cc.AutoPolygon = {}
function cc.AutoPolygon:new() end 


--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCSpriteFrame.h
]]
cc.SpriteFrame = {}
--[[
	Set anchor point of the frame.
	@param anchorPoint The anchor point of the sprite frame.
]]
function cc.SpriteFrame:setAnchorPoint(const_Vec2_anchorPoint) end
--[[
	Set texture of the frame, the texture is retained.
	@param pobTexture The texture of the sprite frame.
]]
function cc.SpriteFrame:setTexture(Texture2D_pobTexture) end
--[[
	Get texture of the frame.
	@return [luaIde#cc.Texture2D]   The texture of the sprite frame.
]]
function cc.SpriteFrame:getTexture() end
--[[
	Set offset of the frame.
	@param offsetInPixels The offset of the sprite frame, in pixels.
]]
function cc.SpriteFrame:setOffsetInPixels(const_Vec2_offsetInPixels) end
--[[
	Get original size of the trimmed image.
	@return [luaIde#cc.Size]   The original size of the trimmed image, in pixels.
]]
function cc.SpriteFrame:getOriginalSizeInPixels() end
--[[
	Set original size of the trimmed image.
	@param sizeInPixels The original size of the trimmed image.
]]
function cc.SpriteFrame:setOriginalSize(const_Size_sizeInPixels) end
--[[
	Get center rect of the frame.
	Useful to create 9-slice sprites
	@return [luaIde#cc.Rect]   The center rect of the sprite frame in points
]]
function cc.SpriteFrame:getCenterRect() end
--[[
	Set rect of the sprite frame.
	@param rectInPixels The rect of the sprite frame, in pixels.
]]
function cc.SpriteFrame:setRectInPixels(const_Rect_rectInPixels) end
--[[
	Get rect of the frame.
	@return [luaIde#cc.Rect]   The rect of the sprite frame.
]]
function cc.SpriteFrame:getRect() end
--[[
	setCenterRect
	Useful to implement "9 sliced" sprites.
	The sprite will be sliced into a 3 x 3 grid. The four corners of this grid are applied without
	performing any scaling. The upper- and lower-middle parts are scaled horizontally, and the left- and right-middle parts are scaled vertically.
	The center is scaled in both directions.
	Important: The scaling is based the Sprite's trimmed size.
	Limitations: Does not work when the sprite is part of `SpriteBatchNode`.
	@param centerRect the Rect in points
]]
function cc.SpriteFrame:setCenterRectInPixels(const_Rect_centerRect) end
--[[
	Set offset of the frame.
	@param offsets The offset of the sprite frame.
]]
function cc.SpriteFrame:setOffset(const_Vec2_offsets) end
--[[
	Initializes a SpriteFrame with a texture filename, rect in points;
	It is assumed that the frame was not trimmed.
	@return bool
]]
function cc.SpriteFrame:initWithTextureFilename(const_std_string_filename,const_Rect_rect) end
--[[
	Initializes a SpriteFrame with a texture, rect, rotated, offset and originalSize in pixels.
	The originalSize is the size in pixels of the frame before being trimmed.
	@since v1.1
	@return bool
]]
function cc.SpriteFrame:initWithTextureFilename(const_std_string_filename,const_Rect_rect,bool_rotated,const_Vec2_offset,const_Size_originalSize) end
--[[
	Set rect of the frame.
	@param rect The rect of the sprite.
]]
function cc.SpriteFrame:setRect(const_Rect_rect) end
--[[
	Initializes a SpriteFrame with a texture, rect in points.
	It is assumed that the frame was not trimmed.
	@return bool
]]
function cc.SpriteFrame:initWithTexture(Texture2D_pobTexture,const_Rect_rect) end
--[[
	Initializes a SpriteFrame with a texture, rect, rotated, offset and originalSize in pixels.
	The originalSize is the size in points of the frame before being trimmed.
	@return bool
]]
function cc.SpriteFrame:initWithTexture(Texture2D_pobTexture,const_Rect_rect,bool_rotated,const_Vec2_offset,const_Size_originalSize) end
--[[
	Get original size of the trimmed image.
	@return [luaIde#cc.Size]   The original size of the trimmed image.
]]
function cc.SpriteFrame:getOriginalSize() end
--[[
	@return [luaIde#cc.SpriteFrame]
]]
function cc.SpriteFrame:clone() end
--[[
	Get rect of the sprite frame.
	@return [luaIde#cc.Rect]   The rect of the sprite frame, in pixels.
]]
function cc.SpriteFrame:getRectInPixels() end
--[[
	Is the sprite frame rotated or not.
	@return bool   Is rotated if true.
]]
function cc.SpriteFrame:isRotated() end
--[[
	hasCenterRect
	@return bool   Whether or not it has a centerRect
]]
function cc.SpriteFrame:hasCenterRect() end
--[[
	Set rotated of the sprite frame.
	@param rotated Rotated the sprite frame if true.
]]
function cc.SpriteFrame:setRotated(bool_rotated) end
--[[
	Get offset of the frame.
	@return [luaIde#cc.Vec2]   The offset of the sprite frame.
]]
function cc.SpriteFrame:getOffset() end
--[[
	Set original size of the trimmed image.
	@param sizeInPixels The original size of the trimmed image, in pixels.
]]
function cc.SpriteFrame:setOriginalSizeInPixels(const_Size_sizeInPixels) end
--[[
	Get anchor point of the frame.
	@return [luaIde#cc.Vec2]   The anchor point of the sprite frame.
]]
function cc.SpriteFrame:getAnchorPoint() end
--[[
	Check if anchor point is defined for the frame.
	@return bool   true if anchor point is available.
]]
function cc.SpriteFrame:hasAnchorPoint() end
--[[
	Get offset of the frame.
	@return [luaIde#cc.Vec2]   The offset of the sprite frame, in pixels.
]]
function cc.SpriteFrame:getOffsetInPixels() end
--[[
	Create a SpriteFrame with a texture filename, rect in points.
	It is assumed that the frame was not trimmed.
	@param filename Texture file name.
	@param rect A specified rect.
	@return [luaIde#cc.SpriteFrame]   An autoreleased SpriteFrame object.
]]
function cc.SpriteFrame:create(const_std_string_filename,const_Rect_rect) end
--[[
	Create a SpriteFrame with a texture filename, rect, rotated, offset and originalSize in pixels.
	The originalSize is the size in pixels of the frame before being trimmed.
	@param filename Texture filename
	@param rect A specified rect.
	@param rotated Is rotated if true.
	@param offset A specified offset.
	@param originalSize A specified original size.
	@return [luaIde#cc.SpriteFrame]   An autoreleased SpriteFrame object.
]]
function cc.SpriteFrame:create(const_std_string_filename,const_Rect_rect,bool_rotated,const_Vec2_offset,const_Size_originalSize) end
--[[
	Create a SpriteFrame with a texture, rect in points.
	It is assumed that the frame was not trimmed.
	@param pobTexture The texture pointer.
	@param rect A specified rect.
	@return [luaIde#cc.SpriteFrame]   An autoreleased SpriteFrame object.
]]
function cc.SpriteFrame:createWithTexture(Texture2D_pobTexture,const_Rect_rect) end
--[[
	Create a SpriteFrame with a texture, rect, rotated, offset and originalSize in pixels.
	The originalSize is the size in points of the frame before being trimmed.
	@param pobTexture The texture pointer.
	@param rect A specified rect.
	@param rotated Is rotated if true.
	@param offset A specified offset.
	@param originalSize A specified original size.
	@return [luaIde#cc.SpriteFrame]   An autoreleased SpriteFrame object.
]]
function cc.SpriteFrame:createWithTexture(Texture2D_pobTexture,const_Rect_rect,bool_rotated,const_Vec2_offset,const_Size_originalSize) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAnimation.h
]]
cc.AnimationFrame = {}
--[[
	Set the SpriteFrame.
	@param frame A SpriteFrame will be used.
]]
function cc.AnimationFrame:setSpriteFrame(SpriteFrame_frame) end
--[[
	@brief Gets user information
	A AnimationFrameDisplayedNotification notification will be broadcast when the frame is displayed with this dictionary as UserInfo.
	If UserInfo is nil, then no notification will be broadcast.
	@return [luaIde#ValueMap]   A dictionary as UserInfo
]]
function cc.AnimationFrame:getUserInfo() end
--[[
	Sets the units of time the frame takes.
	@param delayUnits The units of time the frame takes.
]]
function cc.AnimationFrame:setDelayUnits(float_delayUnits) end
--[[
	@return [luaIde#cc.AnimationFrame]
]]
function cc.AnimationFrame:clone() end
--[[
	Return a SpriteFrameName to be used.
	@return [luaIde#cc.SpriteFrame]   a SpriteFrameName to be used.
]]
function cc.AnimationFrame:getSpriteFrame() end
--[[
	Gets the units of time the frame takes.
	@return float   The units of time the frame takes.
]]
function cc.AnimationFrame:getDelayUnits() end
--[[
	Sets user information.
	@param userInfo A dictionary as UserInfo.
]]
function cc.AnimationFrame:setUserInfo(const_ValueMap_userInfo) end
--[[
	initializes the animation frame with a spriteframe, number of delay units and a notification user info
	@return bool
]]
function cc.AnimationFrame:initWithSpriteFrame(SpriteFrame_spriteFrame,float_delayUnits,const_ValueMap_userInfo) end
--[[
	Creates the animation frame with a spriteframe, number of delay units and a notification user info.
	@param spriteFrame The animation frame with a spriteframe.
	@param delayUnits Number of delay units.
	@param userInfo A notification user info.
	@since 3.0
	@return [luaIde#cc.AnimationFrame]
]]
function cc.AnimationFrame:create(SpriteFrame_spriteFrame,float_delayUnits,const_ValueMap_userInfo) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAnimation.h
]]
cc.Animation = {}
--[[
	Gets the times the animation is going to loop. 0 means animation is not animated. 1, animation is executed one time, ...
	@return int   The times the animation is going to loop.
]]
function cc.Animation:getLoops() end
--[[
	Adds a SpriteFrame to a Animation.
	@param frame The frame will be added with one "delay unit".
]]
function cc.Animation:addSpriteFrame(SpriteFrame_frame) end
--[[
	Sets whether to restore the original frame when animation finishes.
	@param restoreOriginalFrame Whether to restore the original frame when animation finishes.
]]
function cc.Animation:setRestoreOriginalFrame(bool_restoreOriginalFrame) end
--[[
	@return [luaIde#cc.Animation]
]]
function cc.Animation:clone() end
--[[
	Gets the duration in seconds of the whole animation. It is the result of totalDelayUnits * delayPerUnit.
	@return float   Result of totalDelayUnits * delayPerUnit.
]]
function cc.Animation:getDuration() end
--[[
	Initializes a Animation with AnimationFrame.
	@since v2.0
	@return bool
]]
function cc.Animation:initWithAnimationFrames(float_delayPerUnit,unsigned_int_loops) end
--[[
	Initializes a Animation.
	@return bool
]]
function cc.Animation:init() end
--[[
	Sets the array of AnimationFrames.
	@param frames The array of AnimationFrames.
]]
function cc.Animation:setFrames() end
--[[
	Gets the array of AnimationFrames.
	@return [luaIde#Vector__AnimationFrame__]   The array of AnimationFrames.
]]
function cc.Animation:getFrames() end
--[[
	Sets the times the animation is going to loop. 0 means animation is not animated. 1, animation is executed one time, ...
	@param loops The times the animation is going to loop.
]]
function cc.Animation:setLoops(unsigned_int_loops) end
--[[
	Sets the delay in seconds of the "delay unit".
	@param delayPerUnit The delay in seconds of the "delay unit".
]]
function cc.Animation:setDelayPerUnit(float_delayPerUnit) end
--[[
	Adds a frame with an image filename. Internally it will create a SpriteFrame and it will add it.
	The frame will be added with one "delay unit".
	Added to facilitate the migration from v0.8 to v0.9.
	@param filename The path of SpriteFrame.
]]
function cc.Animation:addSpriteFrameWithFile(const_std_string_filename) end
--[[
	@deprecated. Use addSpriteFrameWithFile() instead.
	@js NA
]]
function cc.Animation:addSpriteFrameWithFile(const_std_string_filename) end
--[[
	Gets the total Delay units of the Animation.
	@return float   The total Delay units of the Animation.
]]
function cc.Animation:getTotalDelayUnits() end
--[[
	Gets the delay in seconds of the "delay unit".
	@return float   The delay in seconds of the "delay unit".
]]
function cc.Animation:getDelayPerUnit() end
--[[
	Initializes a Animation with frames and a delay between frames.
	@since v0.99.5
	@return bool
]]
function cc.Animation:initWithSpriteFrames(float_delay,unsigned_int_loops) end
--[[
	Checks whether to restore the original frame when animation finishes.
	@return bool   Restore the original frame when animation finishes.
]]
function cc.Animation:getRestoreOriginalFrame() end
--[[
	Adds a frame with a texture and a rect. Internally it will create a SpriteFrame and it will add it.
	The frame will be added with one "delay unit".
	Added to facilitate the migration from v0.8 to v0.9.
	@param pobTexture A frame with a texture.
	@param rect The Texture of rect.
]]
function cc.Animation:addSpriteFrameWithTexture(Texture2D_pobTexture,const_Rect_rect) end
--[[
	Creates an animation.
	@since v0.99.5
	@return [luaIde#cc.Animation]
]]
function cc.Animation:create() end
--[[
	Creates an animation with an array of AnimationFrame, the delay per units in seconds and how many times it should be executed.
	@since v2.0
	@param arrayOfAnimationFrameNames An animation with an array of AnimationFrame.
	@param delayPerUnit The delay per units in seconds and how many times it should be executed.
	@param loops The times the animation is going to loop.
	@return [luaIde#cc.Animation]
]]
function cc.Animation:create(float_delayPerUnit,unsigned_int_loops) end
--[[
	Creates an animation with an array of SpriteFrame and a delay between frames in seconds.
	The frames will be added with one "delay unit".
	@since v0.99.5
	@param arrayOfSpriteFrameNames An array of SpriteFrame.
	@param delay A delay between frames in seconds.
	@param loops The times the animation is going to loop.
	@return [luaIde#cc.Animation]
]]
function cc.Animation:createWithSpriteFrames(float_delay,unsigned_int_loops) end

--[[
	@SuperType[luaIde#cc.FiniteTimeAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.ActionInterval = {}
--[[
	Gets the amplitude rate, extension in GridAction
	@return float    The amplitude rate.
]]
function cc.ActionInterval:getAmplitudeRate() end
--[[
	initializes the action
	@return bool
]]
function cc.ActionInterval:initWithDuration(float_d) end
--[[
	Sets the amplitude rate, extension in GridAction
	@param amp   The amplitude rate.
]]
function cc.ActionInterval:setAmplitudeRate(float_amp) end
--[[
	How many seconds had elapsed since the actions started to run.
	@return float   The seconds had elapsed since the actions started to run.
]]
function cc.ActionInterval:getElapsed() end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.Sequence = {}
--[[
	@return bool
]]
function cc.Sequence:init() end
--[[
	initializes the action
	@return bool
]]
function cc.Sequence:initWithTwoActions(FiniteTimeAction_pActionOne,FiniteTimeAction_pActionTwo) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.Repeat = {}
--[[
	Sets the inner action.
	@param action The inner action.
]]
function cc.Repeat:setInnerAction(FiniteTimeAction_action) end
--[[
	initializes a Repeat action. Times is an unsigned integer between 1 and pow(2,30)
	@return bool
]]
function cc.Repeat:initWithAction(FiniteTimeAction_pAction,unsigned_int_times) end
--[[
	Gets the inner action.
	@return [luaIde#cc.FiniteTimeAction]   The inner action.
]]
function cc.Repeat:getInnerAction() end
--[[
	Creates a Repeat action. Times is an unsigned integer between 1 and pow(2,30).
	@param action The action needs to repeat.
	@param times The repeat times.
	@return [luaIde#cc.Repeat]   An autoreleased Repeat object.
]]
function cc.Repeat:create(FiniteTimeAction_action,unsigned_int_times) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.RepeatForever = {}
--[[
	Sets the inner action.
	@param action The inner action.
]]
function cc.RepeatForever:setInnerAction(ActionInterval_action) end
--[[
	initializes the action
	@return bool
]]
function cc.RepeatForever:initWithAction(ActionInterval_action) end
--[[
	Gets the inner action.
	@return [luaIde#cc.ActionInterval]   The inner action.
]]
function cc.RepeatForever:getInnerAction() end
--[[
	Creates the action.
	@param action The action need to repeat forever.
	@return [luaIde#cc.RepeatForever]   An autoreleased RepeatForever object.
]]
function cc.RepeatForever:create(ActionInterval_action) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.Spawn = {}
--[[
	@return bool
]]
function cc.Spawn:init() end
--[[
	initializes the Spawn action with the 2 actions to spawn
	@return bool
]]
function cc.Spawn:initWithTwoActions(FiniteTimeAction_action1,FiniteTimeAction_action2) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.RotateTo = {}
--[[
	initializes the action
	@param duration in seconds
	@param dstAngleX in degreesCW
	@param dstAngleY in degreesCW
	@return bool
]]
function cc.RotateTo:initWithDuration(float_duration,float_dstAngleX,float_dstAngleY) end
--[[
	initializes the action
	@param duration in seconds
	@return bool
]]
function cc.RotateTo:initWithDuration(float_duration,const_Vec3_dstAngle3D) end
--[[
	Creates the action with separate rotation angles.
	@param duration Duration time, in seconds.
	@param dstAngleX In degreesCW.
	@param dstAngleY In degreesCW.
	@return [luaIde#cc.RotateTo]   An autoreleased RotateTo object.
]]
function cc.RotateTo:create(float_duration,float_dstAngleX,float_dstAngleY) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param dstAngle In degreesCW.
	@return [luaIde#cc.RotateTo]   An autoreleased RotateTo object.
]]
function cc.RotateTo:create(float_duration,float_dstAngle) end
--[[
	Creates the action with 3D rotation angles.
	@param duration Duration time, in seconds.
	@param dstAngle3D A Vec3 angle.
	@return [luaIde#cc.RotateTo]   An autoreleased RotateTo object.
]]
function cc.RotateTo:create(float_duration,const_Vec3_dstAngle3D) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.RotateBy = {}
--[[
	initializes the action
	@return bool
]]
function cc.RotateBy:initWithDuration(float_duration,float_deltaAngle) end
--[[
	@warning The physics body contained in Node doesn't support rotate with different x and y angle.
	@param deltaAngleZ_X in degreesCW
	@param deltaAngleZ_Y in degreesCW
	@return bool
]]
function cc.RotateBy:initWithDuration(float_duration,float_deltaAngleZ_X,float_deltaAngleZ_Y) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param deltaAngle In degreesCW.
	@return [luaIde#cc.RotateBy]   An autoreleased RotateBy object.
]]
function cc.RotateBy:create(float_duration,float_deltaAngle) end
--[[
	Creates the action with separate rotation angles.
	@param duration Duration time, in seconds.
	@param deltaAngleZ_X In degreesCW.
	@param deltaAngleZ_Y In degreesCW.
	@return [luaIde#cc.RotateBy]   An autoreleased RotateBy object.
	@warning The physics body contained in Node doesn't support rotate with different x and y angle.
]]
function cc.RotateBy:create(float_duration,float_deltaAngleZ_X,float_deltaAngleZ_Y) end
--[[
	Creates the action with 3D rotation angles.
	@param duration Duration time, in seconds.
	@param deltaAngle3D A Vec3 angle.
	@return [luaIde#cc.RotateBy]   An autoreleased RotateBy object.
]]
function cc.RotateBy:create(float_duration,const_Vec3_deltaAngle3D) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.MoveBy = {}
--[[
	initializes the action
	@return bool
]]
function cc.MoveBy:initWithDuration(float_duration,const_Vec2_deltaPosition) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param deltaPosition The delta distance in 2d, it's a Vec2 type.
	@return [luaIde#cc.MoveBy]   An autoreleased MoveBy object.
]]
function cc.MoveBy:create(float_duration,const_Vec2_deltaPosition) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param deltaPosition The delta distance in 3d, it's a Vec3 type.
	@return [luaIde#cc.MoveBy]   An autoreleased MoveBy object.
]]
function cc.MoveBy:create(float_duration,const_Vec3_deltaPosition) end

--[[
	@SuperType[luaIde#cc.MoveBy]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.MoveTo = {}
--[[
	initializes the action
	@param duration in seconds
	@return bool
]]
function cc.MoveTo:initWithDuration(float_duration,const_Vec2_position) end
--[[
	initializes the action
	@param duration in seconds
	@return bool
]]
function cc.MoveTo:initWithDuration(float_duration,const_Vec3_position) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param position The destination position in 2d.
	@return [luaIde#cc.MoveTo]   An autoreleased MoveTo object.
]]
function cc.MoveTo:create(float_duration,const_Vec2_position) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param position The destination position in 3d.
	@return [luaIde#cc.MoveTo]   An autoreleased MoveTo object.
]]
function cc.MoveTo:create(float_duration,const_Vec3_position) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.SkewTo = {}
--[[
	@param t In seconds.
	@return bool
]]
function cc.SkewTo:initWithDuration(float_t,float_sx,float_sy) end
--[[
	Creates the action.
	@param t Duration time, in seconds.
	@param sx Skew x angle.
	@param sy Skew y angle.
	@return [luaIde#cc.SkewTo]   An autoreleased SkewTo object.
]]
function cc.SkewTo:create(float_t,float_sx,float_sy) end

--[[
	@SuperType[luaIde#cc.SkewTo]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.SkewBy = {}
--[[
	@param t In seconds.
	@return bool
]]
function cc.SkewBy:initWithDuration(float_t,float_sx,float_sy) end
--[[
	Creates the action.
	@param t Duration time, in seconds.
	@param deltaSkewX Skew x delta angle.
	@param deltaSkewY Skew y delta angle.
	@return [luaIde#cc.SkewBy]   An autoreleased SkewBy object.
]]
function cc.SkewBy:create(float_t,float_deltaSkewX,float_deltaSkewY) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.JumpBy = {}
--[[
	initializes the action
	@param duration in seconds
	@return bool
]]
function cc.JumpBy:initWithDuration(float_duration,const_Vec2_position,float_height,int_jumps) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param position The jumping distance.
	@param height The jumping height.
	@param jumps The jumping times.
	@return [luaIde#cc.JumpBy]   An autoreleased JumpBy object.
]]
function cc.JumpBy:create(float_duration,const_Vec2_position,float_height,int_jumps) end

--[[
	@SuperType[luaIde#cc.JumpBy]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.JumpTo = {}
--[[
	initializes the action
	@param duration In seconds.
	@return bool
]]
function cc.JumpTo:initWithDuration(float_duration,const_Vec2_position,float_height,int_jumps) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param position The jumping destination position.
	@param height The jumping height.
	@param jumps The jumping times.
	@return [luaIde#cc.JumpTo]   An autoreleased JumpTo object.
]]
function cc.JumpTo:create(float_duration,const_Vec2_position,float_height,int_jumps) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.BezierBy = {}
--[[
	initializes the action with a duration and a bezier configuration
	@param t in seconds
	@return bool
]]
function cc.BezierBy:initWithDuration(float_t,const_ccBezierConfig_c) end

--[[
	@SuperType[luaIde#cc.BezierBy]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.BezierTo = {}
--[[
	@param t In seconds.
	@return bool
]]
function cc.BezierTo:initWithDuration(float_t,const_ccBezierConfig_c) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.ScaleTo = {}
--[[
	initializes the action with the same scale factor for X and Y
	@param duration in seconds
	@return bool
]]
function cc.ScaleTo:initWithDuration(float_duration,float_s) end
--[[
	initializes the action with and X factor and a Y factor
	@param duration in seconds
	@return bool
]]
function cc.ScaleTo:initWithDuration(float_duration,float_sx,float_sy) end
--[[
	initializes the action with X Y Z factor
	@param duration in seconds
	@return bool
]]
function cc.ScaleTo:initWithDuration(float_duration,float_sx,float_sy,float_sz) end
--[[
	Creates the action with the same scale factor for X and Y.
	@param duration Duration time, in seconds.
	@param s Scale factor of x and y.
	@return [luaIde#cc.ScaleTo]   An autoreleased ScaleTo object.
]]
function cc.ScaleTo:create(float_duration,float_s) end
--[[
	Creates the action with and X factor and a Y factor.
	@param duration Duration time, in seconds.
	@param sx Scale factor of x.
	@param sy Scale factor of y.
	@return [luaIde#cc.ScaleTo]   An autoreleased ScaleTo object.
]]
function cc.ScaleTo:create(float_duration,float_sx,float_sy) end
--[[
	Creates the action with X Y Z factor.
	@param duration Duration time, in seconds.
	@param sx Scale factor of x.
	@param sy Scale factor of y.
	@param sz Scale factor of z.
	@return [luaIde#cc.ScaleTo]   An autoreleased ScaleTo object.
]]
function cc.ScaleTo:create(float_duration,float_sx,float_sy,float_sz) end

--[[
	@SuperType[luaIde#cc.ScaleTo]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.ScaleBy = {}
--[[
	Creates the action with the same scale factor for X and Y.
	@param duration Duration time, in seconds.
	@param s Scale factor of x and y.
	@return [luaIde#cc.ScaleBy]   An autoreleased ScaleBy object.
]]
function cc.ScaleBy:create(float_duration,float_s) end
--[[
	Creates the action with and X factor and a Y factor.
	@param duration Duration time, in seconds.
	@param sx Scale factor of x.
	@param sy Scale factor of y.
	@return [luaIde#cc.ScaleBy]   An autoreleased ScaleBy object.
]]
function cc.ScaleBy:create(float_duration,float_sx,float_sy) end
--[[
	Creates the action with X Y Z factor.
	@param duration Duration time, in seconds.
	@param sx Scale factor of x.
	@param sy Scale factor of y.
	@param sz Scale factor of z.
	@return [luaIde#cc.ScaleBy]   An autoreleased ScaleBy object.
]]
function cc.ScaleBy:create(float_duration,float_sx,float_sy,float_sz) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.Blink = {}
--[[
	initializes the action
	@param duration in seconds
	@return bool
]]
function cc.Blink:initWithDuration(float_duration,int_blinks) end
--[[
	Creates the action.
	@param duration Duration time, in seconds.
	@param blinks Blink times.
	@return [luaIde#cc.Blink]   An autoreleased Blink object.
]]
function cc.Blink:create(float_duration,int_blinks) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.FadeTo = {}
--[[
	initializes the action with duration and opacity
	@param duration in seconds
	@return bool
]]
function cc.FadeTo:initWithDuration(float_duration,GLubyte_opacity) end
--[[
	Creates an action with duration and opacity.
	@param duration Duration time, in seconds.
	@param opacity A certain opacity, the range is from 0 to 255.
	@return [luaIde#cc.FadeTo]   An autoreleased FadeTo object.
]]
function cc.FadeTo:create(float_duration,GLubyte_opacity) end

--[[
	@SuperType[luaIde#cc.FadeTo]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.FadeIn = {}
--[[
	@js NA
]]
function cc.FadeIn:setReverseAction(FadeTo_ac) end
--[[
	Creates the action.
	@param d Duration time, in seconds.
	@return [luaIde#cc.FadeIn]   An autoreleased FadeIn object.
]]
function cc.FadeIn:create(float_d) end

--[[
	@SuperType[luaIde#cc.FadeTo]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.FadeOut = {}
--[[
	@js NA
]]
function cc.FadeOut:setReverseAction(FadeTo_ac) end
--[[
	Creates the action.
	@param d Duration time, in seconds.
	@return [luaIde#cc.FadeOut]
]]
function cc.FadeOut:create(float_d) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.TintTo = {}
--[[
	initializes the action with duration and color
	@return bool
]]
function cc.TintTo:initWithDuration(float_duration,GLubyte_red,GLubyte_green,GLubyte_blue) end
--[[
	Creates an action with duration and color.
	@param duration Duration time, in seconds.
	@param red Red Color, from 0 to 255.
	@param green Green Color, from 0 to 255.
	@param blue Blue Color, from 0 to 255.
	@return [luaIde#cc.TintTo]   An autoreleased TintTo object.
]]
function cc.TintTo:create(float_duration,GLubyte_red,GLubyte_green,GLubyte_blue) end
--[[
	Creates an action with duration and color.
	@param duration Duration time, in seconds.
	@param color It's a Color3B type.
	@return [luaIde#cc.TintTo]   An autoreleased TintTo object.
]]
function cc.TintTo:create(float_duration,const_Color3B_color) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.TintBy = {}
--[[
	initializes the action with duration and color
	@return bool
]]
function cc.TintBy:initWithDuration(float_duration,GLshort_deltaRed,GLshort_deltaGreen,GLshort_deltaBlue) end
--[[
	Creates an action with duration and color.
	@param duration Duration time, in seconds.
	@param deltaRed Delta red color.
	@param deltaGreen Delta green color.
	@param deltaBlue Delta blue color.
	@return [luaIde#cc.TintBy]   An autoreleased TintBy object.
]]
function cc.TintBy:create(float_duration,GLshort_deltaRed,GLshort_deltaGreen,GLshort_deltaBlue) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.DelayTime = {}
--[[
	Creates the action.
	@param d Duration time, in seconds.
	@return [luaIde#cc.DelayTime]   An autoreleased DelayTime object.
]]
function cc.DelayTime:create(float_d) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.Animate = {}
--[[
	initializes the action with an Animation and will restore the original frame when the animation is over
	@return bool
]]
function cc.Animate:initWithAnimation(Animation_animation) end
--[[
	returns the Animation object that is being animated
	@return [luaIde#cc.Animation]   Gets the animation object that is being animated.
]]
function cc.Animate:getAnimation() end
--[[
	Gets the index of sprite frame currently displayed.
	@return int   int  the index of sprite frame currently displayed.
]]
function cc.Animate:getCurrentFrameIndex() end
--[[
	Sets the Animation object to be animated
	@param animation certain animation.
]]
function cc.Animate:setAnimation(Animation_animation) end
--[[
	Creates the action with an Animation and will restore the original frame when the animation is over.
	@param animation A certain animation.
	@return [luaIde#cc.Animate]   An autoreleased Animate object.
]]
function cc.Animate:create(Animation_animation) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.TargetedAction = {}
--[[
	returns the target that the action is forced to run with.
	@return [luaIde#cc.Node]   The target that the action is forced to run with.
]]
function cc.TargetedAction:getForcedTarget() end
--[[
	Init an action with the specified action and forced target
	@return bool
]]
function cc.TargetedAction:initWithTarget(Node_target,FiniteTimeAction_action) end
--[[
	Sets the target that the action will be forced to run with.
	@param forcedTarget The target that the action will be forced to run with.
]]
function cc.TargetedAction:setForcedTarget(Node_forcedTarget) end
--[[
	Create an action with the specified action and forced target.
	@param target The target needs to override.
	@param action The action needs to override.
	@return [luaIde#cc.TargetedAction]   An autoreleased TargetedAction object.
]]
function cc.TargetedAction:create(Node_target,FiniteTimeAction_action) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInterval.h
]]
cc.ActionFloat = {}
--[[
	@return bool
]]
function cc.ActionFloat:initWithDuration(float_duration,float_from,float_to,ActionFloatCallback_callback) end
--[[
	Creates FloatAction with specified duration, from value, to value and callback to report back
	results
	@param duration of the action
	@param from value to start from
	@param to value to be at the end of the action
	@param callback to report back result
	@return [luaIde#cc.ActionFloat]   An autoreleased ActionFloat object
]]
function cc.ActionFloat:create(float_duration,float_from,float_to,ActionFloatCallback_callback) end

cc.Properties = {}
--[[
	Returns the value of a variable that is set in this Properties object.
	Variables take on the format ${name} and are inherited from parent Property objects.
	@param name Name of the variable to get.
	@param defaultValue Value to return if the variable is not found.
	@return char   The value of the specified variable, or defaultValue if not found.
]]
function cc.Properties:getVariable(const_char_name,const_char_defaultValue) end
--[[
	Get the value of the given property as a string. This can always be retrieved,
	whatever the intended type of the property.
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param defaultValue The default value to return if the specified property does not exist.
	@return char   The value of the given property as a string, or the empty string if no property with that name exists.
]]
function cc.Properties:getString(const_char_name,const_char_defaultValue) end
--[[
	Interpret the value of the given property as a long integer.
	If the property does not exist, zero will be returned.
	If the property exists but could not be scanned, an error will be logged and zero will be returned.
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@return long   The value of the given property interpreted as a long.
	Zero if the property does not exist or could not be scanned.
]]
function cc.Properties:getLong(const_char_name) end
--[[
	Get a specific namespace by ID or name. This method will optionally
	perform a depth-first search on all namespaces and inner namespaces
	within this Property.
	@param id The ID or name of the namespace to find.
	@param searchNames If true, namespace names are used in the search,
	instead of namespace IDs. By default this parameter is false
	and namespace IDs are searched.
	@param recurse If true, perform a depth-first search, otherwise search
	only the immediate child namespaces.
	@return [luaIde#cc.Properties]   A properties object with the given ID or name.
]]
function cc.Properties:getNamespace(const_char_id,bool_searchNames,bool_recurse) end
--[[
	Get the name of this Property's namespace.
	@return char   The name of this Property's namespace.
]]
function cc.Properties:getNamespace() end
--[[
	Gets the file path for the given property if the file exists.
	This method will first search for the file relative to the working directory.
	If the file is not found then it will search relative to the directory the bundle file is in.
	@param name The name of the property.
	@param path The string to copy the path to if the file exists.
	@return bool   True if the property exists and the file exists, false otherwise.
	@script{ignore}
]]
function cc.Properties:getPath(const_char_name,std_string_path) end
--[[
	Interpret the value of the given property as a Matrix.
	If the property does not exist, out will be set to the identity matrix.
	If the property exists but could not be scanned, an error will be logged and out will be set
	to the identity matrix.
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The matrix to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getMat4(const_char_name,Mat4_out) end
--[[
	Check if a property with the given name is specified in this Properties object.
	@param name The name of the property to query.
	@return bool   True if the property exists, false otherwise.
]]
function cc.Properties:exists(const_char_name) end
--[[
	Sets the value of the property with the specified name.
	If there is no property in this namespace with the current name,
	one is added. Otherwise, the value of the first property with the
	specified name is updated.
	If name is NULL, the value current property (see getNextProperty) is
	set, unless there is no current property, in which case false
	is returned.
	@param name The name of the property to set.
	@param value The property value.
	@return bool   True if the property was set, false otherwise.
]]
function cc.Properties:setString(const_char_name,const_char_value) end
--[[
	Get the ID of this Property's namespace. The ID should be a unique identifier,
	but its uniqueness is not enforced.
	@return char   The ID of this Property's namespace.
]]
function cc.Properties:getId() end
--[[
	Rewind the getNextProperty() and getNextNamespace() iterators
	to the beginning of the file.
]]
function cc.Properties:rewind() end
--[[
	Sets the value of the specified variable.
	@param name Name of the variable to set.
	@param value The value to set.
]]
function cc.Properties:setVariable(const_char_name,const_char_value) end
--[[
	Interpret the value of the given property as a boolean.
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param defaultValue the default value to return if the specified property does not exist within the properties file.
	@return bool   true if the property exists and its value is "true", otherwise false.
]]
function cc.Properties:getBool(const_char_name,bool_defaultValue) end
--[[
	Interpret the value of the given property as an RGB color in hex and write this color to a Vector3.
	E.g. 0xff0000 represents red and sets the vector to (1, 0, 0).
	If the property does not exist, out will be set to Vector3(0.0f, 0.0f, 0.0f).
	If the property exists but could not be scanned, an error will be logged and out will be set
	to Vector3(0.0f, 0.0f, 0.0f).
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The vector to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getColor(const_char_name,Vec3_out) end
--[[
	Interpret the value of the given property as an RGBA color in hex and write this color to a Vector4.
	E.g. 0xff0000ff represents opaque red and sets the vector to (1, 0, 0, 1).
	If the property does not exist, out will be set to Vector4(0.0f, 0.0f, 0.0f, 0.0f).
	If the property exists but could not be scanned, an error will be logged and out will be set
	to Vector4(0.0f, 0.0f, 0.0f, 0.0f).
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The vector to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getColor(const_char_name,Vec4_out) end
--[[
	Returns the type of a property.
	@param name The name of the property to interpret, or NULL to return the current property's type.
	@return [luaIde#Type]   The type of the property.
]]
function cc.Properties:getType(const_char_name) end
--[[
	Get the next namespace.
	@return [luaIde#cc.Properties]
]]
function cc.Properties:getNextNamespace() end
--[[
	Interpret the value of the given property as an integer.
	If the property does not exist, zero will be returned.
	If the property exists but could not be scanned, an error will be logged and zero will be returned.
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@return int   The value of the given property interpreted as an integer.
	Zero if the property does not exist or could not be scanned.
]]
function cc.Properties:getInt(const_char_name) end
--[[
	Interpret the value of the given property as a Vector3.
	If the property does not exist, out will be set to Vector3(0.0f, 0.0f, 0.0f).
	If the property exists but could not be scanned, an error will be logged and out will be set
	to Vector3(0.0f, 0.0f, 0.0f).
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The vector to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getVec3(const_char_name,Vec3_out) end
--[[
	Interpret the value of the given property as a Vector2.
	If the property does not exist, out will be set to Vector2(0.0f, 0.0f).
	If the property exists but could not be scanned, an error will be logged and out will be set
	to Vector2(0.0f, 0.0f).
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The vector to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getVec2(const_char_name,Vec2_out) end
--[[
	Interpret the value of the given property as a Vector4.
	If the property does not exist, out will be set to Vector4(0.0f, 0.0f, 0.0f, 0.0f).
	If the property exists but could not be scanned, an error will be logged and out will be set
	to Vector4(0.0f, 0.0f, 0.0f, 0.0f).
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The vector to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getVec4(const_char_name,Vec4_out) end
--[[
	Get the name of the next property.
	If a valid next property is returned, the value of the property can be
	retrieved using any of the get methods in this class, passing NULL for
	// the property name.
	@return char   The name of the next property, or NULL if there are no properties remaining.
]]
function cc.Properties:getNextProperty() end
--[[
	Interpret the value of the given property as a floating-point number.
	If the property does not exist, zero will be returned.
	If the property exists but could not be scanned, an error will be logged and zero will be returned.
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@return float   The value of the given property interpreted as a float.
	Zero if the property does not exist or could not be scanned.
]]
function cc.Properties:getFloat(const_char_name) end
--[[
	Interpret the value of the given property as a Quaternion specified as an axis angle.
	If the property does not exist, out will be set to Quaternion().
	If the property exists but could not be scanned, an error will be logged and out will be set
	to Quaternion().
	@param name The name of the property to interpret, or NULL to return the current property's value.
	@param out The quaternion to set to this property's interpreted value.
	@return bool   True on success, false if the property does not exist or could not be scanned.
]]
function cc.Properties:getQuaternionFromAxisAngle(const_char_name,Quaternion_out) end
--[[
	Attempts to parse the specified string as an RGB color value.
	@param str The string to parse.
	@param out The value to populate if successful.
	@return bool   True if a valid RGB color was parsed, false otherwise.
]]
function cc.Properties:parseColor(const_char_str,Vec3_out) end
--[[
	Attempts to parse the specified string as an RGBA color value.
	@param str The string to parse.
	@param out The value to populate if successful.
	@return bool   True if a valid RGBA color was parsed, false otherwise.
]]
function cc.Properties:parseColor(const_char_str,Vec4_out) end
--[[
	Attempts to parse the specified string as a Vector3 value.
	On error, false is returned and the output is set to all zero values.
	@param str The string to parse.
	@param out The value to populate if successful.
	@return bool   True if a valid Vector3 was parsed, false otherwise.
]]
function cc.Properties:parseVec3(const_char_str,Vec3_out) end
--[[
	Attempts to parse the specified string as an axis-angle value.
	The specified string is expected to contain four comma-separated
	values, where the first three values represents the axis and the
	fourth value represents the angle, in degrees.
	On error, false is returned and the output is set to all zero values.
	@param str The string to parse.
	@param out A Quaternion populated with the orientation of the axis-angle, if successful.
	@return bool   True if a valid axis-angle was parsed, false otherwise.
]]
function cc.Properties:parseAxisAngle(const_char_str,Quaternion_out) end
--[[
	Attempts to parse the specified string as a Vector2 value.
	On error, false is returned and the output is set to all zero values.
	@param str The string to parse.
	@param out The value to populate if successful.
	@return bool   True if a valid Vector2 was parsed, false otherwise.
]]
function cc.Properties:parseVec2(const_char_str,Vec2_out) end
--[[
	Attempts to parse the specified string as a Vector4 value.
	On error, false is returned and the output is set to all zero values.
	@param str The string to parse.
	@param out The value to populate if successful.
	@return bool   True if a valid Vector4 was parsed, false otherwise.
]]
function cc.Properties:parseVec4(const_char_str,Vec4_out) end

cc.UserDefault = {}
--[[
	Set integer value by key.
	@param key The key to set.
	@param value A integer value to set to the key.
	@js NA
]]
function cc.UserDefault:setIntegerForKey(const_char_key,int_value) end
--[[
	delete any value by key,
	@param key The key to delete value.
	@js NA
]]
function cc.UserDefault:deleteValueForKey(const_char_key) end
--[[
	Get float value by key, if the key doesn't exist, will return 0.0.
	@param key The key to get value.
	@return float   Float value of the key.
	@js NA
]]
function cc.UserDefault:getFloatForKey(const_char_key) end
--[[
	Get float value by key, if the key doesn't exist, will return passed default value.
	@param key The key to get value.
	@param defaultValue The default value to return if the key doesn't exist.
	@return float   Float value of the key.
	@js NA
]]
function cc.UserDefault:getFloatForKey(const_char_key,float_defaultValue) end
--[[
	Get bool value by key, if the key doesn't exist, will return false.
	You can set the default value, or it is false.
	@param key The key to get value.
	@return bool   Bool value by `key`.
	@js NA
]]
function cc.UserDefault:getBoolForKey(const_char_key) end
--[[
	Get bool value by key, if the key doesn't exist, will return passed default value.
	@param key The key to get value.
	@param defaultValue The default value to return if the key doesn't exist.
	@js NA
	@return bool
]]
function cc.UserDefault:getBoolForKey(const_char_key,bool_defaultValue) end
--[[
	Set double value by key.
	@param key The key to set.
	@param value A double value to set to the key.
	@js NA
]]
function cc.UserDefault:setDoubleForKey(const_char_key,double_value) end
--[[
	Set float value by key.
	@param key The key to set.
	@param value A float value to set to the key.
	@js NA
]]
function cc.UserDefault:setFloatForKey(const_char_key,float_value) end
--[[
	Get string value by key, if the key doesn't exist, will return an empty string.
	@param key The key to get value.
	@return std_string   String value of the key.
	@js NA
]]
function cc.UserDefault:getStringForKey(const_char_key) end
--[[
	Get string value by key, if the key doesn't exist, will return passed default value.
	@param key The key to get value.
	@param defaultValue The default value to return if the key doesn't exist.
	@return std_string   String value of the key.
	@js NA
]]
function cc.UserDefault:getStringForKey(const_char_key,const_std_string__defaultValue) end
--[[
	Set string value by key.
	@param key The key to set.
	@param value A string value to set to the key.
	@js NA
]]
function cc.UserDefault:setStringForKey(const_char_key,const_std_string__value) end
--[[
	You should invoke this function to save values set by setXXXForKey().
	@js NA
]]
function cc.UserDefault:flush() end
--[[
	Get integer value by key, if the key doesn't exist, will return 0.
	You can set the default value, or it is 0.
	@param key The key to get value.
	@return int   Integer value of the key.
	@js NA
]]
function cc.UserDefault:getIntegerForKey(const_char_key) end
--[[
	Get bool value by key, if the key doesn't exist, will return passed default value.
	@param key The key to get value.
	@param defaultValue The default value to return if the key doesn't exist.
	@return int   Integer value of the key.
	@js NA
]]
function cc.UserDefault:getIntegerForKey(const_char_key,int_defaultValue) end
--[[
	Get double value by key, if the key doesn't exist, will return 0.0.
	@param key The key to get value.
	@return double   Double value of the key.
	@js NA
]]
function cc.UserDefault:getDoubleForKey(const_char_key) end
--[[
	Get double value by key, if the key doesn't exist, will return passed default value.
	@param key The key to get value.
	@param defaultValue The default value to return if the key doesn't exist.
	@return double   Double value of the key.
	@js NA
]]
function cc.UserDefault:getDoubleForKey(const_char_key,double_defaultValue) end
--[[
	Set bool value by key.
	@param key The key to set.
	@param value A bool value to set to the key.
	@js NA
]]
function cc.UserDefault:setBoolForKey(const_char_key,bool_value) end
--[[
	@js NA
]]
function cc.UserDefault:destroyInstance() end
--[[
	All supported platforms other iOS & Android use xml file to save values. This function is return the file path of the xml path.
	@js NA
	@return std_string
]]
function cc.UserDefault:getXMLFilePath() end
--[[
	All supported platforms other iOS & Android and CC_PLATFORM_WINRT use xml file to save values. This function checks whether the xml file exists or not.
	@return bool   True if the xml file exists, false if not.
	@js NA
]]
function cc.UserDefault:isXMLFileExist() end

cc.FileUtils = {}
--[[
	Returns the fullpath for a given filename.
	First it will try to get a new filename from the "filenameLookup" dictionary.
	If a new filename can't be found on the dictionary, it will use the original filename.
	Then it will try to obtain the full path of the filename using the FileUtils search rules: resolutions, and search paths.
	The file search is based on the array element order of search paths and resolution directories.
	For instance:
	We set two elements("/mnt/sdcard/", "internal_dir/") to search paths vector by setSearchPaths,
	and set three elements("resources-ipadhd/", "resources-ipad/", "resources-iphonehd")
	to resolutions vector by setSearchResolutionsOrder. The "internal_dir" is relative to "Resources/".
	If we have a file named 'sprite.png', the mapping in fileLookup dictionary contains `key: sprite.png -> value: sprite.pvr.gz`.
	Firstly, it will replace 'sprite.png' with 'sprite.pvr.gz', then searching the file sprite.pvr.gz as follows:
	/mnt/sdcard/resources-ipadhd/sprite.pvr.gz      (if not found, search next)
	/mnt/sdcard/resources-ipad/sprite.pvr.gz        (if not found, search next)
	/mnt/sdcard/resources-iphonehd/sprite.pvr.gz    (if not found, search next)
	/mnt/sdcard/sprite.pvr.gz                       (if not found, search next)
	internal_dir/resources-ipadhd/sprite.pvr.gz     (if not found, search next)
	internal_dir/resources-ipad/sprite.pvr.gz       (if not found, search next)
	internal_dir/resources-iphonehd/sprite.pvr.gz   (if not found, search next)
	internal_dir/sprite.pvr.gz                      (if not found, return "sprite.png")
	If the filename contains relative path like "gamescene/uilayer/sprite.png",
	and the mapping in fileLookup dictionary contains `key: gamescene/uilayer/sprite.png -> value: gamescene/uilayer/sprite.pvr.gz`.
	The file search order will be:
	/mnt/sdcard/gamescene/uilayer/resources-ipadhd/sprite.pvr.gz      (if not found, search next)
	/mnt/sdcard/gamescene/uilayer/resources-ipad/sprite.pvr.gz        (if not found, search next)
	/mnt/sdcard/gamescene/uilayer/resources-iphonehd/sprite.pvr.gz    (if not found, search next)
	/mnt/sdcard/gamescene/uilayer/sprite.pvr.gz                       (if not found, search next)
	internal_dir/gamescene/uilayer/resources-ipadhd/sprite.pvr.gz     (if not found, search next)
	internal_dir/gamescene/uilayer/resources-ipad/sprite.pvr.gz       (if not found, search next)
	internal_dir/gamescene/uilayer/resources-iphonehd/sprite.pvr.gz   (if not found, search next)
	internal_dir/gamescene/uilayer/sprite.pvr.gz                      (if not found, return "gamescene/uilayer/sprite.png")
	If the new file can't be found on the file system, it will return the parameter filename directly.
	This method was added to simplify multiplatform support. Whether you are using cocos2d-js or any cross-compilation toolchain like StellaSDK or Apportable,
	you might need to load different resources for a given file in the different platforms.
	@since v2.1
	@return std_string
]]
function cc.FileUtils:fullPathForFilename(const_std_string_filename) end
--[[
	Gets string from a file.
	@return std_string
]]
function cc.FileUtils:getStringFromFile(const_std_string_filename) end
--[[
	Gets string from a file, async off the main cocos thread
	@param path filepath for the string to be read. Can be relative or absolute path
	@param callback Function that will be called when file is read. Will be called
	on the main cocos thread.
]]
function cc.FileUtils:getStringFromFile(const_std_string_path) end
--[[
	Sets the filenameLookup dictionary.
	@param filenameLookupDict The dictionary for replacing filename.
	@since v2.1
]]
function cc.FileUtils:setFilenameLookupDictionary(const_ValueMap_filenameLookupDict) end
--[[
	Removes a file.
	@param filepath The full path of the file, it must be an absolute path.
	@return bool   True if the file have been removed successfully, false if not.
]]
function cc.FileUtils:removeFile(const_std_string_filepath) end
--[[
	Removes a file, async off the main cocos thread.
	@param filepath the path of the file to remove, it must be an absolute path
	@param callback The function that will be called when the operation is complete. Will have one boolean
	argument, true if the file was successfully removed, false otherwise.
]]
function cc.FileUtils:removeFile(const_std_string_filepath) end
--[[
	List all files recursively in a directory, async off the main cocos thread.
	@param dirPath The path of the directory, it could be a relative or an absolute path.
	@param callback The callback to be called once the list operation is complete.
	Will be called on the main cocos thread.
	@js NA
	@lua NA
]]
function cc.FileUtils:listFilesRecursivelyAsync(const_std_string_dirPath) end
--[[
	Checks whether the path is an absolute path.
	@note On Android, if the parameter passed in is relative to "assets/", this method will treat it as an absolute path.
	Also on Blackberry, path starts with "app/native/Resources/" is treated as an absolute path.
	@param path The path that needs to be checked.
	@return bool   True if it's an absolute path, false if not.
]]
function cc.FileUtils:isAbsolutePath(const_std_string_path) end
--[[
	Renames a file under the given directory.
	@param path     The parent directory path of the file, it must be an absolute path.
	@param oldname  The current name of the file.
	@param name     The new name of the file.
	@return bool   True if the file have been renamed successfully, false if not.
]]
function cc.FileUtils:renameFile(const_std_string_path,const_std_string_oldname,const_std_string_name) end
--[[
	Renames a file under the given directory, async off the main cocos thread.
	@param path     The parent directory path of the file, it must be an absolute path.
	@param oldname  The current name of the file.
	@param name     The new name of the file.
	@param callback The function that will be called when the operation is complete. Will have one boolean
	argument, true if the file was successfully renamed, false otherwise.
]]
function cc.FileUtils:renameFile(const_std_string_path,const_std_string_oldname,const_std_string_name) end
--[[
	Renames a file under the given directory.
	@param oldfullpath  The current fullpath of the file. Includes path and name.
	@param newfullpath  The new fullpath of the file. Includes path and name.
	@return bool   True if the file have been renamed successfully, false if not.
]]
function cc.FileUtils:renameFile(const_std_string_oldfullpath,const_std_string_newfullpath) end
--[[
	Renames a file under the given directory, async off the main cocos thread.
	@param oldfullpath  The current fullpath of the file. Includes path and name.
	@param newfullpath  The new fullpath of the file. Includes path and name.
	@param callback The function that will be called when the operation is complete. Will have one boolean
	argument, true if the file was successfully renamed, false otherwise.
]]
function cc.FileUtils:renameFile(const_std_string_oldfullpath,const_std_string_newfullpath) end
--[[
	Get default resource root path.
	@return std_string
]]
function cc.FileUtils:getDefaultResourceRootPath() end
--[[
	Checks whether to pop up a message box when failed to load an image.
	@return bool   True if pop up a message box when failed to load an image, false if not.
]]
function cc.FileUtils:isPopupNotify() end
--[[
	@return [luaIde#ValueVector]
]]
function cc.FileUtils:getValueVectorFromFile(const_std_string_filename) end
--[[
	Gets the array of search paths.
	@return [luaIde#std_vector__std_string__]   The array of search paths which may contain the prefix of default resource root path.
	@note In best practise, getter function should return the value of setter function passes in.
	But since we should not break the compatibility, we keep using the old logic.
	Therefore, If you want to get the original search paths, please call 'getOriginalSearchPaths()' instead.
	@see fullPathForFilename(const char*).
	@lua NA
]]
function cc.FileUtils:getSearchPaths() end
--[[
	write a ValueMap into a plist file
	@param dict the ValueMap want to save
	@param fullPath The full path to the file you want to save a string
	@return bool   bool
]]
function cc.FileUtils:writeToFile(const_ValueMap_dict,const_std_string_fullPath) end
--[[
	Gets the original search path array set by 'setSearchPaths' or 'addSearchPath'.
	@return [luaIde#std_vector__std_string__]   The array of the original search paths
]]
function cc.FileUtils:getOriginalSearchPaths() end
--[[
	Gets the new filename from the filename lookup dictionary.
	It is possible to have a override names.
	@param filename The original filename.
	@return std_string   The new filename after searching in the filename lookup dictionary.
	If the original filename wasn't in the dictionary, it will return the original filename.
]]
function cc.FileUtils:getNewFilename(const_std_string_filename) end
--[[
	List all files in a directory.
	@param dirPath The path of the directory, it could be a relative or an absolute path.
	@return [luaIde#std_vector__std_string__]   File paths in a string vector
]]
function cc.FileUtils:listFiles(const_std_string_dirPath) end
--[[
	Converts the contents of a file to a ValueMap.
	@param filename The filename of the file to gets content.
	@return [luaIde#ValueMap]   ValueMap of the file contents.
	@note This method is used internally.
]]
function cc.FileUtils:getValueMapFromFile(const_std_string_filename) end
--[[
	Retrieve the file size.
	@note If a relative path was passed in, it will be inserted a default root path at the beginning.
	@param filepath The path of the file, it could be a relative or absolute path.
	@return long   The file size.
]]
function cc.FileUtils:getFileSize(const_std_string_filepath) end
--[[
	Retrieve the file size, async off the main cocos thread.
	@note If a relative path was passed in, it will be inserted a default root path at the beginning.
	@param filepath The path of the file, it could be a relative or absolute path.
	@param callback The function that will be called when the operation is complete. Will have one long
	argument, the file size.
]]
function cc.FileUtils:getFileSize(const_std_string_filepath) end
--[[
	Converts the contents of a file to a ValueMap.
	This method is used internally.
	@return [luaIde#ValueMap]
]]
function cc.FileUtils:getValueMapFromData(const_char_filedata,int_filesize) end
--[[
	Removes a directory.
	@param dirPath  The full path of the directory, it must be an absolute path.
	@return bool   True if the directory have been removed successfully, false if not.
]]
function cc.FileUtils:removeDirectory(const_std_string_dirPath) end
--[[
	Removes a directory, async off the main cocos thread.
	@param dirPath the path of the directory, it must be an absolute path
	@param callback The function that will be called when the operation is complete. Will have one boolean
	argument, true if the directory was successfully removed, false otherwise.
]]
function cc.FileUtils:removeDirectory(const_std_string_dirPath) end
--[[
	Sets the array of search paths.
	You can use this array to modify the search path of the resources.
	If you want to use "themes" or search resources in the "cache", you can do it easily by adding new entries in this array.
	@note This method could access relative path and absolute path.
	If the relative path was passed to the vector, FileUtils will add the default resource directory before the relative path.
	For instance:
	On Android, the default resource root path is "assets/".
	If "/mnt/sdcard/" and "resources-large" were set to the search paths vector,
	"resources-large" will be converted to "assets/resources-large" since it was a relative path.
	@param searchPaths The array contains search paths.
	@see fullPathForFilename(const char*)
	@since v2.1
	In js:var setSearchPaths(var jsval);
	@lua NA
]]
function cc.FileUtils:setSearchPaths() end
--[[
	write a string into a file
	@param dataStr the string want to save
	@param fullPath The full path to the file you want to save a string
	@return bool   bool True if write success
]]
function cc.FileUtils:writeStringToFile(const_std_string_dataStr,const_std_string_fullPath) end
--[[
	Write a string to a file, done async off the main cocos thread
	Use this function if you need file access without blocking the main thread.
	This function takes a std::string by value on purpose, to leverage move sematics.
	If you want to avoid a copy of your datastr, use std::move/std::forward if appropriate
	@param dataStr the string want to save
	@param fullPath The full path to the file you want to save a string
	@param callback The function called once the string has been written to a file. This
	function will be executed on the main cocos thread. It will have on boolean argument
	signifying if the write was successful.
]]
function cc.FileUtils:writeStringToFile(std_string_dataStr,const_std_string_fullPath) end
--[[
	Sets the array that contains the search order of the resources.
	@param searchResolutionsOrder The source array that contains the search order of the resources.
	@see getSearchResolutionsOrder(), fullPathForFilename(const char*).
	@since v2.1
	In js:var setSearchResolutionsOrder(var jsval)
	@lua NA
]]
function cc.FileUtils:setSearchResolutionsOrder() end
--[[
	Append search order of the resources.
	@see setSearchResolutionsOrder(), fullPathForFilename().
	@since v2.1
]]
function cc.FileUtils:addSearchResolutionsOrder(const_std_string_order,const_bool_front) end
--[[
	Add search path.
	@since v2.1
]]
function cc.FileUtils:addSearchPath(const_std_string__path,const_bool_front) end
--[[
	write ValueVector into a plist file
	@param vecData the ValueVector want to save
	@param fullPath The full path to the file you want to save a string
	@return bool   bool
]]
function cc.FileUtils:writeValueVectorToFile(const_ValueVector_vecData,const_std_string_fullPath) end
--[[
	Write a ValueVector into a file, done async off the main cocos thread.
	Use this function if you need to write a ValueVector while not blocking the main cocos thread.
	This function takes ValueVector by value on purpose, to leverage move sematics.
	If you want to avoid a copy of your dict, use std::move/std::forward if appropriate
	@param vecData The ValueVector that will be written to disk
	@param fullPath The absolute file path that the data will be written to
	@param callback The function that will be called when vecData is written to disk. This
	function will be executed on the main cocos thread. It will have on boolean argument
	signifying if the write was successful.
]]
function cc.FileUtils:writeValueVectorToFile(ValueVector_vecData,const_std_string_fullPath) end
--[[
	Checks whether a file exists.
	@note If a relative path was passed in, it will be inserted a default root path at the beginning.
	@param filename The path of the file, it could be a relative or absolute path.
	@return bool   True if the file exists, false if not.
]]
function cc.FileUtils:isFileExist(const_std_string_filename) end
--[[
	Checks if a file exists, done async off the main cocos thread.
	Use this function if you need to check if a file exists while not blocking the main cocos thread.
	@note If a relative path was passed in, it will be inserted a default root path at the beginning.
	@param filename The path of the file, it could be a relative or absolute path.
	@param callback The function that will be called when the operation is complete. Will have one boolean
	argument, true if the file exists, false otherwise.
]]
function cc.FileUtils:isFileExist(const_std_string_filename) end
--[[
	Purges full path caches.
]]
function cc.FileUtils:purgeCachedEntries() end
--[[
	Gets full path from a file name and the path of the relative file.
	@param filename The file name.
	@param relativeFile The path of the relative file.
	@return std_string   The full path.
	e.g. filename: hello.png, pszRelativeFile: /User/path1/path2/hello.plist
	Return: /User/path1/path2/hello.pvr (If there a a key(hello.png)-value(hello.pvr) in FilenameLookup dictionary. )
]]
function cc.FileUtils:fullPathFromRelativeFile(const_std_string_filename,const_std_string_relativeFile) end
--[[
	Windows fopen can't support UTF-8 filename
	Need convert all parameters fopen and other 3rd-party libs
	@param filenameUtf8 std::string name file for conversion from utf-8
	@return std_string   std::string ansi filename in current locale
]]
function cc.FileUtils:getSuitableFOpen(const_std_string_filenameUtf8) end
--[[
	write ValueMap into a plist file
	@param dict the ValueMap want to save
	@param fullPath The full path to the file you want to save a string
	@return bool   bool
]]
function cc.FileUtils:writeValueMapToFile(const_ValueMap_dict,const_std_string_fullPath) end
--[[
	Write a ValueMap into a file, done async off the main cocos thread.
	Use this function if you need to write a ValueMap while not blocking the main cocos thread.
	This function takes ValueMap by value on purpose, to leverage move sematics.
	If you want to avoid a copy of your dict, use std::move/std::forward if appropriate
	@param dict The ValueMap that will be written to disk
	@param fullPath The absolute file path that the data will be written to
	@param callback The function that will be called when dict is written to disk. This
	function will be executed on the main cocos thread. It will have on boolean argument
	signifying if the write was successful.
]]
function cc.FileUtils:writeValueMapToFile(ValueMap_dict,const_std_string_fullPath) end
--[[
	Gets filename extension is a suffix (separated from the base filename by a dot) in lower case.
	Examples of filename extensions are .png, .jpeg, .exe, .dmg and .txt.
	@param filePath The path of the file, it could be a relative or absolute path.
	@return std_string   suffix for filename in lower case or empty if a dot not found.
]]
function cc.FileUtils:getFileExtension(const_std_string_filePath) end
--[[
	Sets writable path.
]]
function cc.FileUtils:setWritablePath(const_std_string_writablePath) end
--[[
	Sets whether to pop-up a message box when failed to load an image.
]]
function cc.FileUtils:setPopupNotify(bool_notify) end
--[[
	Checks whether the path is a directory.
	@param dirPath The path of the directory, it could be a relative or an absolute path.
	@return bool   True if the directory exists, false if not.
]]
function cc.FileUtils:isDirectoryExist(const_std_string_dirPath) end
--[[
	Checks whether the absoulate path is a directory, async off of the main cocos thread.
	@param dirPath The path of the directory, it must be an absolute path
	@param callback that will accept a boolean, true if the file exists, false otherwise.
	Callback will happen on the main cocos thread.
]]
function cc.FileUtils:isDirectoryExist(const_std_string_fullPath) end
--[[
	Set default resource root path.
]]
function cc.FileUtils:setDefaultResourceRootPath(const_std_string_path) end
--[[
	Gets the array that contains the search order of the resources.
	@see setSearchResolutionsOrder(const std::vector<std::string>&), fullPathForFilename(const char*).
	@since v2.1
	@lua NA
	@return [luaIde#std_vector__std_string__]
]]
function cc.FileUtils:getSearchResolutionsOrder() end
--[[
	Creates a directory.
	@param dirPath The path of the directory, it must be an absolute path.
	@return bool   True if the directory have been created successfully, false if not.
]]
function cc.FileUtils:createDirectory(const_std_string_dirPath) end
--[[
	Create a directory, async off the main cocos thread.
	@param dirPath the path of the directory, it must be an absolute path
	@param callback The function that will be called when the operation is complete. Will have one boolean
	argument, true if the directory was successfully, false otherwise.
]]
function cc.FileUtils:createDirectory(const_std_string_dirPath) end
--[[
	List all files in a directory async, off of the main cocos thread.
	@param dirPath The path of the directory, it could be a relative or an absolute path.
	@param callback The callback to be called once the list operation is complete. Will be called on the main cocos thread.
	@js NA
	@lua NA
]]
function cc.FileUtils:listFilesAsync(const_std_string_dirPath) end
--[[
	Gets the writable path.
	@return std_string    The path that can be write/read a file in
]]
function cc.FileUtils:getWritablePath() end
--[[
	List all files recursively in a directory.
	@param dirPath The path of the directory, it could be a relative or an absolute path.
	@return File paths in a string vector
]]
function cc.FileUtils:listFilesRecursively(const_std_string_dirPath) end
--[[
	Destroys the instance of FileUtils.
]]
function cc.FileUtils:destroyInstance() end
--[[
	Gets the instance of FileUtils.
	@return [luaIde#cc.FileUtils]
]]
function cc.FileUtils:getInstance() end

--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventAcceleration.h
]]
cc.EventAcceleration = {}


--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventCustom.h
]]
cc.EventCustom = {}
--[[
	Gets event name.
	@return std_string   The name of the event.
]]
function cc.EventCustom:getEventName() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListener.h
]]
cc.EventListener = {}
--[[
	Enables or disables the listener.
	@note Only listeners with `enabled` state will be able to receive events.
	When an listener was initialized, it's enabled by default.
	An event listener can receive events when it is enabled and is not paused.
	paused state is always false when it is a fixed priority listener.
	@param enabled True if enables the listener.
]]
function cc.EventListener:setEnabled(bool_enabled) end
--[[
	Checks whether the listener is enabled.
	@return bool   True if the listener is enabled.
]]
function cc.EventListener:isEnabled() end
--[[
	Clones the listener, its subclasses have to override this method.
	@return [luaIde#cc.EventListener]
]]
function cc.EventListener:clone() end
--[[
	Checks whether the listener is available.
	@return bool   True if the listener is available.
]]
function cc.EventListener:checkAvailable() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventDispatcher.h
]]
cc.EventDispatcher = {}
--[[
	Pauses all listeners which are associated the specified target.
	@param target A given target node.
	@param recursive True if pause recursively, the default value is false.
]]
function cc.EventDispatcher:pauseEventListenersForTarget(Node_target,bool_recursive) end
--[[
	Adds a event listener for a specified event with the priority of scene graph.
	@param listener The listener of a specified event.
	@param node The priority of the listener is based on the draw order of this node.
	@note  The priority of scene graph will be fixed value 0. So the order of listener item
	in the vector will be ' <0, scene graph (0 priority), >0'.
]]
function cc.EventDispatcher:addEventListenerWithSceneGraphPriority(EventListener_listener,Node_node) end
--[[
	Whether to enable dispatching events.
	@param isEnabled  True if enable dispatching events.
]]
function cc.EventDispatcher:setEnabled(bool_isEnabled) end
--[[
	Adds a event listener for a specified event with the fixed priority.
	@param listener The listener of a specified event.
	@param fixedPriority The fixed priority of the listener.
	@note A lower priority will be called before the ones that have a higher value.
	0 priority is forbidden for fixed priority since it's used for scene graph based priority.
]]
function cc.EventDispatcher:addEventListenerWithFixedPriority(EventListener_listener,int_fixedPriority) end
--[[
	Remove a listener.
	@param listener The specified event listener which needs to be removed.
]]
function cc.EventDispatcher:removeEventListener(EventListener_listener) end
--[[
	Dispatches a Custom Event with a event name an optional user data.
	@param eventName The name of the event which needs to be dispatched.
	@param optionalUserData The optional user data, it's a void*, the default value is nullptr.
]]
function cc.EventDispatcher:dispatchCustomEvent(const_std_string_eventName,void_optionalUserData) end
--[[
	Resumes all listeners which are associated the specified target.
	@param target A given target node.
	@param recursive True if resume recursively, the default value is false.
]]
function cc.EventDispatcher:resumeEventListenersForTarget(Node_target,bool_recursive) end
--[[
	Removes all listeners which are associated with the specified target.
	@param target A given target node.
	@param recursive True if remove recursively, the default value is false.
]]
function cc.EventDispatcher:removeEventListenersForTarget(Node_target,bool_recursive) end
--[[
	Sets listener's priority with fixed value.
	@param listener A given listener.
	@param fixedPriority The fixed priority value.
]]
function cc.EventDispatcher:setPriority(EventListener_listener,int_fixedPriority) end
--[[
	Adds a Custom event listener.
	It will use a fixed priority of 1.
	@param eventName A given name of the event.
	@param callback A given callback method that associated the event name.
	@return [luaIde#cc.EventListenerCustom]   the generated event. Needed in order to remove the event from the dispatcher
]]
function cc.EventDispatcher:addCustomEventListener(const_std_string_eventName) end
--[[
	Dispatches the event.
	Also removes all EventListeners marked for deletion from the
	event dispatcher list.
	@param event The event needs to be dispatched.
]]
function cc.EventDispatcher:dispatchEvent(Event_event) end
--[[
	Query whether the specified event listener id has been added.
	@param listenerID The listenerID of the event listener id.
	@return bool   True if dispatching events is exist
]]
function cc.EventDispatcher:hasEventListener(const_EventListener_ListenerID_listenerID) end
--[[
	Removes all listeners.
]]
function cc.EventDispatcher:removeAllEventListeners() end
--[[
	Removes all custom listeners with the same event name.
	@param customEventName A given event listener name which needs to be removed.
]]
function cc.EventDispatcher:removeCustomEventListeners(const_std_string_customEventName) end
--[[
	Checks whether dispatching events is enabled.
	@return bool   True if dispatching events is enabled.
]]
function cc.EventDispatcher:isEnabled() end
--[[
	Removes all listeners with the same event listener type.
	@param listenerType A given event listener type which needs to be removed.
]]
function cc.EventDispatcher:removeEventListenersForType(EventListener_Type_listenerType) end

--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventFocus.h
]]
cc.EventFocus = {}
function cc.EventFocus:new() end 


--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerAcceleration.h
]]
cc.EventListenerAcceleration = {}
--[[
	@return bool
]]
function cc.EventListenerAcceleration:init() end

--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerCustom.h
]]
cc.EventListenerCustom = {}
function cc.EventListenerCustom:new() end 


--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerFocus.h
]]
cc.EventListenerFocus = {}
--[[
	@return bool
]]
function cc.EventListenerFocus:init() end

--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerKeyboard.h
]]
cc.EventListenerKeyboard = {}
--[[
	@return bool
]]
function cc.EventListenerKeyboard:init() end

--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventMouse.h
]]
cc.EventMouse = {}
--[[
	Returns the previous touch location in screen coordinates.
	@return [luaIde#cc.Vec2]   The previous touch location in screen coordinates.
	@js NA
]]
function cc.EventMouse:getPreviousLocationInView() end
--[[
	Returns the current touch location in OpenGL coordinates.
	@return [luaIde#cc.Vec2]   The current touch location in OpenGL coordinates.
]]
function cc.EventMouse:getLocation() end
--[[
	Get mouse button.
	@return [luaIde#MouseButton]   The mouse button.
	@js getButton
]]
function cc.EventMouse:getMouseButton() end
--[[
	Returns the previous touch location in OpenGL coordinates.
	@return [luaIde#cc.Vec2]   The previous touch location in OpenGL coordinates.
	@js NA
]]
function cc.EventMouse:getPreviousLocation() end
--[[
	Returns the delta of 2 current touches locations in screen coordinates.
	@return [luaIde#cc.Vec2]   The delta of 2 current touches locations in screen coordinates.
]]
function cc.EventMouse:getDelta() end
--[[
	Set mouse scroll data.
	@param scrollX The scroll data of x axis.
	@param scrollY The scroll data of y axis.
]]
function cc.EventMouse:setScrollData(float_scrollX,float_scrollY) end
--[[
	Returns the start touch location in screen coordinates.
	@return [luaIde#cc.Vec2]   The start touch location in screen coordinates.
	@js NA
]]
function cc.EventMouse:getStartLocationInView() end
--[[
	Returns the start touch location in OpenGL coordinates.
	@return [luaIde#cc.Vec2]   The start touch location in OpenGL coordinates.
	@js NA
]]
function cc.EventMouse:getStartLocation() end
--[[
	Set mouse button.
	@param button a given mouse button.
	@js setButton
]]
function cc.EventMouse:setMouseButton(MouseButton_button) end
--[[
	Returns the current touch location in screen coordinates.
	@return [luaIde#cc.Vec2]   The current touch location in screen coordinates.
]]
function cc.EventMouse:getLocationInView() end
--[[
	Get mouse scroll data of y axis.
	@return float   The scroll data of y axis.
]]
function cc.EventMouse:getScrollY() end
--[[
	Get mouse scroll data of x axis.
	@return float   The scroll data of x axis.
]]
function cc.EventMouse:getScrollX() end
--[[
	Get the cursor position of x axis.
	@return float   The x coordinate of cursor position.
	@js getLocationX
]]
function cc.EventMouse:getCursorX() end
--[[
	Get the cursor position of y axis.
	@return float   The y coordinate of cursor position.
	@js getLocationY
]]
function cc.EventMouse:getCursorY() end
--[[
	Set the cursor position.
	@param x The x coordinate of cursor position.
	@param y The y coordinate of cursor position.
	@js setLocation
]]
function cc.EventMouse:setCursorPosition(float_x,float_y) end

--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerMouse.h
]]
cc.EventListenerMouse = {}
--[[
	@return bool
]]
function cc.EventListenerMouse:init() end

--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerController.h
]]
cc.EventListenerController = {}
--[[
	Create a controller event listener.
	@return [luaIde#cc.EventListenerController]   An autoreleased EventListenerController object.
]]
function cc.EventListenerController:create() end

--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerTouch.h
]]
cc.EventListenerTouchOneByOne = {}
--[[
	Is swall touches or not.
	@return bool   True if needs to swall touches.
]]
function cc.EventListenerTouchOneByOne:isSwallowTouches() end
--[[
	Whether or not to swall touches.
	@param needSwallow True if needs to swall touches.
]]
function cc.EventListenerTouchOneByOne:setSwallowTouches(bool_needSwallow) end
--[[
	@return bool
]]
function cc.EventListenerTouchOneByOne:init() end

--[[
	@SuperType[luaIde#cc.EventListener]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventListenerTouch.h
]]
cc.EventListenerTouchAllAtOnce = {}
--[[
	@return bool
]]
function cc.EventListenerTouchAllAtOnce:init() end

--[[
	@SuperType[luaIde#cc.Event]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/base/CCEventController.h
]]
cc.EventController = {}
--[[
	Gets the event type of the controller.
	@return [luaIde#ControllerEventType]   The event type of the controller.
]]
function cc.EventController:getControllerEventType() end
--[[
	Sets the connect status.
	@param True if it's connected.
]]
function cc.EventController:setConnectStatus(bool_isConnected) end
--[[
	Gets the connect status.
	@return bool   True if it's connected.
]]
function cc.EventController:isConnected() end
function cc.EventController:setKeyCode(int_keyCode) end
--[[
	@return [luaIde#cc.Controller]
]]
function cc.EventController:getController() end
--[[
	Gets the key code of the controller.
	@return int   The key code of the controller.
]]
function cc.EventController:getKeyCode() end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionCamera.h
]]
cc.ActionCamera = {}
--[[
	Sets the Eye value of the Camera.
	@param eye The Eye value of the Camera.
	@js NA
]]
function cc.ActionCamera:setEye(const_Vec3_eye) end
--[[
	Returns the Eye value of the Camera.
	@return [luaIde#cc.Vec3]   The Eye value of the Camera.
	@js NA
]]
function cc.ActionCamera:getEye() end
--[[
	Sets the Up value of the Camera.
	@param up The Up value of the Camera.
	@js NA
]]
function cc.ActionCamera:setUp(const_Vec3_up) end
--[[
	Returns the Center value of the Camera.
	@return [luaIde#cc.Vec3]   The Center value of the Camera.
	@js NA
]]
function cc.ActionCamera:getCenter() end
--[[
	Sets the Center value of the Camera.
	@param center The Center value of the Camera.
	@js NA
]]
function cc.ActionCamera:setCenter(const_Vec3_center) end
--[[
	Returns the Up value of the Camera.
	@return [luaIde#cc.Vec3]   The Up value of the Camera.
	@js NA
]]
function cc.ActionCamera:getUp() end

--[[
	@SuperType[luaIde#cc.ActionCamera]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionCamera.h
]]
cc.OrbitCamera = {}
--[[
	Initializes a OrbitCamera action with radius, delta-radius,  z, deltaZ, x, deltaX.
	@return bool
]]
function cc.OrbitCamera:initWithDuration(float_t,float_radius,float_deltaRadius,float_angleZ,float_deltaAngleZ,float_angleX,float_deltaAngleX) end
--[[
	Creates a OrbitCamera action with radius, delta-radius,  z, deltaZ, x, deltaX.
	@param t Duration in seconds.
	@param radius The start radius.
	@param deltaRadius The delta radius.
	@param angleZ The start angle in Z.
	@param deltaAngleZ The delta angle in Z.
	@param angleX The start angle in X.
	@param deltaAngleX The delta angle in X.
	@return [luaIde#cc.OrbitCamera]   An OrbitCamera.
]]
function cc.OrbitCamera:create(float_t,float_radius,float_deltaRadius,float_angleZ,float_deltaAngleZ,float_angleX,float_deltaAngleX) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionCatmullRom.h
]]
cc.CardinalSplineTo = {}
--[[
	Return a PointArray.
	@return [luaIde#PointArray]   A PointArray.
]]
function cc.CardinalSplineTo:getPoints() end
--[[
	It will update the target position and change the _previousPosition to newPos
	@param newPos The new position.
]]
function cc.CardinalSplineTo:updatePosition(const_Vec2_newPos) end
--[[
	Initializes the action with a duration and an array of points.
	@param duration In seconds.
	@param points An PointArray.
	@param tension Goodness of fit.
	@return bool
]]
function cc.CardinalSplineTo:initWithDuration(float_duration,PointArray_points,float_tension) end

--[[
	@SuperType[luaIde#cc.CardinalSplineTo]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionCatmullRom.h
]]
cc.CardinalSplineBy = {}
function cc.CardinalSplineBy:new() end 


--[[
	@SuperType[luaIde#cc.CardinalSplineTo]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionCatmullRom.h
]]
cc.CatmullRomTo = {}
--[[
	Initializes the action with a duration and an array of points.
	@param dt In seconds.
	@param points An PointArray.
	@return bool
]]
function cc.CatmullRomTo:initWithDuration(float_dt,PointArray_points) end

--[[
	@SuperType[luaIde#cc.CardinalSplineBy]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionCatmullRom.h
]]
cc.CatmullRomBy = {}
--[[
	Initializes the action with a duration and an array of points.
	@param dt In seconds.
	@param points An PointArray.
	@return bool
]]
function cc.CatmullRomBy:initWithDuration(float_dt,PointArray_points) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionEase.h
]]
cc.ActionEase = {}
--[[
	@brief Initializes the action.
	@return bool   Return true when the initialization success, otherwise return false.
]]
function cc.ActionEase:initWithAction(ActionInterval_action) end
--[[
	@brief Get the pointer of the inner action.
	@return [luaIde#cc.ActionInterval]   The pointer of the inner action.
]]
function cc.ActionEase:getInnerAction() end

--[[
	@SuperType[luaIde#cc.ActionEase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionEase.h
]]
cc.EaseRateAction = {}
--[[
	@brief Set the rate value for the ease rate action.
	@param rate The value will be set.
]]
function cc.EaseRateAction:setRate(float_rate) end
--[[
	@brief Initializes the action with the inner action and the rate parameter.
	@param pAction The pointer of the inner action.
	@param fRate The value of the rate parameter.
	@return bool   Return true when the initialization success, otherwise return false.
]]
function cc.EaseRateAction:initWithAction(ActionInterval_pAction,float_fRate) end
--[[
	@brief Get the rate value of the ease rate action.
	@return float   Return the rate value of the ease rate action.
]]
function cc.EaseRateAction:getRate() end
--[[
	@return [luaIde#cc.EaseRateAction]
]]
function cc.EaseRateAction:create(ActionInterval_action,float_rate) end

--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseExponentialIn = {}
function cc.EaseExponentialIn:new() end 
function cc.EaseExponentialIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseExponentialOut = {}
function cc.EaseExponentialOut:new() end 
function cc.EaseExponentialOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseExponentialInOut = {}
function cc.EaseExponentialInOut:new() end 
function cc.EaseExponentialInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseSineIn = {}
function cc.EaseSineIn:new() end 
function cc.EaseSineIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseSineOut = {}
function cc.EaseSineOut:new() end 
function cc.EaseSineOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseSineInOut = {}
function cc.EaseSineInOut:new() end 
function cc.EaseSineInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionEase.h
]]
cc.EaseBounce = {}


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseBounceIn = {}
function cc.EaseBounceIn:new() end 
function cc.EaseBounceIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseBounceOut = {}
function cc.EaseBounceOut:new() end 
function cc.EaseBounceOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseBounceInOut = {}
function cc.EaseBounceInOut:new() end 
function cc.EaseBounceInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseBackIn = {}
function cc.EaseBackIn:new() end 
function cc.EaseBackIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseBackOut = {}
function cc.EaseBackOut:new() end 
function cc.EaseBackOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseBackInOut = {}
function cc.EaseBackInOut:new() end 
function cc.EaseBackInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuadraticActionIn = {}
function cc.EaseQuadraticActionIn:new() end 
function cc.EaseQuadraticActionIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuadraticActionOut = {}
function cc.EaseQuadraticActionOut:new() end 
function cc.EaseQuadraticActionOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuadraticActionInOut = {}
function cc.EaseQuadraticActionInOut:new() end 
function cc.EaseQuadraticActionInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuarticActionIn = {}
function cc.EaseQuarticActionIn:new() end 
function cc.EaseQuarticActionIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuarticActionOut = {}
function cc.EaseQuarticActionOut:new() end 
function cc.EaseQuarticActionOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuarticActionInOut = {}
function cc.EaseQuarticActionInOut:new() end 
function cc.EaseQuarticActionInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuinticActionIn = {}
function cc.EaseQuinticActionIn:new() end 
function cc.EaseQuinticActionIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuinticActionOut = {}
function cc.EaseQuinticActionOut:new() end 
function cc.EaseQuinticActionOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseQuinticActionInOut = {}
function cc.EaseQuinticActionInOut:new() end 
function cc.EaseQuinticActionInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseCircleActionIn = {}
function cc.EaseCircleActionIn:new() end 
function cc.EaseCircleActionIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseCircleActionOut = {}
function cc.EaseCircleActionOut:new() end 
function cc.EaseCircleActionOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseCircleActionInOut = {}
function cc.EaseCircleActionInOut:new() end 
function cc.EaseCircleActionInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseCubicActionIn = {}
function cc.EaseCubicActionIn:new() end 
function cc.EaseCubicActionIn:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseCubicActionOut = {}
function cc.EaseCubicActionOut:new() end 
function cc.EaseCubicActionOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
]]
cc.EaseCubicActionInOut = {}
function cc.EaseCubicActionInOut:new() end 
function cc.EaseCubicActionInOut:create() end 


--[[
	@SuperType[luaIde#cc.EaseRateAction]
]]
cc.EaseIn = {}
function cc.EaseIn:new() end 
function cc.EaseIn:create() end 


--[[
	@SuperType[luaIde#cc.EaseRateAction]
]]
cc.EaseOut = {}
function cc.EaseOut:new() end 
function cc.EaseOut:create() end 


--[[
	@SuperType[luaIde#cc.EaseRateAction]
]]
cc.EaseInOut = {}
function cc.EaseInOut:new() end 
function cc.EaseInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionEase.h
]]
cc.EaseElastic = {}
--[[
	@brief Set period of the wave in radians.
	@param fPeriod The value will be set.
]]
function cc.EaseElastic:setPeriod(float_fPeriod) end
--[[
	@brief Initializes the action with the inner action and the period in radians.
	@param action The pointer of the inner action.
	@param period Period of the wave in radians. Default is 0.3.
	@return bool   Return true when the initialization success, otherwise return false.
]]
function cc.EaseElastic:initWithAction(ActionInterval_action,float_period) end
--[[
	@brief Get period of the wave in radians. Default value is 0.3.
	@return float   Return the period of the wave in radians.
]]
function cc.EaseElastic:getPeriod() end

--[[
	@SuperType[luaIde#cc.EaseElastic]
]]
cc.EaseElasticIn = {}
function cc.EaseElasticIn:new() end 
function cc.EaseElasticIn:create() end 


--[[
	@SuperType[luaIde#cc.EaseElastic]
]]
cc.EaseElasticOut = {}
function cc.EaseElasticOut:new() end 
function cc.EaseElasticOut:create() end 


--[[
	@SuperType[luaIde#cc.EaseElastic]
]]
cc.EaseElasticInOut = {}
function cc.EaseElasticInOut:new() end 
function cc.EaseElasticInOut:create() end 


--[[
	@SuperType[luaIde#cc.ActionEase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionEase.h
]]
cc.EaseBezierAction = {}
--[[
	@brief Set the bezier parameters.
]]
function cc.EaseBezierAction:setBezierParamer(float_p0,float_p1,float_p2,float_p3) end
--[[
	@brief Create the action with the inner action.
	@param action The pointer of the inner action.
	@return [luaIde#cc.EaseBezierAction]   A pointer of EaseBezierAction action. If creation failed, return nil.
]]
function cc.EaseBezierAction:create(cocos2d_ActionInterval_action) end

--[[
	@SuperType[luaIde#cc.FiniteTimeAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.ActionInstant = {}


--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.Show = {}
--[[
	Allocates and initializes the action.
	@return [luaIde#cc.Show]    An autoreleased Show object.
]]
function cc.Show:create() end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.Hide = {}
--[[
	Allocates and initializes the action.
	@return [luaIde#cc.Hide]   An autoreleased Hide object.
]]
function cc.Hide:create() end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.ToggleVisibility = {}
--[[
	Allocates and initializes the action.
	@return [luaIde#cc.ToggleVisibility]   An autoreleased ToggleVisibility object.
]]
function cc.ToggleVisibility:create() end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.RemoveSelf = {}
--[[
	init the action
	@return bool
]]
function cc.RemoveSelf:init(bool_isNeedCleanUp) end
--[[
	Create the action.
	@param isNeedCleanUp Is need to clean up, the default value is true.
	@return [luaIde#cc.RemoveSelf]   An autoreleased RemoveSelf object.
]]
function cc.RemoveSelf:create(bool_isNeedCleanUp) end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.FlipX = {}
--[[
	init the action
	@return bool
]]
function cc.FlipX:initWithFlipX(bool_x) end
--[[
	Create the action.
	@param x Flips the sprite horizontally if true.
	@return [luaIde#cc.FlipX]    An autoreleased FlipX object.
]]
function cc.FlipX:create(bool_x) end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.FlipY = {}
--[[
	init the action
	@return bool
]]
function cc.FlipY:initWithFlipY(bool_y) end
--[[
	Create the action.
	@param y Flips the sprite vertically if true.
	@return [luaIde#cc.FlipY]   An autoreleased FlipY object.
]]
function cc.FlipY:create(bool_y) end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.Place = {}
--[[
	Initializes a Place action with a position
	@return bool
]]
function cc.Place:initWithPosition(const_Vec2_pos) end
--[[
	Creates a Place action with a position.
	@param pos  A certain position.
	@return [luaIde#cc.Place]    An autoreleased Place object.
]]
function cc.Place:create(const_Vec2_pos) end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionInstant.h
]]
cc.CallFunc = {}
--[[
	Executes the callback.
]]
function cc.CallFunc:execute() end
--[[
	Get the selector target.
	@return [luaIde#cc.Ref]   The selector target.
]]
function cc.CallFunc:getTargetCallback() end
--[[
	Set the selector target.
	@param sel The selector target.
]]
function cc.CallFunc:setTargetCallback(Ref_sel) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid.h
]]
cc.GridAction = {}
--[[
	@brief Get the pointer of GridBase.
	@return [luaIde#cc.GridBase]   The pointer of GridBase.
]]
function cc.GridAction:getGrid() end
--[[
	@brief Initializes the action with size and duration.
	@param duration The duration of the GridAction. It's a value in seconds.
	@param gridSize The size of the GridAction should be.
	@return bool   Return true when the initialization success, otherwise return false.
]]
function cc.GridAction:initWithDuration(float_duration,const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.GridAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid.h
]]
cc.Grid3DAction = {}
--[[
	@brief Get the effect grid rect.
	@return [luaIde#cc.Rect]   Return the effect grid rect.
]]
function cc.Grid3DAction:getGridRect() end

--[[
	@SuperType[luaIde#cc.GridAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid.h
]]
cc.TiledGrid3DAction = {}


--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid.h
]]
cc.StopGrid = {}
--[[
	@brief Create a StopGrid Action.
	@return [luaIde#cc.StopGrid]   Return a pointer of StopGrid. When the creation failed, return nil.
]]
function cc.StopGrid:create() end

--[[
	@SuperType[luaIde#cc.ActionInstant]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid.h
]]
cc.ReuseGrid = {}
--[[
	@brief Initializes an action with the number of times that the current grid will be reused.
	@param times Specify times the grid will be reused.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.ReuseGrid:initWithTimes(int_times) end
--[[
	@brief Create an action with the number of times that the current grid will be reused.
	@param times Specify times the grid will be reused.
	@return [luaIde#cc.ReuseGrid]   Return a pointer of ReuseGrid. When the creation failed, return nil.
]]
function cc.ReuseGrid:create(int_times) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Waves3D = {}
--[[
	@brief Set the amplitude rate of the effect.
	@param amplitudeRate The value of amplitude rate will be set.
]]
function cc.Waves3D:setAmplitudeRate(float_amplitudeRate) end
--[[
	@brief Initializes an action with duration, grid size, waves and amplitude.
	@param duration Specify the duration of the Waves3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the Waves3D action.
	@param amplitude Specify the amplitude of the Waves3D action.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.Waves3D:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude) end
--[[
	@brief Get the amplitude of the effect.
	@return float   Return the amplitude of the effect.
]]
function cc.Waves3D:getAmplitude() end
--[[
	@brief Get the amplitude rate of the effect.
	@return float   Return the amplitude rate of the effect.
]]
function cc.Waves3D:getAmplitudeRate() end
--[[
	@brief Set the amplitude to the effect.
	@param amplitude The value of amplitude will be set.
]]
function cc.Waves3D:setAmplitude(float_amplitude) end
--[[
	@brief Create an action with duration, grid size, waves and amplitude.
	@param duration Specify the duration of the Waves3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the Waves3D action.
	@param amplitude Specify the amplitude of the Waves3D action.
	@return [luaIde#cc.Waves3D]   If the creation success, return a pointer of Waves3D action; otherwise, return nil.
]]
function cc.Waves3D:create(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.FlipX3D = {}
--[[
	@brief Initializes an action with duration and grid size.
	@param gridSize Specify the grid size of the FlipX3D action.
	@param duration Specify the duration of the FlipX3D action. It's a value in seconds.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.FlipX3D:initWithSize(const_Size_gridSize,float_duration) end
--[[
	@brief Initializes an action with duration.
	@param duration Specify the duration of the FlipX3D action. It's a value in seconds.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.FlipX3D:initWithDuration(float_duration) end
--[[
	@brief Create the action with duration.
	@param duration Specify the duration of the FilpX3D action. It's a value in seconds.
	@return [luaIde#cc.FlipX3D]   If the creation success, return a pointer of FilpX3D action; otherwise, return nil.
]]
function cc.FlipX3D:create(float_duration) end

--[[
	@SuperType[luaIde#cc.FlipX3D]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.FlipY3D = {}
--[[
	@brief Create the action with duration.
	@param duration Specify the duration of the FlipY3D action. It's a value in seconds.
	@return [luaIde#cc.FlipY3D]   If the creation success, return a pointer of FlipY3D action; otherwise, return nil.
]]
function cc.FlipY3D:create(float_duration) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Lens3D = {}
--[[
	@brief Set whether lens is concave.
	@param concave Whether lens is concave.
]]
function cc.Lens3D:setConcave(bool_concave) end
--[[
	@brief Initializes the action with center position, radius, grid size and duration.
	@param duration Specify the duration of the Lens3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param position Specify the center position of the lens effect.
	@param radius Specify the radius of the lens effect.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.Lens3D:initWithDuration(float_duration,const_Size_gridSize,const_Vec2_position,float_radius) end
--[[
	@brief Set the value of lens effect.
	@param lensEffect The value of lens effect will be set.
]]
function cc.Lens3D:setLensEffect(float_lensEffect) end
--[[
	@brief Get the value of lens effect. Default value is 0.7.
	@return float   The value of lens effect.
]]
function cc.Lens3D:getLensEffect() end
--[[
	@brief Set the center position of lens effect.
	@param position The center position will be set.
]]
function cc.Lens3D:setPosition(const_Vec2_position) end
--[[
	@brief Get the center position of lens effect.
	@return [luaIde#cc.Vec2]   The center position of lens effect.
]]
function cc.Lens3D:getPosition() end
--[[
	@brief Create the action with center position, radius, a grid size and duration.
	@param duration Specify the duration of the Lens3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param position Specify the center position of the lens.
	@param radius Specify the radius of the lens.
	@return [luaIde#cc.Lens3D]   If the creation success, return a pointer of Lens3D action; otherwise, return nil.
]]
function cc.Lens3D:create(float_duration,const_Size_gridSize,const_Vec2_position,float_radius) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Ripple3D = {}
--[[
	@brief Set the amplitude rate of ripple effect.
	@param fAmplitudeRate The amplitude rate of ripple effect.
]]
function cc.Ripple3D:setAmplitudeRate(float_fAmplitudeRate) end
--[[
	@brief Initializes the action with center position, radius, number of waves, amplitude, a grid size and duration.
	@param duration Specify the duration of the Ripple3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param position Specify the center position of the ripple effect.
	@param radius Specify the radius of the ripple effect.
	@param waves Specify the waves count of the ripple effect.
	@param amplitude Specify the amplitude of the ripple effect.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.Ripple3D:initWithDuration(float_duration,const_Size_gridSize,const_Vec2_position,float_radius,unsigned_int_waves,float_amplitude) end
--[[
	@brief Get the amplitude rate of ripple effect.
	@return float   The amplitude rate of ripple effect.
]]
function cc.Ripple3D:getAmplitudeRate() end
--[[
	@brief Set the amplitude of ripple effect.
	@param fAmplitude The amplitude of ripple effect.
]]
function cc.Ripple3D:setAmplitude(float_fAmplitude) end
--[[
	@brief Get the amplitude of ripple effect.
	@return float   The amplitude of ripple effect.
]]
function cc.Ripple3D:getAmplitude() end
--[[
	@brief Set the center position of ripple effect.
	@param position The center position of ripple effect will be set.
]]
function cc.Ripple3D:setPosition(const_Vec2_position) end
--[[
	@brief Get the center position of ripple effect.
	@return [luaIde#cc.Vec2]   The center position of ripple effect.
]]
function cc.Ripple3D:getPosition() end
--[[
	@brief Create the action with center position, radius, number of waves, amplitude, a grid size and duration.
	@param duration Specify the duration of the Ripple3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param position Specify the center position of the ripple effect.
	@param radius Specify the radius of the ripple effect.
	@param waves Specify the waves count of the ripple effect.
	@param amplitude Specify the amplitude of the ripple effect.
	@return [luaIde#cc.Ripple3D]   If the creation success, return a pointer of Ripple3D action; otherwise, return nil.
]]
function cc.Ripple3D:create(float_duration,const_Size_gridSize,const_Vec2_position,float_radius,unsigned_int_waves,float_amplitude) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Shaky3D = {}
--[[
	@brief Initializes the action with a range, shake Z vertices, grid size and duration.
	@param duration Specify the duration of the Shaky3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param range Specify the range of the shaky effect.
	@param shakeZ Specify whether shake on the z axis.
	@return bool   If the Initialization success, return true; otherwise, return false.
]]
function cc.Shaky3D:initWithDuration(float_duration,const_Size_gridSize,int_range,bool_shakeZ) end
--[[
	@brief Create the action with a range, shake Z vertices, a grid and duration.
	@param initWithDuration Specify the duration of the Shaky3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param range Specify the range of the shaky effect.
	@param shakeZ Specify whether shake on the z axis.
	@return [luaIde#cc.Shaky3D]   If the creation success, return a pointer of Shaky3D action; otherwise, return nil.
]]
function cc.Shaky3D:create(float_initWithDuration,const_Size_gridSize,int_range,bool_shakeZ) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Liquid = {}
--[[
	@brief Set the amplitude rate of the effect.
	@param amplitudeRate The value of amplitude rate will be set.
]]
function cc.Liquid:setAmplitudeRate(float_amplitudeRate) end
--[[
	@brief Initializes the action with amplitude, grid size, waves count and duration.
	@param duration Specify the duration of the Liquid action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the Liquid action.
	@param amplitude Specify the amplitude of the Liquid action.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.Liquid:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude) end
--[[
	@brief Get the amplitude of the effect.
	@return float   Return the amplitude of the effect.
]]
function cc.Liquid:getAmplitude() end
--[[
	@brief Get the amplitude rate of the effect.
	@return float   Return the amplitude rate of the effect.
]]
function cc.Liquid:getAmplitudeRate() end
--[[
	@brief Set the amplitude to the effect.
	@param amplitude The value of amplitude will be set.
]]
function cc.Liquid:setAmplitude(float_amplitude) end
--[[
	@brief Create the action with amplitude, grid size, waves count and duration.
	@param duration Specify the duration of the Liquid action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the Liquid action.
	@param amplitude Specify the amplitude of the Liquid action.
	@return [luaIde#cc.Liquid]   If the creation success, return a pointer of Liquid action; otherwise, return nil.
]]
function cc.Liquid:create(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Waves = {}
--[[
	@brief Set the amplitude rate of the effect.
	@param amplitudeRate The value of amplitude rate will be set.
]]
function cc.Waves:setAmplitudeRate(float_amplitudeRate) end
--[[
	@brief Initializes the action with amplitude, horizontal sin, vertical sin, grid size, waves count and duration.
	@param duration Specify the duration of the Waves action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the Waves action.
	@param amplitude Specify the amplitude of the Waves action.
	@param horizontal Specify whether waves on horizontal.
	@param vertical Specify whether waves on vertical.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.Waves:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude,bool_horizontal,bool_vertical) end
--[[
	@brief Get the amplitude of the effect.
	@return float   Return the amplitude of the effect.
]]
function cc.Waves:getAmplitude() end
--[[
	@brief Get the amplitude rate of the effect.
	@return float   Return the amplitude rate of the effect.
]]
function cc.Waves:getAmplitudeRate() end
--[[
	@brief Set the amplitude to the effect.
	@param amplitude The value of amplitude will be set.
]]
function cc.Waves:setAmplitude(float_amplitude) end
--[[
	@brief Create the action with amplitude, horizontal sin, vertical sin, grid size, waves count and duration.
	@param duration Specify the duration of the Waves action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the Waves action.
	@param amplitude Specify the amplitude of the Waves action.
	@param horizontal Specify whether waves on horizontal.
	@param vertical Specify whether waves on vertical.
	@return [luaIde#cc.Waves]   If the creation success, return a pointer of Waves action; otherwise, return nil.
]]
function cc.Waves:create(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude,bool_horizontal,bool_vertical) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionGrid3D.h
]]
cc.Twirl = {}
--[[
	@brief Set the amplitude rate of the effect.
	@param amplitudeRate The value of amplitude rate will be set.
]]
function cc.Twirl:setAmplitudeRate(float_amplitudeRate) end
--[[
	@brief Initializes the action with center position, number of twirls, amplitude, a grid size and duration.
	@param duration Specify the duration of the Twirl action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param position Specify the center position of the twirl action.
	@param twirls Specify the twirls count of the Twirl action.
	@param amplitude Specify the amplitude of the Twirl action.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.Twirl:initWithDuration(float_duration,const_Size_gridSize,const_Vec2_position,unsigned_int_twirls,float_amplitude) end
--[[
	@brief Get the amplitude rate of the effect.
	@return float   Return the amplitude rate of the effect.
]]
function cc.Twirl:getAmplitudeRate() end
--[[
	@brief Set the amplitude to the effect.
	@param amplitude The value of amplitude will be set.
]]
function cc.Twirl:setAmplitude(float_amplitude) end
--[[
	@brief Get the amplitude of the effect.
	@return float   Return the amplitude of the effect.
]]
function cc.Twirl:getAmplitude() end
--[[
	@brief Set the center position of twirl action.
	@param position The center position of twirl action will be set.
]]
function cc.Twirl:setPosition(const_Vec2_position) end
--[[
	@brief Get the center position of twirl action.
	@return [luaIde#cc.Vec2]   The center position of twirl action.
]]
function cc.Twirl:getPosition() end
--[[
	@brief Create the action with center position, number of twirls, amplitude, a grid size and duration.
	@param duration Specify the duration of the Twirl action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param position Specify the center position of the twirl action.
	@param twirls Specify the twirls count of the Twirl action.
	@param amplitude Specify the amplitude of the Twirl action.
	@return [luaIde#cc.Twirl]   If the creation success, return a pointer of Twirl action; otherwise, return nil.
]]
function cc.Twirl:create(float_duration,const_Size_gridSize,const_Vec2_position,unsigned_int_twirls,float_amplitude) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionManager.h
]]
cc.ActionManager = {}
--[[
	Gets an action given its tag an a target.
	@param tag       The action's tag.
	@param target    A certain target.
	@return [luaIde#cc.Action]    The Action the with the given tag.
]]
function cc.ActionManager:getActionByTag(int_tag,const_Node_target) end
--[[
	Removes an action given its tag and the target.
	@param tag       The action's tag.
	@param target    A certain target.
]]
function cc.ActionManager:removeActionByTag(int_tag,Node_target) end
--[[
	Removes all actions matching at least one bit in flags and the target.
	@param flags     The flag field to match the actions' flags based on bitwise AND.
	@param target    A certain target.
	@js NA
]]
function cc.ActionManager:removeActionsByFlags(unsigned_int_flags,Node_target) end
--[[
	Removes all actions from all the targets.
]]
function cc.ActionManager:removeAllActions() end
--[[
	Adds an action with a target.
	If the target is already present, then the action will be added to the existing target.
	If the target is not present, a new instance of this target will be created either paused or not, and the action will be added to the newly created target.
	When the target is paused, the queued actions won't be 'ticked'.
	@param action    A certain action.
	@param target    The target which need to be added an action.
	@param paused    Is the target paused or not.
]]
function cc.ActionManager:addAction(Action_action,Node_target,bool_paused) end
--[[
	Resumes the target. All queued actions will be resumed.
	@param target    A certain target.
]]
function cc.ActionManager:resumeTarget(Node_target) end
--[[
	Returns the numbers of actions that are running in all targets.
	@return ssize_t    The numbers of actions that are running in all target.
	@js NA
]]
function cc.ActionManager:getNumberOfRunningActions() end
--[[
	Pauses the target: all running actions and newly added actions will be paused.
	@param target    A certain target.
]]
function cc.ActionManager:pauseTarget(Node_target) end
--[[
	Returns the numbers of actions that are running in a certain target.
	Composable actions are counted as 1 action. Example:
	- If you are running 1 Sequence of 7 actions, it will return 1.
	- If you are running 7 Sequences of 2 actions, it will return 7.
	@param target    A certain target.
	@return ssize_t    The numbers of actions that are running in a certain target.
	@js NA
]]
function cc.ActionManager:getNumberOfRunningActionsInTarget(const_Node_target) end
--[[
	Removes all actions from a certain target.
	All the actions that belongs to the target will be removed.
	@param target    A certain target.
]]
function cc.ActionManager:removeAllActionsFromTarget(Node_target) end
--[[
	Resume a set of targets (convenience function to reverse a pauseAllRunningActions call).
	@param targetsToResume   A set of targets need to be resumed.
]]
function cc.ActionManager:resumeTargets() end
--[[
	Removes an action given an action reference.
	@param action    A certain target.
]]
function cc.ActionManager:removeAction(Action_action) end
--[[
	Pauses all running actions, returning a list of targets whose actions were paused.
	@return [luaIde#Vector__Node__]    A list of targets whose actions were paused.
]]
function cc.ActionManager:pauseAllRunningActions() end
--[[
	Main loop of ActionManager.
	@param dt    In seconds.
]]
function cc.ActionManager:update(float_dt) end
--[[
	Removes all actions given its tag and the target.
	@param tag       The actions' tag.
	@param target    A certain target.
	@js NA
]]
function cc.ActionManager:removeAllActionsByTag(int_tag,Node_target) end
--[[
	Returns the numbers of actions that are running in a
	certain target with a specific tag.
	Like getNumberOfRunningActionsInTarget Composable actions
	are counted as 1 action. Example:
	- If you are running 1 Sequence of 7 actions, it will return 1.
	- If you are running 7 Sequences of 2 actions, it will return 7.
	@param target    A certain target.
	@param tag       Tag that will be searched.
	@return [luaIde#size_t]    The numbers of actions that are running in a certain target
	with a specific tag.
	@see getNumberOfRunningActionsInTarget
	@js NA
]]
function cc.ActionManager:getNumberOfRunningActionsInTargetByTag(const_Node_target,int_tag) end

--[[
	@SuperType[luaIde#cc.Grid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionPageTurn3D.h
]]
cc.PageTurn3D = {}
--[[
	@brief Create an action with duration, grid size.
	@param duration Specify the duration of the PageTurn3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@return [luaIde#cc.PageTurn3D]   If the creation success, return a pointer of PageTurn3D action; otherwise, return nil.
]]
function cc.PageTurn3D:create(float_duration,const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionProgressTimer.h
]]
cc.ProgressTo = {}
--[[
	@brief Initializes with a duration and destination percentage.
	@param duration Specify the duration of the ProgressTo action. It's a value in seconds.
	@param percent Specify the destination percentage.
	@return bool   If the creation success, return true; otherwise, return false.
]]
function cc.ProgressTo:initWithDuration(float_duration,float_percent) end
--[[
	@brief Create and initializes with a duration and a destination percentage.
	@param duration Specify the duration of the ProgressTo action. It's a value in seconds.
	@param percent Specify the destination percentage.
	@return [luaIde#cc.ProgressTo]   If the creation success, return a pointer of ProgressTo action; otherwise, return nil.
]]
function cc.ProgressTo:create(float_duration,float_percent) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionProgressTimer.h
]]
cc.ProgressFromTo = {}
--[[
	@brief Initializes the action with a duration, a "from" percentage and a "to" percentage.
	@param duration Specify the duration of the ProgressFromTo action. It's a value in seconds.
	@param fromPercentage Specify the source percentage.
	@param toPercentage Specify the destination percentage.
	@return bool   If the creation success, return true; otherwise, return false.
]]
function cc.ProgressFromTo:initWithDuration(float_duration,float_fromPercentage,float_toPercentage) end
--[[
	@brief Create and initializes the action with a duration, a "from" percentage and a "to" percentage.
	@param duration Specify the duration of the ProgressFromTo action. It's a value in seconds.
	@param fromPercentage Specify the source percentage.
	@param toPercentage Specify the destination percentage.
	@return [luaIde#cc.ProgressFromTo]   If the creation success, return a pointer of ProgressFromTo action; otherwise, return nil.
]]
function cc.ProgressFromTo:create(float_duration,float_fromPercentage,float_toPercentage) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.ShakyTiles3D = {}
--[[
	@brief Initializes the action with a range, shake Z vertices, grid size and duration.
	@param duration Specify the duration of the ShakyTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param range Specify the range of the shaky effect.
	@param shakeZ Specify whether shake on the z axis.
	@return bool   If the Initialization success, return true; otherwise, return false.
]]
function cc.ShakyTiles3D:initWithDuration(float_duration,const_Size_gridSize,int_range,bool_shakeZ) end
--[[
	@brief Create the action with a range, shake Z vertices, a grid and duration.
	@param duration Specify the duration of the ShakyTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param range Specify the range of the shaky effect.
	@param shakeZ Specify whether shake on the z axis.
	@return [luaIde#cc.ShakyTiles3D]   If the creation success, return a pointer of ShakyTiles3D action; otherwise, return nil.
]]
function cc.ShakyTiles3D:create(float_duration,const_Size_gridSize,int_range,bool_shakeZ) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.ShatteredTiles3D = {}
--[[
	@brief Initializes the action with a range, shatter Z vertices, grid size and duration.
	@param duration Specify the duration of the ShatteredTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param range Specify the range of the shatter effect.
	@param shatterZ Specify whether shake on the z axis.
	@return bool   If the Initialization success, return true; otherwise, return false.
]]
function cc.ShatteredTiles3D:initWithDuration(float_duration,const_Size_gridSize,int_range,bool_shatterZ) end
--[[
	@brief Create the action with a range, whether of not to shatter Z vertices, grid size and duration.
	@param duration Specify the duration of the ShatteredTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param range Specify the range of the shatter effect.
	@param shatterZ Specify whether shatter on the z axis.
	@return [luaIde#cc.ShatteredTiles3D]   If the creation success, return a pointer of ShatteredTiles3D action; otherwise, return nil.
]]
function cc.ShatteredTiles3D:create(float_duration,const_Size_gridSize,int_range,bool_shatterZ) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.ShuffleTiles = {}
--[[
	@brief Initializes the action with grid size, random seed and duration.
	@param duration Specify the duration of the ShuffleTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param seed Specify the random seed.
	@return bool   If the Initialization success, return true; otherwise, return false.
]]
function cc.ShuffleTiles:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_seed) end
--[[
	@return [luaIde#cc.Size]
]]
function cc.ShuffleTiles:getDelta(const_Size_pos) end
--[[
	@brief Create the action with grid size, random seed and duration.
	@param duration Specify the duration of the ShuffleTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param seed Specify the random seed.
	@return [luaIde#cc.ShuffleTiles]   If the creation success, return a pointer of ShuffleTiles action; otherwise, return nil.
]]
function cc.ShuffleTiles:create(float_duration,const_Size_gridSize,unsigned_int_seed) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.FadeOutTRTiles = {}
--[[
	@brief Show the tile at specified position.
	@param pos The position index of the tile should be shown.
]]
function cc.FadeOutTRTiles:turnOnTile(const_Vec2_pos) end
--[[
	@brief Hide the tile at specified position.
	@param pos The position index of the tile should be hide.
]]
function cc.FadeOutTRTiles:turnOffTile(const_Vec2_pos) end
--[[
	@brief Show part of the tile.
	@param pos The position index of the tile should be shown.
	@param distance The percentage that the tile should be shown.
]]
function cc.FadeOutTRTiles:transformTile(const_Vec2_pos,float_distance) end
--[[
	@brief Calculate the percentage a tile should be shown.
	@param pos The position index of the tile.
	@param time The current percentage of the action.
	@return float   Return the percentage the tile should be shown.
]]
function cc.FadeOutTRTiles:testFunc(const_Size_pos,float_time) end
--[[
	@brief Create the action with the grid size and the duration.
	@param duration Specify the duration of the FadeOutTRTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@return [luaIde#cc.FadeOutTRTiles]   If the creation success, return a pointer of FadeOutTRTiles action; otherwise, return nil.
]]
function cc.FadeOutTRTiles:create(float_duration,const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.FadeOutTRTiles]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.FadeOutBLTiles = {}
--[[
	@brief Create the action with the grid size and the duration.
	@param duration Specify the duration of the FadeOutBLTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@return [luaIde#cc.FadeOutBLTiles]   If the creation success, return a pointer of FadeOutBLTiles action; otherwise, return nil.
]]
function cc.FadeOutBLTiles:create(float_duration,const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.FadeOutTRTiles]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.FadeOutUpTiles = {}
--[[
	@brief Create the action with the grid size and the duration.
	@param duration Specify the duration of the FadeOutUpTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@return [luaIde#cc.FadeOutUpTiles]   If the creation success, return a pointer of FadeOutUpTiles action; otherwise, return nil.
]]
function cc.FadeOutUpTiles:create(float_duration,const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.FadeOutUpTiles]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.FadeOutDownTiles = {}
--[[
	@brief Create the action with the grid size and the duration.
	@param duration Specify the duration of the FadeOutDownTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@return [luaIde#cc.FadeOutDownTiles]   If the creation success, return a pointer of FadeOutDownTiles action; otherwise, return nil.
]]
function cc.FadeOutDownTiles:create(float_duration,const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.TurnOffTiles = {}
--[[
	@brief Show the tile at specified position.
	@param pos The position index of the tile should be shown.
]]
function cc.TurnOffTiles:turnOnTile(const_Vec2_pos) end
--[[
	@brief Hide the tile at specified position.
	@param pos The position index of the tile should be hide.
]]
function cc.TurnOffTiles:turnOffTile(const_Vec2_pos) end
--[[
	@brief Initializes the action with grid size, random seed and duration.
	@param duration Specify the duration of the TurnOffTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param seed Specify the random seed.
	@return bool   If the Initialization success, return true; otherwise, return false.
]]
function cc.TurnOffTiles:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_seed) end
--[[
	@brief Create the action with the grid size and the duration.
	@param duration Specify the duration of the TurnOffTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@return [luaIde#cc.TurnOffTiles]   If the creation success, return a pointer of TurnOffTiles action; otherwise, return nil.
]]
function cc.TurnOffTiles:create(float_duration,const_Size_gridSize) end
--[[
	@brief Create the action with the grid size and the duration.
	@param duration Specify the duration of the TurnOffTiles action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param seed Specify the random seed.
	@return [luaIde#cc.TurnOffTiles]   If the creation success, return a pointer of TurnOffTiles action; otherwise, return nil.
]]
function cc.TurnOffTiles:create(float_duration,const_Size_gridSize,unsigned_int_seed) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.WavesTiles3D = {}
--[[
	@brief Set the amplitude rate of the effect.
	@param amplitudeRate The value of amplitude rate will be set.
]]
function cc.WavesTiles3D:setAmplitudeRate(float_amplitudeRate) end
--[[
	@brief Initializes an action with duration, grid size, waves count and amplitude.
	@param duration Specify the duration of the WavesTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the WavesTiles3D action.
	@param amplitude Specify the amplitude of the WavesTiles3D action.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.WavesTiles3D:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude) end
--[[
	@brief Get the amplitude of the effect.
	@return float   Return the amplitude of the effect.
]]
function cc.WavesTiles3D:getAmplitude() end
--[[
	@brief Get the amplitude rate of the effect.
	@return float   Return the amplitude rate of the effect.
]]
function cc.WavesTiles3D:getAmplitudeRate() end
--[[
	@brief Set the amplitude to the effect.
	@param amplitude The value of amplitude will be set.
]]
function cc.WavesTiles3D:setAmplitude(float_amplitude) end
--[[
	@brief Create the action with a number of waves, the waves amplitude, the grid size and the duration.
	@param duration Specify the duration of the WavesTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param waves Specify the waves count of the WavesTiles3D action.
	@param amplitude Specify the amplitude of the WavesTiles3D action.
	@return [luaIde#cc.WavesTiles3D]   If the creation success, return a pointer of WavesTiles3D action; otherwise, return nil.
]]
function cc.WavesTiles3D:create(float_duration,const_Size_gridSize,unsigned_int_waves,float_amplitude) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.JumpTiles3D = {}
--[[
	@brief Set the amplitude rate of the effect.
	@param amplitudeRate The value of amplitude rate will be set.
]]
function cc.JumpTiles3D:setAmplitudeRate(float_amplitudeRate) end
--[[
	@brief Initializes the action with the number of jumps, the sin amplitude, the grid size and the duration.
	@param duration Specify the duration of the JumpTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param numberOfJumps Specify the jump tiles count.
	@param amplitude Specify the amplitude of the JumpTiles3D action.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.JumpTiles3D:initWithDuration(float_duration,const_Size_gridSize,unsigned_int_numberOfJumps,float_amplitude) end
--[[
	@brief Get the amplitude of the effect.
	@return float   Return the amplitude of the effect.
]]
function cc.JumpTiles3D:getAmplitude() end
--[[
	@brief Get the amplitude rate of the effect.
	@return float   Return the amplitude rate of the effect.
]]
function cc.JumpTiles3D:getAmplitudeRate() end
--[[
	@brief Set the amplitude to the effect.
	@param amplitude The value of amplitude will be set.
]]
function cc.JumpTiles3D:setAmplitude(float_amplitude) end
--[[
	@brief Create the action with the number of jumps, the sin amplitude, the grid size and the duration.
	@param duration Specify the duration of the JumpTiles3D action. It's a value in seconds.
	@param gridSize Specify the size of the grid.
	@param numberOfJumps Specify the jump tiles count.
	@param amplitude Specify the amplitude of the JumpTiles3D action.
	@return [luaIde#cc.JumpTiles3D]   If the creation success, return a pointer of JumpTiles3D action; otherwise, return nil.
]]
function cc.JumpTiles3D:create(float_duration,const_Size_gridSize,unsigned_int_numberOfJumps,float_amplitude) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.SplitRows = {}
--[[
	@brief Initializes the action with the number rows and the duration.
	@param duration Specify the duration of the SplitRows action. It's a value in seconds.
	@param rows Specify the rows count should be split.
	@return bool   If the creation success, return true; otherwise, return false.
]]
function cc.SplitRows:initWithDuration(float_duration,unsigned_int_rows) end
--[[
	@brief Create the action with the number of rows and the duration.
	@param duration Specify the duration of the SplitRows action. It's a value in seconds.
	@param rows Specify the rows count should be split.
	@return [luaIde#cc.SplitRows]   If the creation success, return a pointer of SplitRows action; otherwise, return nil.
]]
function cc.SplitRows:create(float_duration,unsigned_int_rows) end

--[[
	@SuperType[luaIde#cc.TiledGrid3DAction]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTiledGrid.h
]]
cc.SplitCols = {}
--[[
	@brief Initializes the action with the number columns and the duration.
	@param duration Specify the duration of the SplitCols action. It's a value in seconds.
	@param cols Specify the columns count should be split.
	@return bool   If the creation success, return true; otherwise, return false.
]]
function cc.SplitCols:initWithDuration(float_duration,unsigned_int_cols) end
--[[
	@brief Create the action with the number of columns and the duration.
	@param duration Specify the duration of the SplitCols action. It's a value in seconds.
	@param cols Specify the columns count should be split.
	@return [luaIde#cc.SplitCols]   If the creation success, return a pointer of SplitCols action; otherwise, return nil.
]]
function cc.SplitCols:create(float_duration,unsigned_int_cols) end

--[[
	@SuperType[luaIde#cc.ActionInterval]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCActionTween.h
]]
cc.ActionTween = {}
--[[
	@brief Initializes the action with the property name (key), and the from and to parameters.
	@param duration The duration of the ActionTween. It's a value in seconds.
	@param key The key of property which should be updated.
	@param from The value of the specified property when the action begin.
	@param to The value of the specified property when the action end.
	@return bool   If the initialization success, return true; otherwise, return false.
]]
function cc.ActionTween:initWithDuration(float_duration,const_std_string_key,float_from,float_to) end
--[[
	@brief Create and initializes the action with the property name (key), and the from and to parameters.
	@param duration The duration of the ActionTween. It's a value in seconds.
	@param key The key of property which should be updated.
	@param from The value of the specified property when the action begin.
	@param to The value of the specified property when the action end.
	@return [luaIde#cc.ActionTween]   If the creation success, return a pointer of ActionTween; otherwise, return nil.
]]
function cc.ActionTween:create(float_duration,const_std_string_key,float_from,float_to) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAtlasNode.h
]]
cc.AtlasNode = {}
--[[
	updates the Atlas (indexed vertex array).
	Shall be overridden in subclasses.
]]
function cc.AtlasNode:updateAtlasValues() end
--[[
	Initializes an AtlasNode  with an Atlas file the width and height of each item and the quantity of items to rende
	@return bool
]]
function cc.AtlasNode:initWithTileFile(const_std_string_tile,int_tileWidth,int_tileHeight,int_itemsToRender) end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.AtlasNode:getTexture() end
--[[
	Set an buffer manager of the texture vertex.
]]
function cc.AtlasNode:setTextureAtlas(TextureAtlas_textureAtlas) end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed
	In js: var setBlendFunc(var src, var dst)
	@endcode
	@lua NA
]]
function cc.AtlasNode:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Return the buffer manager of the texture vertex.
	@return [luaIde#TextureAtlas]   Return A TextureAtlas.
]]
function cc.AtlasNode:getTextureAtlas() end
--[[
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.AtlasNode:getBlendFunc() end
--[[
	@return ssize_t
]]
function cc.AtlasNode:getQuadsToDraw() end
function cc.AtlasNode:setTexture(Texture2D_texture) end
--[[
	Initializes an AtlasNode  with a texture the width and height of each item measured in points and the quantity of items to rende
	@return bool
]]
function cc.AtlasNode:initWithTexture(Texture2D_texture,int_tileWidth,int_tileHeight,int_itemsToRender) end
function cc.AtlasNode:setQuadsToDraw(ssize_t_quadsToDraw) end
--[[
	creates a AtlasNode  with an Atlas file the width and height of each item and the quantity of items to render.
	@param filename The path of Atlas file.
	@param tileWidth The width of the item.
	@param tileHeight The height of the item.
	@param itemsToRender The quantity of items to render.
	@return [luaIde#cc.AtlasNode]
]]
function cc.AtlasNode:create(const_std_string_filename,int_tileWidth,int_tileHeight,int_itemsToRender) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCClippingNode.h
]]
cc.ClippingNode = {}
--[[
	If stencil has no children it will not be drawn.
	If you have custom stencil-based node with stencil drawing mechanics other then children-based,
	then this method should return true every time you wish stencil to be visited.
	By default returns true if has any children attached.
	@return bool   If you have custom stencil-based node with stencil drawing mechanics other then children-based,
	then this method should return true every time you wish stencil to be visited.
	By default returns true if has any children attached.
	@js NA
]]
function cc.ClippingNode:hasContent() end
--[[
	Set the ClippingNode whether or not invert.
	@param inverted A bool Type,to set the ClippingNode whether or not invert.
]]
function cc.ClippingNode:setInverted(bool_inverted) end
--[[
	Set the Node to use as a stencil to do the clipping.
	@param stencil The Node to use as a stencil to do the clipping.
]]
function cc.ClippingNode:setStencil(Node_stencil) end
--[[
	The alpha threshold.
	The content is drawn only where the stencil have pixel with alpha greater than the alphaThreshold.
	Should be a float between 0 and 1.
	This default to 1 (so alpha test is disabled).
	@return GLfloat   The alpha threshold value,Should be a float between 0 and 1.
]]
function cc.ClippingNode:getAlphaThreshold() end
--[[
	Initializes a clipping node without a stencil.
	@return bool
]]
function cc.ClippingNode:init() end
--[[
	Initializes a clipping node with an other node as its stencil.
	The stencil node will be retained, and its parent will be set to this clipping node.
	@return bool
]]
function cc.ClippingNode:init(Node_stencil) end
--[[
	The Node to use as a stencil to do the clipping.
	The stencil node will be retained.
	This default to nil.
	@return [luaIde#cc.Node]   The stencil node.
]]
function cc.ClippingNode:getStencil() end
--[[
	Set the alpha threshold.
	@param alphaThreshold The alpha threshold.
]]
function cc.ClippingNode:setAlphaThreshold(GLfloat_alphaThreshold) end
--[[
	Inverted. If this is set to true,
	the stencil is inverted, so the content is drawn where the stencil is NOT drawn.
	This default to false.
	@return bool   If the clippingNode is Inverted, it will be return true.
]]
function cc.ClippingNode:isInverted() end
--[[
	Creates and initializes a clipping node without a stencil.
	@return [luaIde#cc.ClippingNode]   An autorelease ClippingNode.
]]
function cc.ClippingNode:create() end
--[[
	Creates and initializes a clipping node with an other node as its stencil.
	The stencil node will be retained.
	@param stencil The stencil node.
	@return [luaIde#cc.ClippingNode]
]]
function cc.ClippingNode:create(Node_stencil) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCClippingRectangleNode.h
]]
cc.ClippingRectangleNode = {}
--[[
	@brief Get whether the clipping is enabled or not.
	@return bool   Whether the clipping is enabled or not. Default is true.
]]
function cc.ClippingRectangleNode:isClippingEnabled() end
--[[
	@brief Enable/Disable the clipping.
	@param enabled Pass true to enable clipping. Pass false to disable clipping.
]]
function cc.ClippingRectangleNode:setClippingEnabled(bool_enabled) end
--[[
	@brief Get the clipping rectangle.
	@return [luaIde#cc.Rect]   The clipping rectangle.
]]
function cc.ClippingRectangleNode:getClippingRegion() end
--[[
	@brief Set the clipping rectangle.
	@param clippingRegion Specify the clipping rectangle.
]]
function cc.ClippingRectangleNode:setClippingRegion(const_Rect_clippingRegion) end
--[[
	@brief Create node with specified clipping region.
	@param clippingRegion Specify the clipping rectangle.
	@return [luaIde#cc.ClippingRectangleNode]   If the creation success, return a pointer of ClippingRectangleNode; otherwise return nil.
]]
function cc.ClippingRectangleNode:create(const_Rect_clippingRegion) end
--[[
	@brief Create a clipping rectangle node.
	@return [luaIde#cc.ClippingRectangleNode]   If the creation success, return a pointer of ClippingRectangleNode; otherwise return nil.
]]
function cc.ClippingRectangleNode:create() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCDrawNode.h
]]
cc.DrawNode = {}
--[[
	Draw an line from origin to destination with color.
	@param origin The line origin.
	@param destination The line destination.
	@param color The line color.
	@js NA
]]
function cc.DrawNode:drawLine(const_Vec2_origin,const_Vec2_destination,const_Color4F_color) end
--[[
	Draws a rectangle given the origin and destination point measured in points.
	The origin and the destination can not have the same x and y coordinate.
	@param origin The rectangle origin.
	@param destination The rectangle destination.
	@param color The rectangle color.
]]
function cc.DrawNode:drawRect(const_Vec2_origin,const_Vec2_destination,const_Color4F_color) end
--[[
	Draws a rectangle with 4 points.
	@param p1 The rectangle vertex point.
	@param p2 The rectangle vertex point.
	@param p3 The rectangle vertex point.
	@param p4 The rectangle vertex point.
	@param color The rectangle color.
]]
function cc.DrawNode:drawRect(const_Vec2_p1,const_Vec2_p2,const_Vec2_p3,const_Vec2_p4,const_Color4F_color) end
--[[
	Draws a solid circle given the center, radius and number of segments.
	@param center The circle center point.
	@param radius The circle rotate of radius.
	@param angle  The circle angle.
	@param segments The number of segments.
	@param scaleX The scale value in x.
	@param scaleY The scale value in y.
	@param color The solid circle color.
	@js NA
]]
function cc.DrawNode:drawSolidCircle(const_Vec2_center,float_radius,float_angle,unsigned_int_segments,float_scaleX,float_scaleY,const_Color4F_color) end
--[[
	Draws a solid circle given the center, radius and number of segments.
	@param center The circle center point.
	@param radius The circle rotate of radius.
	@param angle  The circle angle.
	@param segments The number of segments.
	@param color The solid circle color.
	@js NA
]]
function cc.DrawNode:drawSolidCircle(const_Vec2_center,float_radius,float_angle,unsigned_int_segments,const_Color4F_color) end
function cc.DrawNode:setLineWidth(GLfloat_lineWidth) end
--[[
	@js NA
]]
function cc.DrawNode:onDrawGLPoint(const_Mat4_transform,uint32_t_flags) end
--[[
	draw a dot at a position, with a given radius and color.
	@param pos The dot center.
	@param radius The dot radius.
	@param color The dot color.
]]
function cc.DrawNode:drawDot(const_Vec2_pos,float_radius,const_Color4F_color) end
--[[
	draw a segment with a radius and color.
	@param from The segment origin.
	@param to The segment destination.
	@param radius The segment radius.
	@param color The segment color.
]]
function cc.DrawNode:drawSegment(const_Vec2_from,const_Vec2_to,float_radius,const_Color4F_color) end
--[[
	Get the color mixed mode.
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.DrawNode:getBlendFunc() end
--[[
	@js NA
]]
function cc.DrawNode:onDraw(const_Mat4_transform,uint32_t_flags) end
--[[
	Draws a circle given the center, radius and number of segments.
	@param center The circle center point.
	@param radius The circle rotate of radius.
	@param angle  The circle angle.
	@param segments The number of segments.
	@param drawLineToCenter Whether or not draw the line from the origin to center.
	@param scaleX The scale value in x.
	@param scaleY The scale value in y.
	@param color Set the circle color.
]]
function cc.DrawNode:drawCircle(const_Vec2_center,float_radius,float_angle,unsigned_int_segments,bool_drawLineToCenter,float_scaleX,float_scaleY,const_Color4F_color) end
--[[
	Draws a circle given the center, radius and number of segments.
	@param center The circle center point.
	@param radius The circle rotate of radius.
	@param angle  The circle angle.
	@param segments The number of segments.
	@param drawLineToCenter Whether or not draw the line from the origin to center.
	@param color Set the circle color.
]]
function cc.DrawNode:drawCircle(const_Vec2_center,float_radius,float_angle,unsigned_int_segments,bool_drawLineToCenter,const_Color4F_color) end
--[[
	Draws a quad bezier path.
	@param origin The origin of the bezier path.
	@param control The control of the bezier path.
	@param destination The destination of the bezier path.
	@param segments The number of segments.
	@param color Set the quad bezier color.
]]
function cc.DrawNode:drawQuadBezier(const_Vec2_origin,const_Vec2_control,const_Vec2_destination,unsigned_int_segments,const_Color4F_color) end
--[[
	@js NA
]]
function cc.DrawNode:onDrawGLLine(const_Mat4_transform,uint32_t_flags) end
--[[
	draw a triangle with color.
	@param p1 The triangle vertex point.
	@param p2 The triangle vertex point.
	@param p3 The triangle vertex point.
	@param color The triangle color.
	@js NA
]]
function cc.DrawNode:drawTriangle(const_Vec2_p1,const_Vec2_p2,const_Vec2_p3,const_Color4F_color) end
--[[
	Set the color mixed mode.
	@code
	When this function bound into js or lua,the parameter will be changed
	In js: var setBlendFunc(var src, var dst)
	@endcode
	@lua NA
]]
function cc.DrawNode:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Clear the geometry in the node's buffer.
]]
function cc.DrawNode:clear() end
--[[
	Draws a solid rectangle given the origin and destination point measured in points.
	The origin and the destination can not have the same x and y coordinate.
	@param origin The rectangle origin.
	@param destination The rectangle destination.
	@param color The rectangle color.
	@js NA
]]
function cc.DrawNode:drawSolidRect(const_Vec2_origin,const_Vec2_destination,const_Color4F_color) end
--[[
	@return GLfloat
]]
function cc.DrawNode:getLineWidth() end
--[[
	Draw a point.
	@param point A Vec2 used to point.
	@param pointSize The point size.
	@param color The point color.
	@js NA
]]
function cc.DrawNode:drawPoint(const_Vec2_point,const_float_pointSize,const_Color4F_color) end
--[[
	Draw a cubic bezier curve with color and number of segments
	@param origin The origin of the bezier path.
	@param control1 The first control of the bezier path.
	@param control2 The second control of the bezier path.
	@param destination The destination of the bezier path.
	@param segments The number of segments.
	@param color Set the cubic bezier color.
]]
function cc.DrawNode:drawCubicBezier(const_Vec2_origin,const_Vec2_control1,const_Vec2_control2,const_Vec2_destination,unsigned_int_segments,const_Color4F_color) end
--[[
	creates and initialize a DrawNode node.
	@return [luaIde#cc.DrawNode]   Return an autorelease object.
]]
function cc.DrawNode:create(GLfloat_defaultLineWidth) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLabel.h
]]
cc.Label = {}
--[[
	@return bool
]]
function cc.Label:isClipMarginEnabled() end
--[[
	Enable shadow effect to Label.
	@todo Support blur for shadow effect.
]]
function cc.Label:enableShadow(const_Color4B_shadowColor,const_Size_offset,int_blurRadius) end
--[[
	Sets the untransformed size of the Label in a more efficient way.
]]
function cc.Label:setDimensions(float_width,float_height) end
--[[
	@return float
]]
function cc.Label:getWidth() end
--[[
	Return the text the Label is currently displaying
	@return std_string
]]
function cc.Label:getString() end
--[[
	@return float
]]
function cc.Label:getHeight() end
--[[
	Disable all effect applied to Label.
	@warning Please use disableEffect(LabelEffect::ALL) instead of this API.
]]
function cc.Label:disableEffect() end
--[[
	Disable effect to Label.
	@see `LabelEffect`
]]
function cc.Label:disableEffect(LabelEffect_effect) end
--[[
	Sets a new TTF configuration to Label.
	@see `TTFConfig`
	@return bool
]]
function cc.Label:setTTFConfig(const_TTFConfig_ttfConfig) end
--[[
	Returns the text color of the Label
	@return [luaIde#Color4B]
]]
function cc.Label:getTextColor() end
--[[
	@return [luaIde#cc.BlendFunc]
]]
function cc.Label:getBlendFunc() end
--[[
	Toggle wrap option of the label.
	Note: System font doesn't support manually toggle wrap.
	@param enable Set true to enable wrap and false to disable wrap.
]]
function cc.Label:enableWrap(bool_enable) end
--[[
	Makes the Label exactly this untransformed width.
	The Label's width be used for text align if the value not equal zero.
]]
function cc.Label:setWidth(float_width) end
--[[
	Returns the additional kerning of the Label.
	@warning Not support system font.
	@since v3.2.0
	@return float
]]
function cc.Label:getAdditionalKerning() end
--[[
	Return the user define BMFont size.
	@return float   The BMFont size in float value.
]]
function cc.Label:getBMFontSize() end
--[[
	@return float
]]
function cc.Label:getMaxLineWidth() end
--[[
	Returns the Label's text horizontal alignment
	@return [luaIde#TextHAlignment]
]]
function cc.Label:getHorizontalAlignment() end
--[[
	Return shadow effect offset value.
	@return [luaIde#cc.Size]
]]
function cc.Label:getShadowOffset() end
--[[
	@return float
]]
function cc.Label:getLineSpacing() end
--[[
	Clips upper and lower margin to reduce height of Label
]]
function cc.Label:setClipMarginEnabled(bool_clipEnabled) end
--[[
	Sets the text that this Label is to display
]]
function cc.Label:setString(const_std_string_text) end
--[[
	Sets a new system font to Label.
	@param font A font file or a font family name.
	@warning
]]
function cc.Label:setSystemFontName(const_std_string_font) end
--[[
	Query the wrap is enabled or not.
	Note: System font will always return true.
	@return bool
]]
function cc.Label:isWrapEnabled() end
--[[
	Return the outline effect size value.
	@return float
]]
function cc.Label:getOutlineSize() end
--[[
	Sets a new bitmap font to Label
	@return bool
]]
function cc.Label:setBMFontFilePath(const_std_string_bmfontFilePath,const_Vec2_imageOffset,float_fontSize) end
--[[
	@return bool
]]
function cc.Label:initWithTTF(const_TTFConfig_ttfConfig,const_std_string_text,TextHAlignment_hAlignment,int_maxLineWidth) end
--[[
	@return [luaIde#FontAtlas]
]]
function cc.Label:getFontAtlas() end
--[[
	Sets the line height of the Label.
	@warning Not support system font.
	@since v3.2.0
]]
function cc.Label:setLineHeight(float_height) end
--[[
	Sets the system font size of Label
]]
function cc.Label:setSystemFontSize(float_fontSize) end
--[[
	Change the label's Overflow type, currently only TTF and BMFont support all the valid Overflow type.
	Char Map font supports all the Overflow type except for SHRINK, because we can't measure it's font size.
	System font only support Overflow::Normal and Overflow::RESIZE_HEIGHT.
	@param overflow   see `Overflow`
]]
function cc.Label:setOverflow(Overflow_overflow) end
--[[
	Enables strikethrough.
	Underline and Strikethrough cannot be enabled at the same time.
	Strikethrough is like an underline but at the middle of the glyph
]]
function cc.Label:enableStrikethrough() end
--[[
	Update content immediately
]]
function cc.Label:updateContent() end
--[[
	Return length of string.
	@return int
]]
function cc.Label:getStringLength() end
--[[
	Specify what happens when a line is too long for Label.
	@param breakWithoutSpace Lines are automatically broken between words if this value is false.
]]
function cc.Label:setLineBreakWithoutSpace(bool_breakWithoutSpace) end
--[[
	Return the number of lines of text.
	@return int
]]
function cc.Label:getStringNumLines() end
--[[
	Enable outline effect to Label.
	@warning Limiting use to only when the Label created with true type font or system font.
]]
function cc.Label:enableOutline(const_Color4B_outlineColor,int_outlineSize) end
--[[
	Return the shadow effect blur radius.
	@return float
]]
function cc.Label:getShadowBlurRadius() end
--[[
	Return current effect color value.
	@return [luaIde#Color4F]
]]
function cc.Label:getEffectColor() end
function cc.Label:removeAllChildrenWithCleanup(bool_cleanup) end
--[[
	Sets a new char map configuration to Label.
	@see `createWithCharMap(const std::string&,int,int,int)`
	@return bool
]]
function cc.Label:setCharMap(const_std_string_charMapFile,int_itemWidth,int_itemHeight,int_startCharMap) end
--[[
	Sets a new char map configuration to Label.
	@see `createWithCharMap(Texture2D*,int,int,int)`
	@return bool
]]
function cc.Label:setCharMap(Texture2D_texture,int_itemWidth,int_itemHeight,int_startCharMap) end
--[[
	Sets a new char map configuration to Label.
	@see `createWithCharMap(const std::string&)`
	@return bool
]]
function cc.Label:setCharMap(const_std_string_plistFile) end
--[[
	@return [luaIde#cc.Size]
]]
function cc.Label:getDimensions() end
--[[
	Makes the Label at most this line untransformed width.
	The Label's max line width be used for force line breaks if the value not equal zero.
]]
function cc.Label:setMaxLineWidth(float_maxLineWidth) end
--[[
	Returns the system font used by the Label
	@return std_string
]]
function cc.Label:getSystemFontName() end
--[[
	Sets the Label's text vertical alignment
]]
function cc.Label:setVerticalAlignment(TextVAlignment_vAlignment) end
function cc.Label:setLineSpacing(float_height) end
--[[
	Returns the line height of this Label.
	@warning Not support system font.
	@since v3.2.0
	@return float
]]
function cc.Label:getLineHeight() end
--[[
	Return the shadow effect color value.
	@return [luaIde#Color4F]
]]
function cc.Label:getShadowColor() end
--[[
	Returns the TTF configuration object used by the Label.
	@see `TTFConfig`
	@return [luaIde#cc.TTFConfig]
]]
function cc.Label:getTTFConfig() end
--[[
	Enable italics rendering
]]
function cc.Label:enableItalics() end
--[[
	Sets the text color of Label.
	The text color is different from the color of Node.
	@warning Limiting use to only when the Label created with true type font or system font.
]]
function cc.Label:setTextColor(const_Color4B_color) end
--[[
	Provides a way to treat each character like a Sprite.
	@warning No support system font.
	@return [luaIde#cc.Sprite]
]]
function cc.Label:getLetter(int_lettetIndex) end
--[[
	Makes the Label exactly this untransformed height.
	The Label's height be used for text align if the value not equal zero.
	The text will display incomplete if the size of Label is not large enough to display all text.
]]
function cc.Label:setHeight(float_height) end
--[[
	Return whether the shadow effect is enabled.
	@return bool
]]
function cc.Label:isShadowEnabled() end
--[[
	Enable glow effect to Label.
	@warning Limiting use to only when the Label created with true type font.
]]
function cc.Label:enableGlow(const_Color4B_glowColor) end
--[[
	Query the label's Overflow type.
	@return [luaIde#Overflow]   see `Overflow`
]]
function cc.Label:getOverflow() end
--[[
	Returns the Label's text vertical alignment
	@return [luaIde#TextVAlignment]
]]
function cc.Label:getVerticalAlignment() end
--[[
	Sets the additional kerning of the Label.
	@warning Not support system font.
	@since v3.2.0
]]
function cc.Label:setAdditionalKerning(float_space) end
--[[
	Returns the bitmap font path used by the Label
	@return float
]]
function cc.Label:getSystemFontSize() end
function cc.Label:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Returns the Label's text horizontal alignment
	@return [luaIde#TextHAlignment]
]]
function cc.Label:getTextAlignment() end
--[[
	Returns the bitmap font used by the Label
	@return std_string
]]
function cc.Label:getBMFontFilePath() end
--[[
	Sets the Label's text horizontal alignment
]]
function cc.Label:setHorizontalAlignment(TextHAlignment_hAlignment) end
--[[
	Enable bold rendering
]]
function cc.Label:enableBold() end
--[[
	Enable underline
]]
function cc.Label:enableUnderline() end
--[[
	Return current effect type.
	@return [luaIde#LabelEffect]
]]
function cc.Label:getLabelEffectType() end
--[[
	Sets the Label's text horizontal alignment
]]
function cc.Label:setAlignment(TextHAlignment_hAlignment) end
--[[
	Sets the Label's text alignment
]]
function cc.Label:setAlignment(TextHAlignment_hAlignment,TextVAlignment_vAlignment) end
--[[
	@warning This method is not recommended for game developers.
]]
function cc.Label:requestSystemFontRefresh() end
--[[
	Change font size of label type BMFONT
	Note: This function only scale the BMFONT letter to mimic the font size change effect.
	@param fontSize The desired font size in float.
]]
function cc.Label:setBMFontSize(float_fontSize) end
--[[
	Allocates and initializes a Label, with default settings.
	@return [luaIde#cc.Label]   An automatically released Label object.
]]
function cc.Label:create() end
--[[
	Allocates and initializes a Label, with char map configuration.
	@param charMapFile A char map file, it's a PNG format.
	@param itemWidth The width in points of each element.
	@param itemHeight The height in points of each element.
	@param startCharMap The starting char of the char map.
	@return [luaIde#cc.Label]   An automatically released Label object.
]]
function cc.Label:createWithCharMap(const_std_string_charMapFile,int_itemWidth,int_itemHeight,int_startCharMap) end
--[[
	Allocates and initializes a Label, with char map configuration.
	@param texture A pointer to an existing Texture2D object.
	@param itemWidth The width in points of each element.
	@param itemHeight The height in points of each element.
	@param startCharMap The starting char of the char map.
	@return [luaIde#cc.Label]   An automatically released Label object.
]]
function cc.Label:createWithCharMap(Texture2D_texture,int_itemWidth,int_itemHeight,int_startCharMap) end
--[[
	Allocates and initializes a Label, with char map configuration.
	@param plistFile A configuration file of char map.
	@return [luaIde#cc.Label]   An automatically released Label object.
]]
function cc.Label:createWithCharMap(const_std_string_plistFile) end

--[[
	@SuperType[luaIde#cc.AtlasNode]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLabelAtlas.h
]]
cc.LabelAtlas = {}
function cc.LabelAtlas:setString(const_std_string_label) end
--[[
	Initializes the LabelAtlas with a string, a char map file(the atlas), the width and height of each element and the starting char of the atlas.
	@return bool
]]
function cc.LabelAtlas:initWithString(const_std_string_string,const_std_string_charMapFile,int_itemWidth,int_itemHeight,int_startCharMap) end
--[[
	Initializes the LabelAtlas with a string and a configuration file.
	@since v2.0
	@return bool
]]
function cc.LabelAtlas:initWithString(const_std_string_string,const_std_string_fntFile) end
--[[
	Initializes the LabelAtlas with a string, a texture, the width and height in points of each element and the starting char of the atlas
	@return bool
]]
function cc.LabelAtlas:initWithString(const_std_string_string,Texture2D_texture,int_itemWidth,int_itemHeight,int_startCharMap) end
--[[
	@return std_string
]]
function cc.LabelAtlas:getString() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLayer.h
]]
cc.Layer = {}
--[[
	Creates a fullscreen black layer.
	@return [luaIde#cc.Layer]   An autoreleased Layer object.
]]
function cc.Layer:create() end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLayer.h
]]
cc.LayerColor = {}
--[[
	Change width and height in Points.
	@param w The width of layer.
	@param h The Height of layer.
	@since v0.8
]]
function cc.LayerColor:changeWidthAndHeight(GLfloat_w,GLfloat_h) end
--[[
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.LayerColor:getBlendFunc() end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed
	In js: var setBlendFunc(var src, var dst)
	In lua: local setBlendFunc(local src, local dst)
	@endcode
]]
function cc.LayerColor:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Change width in Points.
	@param w The width of layer.
]]
function cc.LayerColor:changeWidth(GLfloat_w) end
--[[
	@return bool
]]
function cc.LayerColor:initWithColor(const_Color4B_color,GLfloat_width,GLfloat_height) end
--[[
	Change height in Points.
	@param h The height of layer.
]]
function cc.LayerColor:changeHeight(GLfloat_h) end
--[[
	Creates a fullscreen black layer.
	@return [luaIde#cc.LayerColor]   An autoreleased LayerColor object.
]]
function cc.LayerColor:create() end
--[[
	Creates a Layer with color, width and height in Points.
	@param color The color of layer.
	@param width The width of layer.
	@param height The height of layer.
	@return [luaIde#cc.LayerColor]   An autoreleased LayerColor object.
]]
function cc.LayerColor:create(const_Color4B_color,GLfloat_width,GLfloat_height) end
--[[
	Creates a Layer with color. Width and height are the window size.
	@param color The color of layer.
	@return [luaIde#cc.LayerColor]   An autoreleased LayerColor object.
]]
function cc.LayerColor:create(const_Color4B_color) end

--[[
	@SuperType[luaIde#cc.LayerColor]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLayer.h
]]
cc.LayerGradient = {}
--[[
	Returns the start color of the gradient.
	@return [luaIde#Color3B]   The start color.
]]
function cc.LayerGradient:getStartColor() end
--[[
	Get the compressedInterpolation
	@return bool   The interpolation will be compressed if true.
]]
function cc.LayerGradient:isCompressedInterpolation() end
--[[
	Returns the start opacity of the gradient.
	@return [luaIde#GLubyte]   The start opacity.
]]
function cc.LayerGradient:getStartOpacity() end
--[[
	Sets the directional vector that will be used for the gradient.
	The default value is vertical direction (0,-1).
	@param alongVector The direction of gradient.
]]
function cc.LayerGradient:setVector(const_Vec2_alongVector) end
--[[
	Returns the start opacity of the gradient.
	@param startOpacity The start opacity, from 0 to 255.
]]
function cc.LayerGradient:setStartOpacity(GLubyte_startOpacity) end
--[[
	Whether or not the interpolation will be compressed in order to display all the colors of the gradient both in canonical and non canonical vectors.
	Default: true.
	@param compressedInterpolation The interpolation will be compressed if true.
]]
function cc.LayerGradient:setCompressedInterpolation(bool_compressedInterpolation) end
--[[
	Returns the end opacity of the gradient.
	@param endOpacity The end opacity, from 0 to 255.
]]
function cc.LayerGradient:setEndOpacity(GLubyte_endOpacity) end
--[[
	Returns the directional vector used for the gradient.
	@return [luaIde#cc.Vec2]   The direction of gradient.
]]
function cc.LayerGradient:getVector() end
--[[
	Sets the end color of the gradient.
	@param endColor The end color.
]]
function cc.LayerGradient:setEndColor(const_Color3B_endColor) end
--[[
	Initializes the Layer with a gradient between start and end.
	@js init
	@lua init
	@return bool
]]
function cc.LayerGradient:initWithColor(const_Color4B_start,const_Color4B_end) end
--[[
	Initializes the Layer with a gradient between start and end in the direction of v.
	@js init
	@lua init
	@return bool
]]
function cc.LayerGradient:initWithColor(const_Color4B_start,const_Color4B_end,const_Vec2_v) end
--[[
	Returns the end color of the gradient.
	@return [luaIde#Color3B]   The end color.
]]
function cc.LayerGradient:getEndColor() end
--[[
	Returns the end opacity of the gradient.
	@return [luaIde#GLubyte]   The end opacity.
]]
function cc.LayerGradient:getEndOpacity() end
--[[
	Sets the start color of the gradient.
	@param startColor The start color.
]]
function cc.LayerGradient:setStartColor(const_Color3B_startColor) end
--[[
	Creates a fullscreen black layer.
	@return [luaIde#cc.LayerGradient]   An autoreleased LayerGradient object.
]]
function cc.LayerGradient:create() end
--[[
	Creates a full-screen Layer with a gradient between start and end.
	@param start The start color.
	@param end The end color.
	@return [luaIde#cc.LayerGradient]   An autoreleased LayerGradient object.
]]
function cc.LayerGradient:create(const_Color4B_start,const_Color4B_end) end
--[[
	Creates a full-screen Layer with a gradient between start and end in the direction of v.
	@param start The start color.
	@param end The end color.
	@param v The direction of gradient color.
	@return [luaIde#cc.LayerGradient]   An autoreleased LayerGradient object.
]]
function cc.LayerGradient:create(const_Color4B_start,const_Color4B_end,const_Vec2_v) end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLayer.h
]]
cc.LayerRadialGradient = {}
--[[
	@return [luaIde#Color4B]
]]
function cc.LayerRadialGradient:getStartColor() end
--[[
	@return [luaIde#cc.BlendFunc]
]]
function cc.LayerRadialGradient:getBlendFunc() end
--[[
	@return [luaIde#Color3B]
]]
function cc.LayerRadialGradient:getStartColor3B() end
--[[
	@return [luaIde#GLubyte]
]]
function cc.LayerRadialGradient:getStartOpacity() end
function cc.LayerRadialGradient:setCenter(const_Vec2_center) end
--[[
	@return [luaIde#Color4B]
]]
function cc.LayerRadialGradient:getEndColor() end
function cc.LayerRadialGradient:setStartOpacity(GLubyte_opacity) end
--[[
	@return [luaIde#cc.Vec2]
]]
function cc.LayerRadialGradient:getCenter() end
function cc.LayerRadialGradient:setEndOpacity(GLubyte_opacity) end
function cc.LayerRadialGradient:setExpand(float_expand) end
--[[
	@return [luaIde#GLubyte]
]]
function cc.LayerRadialGradient:getEndOpacity() end
--[[
	@return bool
]]
function cc.LayerRadialGradient:initWithColor(const_Color4B_startColor,const_Color4B_endColor,float_radius,const_Vec2_center,float_expand) end
function cc.LayerRadialGradient:setEndColor(const_Color3B_color) end
--[[
	@return [luaIde#Color3B]
]]
function cc.LayerRadialGradient:getEndColor3B() end
function cc.LayerRadialGradient:setRadius(float_radius) end
function cc.LayerRadialGradient:setStartColor(const_Color3B_color) end
--[[
	@return float
]]
function cc.LayerRadialGradient:getExpand() end
function cc.LayerRadialGradient:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	@return float
]]
function cc.LayerRadialGradient:getRadius() end
--[[
	Create a LayerRadialGradient
	@param startColor the inner color of the gradient
	@param endColor the out color of the gradient
	@param radius the radius of the gradient(length from center of gradient to outer color)
	@param center the position of the center of the gradient
	@param expand an alpha value(0.f-1.f) that specifies how much of that radius in only inner color(the gradient
	starts outside of that amount)
	@return [luaIde#cc.LayerRadialGradient]
]]
function cc.LayerRadialGradient:create(const_Color4B_startColor,const_Color4B_endColor,float_radius,const_Vec2_center,float_expand) end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLayer.h
]]
cc.LayerMultiplex = {}
--[[
	initializes a MultiplexLayer with an array of layers
	@since v2.1
	@return bool
]]
function cc.LayerMultiplex:initWithArray() end
--[[
	release the current layer and switches to another layer indexed by n.
	The current (old) layer will be removed from it's parent with 'cleanup=true'.
	@param n The layer indexed by n will display.
]]
function cc.LayerMultiplex:switchToAndReleaseMe(int_n) end
--[[
	Add a certain layer to LayerMultiplex.
	@param layer A layer need to be added to the LayerMultiplex.
]]
function cc.LayerMultiplex:addLayer(Layer_layer) end
--[[
	Switches to a certain layer indexed by n.
	The current (old) layer will be removed from it's parent with 'cleanup=true'.
	@param n The layer indexed by n will display.
]]
function cc.LayerMultiplex:switchTo(int_n) end
--[[
	The same as switchTo(int), but has a parameter to set if need to clean up child.
]]
function cc.LayerMultiplex:switchTo(int_n,bool_cleanup) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItem = {}
--[[
	Enables or disables the item.
]]
function cc.MenuItem:setEnabled(bool_value) end
--[[
	Activate the item.
]]
function cc.MenuItem:activate() end
--[[
	Returns whether or not the item is enabled.
	@return bool
]]
function cc.MenuItem:isEnabled() end
--[[
	The item was selected (not activated), similar to "mouse-over".
]]
function cc.MenuItem:selected() end
--[[
	Returns whether or not the item is selected.
	@return bool
]]
function cc.MenuItem:isSelected() end
--[[
	The item was unselected.
]]
function cc.MenuItem:unselected() end
--[[
	Returns the outside box.
	@return [luaIde#cc.Rect]
]]
function cc.MenuItem:rect() end

--[[
	@SuperType[luaIde#cc.MenuItem]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItemLabel = {}
--[[
	Sets the label that is rendered.
]]
function cc.MenuItemLabel:setLabel(Node_node) end
--[[
	Get the inner string of the inner label.
	@return std_string
]]
function cc.MenuItemLabel:getString() end
--[[
	Gets the color that will be used when the item is disabled.
	@return [luaIde#Color3B]
]]
function cc.MenuItemLabel:getDisabledColor() end
--[[
	Sets a new string to the inner label.
]]
function cc.MenuItemLabel:setString(const_std_string_label) end
--[[
	Initializes a MenuItemLabel with a Label, target and selector.
	@return bool
]]
function cc.MenuItemLabel:initWithLabel(Node_label,const_ccMenuCallback_callback) end
--[[
	Initializes a MenuItemLabel with a Label, target and selector.
	@return bool
]]
function cc.MenuItemLabel:initWithLabel(Node_label,Ref_target,SEL_MenuHandler_selector) end
--[[
	Sets the color that will be used when the item is disabled.
]]
function cc.MenuItemLabel:setDisabledColor(const_Color3B_color) end
--[[
	Gets the label that is rendered.
	@return [luaIde#cc.Node]
]]
function cc.MenuItemLabel:getLabel() end

--[[
	@SuperType[luaIde#cc.MenuItemLabel]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItemAtlasFont = {}
--[[
	Initializes a menu item from a string and atlas with a target/selector.
	@return bool
]]
function cc.MenuItemAtlasFont:initWithString(const_std_string_value,const_std_string_charMapFile,int_itemWidth,int_itemHeight,char_startCharMap,Ref_target,SEL_MenuHandler_selector) end
--[[
	Initializes a menu item from a string and atlas with a target/selector.
	@return bool
]]
function cc.MenuItemAtlasFont:initWithString(const_std_string_value,const_std_string_charMapFile,int_itemWidth,int_itemHeight,char_startCharMap,const_ccMenuCallback_callback) end

--[[
	@SuperType[luaIde#cc.MenuItemLabel]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItemFont = {}
--[[
	Returns the name of the Font.
	@js getFontNameObj
	@js NA
	@return std_string
]]
function cc.MenuItemFont:getFontNameObj() end
--[[
	Set the font name .
	c++ can not overload static and non-static member functions with the same parameter types.
	so change the name to setFontNameObj.
	@js setFontName
	@js NA
]]
function cc.MenuItemFont:setFontNameObj(const_std_string_name) end
--[[
	Initializes a menu item from a string with a target/selector.
	@return bool
]]
function cc.MenuItemFont:initWithString(const_std_string_value,Ref_target,SEL_MenuHandler_selector) end
--[[
	Initializes a menu item from a string with a target/selector.
	@return bool
]]
function cc.MenuItemFont:initWithString(const_std_string_value,const_ccMenuCallback_callback) end
--[[
	get font size .
	@js getFontSize
	@js NA
	@return int
]]
function cc.MenuItemFont:getFontSizeObj() end
--[[
	Set font size.
	c++ can not overload static and non-static member functions with the same parameter types.
	so change the name to setFontSizeObj.
	@js setFontSize
	@js NA
]]
function cc.MenuItemFont:setFontSizeObj(int_size) end
--[[
	Set the default font name.
]]
function cc.MenuItemFont:setFontName(const_std_string_name) end
--[[
	Get default font size.
	@return int
]]
function cc.MenuItemFont:getFontSize() end
--[[
	Get the default font name.
	@return std_string
]]
function cc.MenuItemFont:getFontName() end
--[[
	Set default font size.
]]
function cc.MenuItemFont:setFontSize(int_size) end

--[[
	@SuperType[luaIde#cc.MenuItem]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItemSprite = {}
--[[
	Enables or disables the item.
]]
function cc.MenuItemSprite:setEnabled(bool_bEnabled) end
--[[
	The item was selected (not activated), similar to "mouse-over".
	@since v0.99.5
]]
function cc.MenuItemSprite:selected() end
--[[
	Sets the image used when the item is not selected.
]]
function cc.MenuItemSprite:setNormalImage(Node_image) end
--[[
	Sets the image used when the item is disabled.
]]
function cc.MenuItemSprite:setDisabledImage(Node_image) end
--[[
	Initializes a menu item with a normal, selected and disabled image with target/selector.
	@return bool
]]
function cc.MenuItemSprite:initWithNormalSprite(Node_normalSprite,Node_selectedSprite,Node_disabledSprite,Ref_target,SEL_MenuHandler_selector) end
--[[
	Initializes a menu item with a normal, selected and disabled image with a callable object.
	@return bool
]]
function cc.MenuItemSprite:initWithNormalSprite(Node_normalSprite,Node_selectedSprite,Node_disabledSprite,const_ccMenuCallback_callback) end
--[[
	Sets the image used when the item is selected.
]]
function cc.MenuItemSprite:setSelectedImage(Node_image) end
--[[
	Gets the image used when the item is disabled.
	@return [luaIde#cc.Node]
]]
function cc.MenuItemSprite:getDisabledImage() end
--[[
	Gets the image used when the item is selected.
	@return [luaIde#cc.Node]
]]
function cc.MenuItemSprite:getSelectedImage() end
--[[
	Gets the image used when the item is not selected.
	@return [luaIde#cc.Node]
]]
function cc.MenuItemSprite:getNormalImage() end
--[[
	The item was unselected.
]]
function cc.MenuItemSprite:unselected() end

--[[
	@SuperType[luaIde#cc.MenuItemSprite]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItemImage = {}
--[[
	Sets the sprite frame for the disabled image.
]]
function cc.MenuItemImage:setDisabledSpriteFrame(SpriteFrame_frame) end
--[[
	Sets the sprite frame for the selected image.
]]
function cc.MenuItemImage:setSelectedSpriteFrame(SpriteFrame_frame) end
--[[
	Sets the sprite frame for the normal image.
]]
function cc.MenuItemImage:setNormalSpriteFrame(SpriteFrame_frame) end
--[[
	@return bool
]]
function cc.MenuItemImage:init() end
--[[
	Initializes a menu item with a normal, selected and disabled image with target/selector.
	@return bool
]]
function cc.MenuItemImage:initWithNormalImage(const_std_string_normalImage,const_std_string_selectedImage,const_std_string_disabledImage,Ref_target,SEL_MenuHandler_selector) end
--[[
	Initializes a menu item with a normal, selected and disabled image with a callable object.
	@return bool
]]
function cc.MenuItemImage:initWithNormalImage(const_std_string_normalImage,const_std_string_selectedImage,const_std_string_disabledImage,const_ccMenuCallback_callback) end

--[[
	@SuperType[luaIde#cc.MenuItem]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenuItem.h
]]
cc.MenuItemToggle = {}
--[[
	Sets the array that contains the subitems.
]]
function cc.MenuItemToggle:setSubItems() end
--[[
	Initializes a menu item with a item.
	@return bool
]]
function cc.MenuItemToggle:initWithItem(MenuItem_item) end
--[[
	Gets the index of the selected item.
	@return int
]]
function cc.MenuItemToggle:getSelectedIndex() end
--[[
	Add more menu item.
]]
function cc.MenuItemToggle:addSubItem(MenuItem_item) end
--[[
	Return the selected item.
	@return [luaIde#cc.MenuItem]
]]
function cc.MenuItemToggle:getSelectedItem() end
--[[
	Sets the index of the selected item.
]]
function cc.MenuItemToggle:setSelectedIndex(unsigned_int_index) end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMenu.h
]]
cc.Menu = {}
--[[
	initializes a Menu with a NSArray of MenuItem objects
	@return bool
]]
function cc.Menu:initWithArray() end
--[[
	Set whether the menu is visible. If set false, interacting with the menu
	will have no effect.
	The default value is true, a menu is default to visible.
	@param value true if menu is to be enabled, false if menu is to be disabled.
]]
function cc.Menu:setEnabled(bool_value) end
--[[
	Align items vertically.
]]
function cc.Menu:alignItemsVertically() end
--[[
	Determines if the menu is enabled.
	@see `setEnabled(bool)`.
	@return bool   whether the menu is enabled or not.
]]
function cc.Menu:isEnabled() end
--[[
	Align items horizontally with padding.
	@since v0.7.2
]]
function cc.Menu:alignItemsHorizontallyWithPadding(float_padding) end
--[[
	Align items vertically with padding.
	@since v0.7.2
]]
function cc.Menu:alignItemsVerticallyWithPadding(float_padding) end
--[[
	Align items horizontally.
]]
function cc.Menu:alignItemsHorizontally() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCMotionStreak.h
]]
cc.MotionStreak = {}
--[[
	Remove all living segments of the ribbon.
]]
function cc.MotionStreak:reset() end
function cc.MotionStreak:setTexture(Texture2D_texture) end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.MotionStreak:getTexture() end
--[[
	Color used for the tint.
	@param colors The color used for the tint.
]]
function cc.MotionStreak:tintWithColor(const_Color3B_colors) end
--[[
	@js NA
	@lua NA
]]
function cc.MotionStreak:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Sets the starting position initialized or not.
	@param bStartingPositionInitialized True if initialized the starting position.
]]
function cc.MotionStreak:setStartingPositionInitialized(bool_bStartingPositionInitialized) end
--[[
	@js NA
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.MotionStreak:getBlendFunc() end
--[[
	Is the starting position initialized or not.
	@return bool   True if the starting position is initialized.
]]
function cc.MotionStreak:isStartingPositionInitialized() end
--[[
	When fast mode is enabled, new points are added faster but with lower precision.
	@return bool   True if fast mode is enabled.
]]
function cc.MotionStreak:isFastMode() end
--[[
	Get stroke.
	@return float   float stroke.
]]
function cc.MotionStreak:getStroke() end
--[[
	initializes a motion streak with fade in seconds, minimum segments, stroke's width, color and texture filename
	@return bool
]]
function cc.MotionStreak:initWithFade(float_fade,float_minSeg,float_stroke,const_Color3B_color,const_std_string_path) end
--[[
	initializes a motion streak with fade in seconds, minimum segments, stroke's width, color and texture
	@return bool
]]
function cc.MotionStreak:initWithFade(float_fade,float_minSeg,float_stroke,const_Color3B_color,Texture2D_texture) end
--[[
	Sets fast mode or not.
	@param bFastMode True if enabled fast mode.
]]
function cc.MotionStreak:setFastMode(bool_bFastMode) end
--[[
	Set stroke.
	@param stroke The width of stroke.
]]
function cc.MotionStreak:setStroke(float_stroke) end
--[[
	Creates and initializes a motion streak with fade in seconds, minimum segments, stroke's width, color, texture filename.
	@param timeToFade The fade time, in seconds.
	@param minSeg The minimum segments.
	@param strokeWidth The width of stroke.
	@param strokeColor The color of stroke.
	@param imagePath The texture file name of stoke.
	@return [luaIde#cc.MotionStreak]   An autoreleased MotionStreak object.
]]
function cc.MotionStreak:create(float_timeToFade,float_minSeg,float_strokeWidth,const_Color3B_strokeColor,const_std_string_imagePath) end
--[[
	Creates and initializes a motion streak with fade in seconds, minimum segments, stroke's width, color, texture.
	@param timeToFade The fade time, in seconds.
	@param minSeg The minimum segments.
	@param strokeWidth The width of stroke.
	@param strokeColor The color of stroke.
	@param texture The texture name of stoke.
	@return [luaIde#cc.MotionStreak]   An autoreleased MotionStreak object.
]]
function cc.MotionStreak:create(float_timeToFade,float_minSeg,float_strokeWidth,const_Color3B_strokeColor,Texture2D_texture) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCNodeGrid.h
]]
cc.NodeGrid = {}
--[[
	@brief Set the effect grid rect.
	@param gridRect The effect grid rect.
]]
function cc.NodeGrid:setGridRect(const_Rect_gridRect) end
--[[
	Set the Grid Target.
	@param target A Node is used to set the Grid Target.
]]
function cc.NodeGrid:setTarget(Node_target) end
--[[
	Changes a grid object that is used when applying effects.
	@param grid  A Grid object that is used when applying effects.
]]
function cc.NodeGrid:setGrid(GridBase_grid) end
--[[
	Get a Grid Node.
	@return [luaIde#cc.GridBase]   Return a GridBase.
]]
function cc.NodeGrid:getGrid() end
--[[
	@js NA
	@return [luaIde#cc.GridBase]
]]
function cc.NodeGrid:getGrid() end
--[[
	@brief Get the effect grid rect.
	@return [luaIde#cc.Rect]   Return the effect grid rect.
]]
function cc.NodeGrid:getGridRect() end
--[[
	Create a Grid Node.
	@return [luaIde#cc.NodeGrid]   An autorelease Grid Node.
]]
function cc.NodeGrid:create() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleBatchNode.h
]]
cc.ParticleBatchNode = {}
function cc.ParticleBatchNode:setTexture(Texture2D_texture) end
--[[
	initializes the particle system with Texture2D, a capacity of particles
	@return bool
]]
function cc.ParticleBatchNode:initWithTexture(Texture2D_tex,int_capacity) end
--[[
	Disables a particle by inserting a 0'd quad into the texture atlas.
	@param particleIndex The index of the particle.
]]
function cc.ParticleBatchNode:disableParticle(int_particleIndex) end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.ParticleBatchNode:getTexture() end
--[[
	Sets the texture atlas used for drawing the quads.
	@param atlas The texture atlas used for drawing the quads.
]]
function cc.ParticleBatchNode:setTextureAtlas(TextureAtlas_atlas) end
--[[
	initializes the particle system with the name of a file on disk (for a list of supported formats look at the Texture2D class), a capacity of particles
	@return bool
]]
function cc.ParticleBatchNode:initWithFile(const_std_string_fileImage,int_capacity) end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed
	In js: var setBlendFunc(var src, var dst)
	@endcode
	@lua NA
]]
function cc.ParticleBatchNode:setBlendFunc(const_BlendFunc_blendFunc) end
function cc.ParticleBatchNode:removeAllChildrenWithCleanup(bool_doCleanup) end
--[[
	Gets the texture atlas used for drawing the quads.
	@return [luaIde#TextureAtlas]   The texture atlas used for drawing the quads.
]]
function cc.ParticleBatchNode:getTextureAtlas() end
--[[
	@js NA
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.ParticleBatchNode:getBlendFunc() end
--[[
	Inserts a child into the ParticleBatchNode.
	@param system A given particle system.
	@param index The insert index.
]]
function cc.ParticleBatchNode:insertChild(ParticleSystem_system,int_index) end
--[[
	Remove a child of the ParticleBatchNode.
	@param index The index of the child.
	@param doCleanup True if all actions and callbacks on this node should be removed, false otherwise.
]]
function cc.ParticleBatchNode:removeChildAtIndex(int_index,bool_doCleanup) end
--[[
	Create the particle system with the name of a file on disk (for a list of supported formats look at the Texture2D class), a capacity of particles.
	@param fileImage A given file name.
	@param capacity A capacity of particles.
	@return [luaIde#cc.ParticleBatchNode]   An autoreleased ParticleBatchNode object.
]]
function cc.ParticleBatchNode:create(const_std_string_fileImage,int_capacity) end
--[[
	Create the particle system with Texture2D, a capacity of particles, which particle system to use.
	@param tex A given texture.
	@param capacity A capacity of particles.
	@return [luaIde#cc.ParticleBatchNode]   An autoreleased ParticleBatchNode object.
	@js NA
]]
function cc.ParticleBatchNode:createWithTexture(Texture2D_tex,int_capacity) end

cc.ParticleData = {}
function cc.ParticleData:release() end
--[[
	@return int
]]
function cc.ParticleData:getMaxCount() end
--[[
	@return bool
]]
function cc.ParticleData:init(int_count) end
function cc.ParticleData:copyParticle(int_p1,int_p2) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleSystem.h
]]
cc.ParticleSystem = {}
--[[
	Gets the start size variance in pixels of each particle.
	@return float   The start size variance in pixels of each particle.
]]
function cc.ParticleSystem:getStartSizeVar() end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.ParticleSystem:getTexture() end
--[[
	Whether or not the system is full.
	@return bool   True if the system is full.
]]
function cc.ParticleSystem:isFull() end
--[[
	Gets the batch node.
	@return [luaIde#cc.ParticleBatchNode]   The batch node.
]]
function cc.ParticleSystem:getBatchNode() end
--[[
	Gets the start color of each particle.
	@return [luaIde#Color4F]   The start color of each particle.
]]
function cc.ParticleSystem:getStartColor() end
--[[
	Gets the particles movement type: Free or Grouped.
	@since v0.8
	@return [luaIde#PositionType]   The particles movement type.
]]
function cc.ParticleSystem:getPositionType() end
--[[
	Sets the position variance of the emitter.
	@param pos The position variance of the emitter.
]]
function cc.ParticleSystem:setPosVar(const_Vec2_pos) end
--[[
	Gets the end spin of each particle.
	@return float   The end spin of each particle.
]]
function cc.ParticleSystem:getEndSpin() end
--[[
	Sets the rotate per second variance.
	@param degrees The rotate per second variance.
]]
function cc.ParticleSystem:setRotatePerSecondVar(float_degrees) end
--[[
	@} end of PlayableProtocol
]]
function cc.ParticleSystem:setSourcePositionCompatible(bool_sourcePositionCompatible) end
--[[
	Gets the start spin variance of each particle.
	@return float   The start spin variance of each particle.
]]
function cc.ParticleSystem:getStartSpinVar() end
--[[
	Gets the radial acceleration variance.
	@return float   The radial acceleration variance.
]]
function cc.ParticleSystem:getRadialAccelVar() end
--[[
	Gets the end size variance in pixels of each particle.
	@return float   The end size variance in pixels of each particle.
]]
function cc.ParticleSystem:getEndSizeVar() end
--[[
	Sets the tangential acceleration.
	@param t The tangential acceleration.
]]
function cc.ParticleSystem:setTangentialAccel(float_t) end
--[[
	Gets the radial acceleration.
	@return float   The radial acceleration.
]]
function cc.ParticleSystem:getRadialAccel() end
--[[
	Sets the start radius.
	@param startRadius The start radius.
]]
function cc.ParticleSystem:setStartRadius(float_startRadius) end
--[[
	Sets the number of degrees to rotate a particle around the source pos per second.
	@param degrees The number of degrees to rotate a particle around the source pos per second.
]]
function cc.ParticleSystem:setRotatePerSecond(float_degrees) end
--[[
	Sets the end size in pixels of each particle.
	@param endSize The end size in pixels of each particle.
]]
function cc.ParticleSystem:setEndSize(float_endSize) end
--[[
	Gets the gravity.
	@return [luaIde#cc.Vec2]   The gravity.
]]
function cc.ParticleSystem:getGravity() end
--[[
	UnPause the emission
]]
function cc.ParticleSystem:resumeEmissions() end
--[[
	Gets the tangential acceleration.
	@return float   The tangential acceleration.
]]
function cc.ParticleSystem:getTangentialAccel() end
--[[
	Sets the end radius.
	@param endRadius The end radius.
]]
function cc.ParticleSystem:setEndRadius(float_endRadius) end
--[[
	Gets the speed.
	@return float   The speed.
]]
function cc.ParticleSystem:getSpeed() end
--[[
	Pause the emission
]]
function cc.ParticleSystem:pauseEmissions() end
--[[
	Gets the angle of each particle.
	@return float   The angle of each particle.
]]
function cc.ParticleSystem:getAngle() end
--[[
	Sets the end color and end color variation of each particle.
	@param color The end color and end color variation of each particle.
]]
function cc.ParticleSystem:setEndColor(const_Color4F_color) end
--[[
	Sets the start spin of each particle.
	@param spin The start spin of each particle.
]]
function cc.ParticleSystem:setStartSpin(float_spin) end
--[[
	Sets how many seconds the emitter will run. -1 means 'forever'.
	@param duration The seconds that the emitter will run. -1 means 'forever'.
]]
function cc.ParticleSystem:setDuration(float_duration) end
--[[
	@return bool
]]
function cc.ParticleSystem:initWithTotalParticles(int_numberOfParticles) end
function cc.ParticleSystem:addParticles(int_count) end
function cc.ParticleSystem:setTexture(Texture2D_texture) end
--[[
	Gets the position variance of the emitter.
	@return [luaIde#cc.Vec2]   The position variance of the emitter.
]]
function cc.ParticleSystem:getPosVar() end
--[[
	Call the update method with no time..
]]
function cc.ParticleSystem:updateWithNoTime() end
--[[
	Whether or not the particle system is blend additive.
	@return bool   True if the particle system is blend additive.
]]
function cc.ParticleSystem:isBlendAdditive() end
--[[
	Gets the speed variance.
	@return float   The speed variance.
]]
function cc.ParticleSystem:getSpeedVar() end
--[[
	Sets the particles movement type: Free or Grouped.
	@since v0.8
	@param type The particles movement type.
]]
function cc.ParticleSystem:setPositionType(PositionType_type) end
function cc.ParticleSystem:stopSystem() end
--[[
	Gets the source position of the emitter.
	@return [luaIde#cc.Vec2]   The source position of the emitter.
]]
function cc.ParticleSystem:getSourcePosition() end
--[[
	Sets the life variance of each particle.
	@param lifeVar The life variance of each particle.
]]
function cc.ParticleSystem:setLifeVar(float_lifeVar) end
--[[
	Sets the maximum particles of the system.
	@param totalParticles The maximum particles of the system.
]]
function cc.ParticleSystem:setTotalParticles(int_totalParticles) end
--[[
	Sets the end color variance of each particle.
	@param color The end color variance of each particle.
]]
function cc.ParticleSystem:setEndColorVar(const_Color4F_color) end
--[[
	Gets the index of system in batch node array.
	@return int   The index of system in batch node array.
]]
function cc.ParticleSystem:getAtlasIndex() end
--[[
	Gets the start size in pixels of each particle.
	@return float   The start size in pixels of each particle.
]]
function cc.ParticleSystem:getStartSize() end
--[[
	Sets the start spin variance of each particle.
	@param pinVar The start spin variance of each particle.
]]
function cc.ParticleSystem:setStartSpinVar(float_pinVar) end
--[[
	Kill all living particles.
]]
function cc.ParticleSystem:resetSystem() end
--[[
	Sets the index of system in batch node array.
	@param index The index of system in batch node array.
]]
function cc.ParticleSystem:setAtlasIndex(int_index) end
--[[
	Sets the tangential acceleration variance.
	@param t The tangential acceleration variance.
]]
function cc.ParticleSystem:setTangentialAccelVar(float_t) end
--[[
	Sets the end radius variance.
	@param endRadiusVar The end radius variance.
]]
function cc.ParticleSystem:setEndRadiusVar(float_endRadiusVar) end
--[[
	Gets the end radius.
	@return float   The end radius.
]]
function cc.ParticleSystem:getEndRadius() end
--[[
	Whether or not the particle system is active.
	@return bool   True if the particle system is active.
]]
function cc.ParticleSystem:isActive() end
--[[
	Sets the radial acceleration variance.
	@param t The radial acceleration variance.
]]
function cc.ParticleSystem:setRadialAccelVar(float_t) end
--[[
	Sets the start size in pixels of each particle.
	@param startSize The start size in pixels of each particle.
]]
function cc.ParticleSystem:setStartSize(float_startSize) end
--[[
	Sets the speed.
	@param speed The speed.
]]
function cc.ParticleSystem:setSpeed(float_speed) end
--[[
	Gets the start spin of each particle.
	@return float   The start spin of each particle.
]]
function cc.ParticleSystem:getStartSpin() end
--[[
	@return std_string
]]
function cc.ParticleSystem:getResourceFile() end
--[[
	Gets the number of degrees to rotate a particle around the source pos per second.
	@return float   The number of degrees to rotate a particle around the source pos per second.
]]
function cc.ParticleSystem:getRotatePerSecond() end
--[[
	Sets the mode of the emitter.
	@param mode The mode of the emitter.
]]
function cc.ParticleSystem:setEmitterMode(Mode_mode) end
--[[
	Gets how many seconds the emitter will run. -1 means 'forever'.
	@return float   The seconds that the emitter will run. -1 means 'forever'.
]]
function cc.ParticleSystem:getDuration() end
--[[
	Sets the source position of the emitter.
	@param pos The source position of the emitter.
]]
function cc.ParticleSystem:setSourcePosition(const_Vec2_pos) end
function cc.ParticleSystem:stop() end
--[[
	Update the verts position data of particle,
	should be overridden by subclasses.
]]
function cc.ParticleSystem:updateParticleQuads() end
--[[
	Gets the end spin variance of each particle.
	@return float   The end spin variance of each particle.
]]
function cc.ParticleSystem:getEndSpinVar() end
--[[
	Sets the particle system blend additive.
	@param value True if the particle system is blend additive.
]]
function cc.ParticleSystem:setBlendAdditive(bool_value) end
--[[
	Sets the life of each particle.
	@param life The life of each particle.
]]
function cc.ParticleSystem:setLife(float_life) end
--[[
	Sets the angle variance of each particle.
	@param angleVar The angle variance of each particle.
]]
function cc.ParticleSystem:setAngleVar(float_angleVar) end
--[[
	Sets the rotation of each particle to its direction.
	@param t True if the rotation is the direction.
]]
function cc.ParticleSystem:setRotationIsDir(bool_t) end
--[[
	@name implement Playable Protocol
]]
function cc.ParticleSystem:start() end
--[[
	Sets the end size variance in pixels of each particle.
	@param sizeVar The end size variance in pixels of each particle.
]]
function cc.ParticleSystem:setEndSizeVar(float_sizeVar) end
--[[
	Sets the angle of each particle.
	@param angle The angle of each particle.
]]
function cc.ParticleSystem:setAngle(float_angle) end
--[[
	Sets the batch node.
	@param batchNode The batch node.
]]
function cc.ParticleSystem:setBatchNode(ParticleBatchNode_batchNode) end
--[[
	Gets the tangential acceleration variance.
	@return float   The tangential acceleration variance.
]]
function cc.ParticleSystem:getTangentialAccelVar() end
--[[
	Switch between different kind of emitter modes:
	- kParticleModeGravity: uses gravity, speed, radial and tangential acceleration.
	- kParticleModeRadius: uses radius movement + rotation.
	@return [luaIde#Mode]   The mode of the emitter.
]]
function cc.ParticleSystem:getEmitterMode() end
--[[
	Sets the end spin variance of each particle.
	@param endSpinVar The end spin variance of each particle.
]]
function cc.ParticleSystem:setEndSpinVar(float_endSpinVar) end
--[[
	initializes a ParticleSystem from a plist file.
	This plist files can be created manually or with Particle Designer:
	http://particledesigner.71squared.com/
	@since v0.99.3
	@return bool
]]
function cc.ParticleSystem:initWithFile(const_std_string_plistFile) end
--[[
	Gets the angle variance of each particle.
	@return float   The angle variance of each particle.
]]
function cc.ParticleSystem:getAngleVar() end
--[[
	Sets the start color of each particle.
	@param color The start color of each particle.
]]
function cc.ParticleSystem:setStartColor(const_Color4F_color) end
--[[
	Gets the rotate per second variance.
	@return float   The rotate per second variance.
]]
function cc.ParticleSystem:getRotatePerSecondVar() end
--[[
	Gets the end size in pixels of each particle.
	@return float   The end size in pixels of each particle.
]]
function cc.ParticleSystem:getEndSize() end
--[[
	Gets the life of each particle.
	@return float   The life of each particle.
]]
function cc.ParticleSystem:getLife() end
--[[
	Are the emissions paused
	@return bool   True if the emissions are paused, else false
]]
function cc.ParticleSystem:isPaused() end
--[[
	Sets the speed variance.
	@param speed The speed variance.
]]
function cc.ParticleSystem:setSpeedVar(float_speed) end
--[[
	Set the particle system auto removed it self on finish.
	@param var True if the particle system removed self on finish.
]]
function cc.ParticleSystem:setAutoRemoveOnFinish(bool_var) end
--[[
	Sets the gravity.
	@param g The gravity.
]]
function cc.ParticleSystem:setGravity(const_Vec2_g) end
--[[
	Update the VBO verts buffer which does not use batch node,
	should be overridden by subclasses.
]]
function cc.ParticleSystem:postStep() end
--[[
	Sets the emission rate of the particles.
	@param rate The emission rate of the particles.
]]
function cc.ParticleSystem:setEmissionRate(float_rate) end
--[[
	Gets the end color variance of each particle.
	@return [luaIde#Color4F]   The end color variance of each particle.
]]
function cc.ParticleSystem:getEndColorVar() end
--[[
	Whether or not the rotation of each particle to its direction.
	@return bool   True if the rotation is the direction.
]]
function cc.ParticleSystem:getRotationIsDir() end
--[[
	Gets the emission rate of the particles.
	@return float   The emission rate of the particles.
]]
function cc.ParticleSystem:getEmissionRate() end
--[[
	Gets the end color and end color variation of each particle.
	@return [luaIde#Color4F]   The end color and end color variation of each particle.
]]
function cc.ParticleSystem:getEndColor() end
--[[
	Gets the life variance of each particle.
	@return float   The life variance of each particle.
]]
function cc.ParticleSystem:getLifeVar() end
--[[
	Sets the start size variance in pixels of each particle.
	@param sizeVar The start size variance in pixels of each particle.
]]
function cc.ParticleSystem:setStartSizeVar(float_sizeVar) end
--[[
	Gets the start radius.
	@return float   The start radius.
]]
function cc.ParticleSystem:getStartRadius() end
--[[
	Gets the Quantity of particles that are being simulated at the moment.
	@return int   The Quantity of particles that are being simulated at the moment.
]]
function cc.ParticleSystem:getParticleCount() end
--[[
	Gets the start radius variance.
	@return float   The start radius variance.
]]
function cc.ParticleSystem:getStartRadiusVar() end
--[[
	Sets the start color variance of each particle.
	@param color The start color variance of each particle.
]]
function cc.ParticleSystem:setStartColorVar(const_Color4F_color) end
--[[
	Sets the end spin of each particle.
	@param endSpin The end spin of each particle.
]]
function cc.ParticleSystem:setEndSpin(float_endSpin) end
--[[
	Sets the radial acceleration.
	@param t The radial acceleration.
]]
function cc.ParticleSystem:setRadialAccel(float_t) end
--[[
	initializes a QuadParticleSystem from a Dictionary.
	@since v0.99.3
	@return bool
]]
function cc.ParticleSystem:initWithDictionary(ValueMap_dictionary) end
--[[
	initializes a particle system from a NSDictionary and the path from where to load the png
	@since v2.1
	@return bool
]]
function cc.ParticleSystem:initWithDictionary(ValueMap_dictionary,const_std_string_dirname) end
--[[
	Whether or not the particle system removed self on finish.
	@return bool   True if the particle system removed self on finish.
]]
function cc.ParticleSystem:isAutoRemoveOnFinish() end
--[[
	@return bool
]]
function cc.ParticleSystem:isSourcePositionCompatible() end
--[[
	Gets the maximum particles of the system.
	@return int   The maximum particles of the system.
]]
function cc.ParticleSystem:getTotalParticles() end
--[[
	Sets the start radius variance.
	@param startRadiusVar The start radius variance.
]]
function cc.ParticleSystem:setStartRadiusVar(float_startRadiusVar) end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed
	In js: var setBlendFunc(var src, var dst)
	In lua: local setBlendFunc(local src, local dst)
	@endcode
]]
function cc.ParticleSystem:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Gets the end radius variance.
	@return float   The end radius variance.
]]
function cc.ParticleSystem:getEndRadiusVar() end
--[[
	Gets the start color variance of each particle.
	@return [luaIde#Color4F]   The start color variance of each particle.
]]
function cc.ParticleSystem:getStartColorVar() end
--[[
	Creates an initializes a ParticleSystem from a plist file.
	This plist files can be created manually or with Particle Designer:
	http://particledesigner.71squared.com/
	@since v2.0
	@param plistFile Particle plist file name.
	@return [luaIde#cc.ParticleSystem]   An autoreleased ParticleSystem object.
]]
function cc.ParticleSystem:create(const_std_string_plistFile) end
--[[
	Create a system with a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleSystem]   An autoreleased ParticleSystemQuad object.
	@js NA
]]
function cc.ParticleSystem:createWithTotalParticles(int_numberOfParticles) end
--[[
	Gets all ParticleSystem references
	@return [luaIde#Vector__ParticleSystem__]
]]
function cc.ParticleSystem:getAllParticleSystems() end

--[[
	@SuperType[luaIde#cc.ParticleSystem]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleSystemQuad.h
]]
cc.ParticleSystemQuad = {}
--[[
	Sets a new SpriteFrame as particle.
	WARNING: this method is experimental. Use setTextureWithRect instead.
	@param spriteFrame A given sprite frame as particle texture.
	@since v0.99.4
]]
function cc.ParticleSystemQuad:setDisplayFrame(SpriteFrame_spriteFrame) end
--[[
	Sets a new texture with a rect. The rect is in Points.
	@since v0.99.4
	@js NA
	@lua NA
	@param texture A given texture.
	8 @param rect A given rect, in points.
]]
function cc.ParticleSystemQuad:setTextureWithRect(Texture2D_texture,const_Rect_rect) end
--[[
	Listen the event that renderer was recreated on Android/WP8.
	@js NA
	@lua NA
	@param event the event that renderer was recreated on Android/WP8.
]]
function cc.ParticleSystemQuad:listenRendererRecreated(EventCustom_event) end
--[[
	Creates a Particle Emitter.
	@return [luaIde#cc.ParticleSystemQuad]   An autoreleased ParticleSystemQuad object.
]]
function cc.ParticleSystemQuad:create() end
--[[
	Creates an initializes a ParticleSystemQuad from a plist file.
	This plist files can be created manually or with Particle Designer.
	@param filename Particle plist file name.
	@return [luaIde#cc.ParticleSystemQuad]   An autoreleased ParticleSystemQuad object.
]]
function cc.ParticleSystemQuad:create(const_std_string_filename) end
--[[
	Creates a Particle Emitter with a dictionary.
	@param dictionary Particle dictionary.
	@return [luaIde#cc.ParticleSystemQuad]   An autoreleased ParticleSystemQuad object.
]]
function cc.ParticleSystemQuad:create(ValueMap_dictionary) end
--[[
	Creates a Particle Emitter with a number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleSystemQuad]   An autoreleased ParticleSystemQuad object.
]]
function cc.ParticleSystemQuad:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleFire = {}
--[[
	Create a fire particle system.
	@return [luaIde#cc.ParticleFire]   An autoreleased ParticleFire object.
]]
function cc.ParticleFire:create() end
--[[
	Create a fire particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleFire]   An autoreleased ParticleFire object.
	@js NA
]]
function cc.ParticleFire:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleFireworks = {}
--[[
	@return bool
]]
function cc.ParticleFireworks:init() end
--[[
	Create a fireworks particle system.
	@return [luaIde#cc.ParticleFireworks]   An autoreleased ParticleFireworks object.
]]
function cc.ParticleFireworks:create() end
--[[
	Create a fireworks particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleFireworks]   An autoreleased ParticleFireworks object.
	@js NA
]]
function cc.ParticleFireworks:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleSun = {}
--[[
	@return bool
]]
function cc.ParticleSun:init() end
--[[
	Create a sun particle system.
	@return [luaIde#cc.ParticleSun]   An autoreleased ParticleSun object.
]]
function cc.ParticleSun:create() end
--[[
	Create a sun particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleSun]   An autoreleased ParticleSun object.
	@js NA
]]
function cc.ParticleSun:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleGalaxy = {}
--[[
	@return bool
]]
function cc.ParticleGalaxy:init() end
--[[
	Create a galaxy particle system.
	@return [luaIde#cc.ParticleGalaxy]   An autoreleased ParticleGalaxy object.
]]
function cc.ParticleGalaxy:create() end
--[[
	Create a galaxy particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleGalaxy]   An autoreleased ParticleGalaxy object.
	@js NA
]]
function cc.ParticleGalaxy:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleFlower = {}
--[[
	@return bool
]]
function cc.ParticleFlower:init() end
--[[
	Create a flower particle system.
	@return [luaIde#cc.ParticleFlower]   An autoreleased ParticleFlower object.
]]
function cc.ParticleFlower:create() end
--[[
	Create a flower particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleFlower]   An autoreleased ParticleFlower object.
	@js NA
]]
function cc.ParticleFlower:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleMeteor = {}
--[[
	@return bool
]]
function cc.ParticleMeteor:init() end
--[[
	Create a meteor particle system.
	@return [luaIde#cc.ParticleMeteor]   An autoreleased ParticleMeteor object.
]]
function cc.ParticleMeteor:create() end
--[[
	Create a meteor particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleMeteor]   An autoreleased ParticleMeteor object.
	@js NA
]]
function cc.ParticleMeteor:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleSpiral = {}
--[[
	@return bool
]]
function cc.ParticleSpiral:init() end
--[[
	Create a spiral particle system.
	@return [luaIde#cc.ParticleSpiral]   An autoreleased ParticleSpiral object.
]]
function cc.ParticleSpiral:create() end
--[[
	Create a spiral particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleSpiral]   An autoreleased ParticleSpiral object.
	@js NA
]]
function cc.ParticleSpiral:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleExplosion = {}
--[[
	@return bool
]]
function cc.ParticleExplosion:init() end
--[[
	Create a explosion particle system.
	@return [luaIde#cc.ParticleExplosion]   An autoreleased ParticleExplosion object.
]]
function cc.ParticleExplosion:create() end
--[[
	Create a explosion particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleExplosion]   An autoreleased ParticleExplosion object.
	@js NA
]]
function cc.ParticleExplosion:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleSmoke = {}
--[[
	@return bool
]]
function cc.ParticleSmoke:init() end
--[[
	Create a smoke particle system.
	@return [luaIde#cc.ParticleSmoke]   An autoreleased ParticleSmoke object.
]]
function cc.ParticleSmoke:create() end
--[[
	Create a smoke particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleSmoke]   An autoreleased ParticleSmoke object.
	@js NA
]]
function cc.ParticleSmoke:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleSnow = {}
--[[
	@return bool
]]
function cc.ParticleSnow:init() end
--[[
	Create a snow particle system.
	@return [luaIde#cc.ParticleSnow]   An autoreleased ParticleSnow object.
]]
function cc.ParticleSnow:create() end
--[[
	Create a snow particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleSnow]   An autoreleased ParticleSnow object.
	@js NA
]]
function cc.ParticleSnow:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.ParticleSystemQuad]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParticleExamples.h
]]
cc.ParticleRain = {}
--[[
	@return bool
]]
function cc.ParticleRain:init() end
--[[
	Create a rain particle system.
	@return [luaIde#cc.ParticleRain]   An autoreleased ParticleRain object.
]]
function cc.ParticleRain:create() end
--[[
	Create a rain particle system withe a fixed number of particles.
	@param numberOfParticles A given number of particles.
	@return [luaIde#cc.ParticleRain]   An autoreleased ParticleRain object.
	@js NA
]]
function cc.ParticleRain:createWithTotalParticles(int_numberOfParticles) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCProgressTimer.h
]]
cc.ProgressTimer = {}
--[[
	Initializes a progress timer with the sprite as the shape the timer goes through
	@return bool
]]
function cc.ProgressTimer:initWithSprite(Sprite_sp) end
--[[
	Return the Reverse direction.
	@return bool   If the direction is Anti-clockwise,it will return true.
]]
function cc.ProgressTimer:isReverseDirection() end
--[[
	This allows the bar type to move the component at a specific rate.
	Set the component to 0 to make sure it stays at 100%.
	For example you want a left to right bar but not have the height stay 100%.
	Set the rate to be Vec2(0,1); and set the midpoint to = Vec2(0,.5f).
	@param barChangeRate A Vec2.
]]
function cc.ProgressTimer:setBarChangeRate(const_Vec2_barChangeRate) end
--[[
	Percentages are from 0 to 100.
	@return float   Percentages.
]]
function cc.ProgressTimer:getPercentage() end
--[[
	Set the sprite as the shape.
	@param sprite The sprite as the shape.
]]
function cc.ProgressTimer:setSprite(Sprite_sprite) end
--[[
	Change the percentage to change progress.
	@return [luaIde#Type]   A Type
]]
function cc.ProgressTimer:getType() end
--[[
	The image to show the progress percentage, retain.
	@return [luaIde#cc.Sprite]   A sprite.
]]
function cc.ProgressTimer:getSprite() end
--[[
	Midpoint is used to modify the progress start position.
	If you're using radials type then the midpoint changes the center point.
	If you're using bar type then the midpoint changes the bar growth.
	it expands from the center but clamps to the sprites edge so:
	you want a left to right then set the midpoint all the way to Vec2(0,y).
	you want a right to left then set the midpoint all the way to Vec2(1,y).
	you want a bottom to top then set the midpoint all the way to Vec2(x,0).
	you want a top to bottom then set the midpoint all the way to Vec2(x,1).
	@param point A Vec2 point.
]]
function cc.ProgressTimer:setMidpoint(const_Vec2_point) end
--[[
	Returns the BarChangeRate.
	@return [luaIde#cc.Vec2]   A barChangeRate.
]]
function cc.ProgressTimer:getBarChangeRate() end
--[[
	Set the Reverse direction.
	@param value If value is false it will clockwise,if is true it will Anti-clockwise.
]]
function cc.ProgressTimer:setReverseDirection(bool_value) end
--[[
	Returns the Midpoint.
	@return [luaIde#cc.Vec2]   A Vec2.
]]
function cc.ProgressTimer:getMidpoint() end
--[[
	Set the initial percentage values.
	@param percentage The initial percentage values.
]]
function cc.ProgressTimer:setPercentage(float_percentage) end
--[[
	Set the ProgressTimer type.
	@param type Is an Type.
]]
function cc.ProgressTimer:setType(Type_type) end
--[[
	Creates a progress timer with the sprite as the shape the timer goes through.
	@param sp The sprite as the shape the timer goes through.
	@return [luaIde#cc.ProgressTimer]   A ProgressTimer.
]]
function cc.ProgressTimer:create(Sprite_sp) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCProtectedNode.h
]]
cc.ProtectedNode = {}
--[[
	Adds a child to the container with z-order as 0.
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child A child node
]]
function cc.ProtectedNode:addProtectedChild(Node__child) end
--[[
	Adds a child to the container with a local z-order.
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child     A child node
	@param localZOrder    Z order for drawing priority. Please refer to `setLocalZOrder(int)`
]]
function cc.ProtectedNode:addProtectedChild(Node__child,int_localZOrder) end
--[[
	Adds a child to the container with z order and tag.
	If the child is added to a 'running' node, then 'onEnter' and 'onEnterTransitionDidFinish' will be called immediately.
	@param child     A child node
	@param localZOrder    Z order for drawing priority. Please refer to `setLocalZOrder(int)`
	@param tag       An integer to identify the node easily. Please refer to `setTag(int)`
]]
function cc.ProtectedNode:addProtectedChild(Node_child,int_localZOrder,int_tag) end
function cc.ProtectedNode:disableCascadeColor() end
--[[
	Removes a child from the container by tag value. It will also cleanup all running actions depending on the cleanup parameter.
	@param tag       An integer number that identifies a child node.
	@param cleanup   true if all running actions and callbacks on the child node will be cleanup, false otherwise.
]]
function cc.ProtectedNode:removeProtectedChildByTag(int_tag,bool_cleanup) end
--[[
	Reorders a child according to a new z value.
	@param child     An already added child node. It MUST be already added.
	@param localZOrder Z order for drawing priority. Please refer to setLocalZOrder(int)
]]
function cc.ProtectedNode:reorderProtectedChild(Node__child,int_localZOrder) end
--[[
	Removes all children from the container, and do a cleanup to all running actions depending on the cleanup parameter.
	@param cleanup   true if all running actions on all children nodes should be cleanup, false otherwise.
	@js removeAllChildren
	@lua removeAllChildren
]]
function cc.ProtectedNode:removeAllProtectedChildrenWithCleanup(bool_cleanup) end
function cc.ProtectedNode:disableCascadeOpacity() end
--[[
	Sorts the children array once before drawing, instead of every time when a child is added or reordered.
	This approach can improves the performance massively.
	@note Don't call this manually unless a child added needs to be removed in the same frame
]]
function cc.ProtectedNode:sortAllProtectedChildren() end
--[[
	Gets a child from the container with its tag.
	@param tag   An identifier to find the child node.
	@return [luaIde#cc.Node]   a Node object whose tag equals to the input parameter.
]]
function cc.ProtectedNode:getProtectedChildByTag(int_tag) end
--[[
	Removes a child from the container. It will also cleanup all running actions depending on the cleanup parameter.
	@param child     The child node which will be removed.
	@param cleanup   true if all running actions and callbacks on the child node will be cleanup, false otherwise.
]]
function cc.ProtectedNode:removeProtectedChild(Node_child,bool_cleanup) end
--[[
	Removes all children from the container with a cleanup.
	@see `removeAllChildrenWithCleanup(bool)`.
]]
function cc.ProtectedNode:removeAllProtectedChildren() end
--[[
	Creates a ProtectedNode with no argument.
	@return [luaIde#cc.ProtectedNode]   A instance of ProtectedNode.
]]
function cc.ProtectedNode:create() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCSprite.h
]]
cc.Sprite = {}
--[[
	@{
	Sets a new SpriteFrame to the Sprite.
]]
function cc.Sprite:setSpriteFrame(const_std_string_spriteFrameName) end
--[[
	Sets a new texture (from a filename) to the sprite.
	@memberof Sprite
	It will call `setTextureRect()` with the texture's content size.
]]
function cc.Sprite:setTexture(const_std_string_filename) end
--[[
	@overload
	The Texture's rect is not changed.
]]
function cc.Sprite:setTexture(Texture2D_texture) end
--[[
	Returns the Texture2D object used by the sprite.
	@return [luaIde#cc.Texture2D]
]]
function cc.Sprite:getTexture() end
--[[
	Sets whether the sprite should be flipped vertically or not.
	@param flippedY true if the sprite should be flipped vertically, false otherwise.
]]
function cc.Sprite:setFlippedY(bool_flippedY) end
--[[
	Sets whether the sprite should be flipped horizontally or not.
	@param flippedX true if the sprite should be flipped horizontally, false otherwise.
]]
function cc.Sprite:setFlippedX(bool_flippedX) end
--[[
	@return int
]]
function cc.Sprite:getResourceType() end
--[[
	Changes the display frame with animation name and index.
	The animation name will be get from the AnimationCache.
]]
function cc.Sprite:setDisplayFrameWithAnimationName(const_std_string_animationName,ssize_t_frameIndex) end
--[[
	Returns the batch node object if this sprite is rendered by SpriteBatchNode.
	@return [luaIde#cc.SpriteBatchNode]   The SpriteBatchNode object if this sprite is rendered by SpriteBatchNode,
	nullptr if the sprite isn't used batch node.
]]
function cc.Sprite:getBatchNode() end
--[[
	Gets the offset position of the sprite. Calculated automatically by editors like Zwoptex.
	@return [luaIde#cc.Vec2]
]]
function cc.Sprite:getOffsetPosition() end
--[[
	@brief Returns the Cap Insets rect
	@return [luaIde#cc.Rect]   Scale9Sprite's cap inset.
]]
function cc.Sprite:getCenterRect() end
function cc.Sprite:removeAllChildrenWithCleanup(bool_cleanup) end
--[[
	setCenterRectNormalized
	Useful to implement "9 sliced" sprites.
	The default value is (0,0) - (1,1), which means that only one "slice" will be used: From top-left (0,0) to bottom-right (1,1).
	If the value is different than (0,0), (1,1), then the sprite will be sliced into a 3 x 3 grid. The four corners of this grid are applied without
	performing any scaling. The upper- and lower-middle parts are scaled horizontally, and the left- and right-middle parts are scaled vertically.
	The center is scaled in both directions.
	Important: The scaling is based the Sprite's trimmed size.
	Limitations: Does not work when the sprite is part of `SpriteBatchNode`.
]]
function cc.Sprite:setCenterRectNormalized(const_Rect_rect) end
--[[
	returns whether or not contentSize stretches the sprite's texture
	@return bool
]]
function cc.Sprite:isStretchEnabled() end
--[[
	Updates the texture rect of the Sprite in points.
	It will call setTextureRect(const Rect& rect, bool rotated, const Size& untrimmedSize) with \p rotated = false, and \p utrimmedSize = rect.size.
]]
function cc.Sprite:setTextureRect(const_Rect_rect) end
--[[
	@overload
	It will update the texture coordinates and the vertex rectangle.
]]
function cc.Sprite:setTextureRect(const_Rect_rect,bool_rotated,const_Size_untrimmedSize) end
--[[
	Initializes a sprite with an sprite frame name.
	A SpriteFrame will be fetched from the SpriteFrameCache by name.
	If the SpriteFrame doesn't exist it will raise an exception.
	@param   spriteFrameName  A key string that can fetched a valid SpriteFrame from SpriteFrameCache.
	@return bool    True if the sprite is initialized properly, false otherwise.
]]
function cc.Sprite:initWithSpriteFrameName(const_std_string_spriteFrameName) end
--[[
	whether or not contentSize stretches the sprite's texture
]]
function cc.Sprite:setStretchEnabled(bool_enabled) end
--[[
	Returns whether or not a SpriteFrame is being displayed.
	@return bool
]]
function cc.Sprite:isFrameDisplayed(SpriteFrame_frame) end
--[[
	Returns the index used on the TextureAtlas.
	@return ssize_t
]]
function cc.Sprite:getAtlasIndex() end
--[[
	Sets the batch node to sprite.
	@warning This method is not recommended for game developers. Sample code for using batch node
	@code
	SpriteBatchNode *batch = SpriteBatchNode::create("Images/grossini_dance_atlas.png", 15);
	Sprite *sprite = Sprite::createWithTexture(batch->getTexture(), Rect(0, 0, 57, 57));
	batch->addChild(sprite);
	layer->addChild(batch);
	@endcode
]]
function cc.Sprite:setBatchNode(SpriteBatchNode_spriteBatchNode) end
--[[
	@js  NA
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.Sprite:getBlendFunc() end
--[[
	setCenterRect
	Like `setCenterRectNormalized`, but instead of being in normalized coordinates, it is in points coordinates
]]
function cc.Sprite:setCenterRect(const_Rect_rect) end
--[[
	Sets the weak reference of the TextureAtlas when the sprite is rendered using via SpriteBatchNode.
]]
function cc.Sprite:setTextureAtlas(TextureAtlas_textureAtlas) end
--[[
	Returns the current displayed frame.
	@return [luaIde#cc.SpriteFrame]
]]
function cc.Sprite:getSpriteFrame() end
--[[
	@return std_string
]]
function cc.Sprite:getResourceName() end
--[[
	Whether or not the Sprite needs to be updated in the Atlas.
	@return bool   True if the sprite needs to be updated in the Atlas, false otherwise.
]]
function cc.Sprite:isDirty() end
--[[
	getCenterRectNormalized
	Returns the CenterRect in normalized coordinates
	@return [luaIde#cc.Rect]
]]
function cc.Sprite:getCenterRectNormalized() end
--[[
	Sets the index used on the TextureAtlas.
	@warning Don't modify this value unless you know what you are doing.
]]
function cc.Sprite:setAtlasIndex(ssize_t_atlasIndex) end
--[[
	Initializes a sprite with a texture.
	After initialization, the rect used will be the size of the texture, and the offset will be (0,0).
	@param   texture    A pointer to an existing Texture2D object.
	You can use a Texture2D object for many sprites.
	@return bool    True if the sprite is initialized properly, false otherwise.
]]
function cc.Sprite:initWithTexture(Texture2D_texture) end
--[[
	Initializes a sprite with a texture and a rect.
	After initialization, the offset will be (0,0).
	@param   texture    A pointer to an existing Texture2D object.
	You can use a Texture2D object for many sprites.
	@param   rect        Only the contents inside rect of this texture will be applied for this sprite.
	@return bool    True if the sprite is initialized properly, false otherwise.
]]
function cc.Sprite:initWithTexture(Texture2D_texture,const_Rect_rect) end
--[[
	Initializes a sprite with a texture and a rect in points, optionally rotated.
	After initialization, the offset will be (0,0).
	@note    This is the designated initializer.
	@param   texture    A Texture2D object whose texture will be applied to this sprite.
	@param   rect        A rectangle assigned the contents of texture.
	@param   rotated     Whether or not the texture rectangle is rotated.
	@return bool    True if the sprite is initialized properly, false otherwise.
]]
function cc.Sprite:initWithTexture(Texture2D_texture,const_Rect_rect,bool_rotated) end
--[[
	Makes the Sprite to be updated in the Atlas.
]]
function cc.Sprite:setDirty(bool_dirty) end
--[[
	Returns whether or not the texture rectangle is rotated.
	@return bool
]]
function cc.Sprite:isTextureRectRotated() end
--[[
	Returns the rect of the Sprite in points.
	@return [luaIde#cc.Rect]
]]
function cc.Sprite:getTextureRect() end
--[[
	Initializes a sprite with an image filename.
	This method will find filename from local file system, load its content to Texture2D,
	then use Texture2D to create a sprite.
	After initialization, the rect used will be the size of the image. The offset will be (0,0).
	@param   filename The path to an image file in local file system.
	@return bool    True if the sprite is initialized properly, false otherwise.
	@lua     init
]]
function cc.Sprite:initWithFile(const_std_string_filename) end
--[[
	Initializes a sprite with an image filename, and a rect.
	This method will find filename from local file system, load its content to Texture2D,
	then use Texture2D to create a sprite.
	After initialization, the offset will be (0,0).
	@param   filename The path to an image file in local file system.
	@param   rect        The rectangle assigned the content area from texture.
	@return bool    True if the sprite is initialized properly, false otherwise.
	@lua     init
]]
function cc.Sprite:initWithFile(const_std_string_filename,const_Rect_rect) end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed.
	In js: var setBlendFunc(var src, var dst).
	In lua: local setBlendFunc(local src, local dst).
	@endcode
]]
function cc.Sprite:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Gets the weak reference of the TextureAtlas when the sprite is rendered using via SpriteBatchNode.
	@return [luaIde#TextureAtlas]
]]
function cc.Sprite:getTextureAtlas() end
--[[
	Initializes a sprite with an SpriteFrame. The texture and rect in SpriteFrame will be applied on this sprite.
	@param   spriteFrame  A SpriteFrame object. It should includes a valid texture and a rect.
	@return bool    True if the sprite is initialized properly, false otherwise.
]]
function cc.Sprite:initWithSpriteFrame(SpriteFrame_spriteFrame) end
--[[
	Returns the flag which indicates whether the sprite is flipped horizontally or not.
	It only flips the texture of the sprite, and not the texture of the sprite's children.
	Also, flipping the texture doesn't alter the anchorPoint.
	If you want to flip the anchorPoint too, and/or to flip the children too use:
	sprite->setScaleX(sprite->getScaleX() * -1);
	@return bool   true if the sprite is flipped horizontally, false otherwise.
]]
function cc.Sprite:isFlippedX() end
--[[
	Return the flag which indicates whether the sprite is flipped vertically or not.
	It only flips the texture of the sprite, and not the texture of the sprite's children.
	Also, flipping the texture doesn't alter the anchorPoint.
	If you want to flip the anchorPoint too, and/or to flip the children too use:
	sprite->setScaleY(sprite->getScaleY() * -1);
	@return bool   true if the sprite is flipped vertically, false otherwise.
]]
function cc.Sprite:isFlippedY() end
--[[
	Sets the vertex rect.
	It will be called internally by setTextureRect.
	Useful if you want to create 2x images from SD images in Retina Display.
	Do not call it manually. Use setTextureRect instead.
]]
function cc.Sprite:setVertexRect(const_Rect_rect) end
--[[
	Creates a sprite with a Texture2D object.
	After creation, the rect will be the size of the texture, and the offset will be (0,0).
	@param   texture    A pointer to a Texture2D object.
	@return [luaIde#cc.Sprite]    An autoreleased sprite object.
]]
function cc.Sprite:createWithTexture(Texture2D_texture) end
--[[
	Creates a sprite with a texture and a rect.
	After creation, the offset will be (0,0).
	@param   texture     A pointer to an existing Texture2D object.
	You can use a Texture2D object for many sprites.
	@param   rect        Only the contents inside the rect of this texture will be applied for this sprite.
	@param   rotated     Whether or not the rect is rotated.
	@return [luaIde#cc.Sprite]    An autoreleased sprite object.
]]
function cc.Sprite:createWithTexture(Texture2D_texture,const_Rect_rect,bool_rotated) end
--[[
	Creates a sprite with an sprite frame name.
	A SpriteFrame will be fetched from the SpriteFrameCache by spriteFrameName param.
	If the SpriteFrame doesn't exist it will raise an exception.
	@param   spriteFrameName A null terminated string which indicates the sprite frame name.
	@return [luaIde#cc.Sprite]    An autoreleased sprite object.
]]
function cc.Sprite:createWithSpriteFrameName(const_std_string_spriteFrameName) end
--[[
	Creates a sprite with an sprite frame.
	@param   spriteFrame    A sprite frame which involves a texture and a rect.
	@return [luaIde#cc.Sprite]    An autoreleased sprite object.
]]
function cc.Sprite:createWithSpriteFrame(SpriteFrame_spriteFrame) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCRenderTexture.h
]]
cc.RenderTexture = {}
--[[
	Used for grab part of screen to a texture.
	@param rtBegin The position of renderTexture on the fullRect.
	@param fullRect The total size of screen.
	@param fullViewport The total viewportSize.
]]
function cc.RenderTexture:setVirtualViewport(const_Vec2_rtBegin,const_Rect_fullRect,const_Rect_fullViewport) end
--[[
	Clears the texture with a specified stencil value.
	@param stencilValue A specified stencil value.
]]
function cc.RenderTexture:clearStencil(int_stencilValue) end
--[[
	Value for clearDepth. Valid only when "autoDraw" is true.
	@return float   Value for clearDepth.
]]
function cc.RenderTexture:getClearDepth() end
--[[
	Value for clear Stencil. Valid only when "autoDraw" is true.
	@return int   Value for clear Stencil.
]]
function cc.RenderTexture:getClearStencil() end
--[[
	Set Value for clear Stencil.
	@param clearStencil Value for clear Stencil.
]]
function cc.RenderTexture:setClearStencil(int_clearStencil) end
--[[
	Sets the Sprite being used.
	@param sprite A Sprite.
]]
function cc.RenderTexture:setSprite(Sprite_sprite) end
--[[
	Gets the Sprite being used.
	@return [luaIde#cc.Sprite]   A Sprite.
]]
function cc.RenderTexture:getSprite() end
--[[
	When enabled, it will render its children into the texture automatically. Disabled by default for compatibility reasons.
	Will be enabled in the future.
	@return bool   Return the autoDraw value.
]]
function cc.RenderTexture:isAutoDraw() end
--[[
	Flag: Use stack matrix computed from scene hierarchy or generate new modelView and projection matrix.
	@param keepMatrix Whether or not use stack matrix computed from scene hierarchy or generate new modelView and projection matrix.
	@js NA
]]
function cc.RenderTexture:setKeepMatrix(bool_keepMatrix) end
--[[
	Set flags.
	@param clearFlags Valid flags: GL_COLOR_BUFFER_BIT, GL_DEPTH_BUFFER_BIT, GL_STENCIL_BUFFER_BIT.
]]
function cc.RenderTexture:setClearFlags(unsigned_int_clearFlags) end
--[[
	Starts grabbing.
]]
function cc.RenderTexture:begin() end
--[[
	Saves the texture into a file using JPEG format. The file will be saved in the Documents folder.
	Returns true if the operation is successful.
	@param filename The file name.
	@param isRGBA The file is RGBA or not.
	@param callback When the file is save finished,it will callback this function.
	@return bool   Returns true if the operation is successful.
]]
function cc.RenderTexture:saveToFile(const_std_string_filename,bool_isRGBA) end
--[[
	saves the texture into a file. The format could be JPG or PNG. The file will be saved in the Documents folder.
	Returns true if the operation is successful.
	Notes: since v3.x, saveToFile will generate a custom command, which will be called in the following render->render().
	So if this function is called in a event handler, the actual save file will be called in the next frame. If we switch to a different scene, the game will crash.
	To solve this, add Director::getInstance()->getRenderer()->render(); after this function.
	@param filename The file name.
	@param format The image format.
	@param isRGBA The file is RGBA or not.
	@param callback When the file is save finished,it will callback this function.
	@return bool   Returns true if the operation is successful.
]]
function cc.RenderTexture:saveToFile(const_std_string_filename,Image_Format_format,bool_isRGBA) end
--[[
	Set a valve to control whether or not render its children into the texture automatically.
	@param isAutoDraw Whether or not render its children into the texture automatically.
]]
function cc.RenderTexture:setAutoDraw(bool_isAutoDraw) end
--[[
	Set color value.
	@param clearColor Color value.
]]
function cc.RenderTexture:setClearColor(const_Color4F_clearColor) end
--[[
	Starts rendering to the texture while clearing the texture first.
	This is more efficient then calling -clear first and then -begin.
	@param r Red.
	@param g Green.
	@param b Blue.
	@param a Alpha.
]]
function cc.RenderTexture:beginWithClear(float_r,float_g,float_b,float_a) end
--[[
	Starts rendering to the texture while clearing the texture first.
	This is more efficient then calling -clear first and then -begin.
	@param r Red.
	@param g Green.
	@param b Blue.
	@param a Alpha.
	@param depthValue The depth Value.
]]
function cc.RenderTexture:beginWithClear(float_r,float_g,float_b,float_a,float_depthValue) end
--[[
	Starts rendering to the texture while clearing the texture first.
	This is more efficient then calling -clear first and then -begin.
	@param r Red.
	@param g Green.
	@param b Blue.
	@param a Alpha.
	@param depthValue A specified depth value.
	@param stencilValue A specified stencil value.
]]
function cc.RenderTexture:beginWithClear(float_r,float_g,float_b,float_a,float_depthValue,int_stencilValue) end
function cc.RenderTexture:beginWithClear(float_r,float_g,float_b,float_a,float_depthValue,int_stencilValue,GLbitfield_flags) end
--[[
	Clears the texture with a specified depth value.
	@param depthValue A specified depth value.
]]
function cc.RenderTexture:clearDepth(float_depthValue) end
--[[
	Clear color value. Valid only when "autoDraw" is true.
	@return [luaIde#Color4F]   Color value.
]]
function cc.RenderTexture:getClearColor() end
--[[
	Clears the texture with a color.
	@param r Red.
	@param g Green.
	@param b Blue.
	@param a Alpha.
]]
function cc.RenderTexture:clear(float_r,float_g,float_b,float_a) end
--[[
	Valid flags: GL_COLOR_BUFFER_BIT, GL_DEPTH_BUFFER_BIT, GL_STENCIL_BUFFER_BIT. They can be OR'ed. Valid when "autoDraw" is true.
	@return int   Clear flags.
]]
function cc.RenderTexture:getClearFlags() end
--[[
	Creates a new Image from with the texture's data.
	Caller is responsible for releasing it by calling delete.
	@param flipImage Whether or not to flip image.
	@return [luaIde#cc.Image]   An image.
	@js NA
]]
function cc.RenderTexture:newImage(bool_flipImage) end
--[[
	Set Value for clearDepth.
	@param clearDepth Value for clearDepth.
]]
function cc.RenderTexture:setClearDepth(float_clearDepth) end
--[[
	Initializes a RenderTexture object with width and height in Points and a pixel format, only RGB and RGBA formats are valid.
	@param w The RenderTexture object width.
	@param h The RenderTexture object height.
	@param format In Points and a pixel format( only RGB and RGBA formats are valid ).
	@return bool   If succeed, it will return true.
]]
function cc.RenderTexture:initWithWidthAndHeight(int_w,int_h,Texture2D_PixelFormat_format) end
--[[
	Initializes a RenderTexture object with width and height in Points and a pixel format( only RGB and RGBA formats are valid ) and depthStencil format.
	@param w The RenderTexture object width.
	@param h The RenderTexture object height.
	@param format In Points and a pixel format( only RGB and RGBA formats are valid ).
	@param depthStencilFormat The depthStencil format.
	@return bool   If succeed, it will return true.
]]
function cc.RenderTexture:initWithWidthAndHeight(int_w,int_h,Texture2D_PixelFormat_format,GLuint_depthStencilFormat) end
--[[
	Initializes a RenderTexture object with width and height in Points and a pixel format( only RGB and RGBA formats are valid ) and depthStencil format.
	@param w The RenderTexture object width.
	@param h The RenderTexture object height.
	@param format In Points and a pixel format( only RGB and RGBA formats are valid ).
	@param depthStencilFormat The depthStencil format.
	@return [luaIde#cc.RenderTexture]
]]
function cc.RenderTexture:create(int_w,int_h,Texture2D_PixelFormat_format,GLuint_depthStencilFormat) end
--[[
	Creates a RenderTexture object with width and height in Points and a pixel format, only RGB and RGBA formats are valid.
	@param w The RenderTexture object width.
	@param h The RenderTexture object height.
	@param format In Points and a pixel format( only RGB and RGBA formats are valid ).
	@return [luaIde#cc.RenderTexture]
]]
function cc.RenderTexture:create(int_w,int_h,Texture2D_PixelFormat_format) end
--[[
	Creates a RenderTexture object with width and height in Points, pixel format is RGBA8888.
	@param w The RenderTexture object width.
	@param h The RenderTexture object height.
	@return [luaIde#cc.RenderTexture]
]]
function cc.RenderTexture:create(int_w,int_h) end

cc.TransitionEaseScene = {}
--[[
	Returns the Ease action that will be performed on a linear action.
	@since v0.8.2
	@param action A given interval action.
	@return [luaIde#cc.ActionInterval]   The Ease action that will be performed on a linear action.
]]
function cc.TransitionEaseScene:easeActionWithAction(ActionInterval__action) end

--[[
	@SuperType[luaIde#cc.Scene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionScene = {}
--[[
	@return [luaIde#cc.Scene]
]]
function cc.TransitionScene:getInScene() end
--[[
	Called after the transition finishes.
]]
function cc.TransitionScene:finish() end
--[[
	initializes a transition with duration and incoming scene
	@return bool
]]
function cc.TransitionScene:initWithDuration(float_t,Scene_scene) end
--[[
	@return float
]]
function cc.TransitionScene:getDuration() end
--[[
	Used by some transitions to hide the outer scene.
]]
function cc.TransitionScene:hideOutShowIn() end
--[[
	Creates a base transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionScene]   A autoreleased TransitionScene object.
]]
function cc.TransitionScene:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSceneOriented = {}
--[[
	initializes a transition with duration and incoming scene
	@return bool
]]
function cc.TransitionSceneOriented:initWithDuration(float_t,Scene_scene,Orientation_orientation) end
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@param orientation A given orientation: LeftOver, RightOver, UpOver, DownOver.
	@return [luaIde#cc.TransitionSceneOriented]   A autoreleased TransitionSceneOriented object.
]]
function cc.TransitionSceneOriented:create(float_t,Scene_scene,Orientation_orientation) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionRotoZoom = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionRotoZoom]   A autoreleased TransitionRotoZoom object.
]]
function cc.TransitionRotoZoom:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionJumpZoom = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionJumpZoom]   A autoreleased TransitionJumpZoom object.
]]
function cc.TransitionJumpZoom:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionMoveInL = {}
--[[
	Returns the action that will be performed.
	@return [luaIde#cc.ActionInterval]   The action that will be performed.
]]
function cc.TransitionMoveInL:action() end
--[[
	@return [luaIde#cc.ActionInterval]
]]
function cc.TransitionMoveInL:easeActionWithAction(ActionInterval__action) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionMoveInL]   A autoreleased TransitionMoveInL object.
]]
function cc.TransitionMoveInL:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionMoveInL]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionMoveInR = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionMoveInR]   A autoreleased TransitionMoveInR object.
]]
function cc.TransitionMoveInR:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionMoveInL]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionMoveInT = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionMoveInT]   A autoreleased TransitionMoveInT object.
]]
function cc.TransitionMoveInT:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionMoveInL]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionMoveInB = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionMoveInB]   A autoreleased TransitionMoveInB object.
]]
function cc.TransitionMoveInB:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSlideInL = {}
--[[
	Returns the action that will be performed by the incoming and outgoing scene.
	@return [luaIde#cc.ActionInterval]   The action that will be performed by the incoming and outgoing scene.
]]
function cc.TransitionSlideInL:action() end
--[[
	@return [luaIde#cc.ActionInterval]
]]
function cc.TransitionSlideInL:easeActionWithAction(ActionInterval__action) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionSlideInL]   A autoreleased TransitionSlideInL object.
]]
function cc.TransitionSlideInL:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionSlideInL]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSlideInR = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionSlideInR]   A autoreleased TransitionSlideInR object.
]]
function cc.TransitionSlideInR:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionSlideInL]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSlideInB = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionSlideInB]   A autoreleased TransitionSlideInB object.
]]
function cc.TransitionSlideInB:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionSlideInL]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSlideInT = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionSlideInT]   A autoreleased TransitionSlideInT object.
]]
function cc.TransitionSlideInT:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionShrinkGrow = {}
--[[
	@return [luaIde#cc.ActionInterval]
]]
function cc.TransitionShrinkGrow:easeActionWithAction(ActionInterval__action) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionShrinkGrow]   A autoreleased TransitionShrinkGrow object.
]]
function cc.TransitionShrinkGrow:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionSceneOriented]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFlipX = {}
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param s A given scene.
	@param o A given orientation.
	@return [luaIde#cc.TransitionFlipX]   A autoreleased TransitionFlipX object.
]]
function cc.TransitionFlipX:create(float_t,Scene_s,Orientation_o) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param s A given scene.
	@return [luaIde#cc.TransitionFlipX]   A autoreleased TransitionFlipX object.
]]
function cc.TransitionFlipX:create(float_t,Scene_s) end

--[[
	@SuperType[luaIde#cc.TransitionSceneOriented]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFlipY = {}
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param s A given scene.
	@param o A given orientation.
	@return [luaIde#cc.TransitionFlipY]   A autoreleased TransitionFlipY object.
]]
function cc.TransitionFlipY:create(float_t,Scene_s,Orientation_o) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param s A given scene.
	@return [luaIde#cc.TransitionFlipY]   A autoreleased TransitionFlipY object.
]]
function cc.TransitionFlipY:create(float_t,Scene_s) end

--[[
	@SuperType[luaIde#cc.TransitionSceneOriented]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFlipAngular = {}
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param s A given scene.
	@param o A given orientation.
	@return [luaIde#cc.TransitionFlipAngular]   A autoreleased TransitionFlipAngular object.
]]
function cc.TransitionFlipAngular:create(float_t,Scene_s,Orientation_o) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param s A given scene.
	@return [luaIde#cc.TransitionFlipAngular]   A autoreleased TransitionFlipAngular object.
]]
function cc.TransitionFlipAngular:create(float_t,Scene_s) end

--[[
	@SuperType[luaIde#cc.TransitionSceneOriented]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionZoomFlipX = {}
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param s A given scene.
	@param o A given orientation.
	@return [luaIde#cc.TransitionZoomFlipX]   A autoreleased TransitionZoomFlipX object.
]]
function cc.TransitionZoomFlipX:create(float_t,Scene_s,Orientation_o) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param s A given scene.
	@return [luaIde#cc.TransitionZoomFlipX]   A autoreleased TransitionZoomFlipX object.
]]
function cc.TransitionZoomFlipX:create(float_t,Scene_s) end

--[[
	@SuperType[luaIde#cc.TransitionSceneOriented]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionZoomFlipY = {}
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param s A given scene.
	@param o A given orientation.
	@return [luaIde#cc.TransitionZoomFlipY]   A autoreleased TransitionZoomFlipY object.
]]
function cc.TransitionZoomFlipY:create(float_t,Scene_s,Orientation_o) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param s A given scene.
	@return [luaIde#cc.TransitionZoomFlipY]   A autoreleased TransitionZoomFlipY object.
]]
function cc.TransitionZoomFlipY:create(float_t,Scene_s) end

--[[
	@SuperType[luaIde#cc.TransitionSceneOriented]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionZoomFlipAngular = {}
--[[
	Creates a transition with duration, incoming scene and orientation.
	@param t Duration time, in seconds.
	@param s A given scene.
	@param o A given orientation.
	@return [luaIde#cc.TransitionZoomFlipAngular]   A autoreleased TransitionZoomFlipAngular object.
]]
function cc.TransitionZoomFlipAngular:create(float_t,Scene_s,Orientation_o) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param s A given scene.
	@return [luaIde#cc.TransitionZoomFlipAngular]   A autoreleased TransitionZoomFlipAngular object.
]]
function cc.TransitionZoomFlipAngular:create(float_t,Scene_s) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFade = {}
--[[
	initializes the transition with a duration and with an RGB color
	@return bool
]]
function cc.TransitionFade:initWithDuration(float_t,Scenescene,const_Color3B_color) end
--[[
	Creates the transition with a duration and with an RGB color
	Example: FadeTransition::create(2, scene, Color3B(255,0,0); // red color
	@param duration Duration time, in seconds.
	@param scene A given scene.
	@param color A given transition color.
	@return [luaIde#cc.TransitionFade]   A autoreleased TransitionFade object.
]]
function cc.TransitionFade:create(float_duration,Scene_scene,const_Color3B_color) end
--[[
	Creates the transition with a duration.
	@param duration Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionFade]   A autoreleased TransitionFade object.
]]
function cc.TransitionFade:create(float_duration,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionCrossFade = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionCrossFade]   A autoreleased TransitionCrossFade object.
]]
function cc.TransitionCrossFade:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionTurnOffTiles = {}
--[[
	@return [luaIde#cc.ActionInterval]
]]
function cc.TransitionTurnOffTiles:easeActionWithAction(ActionInterval__action) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionTurnOffTiles]   A autoreleased TransitionTurnOffTiles object.
]]
function cc.TransitionTurnOffTiles:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSplitCols = {}
--[[
	Returns the action that will be performed.
	@return [luaIde#cc.ActionInterval]   The action that will be performed.
]]
function cc.TransitionSplitCols:action() end
--[[
	@return [luaIde#cc.ActionInterval]
]]
function cc.TransitionSplitCols:easeActionWithAction(ActionInterval__action) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionSplitCols]   A autoreleased TransitionSplitCols object.
]]
function cc.TransitionSplitCols:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionSplitCols]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionSplitRows = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionSplitRows]   A autoreleased TransitionSplitRows object.
]]
function cc.TransitionSplitRows:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFadeTR = {}
--[[
	@return [luaIde#cc.ActionInterval]
]]
function cc.TransitionFadeTR:easeActionWithAction(ActionInterval__action) end
--[[
	Returns the action that will be performed with size.
	@param size A given size.
	@return [luaIde#cc.ActionInterval]   The action that will be performed.
]]
function cc.TransitionFadeTR:actionWithSize(const_Size_size) end
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionFadeTR]   A autoreleased TransitionFadeTR object.
]]
function cc.TransitionFadeTR:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionFadeTR]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFadeBL = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionFadeBL]   A autoreleased TransitionFadeBL object.
]]
function cc.TransitionFadeBL:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionFadeTR]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFadeUp = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionFadeUp]   A autoreleased TransitionFadeUp object.
]]
function cc.TransitionFadeUp:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionFadeTR]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransition.h
]]
cc.TransitionFadeDown = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionFadeDown]   A autoreleased TransitionFadeDown object.
]]
function cc.TransitionFadeDown:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionPageTurn.h
]]
cc.TransitionPageTurn = {}
--[[
	Returns the action that will be performed with size.
	@param vector A given size.
	@return [luaIde#cc.ActionInterval]   The action that will be performed.
]]
function cc.TransitionPageTurn:actionWithSize(const_Size_vector) end
--[[
	Creates a base transition with duration and incoming scene.
	If back is true then the effect is reversed to appear as if the incoming
	scene is being turned from left over the outgoing scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@param backwards If back is true then the effect is reversed to appear as if the incoming scene is being turned from left over the outgoing scene.
	@return bool   True if initialize success.
]]
function cc.TransitionPageTurn:initWithDuration(float_t,Scene_scene,bool_backwards) end
--[[
	Creates a base transition with duration and incoming scene.
	If back is true then the effect is reversed to appear as if the incoming
	scene is being turned from left over the outgoing scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@param backwards If back is true then the effect is reversed to appear as if the incoming scene is being turned from left over the outgoing scene.
	@return [luaIde#cc.TransitionPageTurn]   An autoreleased TransitionPageTurn object.
]]
function cc.TransitionPageTurn:create(float_t,Scene_scene,bool_backwards) end

--[[
	@SuperType[luaIde#cc.TransitionScene]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgress = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgress]   An autoreleased TransitionProgress object.
]]
function cc.TransitionProgress:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionProgress]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgressRadialCCW = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgressRadialCCW]   An autoreleased TransitionProgressRadialCCW object.
]]
function cc.TransitionProgressRadialCCW:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionProgress]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgressRadialCW = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgressRadialCW]   An autoreleased TransitionProgressRadialCW object.
]]
function cc.TransitionProgressRadialCW:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionProgress]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgressHorizontal = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgressHorizontal]   An autoreleased TransitionProgressHorizontal object.
]]
function cc.TransitionProgressHorizontal:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionProgress]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgressVertical = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgressVertical]   An autoreleased TransitionProgressVertical object.
]]
function cc.TransitionProgressVertical:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionProgress]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgressInOut = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgressInOut]   An autoreleased TransitionProgressInOut object.
]]
function cc.TransitionProgressInOut:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.TransitionProgress]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTransitionProgress.h
]]
cc.TransitionProgressOutIn = {}
--[[
	Creates a transition with duration and incoming scene.
	@param t Duration time, in seconds.
	@param scene A given scene.
	@return [luaIde#cc.TransitionProgressOutIn]   An autoreleased TransitionProgressOutIn object.
]]
function cc.TransitionProgressOutIn:create(float_t,Scene_scene) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCCamera.h
]]
cc.Camera = {}
--[[
	Restore the FBO, RenderTargets and viewport.
]]
function cc.Camera:restore() end
--[[
	get depth, camera with larger depth is drawn on top of camera with smaller depth, the depth of camera with CameraFlag::DEFAULT is 0, user defined camera is -1 by default
	@return [luaIde#int8_t]
]]
function cc.Camera:getDepth() end
--[[
	get view projection matri
	@return [luaIde#Mat4]
]]
function cc.Camera:getViewProjectionMatrix() end
function cc.Camera:applyViewport() end
--[[
	set the background brush. See CameraBackgroundBrush for more information.
	@param clearBrush Brush used to clear the background
]]
function cc.Camera:setBackgroundBrush(CameraBackgroundBrush_clearBrush) end
--[[
	Make Camera looks at target
	@param target The target camera is point at
	@param up The up vector, usually it's Y axis
]]
function cc.Camera:lookAt(const_Vec3_target,const_Vec3_up) end
--[[
	Apply the FBO, RenderTargets and viewport.
]]
function cc.Camera:apply() end
--[[
	Get clear brush
	@return [luaIde#cc.CameraBackgroundBrush]
]]
function cc.Camera:getBackgroundBrush() end
--[[
	Gets the camera's projection matrix.
	@return [luaIde#Mat4]   The camera projection matrix.
]]
function cc.Camera:getProjectionMatrix() end
--[[
	@return bool
]]
function cc.Camera:isBrushValid() end
--[[
	Get object depth towards camera
	@return float
]]
function cc.Camera:getDepthInView(const_Mat4_transform) end
function cc.Camera:restoreViewport() end
--[[
	Before rendering scene with this camera, the background need to be cleared. It clears the depth buffer with max depth by default. Use setBackgroundBrush to modify the default behavior
]]
function cc.Camera:clearBackground() end
--[[
	set additional matrix for the projection matrix, it multiplies mat to projection matrix when called, used by WP
]]
function cc.Camera:setAdditionalProjection(const_Mat4_mat) end
--[[
	Set Viewport for camera.
]]
function cc.Camera:setViewport(const_experimental_Viewport_vp) end
--[[
	init camera
	@return bool
]]
function cc.Camera:initDefault() end
--[[
	get & set Camera fla
	@return [luaIde#CameraFlag]
]]
function cc.Camera:getCameraFlag() end
--[[
	Gets the type of camera.
	@return [luaIde#Camera_Type]   The camera type.
]]
function cc.Camera:getType() end
--[[
	@return bool
]]
function cc.Camera:initOrthographic(float_zoomX,float_zoomY,float_nearPlane,float_farPlane) end
--[[
	get rendered order
	@return int
]]
function cc.Camera:getRenderOrder() end
--[[
	Is this aabb visible in frustum
	@return bool
]]
function cc.Camera:isVisibleInFrustum(const_AABB_aabb) end
--[[
	set depth, camera with larger depth is drawn on top of camera with smaller depth, the depth of camera with CameraFlag::DEFAULT is 0, user defined camera is -1 by default
]]
function cc.Camera:setDepth(int8_t_depth) end
--[[
	Set the scene,this method shall not be invoke manually
]]
function cc.Camera:setScene(Scene_scene) end
--[[
	convert the specified point in 3D world-space coordinates into the GL-screen-space coordinates.
	Origin point at left bottom corner in GL-screen-space.
	@param src The 3D world-space position.
	@return [luaIde#cc.Vec2]   The GL-screen-space position.
]]
function cc.Camera:projectGL(const_Vec3_src) end
function cc.Camera:restoreFrameBufferObject() end
--[[
	Gets the camera's view matrix.
	@return [luaIde#Mat4]   The camera view matrix.
]]
function cc.Camera:getViewMatrix() end
--[[
	Get the frustum's near plane.
	@return float
]]
function cc.Camera:getNearPlane() end
--[[
	convert the specified point in 3D world-space coordinates into the screen-space coordinates.
	Origin point at left top corner in screen-space.
	@param src The world-space position.
	@return [luaIde#cc.Vec2]   The screen-space position.
]]
function cc.Camera:project(const_Vec3_src) end
function cc.Camera:setCameraFlag(CameraFlag_flag) end
--[[
	Get the frustum's far plane.
	@return float
]]
function cc.Camera:getFarPlane() end
function cc.Camera:applyFrameBufferObject() end
--[[
	Set FBO, which will attach several render target for the rendered result.
]]
function cc.Camera:setFrameBufferObject(experimental_FrameBuffer_fbo) end
--[[
	Whether or not the viewprojection matrix was updated since the last frame.
	@return bool   True if the viewprojection matrix was updated since the last frame.
]]
function cc.Camera:isViewProjectionUpdated() end
--[[
	@return bool
]]
function cc.Camera:initPerspective(float_fieldOfView,float_aspectRatio,float_nearPlane,float_farPlane) end
--[[
	Creates an orthographic camera.
	@param zoomX The zoom factor along the X-axis of the orthographic projection (the width of the ortho projection).
	@param zoomY The zoom factor along the Y-axis of the orthographic projection (the height of the ortho projection).
	@param nearPlane The near plane distance.
	@param farPlane The far plane distance.
	@return [luaIde#cc.Camera]
]]
function cc.Camera:createOrthographic(float_zoomX,float_zoomY,float_nearPlane,float_farPlane) end
--[[
	Get the visiting camera , the visiting camera shall be set on Scene::render
	@return [luaIde#cc.Camera]
]]
function cc.Camera:getVisitingCamera() end
--[[
	create default camera, the camera type depends on Director::getProjection, the depth of the default camera is 0
	@return [luaIde#cc.Camera]
]]
function cc.Camera:create() end
--[[
	Creates a perspective camera.
	@param fieldOfView The field of view for the perspective camera (normally in the range of 40-60 degrees).
	@param aspectRatio The aspect ratio of the camera (normally the width of the viewport divided by the height of the viewport).
	@param nearPlane The near plane distance.
	@param farPlane The far plane distance.
	@return [luaIde#cc.Camera]
]]
function cc.Camera:createPerspective(float_fieldOfView,float_aspectRatio,float_nearPlane,float_farPlane) end
--[[
	@return [luaIde#experimental_Viewport]
]]
function cc.Camera:getDefaultViewport() end
function cc.Camera:setDefaultViewport(const_experimental_Viewport_vp) end
--[[
	Get the default camera of the current running scene.
	@return [luaIde#cc.Camera]
]]
function cc.Camera:getDefaultCamera() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCCameraBackgroundBrush.h
]]
cc.CameraBackgroundBrush = {}
--[[
	get brush type
	@return [luaIde#BrushType]   BrushType
]]
function cc.CameraBackgroundBrush:getBrushType() end
function cc.CameraBackgroundBrush:drawBackground(Camera_camera) end
--[[
	@return bool
]]
function cc.CameraBackgroundBrush:init() end
--[[
	@return bool
]]
function cc.CameraBackgroundBrush:isValid() end
--[[
	Creates a color brush
	@param color Color of brush
	@param depth Depth used to clear depth buffer
	@return [luaIde#cc.CameraBackgroundColorBrush]   Created brush
]]
function cc.CameraBackgroundBrush:createColorBrush(const_Color4F_color,float_depth) end
--[[
	Creates a none brush, it does nothing when clear the background
	@return [luaIde#cc.CameraBackgroundBrush]   Created brush.
]]
function cc.CameraBackgroundBrush:createNoneBrush() end
--[[
	Creates a depth brush, which clears depth buffer with a given depth.
	@param depth Depth used to clear depth buffer
	@return [luaIde#cc.CameraBackgroundDepthBrush]   Created brush
]]
function cc.CameraBackgroundBrush:createDepthBrush(float_depth) end

--[[
	@SuperType[luaIde#cc.CameraBackgroundBrush]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCCameraBackgroundBrush.h
]]
cc.CameraBackgroundDepthBrush = {}
--[[
	Set depth
	@param depth Depth used to clear depth buffer
]]
function cc.CameraBackgroundDepthBrush:setDepth(float_depth) end
--[[
	Create a depth brush
	@param depth Depth used to clear the depth buffer
	@return [luaIde#cc.CameraBackgroundDepthBrush]   Created brush
]]
function cc.CameraBackgroundDepthBrush:create(float_depth) end

--[[
	@SuperType[luaIde#cc.CameraBackgroundDepthBrush]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCCameraBackgroundBrush.h
]]
cc.CameraBackgroundColorBrush = {}
--[[
	Set clear color
	@param color Color used to clear the color buffer
]]
function cc.CameraBackgroundColorBrush:setColor(const_Color4F_color) end
--[[
	Create a color brush
	@param color Color used to clear the color buffer
	@param depth Depth used to clear the depth buffer
	@return [luaIde#cc.CameraBackgroundColorBrush]   Created brush
]]
function cc.CameraBackgroundColorBrush:create(const_Color4F_color,float_depth) end

--[[
	@SuperType[luaIde#cc.CameraBackgroundBrush]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCCameraBackgroundBrush.h
]]
cc.CameraBackgroundSkyBoxBrush = {}
function cc.CameraBackgroundSkyBoxBrush:setTextureValid(bool_valid) end
--[[
	Set skybox texture
	@param texture Skybox texture
]]
function cc.CameraBackgroundSkyBoxBrush:setTexture(TextureCube__texture) end
function cc.CameraBackgroundSkyBoxBrush:setActived(bool_actived) end
--[[
	@return bool
]]
function cc.CameraBackgroundSkyBoxBrush:isActived() end
--[[
	Creates a Skybox brush with 6 textures.
	@return [luaIde#cc.CameraBackgroundSkyBoxBrush]
]]
function cc.CameraBackgroundSkyBoxBrush:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCGrid.h
]]
cc.GridBase = {}
--[[
	Set the size of the grid
]]
function cc.GridBase:setGridSize(const_Size_gridSize) end
--[[
	@brief Set the effect grid rect.
	@param rect The effect grid rect.
]]
function cc.GridBase:setGridRect(const_Rect_rect) end
function cc.GridBase:afterBlit() end
--[[
	@brief Get the effect grid rect.
	@return [luaIde#cc.Rect]   Return the effect grid rect.
]]
function cc.GridBase:getGridRect() end
function cc.GridBase:afterDraw(Node_target) end
--[[
	@{
	Init and reset the status when render effects by using the grid.
]]
function cc.GridBase:beforeDraw() end
--[[
	Interface, Calculate the vertices used for the blit
]]
function cc.GridBase:calculateVertexPoints() end
--[[
	is texture flipped.
	@return bool
]]
function cc.GridBase:isTextureFlipped() end
--[[
	Size of the grid.
	@return [luaIde#cc.Size]
]]
function cc.GridBase:getGridSize() end
--[[
	Pixels between the grids.
	@return [luaIde#cc.Vec2]
]]
function cc.GridBase:getStep() end
--[[
	Change projection to 2D for grabbing
]]
function cc.GridBase:set2DProjection() end
--[[
	Get the pixels between the grids
]]
function cc.GridBase:setStep(const_Vec2_step) end
--[[
	Set the texture flipped or not
]]
function cc.GridBase:setTextureFlipped(bool_flipped) end
--[[
	Interface used to blit the texture with grid to screen
]]
function cc.GridBase:blit() end
function cc.GridBase:setActive(bool_active) end
--[[
	Get number of times that the grid will be reused.
	@return int
]]
function cc.GridBase:getReuseGrid() end
--[[
	@{
	Init the Grid base.
	@param gridSize the size of the grid.
	@param texture The texture used for grab.
	@param flipped whether or not the grab texture should be flip by Y or not.
	@param rect The effective grid rect.
	@return bool
]]
function cc.GridBase:initWithSize(const_Size_gridSize) end
--[[
	@return bool
]]
function cc.GridBase:initWithSize(const_Size_gridSize,Texture2D_texture,bool_flipped) end
--[[
	@{
	Interface for custom action when before or after draw.
	@js NA
]]
function cc.GridBase:beforeBlit() end
--[[
	Set number of times that the grid will be reused.
]]
function cc.GridBase:setReuseGrid(int_reuseGrid) end
--[[
	@{
	Getter and setter of the active state of the grid.
	@return bool
]]
function cc.GridBase:isActive() end
--[[
	Interface, Reuse the grid vertices
]]
function cc.GridBase:reuse() end
--[[
	create one Grid
	@return [luaIde#cc.GridBase]
]]
function cc.GridBase:create(const_Size_gridSize,Texture2D_texture,bool_flipped) end
--[[
	create one Grid
	@return [luaIde#cc.GridBase]
]]
function cc.GridBase:create(const_Size_gridSize) end

--[[
	@SuperType[luaIde#cc.GridBase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCGrid.h
]]
cc.Grid3D = {}
--[[
	@return bool
]]
function cc.Grid3D:getNeedDepthTestForBlit() end
--[[
	@{
	Getter and Setter for depth test state when blit.
	@js NA
]]
function cc.Grid3D:setNeedDepthTestForBlit(bool_neededDepthTest) end
--[[
	create one Grid.
	@return [luaIde#cc.Grid3D]
]]
function cc.Grid3D:create(const_Size_gridSize) end
--[[
	create one Grid.
	@return [luaIde#cc.Grid3D]
]]
function cc.Grid3D:create(const_Size_gridSize,const_Rect_rect) end
--[[
	create one Grid.
	@return [luaIde#cc.Grid3D]
]]
function cc.Grid3D:create(const_Size_gridSize,Texture2D_texture,bool_flipped) end
--[[
	create one Grid.
	@return [luaIde#cc.Grid3D]
]]
function cc.Grid3D:create(const_Size_gridSize,Texture2D_texture,bool_flipped,const_Rect_rect) end

--[[
	@SuperType[luaIde#cc.GridBase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCGrid.h
]]
cc.TiledGrid3D = {}
--[[
	Create one Grid.
	@return [luaIde#cc.TiledGrid3D]
]]
function cc.TiledGrid3D:create(const_Size_gridSize) end
--[[
	Create one Grid.
	@return [luaIde#cc.TiledGrid3D]
]]
function cc.TiledGrid3D:create(const_Size_gridSize,const_Rect_rect) end
--[[
	Create one Grid.
	@return [luaIde#cc.TiledGrid3D]
]]
function cc.TiledGrid3D:create(const_Size_gridSize,Texture2D_texture,bool_flipped) end
--[[
	Create one Grid.
	@return [luaIde#cc.TiledGrid3D]
]]
function cc.TiledGrid3D:create(const_Size_gridSize,Texture2D_texture,bool_flipped,const_Rect_rect) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLight.h
]]
cc.BaseLight = {}
--[[
	light enabled getter and setter.
]]
function cc.BaseLight:setEnabled(bool_enabled) end
--[[
	intensity getter and setter
	@return float
]]
function cc.BaseLight:getIntensity() end
--[[
	@return bool
]]
function cc.BaseLight:isEnabled() end
--[[
	Get the light type,light type MUST be one of LightType::DIRECTIONAL ,
	LightType::POINT, LightType::SPOT, LightType::AMBIENT.
	@return [luaIde#LightType]
]]
function cc.BaseLight:getLightType() end
function cc.BaseLight:setLightFlag(LightFlag_flag) end
function cc.BaseLight:setIntensity(float_intensity) end
--[[
	light flag getter and sette
	@return [luaIde#LightFlag]
]]
function cc.BaseLight:getLightFlag() end

--[[
	@SuperType[luaIde#cc.BaseLight]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLight.h
]]
cc.DirectionLight = {}
--[[
	Returns the Direction in parent.
	@return [luaIde#cc.Vec3]
]]
function cc.DirectionLight:getDirection() end
--[[
	Returns direction in world.
	@return [luaIde#cc.Vec3]
]]
function cc.DirectionLight:getDirectionInWorld() end
--[[
	Sets the Direction in parent.
	@param dir The Direction in parent.
]]
function cc.DirectionLight:setDirection(const_Vec3_dir) end
--[[
	Creates a direction light.
	@param direction The light's direction
	@param color The light's color.
	@return [luaIde#cc.DirectionLight]   The new direction light.
]]
function cc.DirectionLight:create(const_Vec3_direction,const_Color3B_color) end

--[[
	@SuperType[luaIde#cc.BaseLight]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLight.h
]]
cc.PointLight = {}
--[[
	get or set range
	@return float
]]
function cc.PointLight:getRange() end
function cc.PointLight:setRange(float_range) end
--[[
	Creates a point light.
	@param position The light's position
	@param color The light's color.
	@param range The light's range.
	@return [luaIde#cc.PointLight]   The new point light.
]]
function cc.PointLight:create(const_Vec3_position,const_Color3B_color,float_range) end

--[[
	@SuperType[luaIde#cc.BaseLight]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLight.h
]]
cc.SpotLight = {}
--[[
	Returns the range of point or spot light.
	@return float   The range of the point or spot light.
]]
function cc.SpotLight:getRange() end
--[[
	Sets the Direction in parent.
	@param dir The Direction in parent.
]]
function cc.SpotLight:setDirection(const_Vec3_dir) end
--[[
	get cos innerAngle
	@return float
]]
function cc.SpotLight:getCosInnerAngle() end
--[[
	Returns the outer angle of the spot light (in radians).
	@return float
]]
function cc.SpotLight:getOuterAngle() end
--[[
	Returns the inner angle the spot light (in radians).
	@return float
]]
function cc.SpotLight:getInnerAngle() end
--[[
	Returns the Direction in parent.
	@return [luaIde#cc.Vec3]
]]
function cc.SpotLight:getDirection() end
--[[
	get cos outAngle
	@return float
]]
function cc.SpotLight:getCosOuterAngle() end
--[[
	Sets the outer angle of a spot light (in radians).
	@param outerAngle The angle of spot light (in radians).
]]
function cc.SpotLight:setOuterAngle(float_outerAngle) end
--[[
	Sets the inner angle of a spot light (in radians).
	@param angle The angle of spot light (in radians).
]]
function cc.SpotLight:setInnerAngle(float_angle) end
--[[
	Returns direction in world.
	@return [luaIde#cc.Vec3]
]]
function cc.SpotLight:getDirectionInWorld() end
--[[
	Sets the range of point or spot light.
	@param range The range of point or spot light.
]]
function cc.SpotLight:setRange(float_range) end
--[[
	Creates a spot light.
	@param direction The light's direction
	@param position The light's position
	@param color The light's color.
	@param innerAngle The light's inner angle (in radians).
	@param outerAngle The light's outer angle (in radians).
	@param range The light's range.
	@return [luaIde#cc.SpotLight]   The new spot light.
]]
function cc.SpotLight:create(const_Vec3_direction,const_Vec3_position,const_Color3B_color,float_innerAngle,float_outerAngle,float_range) end

--[[
	@SuperType[luaIde#cc.BaseLight]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLight.h
]]
cc.AmbientLight = {}
--[[
	Creates a ambient light.
	@param color The light's color.
	@return [luaIde#cc.AmbientLight]   The new ambient light.
]]
function cc.AmbientLight:create(const_Color3B_color) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCGLProgram.h
]]
cc.GLProgram = {}
--[[
	returns the fragmentShader error log
	@return std_string
]]
function cc.GLProgram:getFragmentShaderLog() end
--[[
	@return bool
]]
function cc.GLProgram:initWithByteArrays(const_GLchar_vShaderByteArray,const_GLchar_fShaderByteArray) end
--[[
	@return bool
]]
function cc.GLProgram:initWithByteArrays(const_GLchar_vShaderByteArray,const_GLchar_fShaderByteArray,const_std_string_compileTimeDefines) end
--[[
	@return bool
]]
function cc.GLProgram:initWithByteArrays(const_GLchar_vShaderByteArray,const_GLchar_fShaderByteArray,const_std_string_compileTimeHeaders,const_std_string_compileTimeDefines) end
--[[
	@return bool
]]
function cc.GLProgram:initWithFilenames(const_std_string_vShaderFilename,const_std_string_fShaderFilename) end
--[[
	@return bool
]]
function cc.GLProgram:initWithFilenames(const_std_string_vShaderFilename,const_std_string_fShaderFilename,const_std_string_compileTimeDefines) end
--[[
	@return bool
]]
function cc.GLProgram:initWithFilenames(const_std_string_vShaderFilename,const_std_string_fShaderFilename,const_std_string_compileTimeHeaders,const_std_string_compileTimeDefines) end
--[[
	it will call glUseProgram()
]]
function cc.GLProgram:use() end
--[[
	returns the vertexShader error log
	@return std_string
]]
function cc.GLProgram:getVertexShaderLog() end
--[[
	Update the builtin uniforms if they are different than the previous call for this same shader program.
	@param modelView modelView matrix applied to the built in uniform of the shader.
]]
function cc.GLProgram:setUniformsForBuiltins(const_Mat4_modelView) end
--[[
	Update the builtin uniforms if they are different than the previous call for this same shader program.
]]
function cc.GLProgram:setUniformsForBuiltins() end
--[[
	It will create 4 uniforms:
	- kUniformPMatrix
	- kUniformMVMatrix
	- kUniformMVPMatrix
	- GLProgram::UNIFORM_SAMPLER
	And it will bind "GLProgram::UNIFORM_SAMPLER" to 0
]]
function cc.GLProgram:updateUniforms() end
--[[
	Reload all shaders, this function is designed for android
	when opengl context lost, so don't call it.
]]
function cc.GLProgram:reset() end
--[[
	It will add a new attribute to the shader by calling glBindAttribLocation.
]]
function cc.GLProgram:bindAttribLocation(const_std_string_attributeName,GLuint_index) end
--[[
	Calls glGetAttribLocation.
	@return [luaIde#GLint]
]]
function cc.GLProgram:getAttribLocation(const_std_string_attributeName) end
--[[
	links the glProgram
	@return bool
]]
function cc.GLProgram:link() end
--[[
	@{
	Create or Initializes the GLProgram with a vertex and fragment with bytes array.
	@js initWithString.
	@lua initWithString.
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgram:createWithByteArrays(const_GLchar_vShaderByteArray,const_GLchar_fShaderByteArray) end
--[[
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgram:createWithByteArrays(const_GLchar_vShaderByteArray,const_GLchar_fShaderByteArray,const_std_string_compileTimeDefines) end
--[[
	@{
	Create or Initializes the GLProgram with a vertex and fragment with bytes array, with shader headers definition(eg. #version ... or #extension ...), with compileTimeDefines(eg. #define ...).
	@js initWithString.
	@lua initWithString.
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgram:createWithByteArrays(const_GLchar_vShaderByteArray,const_GLchar_fShaderByteArray,const_std_string_compileTimeHeaders,const_std_string_compileTimeDefines) end
--[[
	@{
	Create or Initializes the GLProgram with a vertex and fragment with contents of filenames.
	@js init
	@lua init
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgram:createWithFilenames(const_std_string_vShaderFilename,const_std_string_fShaderFilename) end
--[[
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgram:createWithFilenames(const_std_string_vShaderFilename,const_std_string_fShaderFilename,const_std_string_compileTimeDefines) end
--[[
	@{
	Create or Initializes the GLProgram with a vertex and fragment with contents of filenames, with shader headers definition(eg. #version ... or #extension ...), with compileTimeDefines(eg. #define ...).
	@js init
	@lua init
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgram:createWithFilenames(const_std_string_vShaderFilename,const_std_string_fShaderFilename,const_std_string_compileTimeHeaders,const_std_string_compileTimeDefines) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCGLProgramCache.h
]]
cc.GLProgramCache = {}
--[[
	reload default programs these are relative to light
]]
function cc.GLProgramCache:reloadDefaultGLProgramsRelativeToLights() end
--[[
	adds a GLProgram to the cache for a given name
]]
function cc.GLProgramCache:addGLProgram(GLProgram_program,const_std_string_key) end
--[[
	reload the default shaders
]]
function cc.GLProgramCache:reloadDefaultGLPrograms() end
--[[
	loads the default shaders
]]
function cc.GLProgramCache:loadDefaultGLPrograms() end
--[[
	returns a GL program for a given key
	@return [luaIde#cc.GLProgram]
]]
function cc.GLProgramCache:getGLProgram(const_std_string_key) end
--[[
	purges the cache. It releases the retained instance.
]]
function cc.GLProgramCache:destroyInstance() end
--[[
	returns the shared instance
	@return [luaIde#cc.GLProgramCache]
]]
function cc.GLProgramCache:getInstance() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCRenderState.h
]]
cc.RenderState = {}
--[[
	Texture that will use in the CC_Texture0 uniform.
	Added to be backwards compatible. Use Samplers from .material instead.
]]
function cc.RenderState:setTexture(Texture2D_texture) end
--[[
	Returns the topmost RenderState in the hierarchy below the given RenderState.
	@return [luaIde#cc.RenderState]
]]
function cc.RenderState:getTopmost(RenderState_below) end
--[[
	Returns the texture that is going to be used for CC_Texture0.
	Added to be backwards compatible.
	@return [luaIde#cc.Texture2D]
]]
function cc.RenderState:getTexture() end
--[[
	Binds the render state for this RenderState and any of its parents, top-down,
	for the given pass.
]]
function cc.RenderState:bind(Pass_pass) end
--[[
	Binds the state in this StateBlock to the renderer.
	This method handles both setting and restoring of render states to ensure that
	only the state explicitly defined by this StateBlock is applied to the renderer.
]]
function cc.RenderState:bind() end
--[[
	@return std_string
]]
function cc.RenderState:getName() end
--[[
	@return [luaIde#StateBlock]
]]
function cc.RenderState:getStateBlock() end
function cc.RenderState:setParent(RenderState_parent) end
--[[
	Static initializer that is called during game startup.
]]
function cc.RenderState:initialize() end

--[[
	@SuperType[luaIde#cc.RenderState]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCPass.h
]]
cc.Pass = {}
--[[
	Unbinds the Pass.
	This method must be called AFTER calling the actual draw call
]]
function cc.Pass:unbind() end
--[[
	Binds the GLProgramState and the RenderState.
	This method must be called before call the actual draw call.
]]
function cc.Pass:bind(const_Mat4_modelView) end
--[[
	Returns a clone (deep-copy) of this instance
	@return [luaIde#cc.Pass]
]]
function cc.Pass:clone() end
--[[
	Returns the GLProgramState
	@return [luaIde#cc.GLProgramState]
]]
function cc.Pass:getGLProgramState() end
--[[
	Returns the vertex attribute binding for this pass.
	@return [luaIde#VertexAttribBinding]   The vertex attribute binding for this pass.
]]
function cc.Pass:getVertexAttributeBinding() end
--[[
	@return [luaIde#uint32_t]
]]
function cc.Pass:getHash() end
--[[
	Sets a vertex attribute binding for this pass.
	When a mesh binding is set, the VertexAttribBinding will be automatically
	bound when the bind() method is called for the pass.
	@param binding The VertexAttribBinding to set (or NULL to remove an existing binding).
]]
function cc.Pass:setVertexAttribBinding(VertexAttribBinding_binding) end
--[[
	@return [luaIde#cc.Pass]
]]
function cc.Pass:create(Technique_parent) end
--[[
	Creates a Pass with a GLProgramState.
	@return [luaIde#cc.Pass]
]]
function cc.Pass:createWithGLProgramState(Technique_parent,GLProgramState_programState) end

--[[
	@SuperType[luaIde#cc.RenderState]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCTechnique.h
]]
cc.Technique = {}
--[[
	Returns the number of Passes in the Technique
	@return ssize_t
]]
function cc.Technique:getPassCount() end
--[[
	Returns a new clone of the Technique
	@return [luaIde#cc.Technique]
]]
function cc.Technique:clone() end
--[[
	Adds a new pass to the Technique.
	Order matters. First added, first rendered
]]
function cc.Technique:addPass(Pass_pass) end
--[[
	Returns the list of passes
	@return [luaIde#Vector__Pass__]
]]
function cc.Technique:getPasses() end
--[[
	Returns the name of the Technique
	@return std_string
]]
function cc.Technique:getName() end
--[[
	Returns the Pass at given index
	@return [luaIde#cc.Pass]
]]
function cc.Technique:getPassByIndex(ssize_t_index) end
--[[
	@return [luaIde#cc.Technique]
]]
function cc.Technique:create(Material_parent) end
--[[
	Creates a new Technique with a GLProgramState.
	Method added to support legacy code
	@return [luaIde#cc.Technique]
]]
function cc.Technique:createWithGLProgramState(Material_parent,GLProgramState_state) end

--[[
	@SuperType[luaIde#cc.RenderState]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCMaterial.h
]]
cc.Material = {}
--[[
	returns a clone (deep-copy) of the material
	@return [luaIde#cc.Material]
]]
function cc.Material:clone() end
--[[
	Returns the number of Techniques in the Material.
	@return ssize_t
]]
function cc.Material:getTechniqueCount() end
--[[
	sets the material name
]]
function cc.Material:setName(const_std_string_name) end
--[[
	Returns a Technique by index.
	returns `nullptr` if the index is invalid.
	@return [luaIde#cc.Technique]
]]
function cc.Material:getTechniqueByIndex(ssize_t_index) end
--[[
	@return std_string
]]
function cc.Material:getName() end
--[[
	Returns the list of Techniques
	@return [luaIde#Vector__Technique__]
]]
function cc.Material:getTechniques() end
--[[
	Sets the current technique
]]
function cc.Material:setTechnique(const_std_string_techniqueName) end
--[[
	Returns a Technique by its name.
	returns `nullptr` if the Technique can't be found.
	@return [luaIde#cc.Technique]
]]
function cc.Material:getTechniqueByName(const_std_string_name) end
--[[
	Adds a Technique into the Material
]]
function cc.Material:addTechnique(Technique_technique) end
--[[
	Returns the Technique used by the Material
	@return [luaIde#cc.Technique]
]]
function cc.Material:getTechnique() end
--[[
	Creates a Material using the data from the Properties object defined at the specified URL,
	where the URL is of the format "<file-path>.<extension>#<namespace-id>/<namespace-id>/.../<namespace-id>"
	(and "#<namespace-id>/<namespace-id>/.../<namespace-id>" is optional).
	@param url The URL pointing to the Properties object defining the material.
	@return [luaIde#cc.Material]   A new Material or NULL if there was an error.
]]
function cc.Material:createWithFilename(const_std_string_path) end
--[[
	Creates a Material with a GLProgramState.
	It will only contain one Technique and one Pass.
	Added in order to support legacy code.
	@return [luaIde#cc.Material]
]]
function cc.Material:createWithGLStateProgram(GLProgramState_programState) end
--[[
	Creates a material from the specified properties object.
	@param materialProperties The properties object defining the
	material (must have namespace equal to 'material').
	@return [luaIde#cc.Material]   A new Material.
]]
function cc.Material:createWithProperties(Properties_materialProperties) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/renderer/CCTextureCache.h
]]
cc.TextureCache = {}
--[[
	Reload texture from the image file.
	If the file image hasn't loaded before, load it.
	Otherwise the texture will be reloaded from the file image.
	@param fileName It's the related/absolute path of the file image.
	@return bool   True if the reloading is succeed, otherwise return false.
]]
function cc.TextureCache:reloadTexture(const_std_string_fileName) end
--[[
	Unbind all bound image asynchronous load callbacks.
	@since v3.1
]]
function cc.TextureCache:unbindAllImageAsync() end
--[[
	Deletes a texture from the cache given a its key name.
	@param key It's the related/absolute path of the file image.
	@since v0.99.4
]]
function cc.TextureCache:removeTextureForKey(const_std_string_key) end
--[[
	Purges the dictionary of loaded textures.
	Call this method if you receive the "Memory Warning".
	In the short term: it will free some resources preventing your app from being killed.
	In the medium term: it will allocate more resources.
	In the long term: it will be the same.
]]
function cc.TextureCache:removeAllTextures() end
--[[
	@js NA
	@lua NA
	@return std_string
]]
function cc.TextureCache:getDescription() end
--[[
	Output to CCLOG the current contents of this TextureCache.
	This will attempt to calculate the size of each texture, and the total texture memory in use.
	@since v1.0
	@return std_string
]]
function cc.TextureCache:getCachedTextureInfo() end
--[[
	Returns a Texture2D object given an filename.
	If the filename was not previously loaded, it will create a new Texture2D.
	Object and it will return it. It will use the filename as a key.
	Otherwise it will return a reference of a previously loaded image.
	Supported image extensions: .png, .bmp, .tiff, .jpeg, .pvr.
	@param filepath A null terminated string.
	@return [luaIde#cc.Texture2D]
]]
function cc.TextureCache:addImage(const_std_string_filepath) end
--[[
	Returns a Texture2D object given an Image.
	If the image was not previously loaded, it will create a new Texture2D object and it will return it.
	Otherwise it will return a reference of a previously loaded image.
	@param key The "key" parameter will be used as the "key" for the cache.
	If "key" is nil, then a new texture will be created each time.
	@return [luaIde#cc.Texture2D]
]]
function cc.TextureCache:addImage(Image_image,const_std_string_key) end
--[[
	Unbind a specified bound image asynchronous callback.
	In the case an object who was bound to an image asynchronous callback was destroyed before the callback is invoked,
	the object always need to unbind this callback manually.
	@param filename It's the related/absolute path of the file image.
	@since v3.1
]]
function cc.TextureCache:unbindImageAsync(const_std_string_filename) end
--[[
	Returns an already created texture. Returns nil if the texture doesn't exist.
	@param key It's the related/absolute path of the file image.
	@since v0.99.5
	@return [luaIde#cc.Texture2D]
]]
function cc.TextureCache:getTextureForKey(const_std_string_key) end
--[[
	Get the file path of the texture
	@param texture A Texture2D object pointer.
	@return std_string   The full path of the file.
]]
function cc.TextureCache:getTextureFilePath(Texture2D_texture) end
--[[
	Reload texture from a new file.
	This function is mainly for editor, won't suggest use it in game for performance reason.
	@param srcName Original texture file name.
	@param dstName New texture file name.
	@since v3.10
]]
function cc.TextureCache:renameTextureWithKey(const_std_string_srcName,const_std_string_dstName) end
--[[
	Removes unused textures.
	Textures that have a retain count of 1 will be deleted.
	It is convenient to call this method after when starting a new Scene.
	@since v0.8
]]
function cc.TextureCache:removeUnusedTextures() end
--[[
	Deletes a texture from the cache given a texture.
]]
function cc.TextureCache:removeTexture(Texture2D_texture) end
--[[
	Called by director, please do not called outside
]]
function cc.TextureCache:waitForQuit() end
--[[
	ETC1 ALPHA supports.
]]
function cc.TextureCache:setETC1AlphaFileSuffix(const_std_string_suffix) end
--[[
	@return std_string
]]
function cc.TextureCache:getETC1AlphaFileSuffix() end

cc.Device = {}
--[[
	To enable or disable accelerometer.
]]
function cc.Device:setAccelerometerEnabled(bool_isEnabled) end
--[[
	Sets the interval of accelerometer.
]]
function cc.Device:setAccelerometerInterval(float_interval) end
--[[
	Controls whether the screen should remain on.
	@param keepScreenOn One flag indicating that the screen should remain on.
]]
function cc.Device:setKeepScreenOn(bool_keepScreenOn) end
--[[
	Vibrate for the specified amount of time.
	If vibrate is not supported, then invoking this method has no effect.
	Some platforms limit to a maximum duration of 5 seconds.
	Duration is ignored on iOS due to API limitations.
	@param duration The duration in seconds.
]]
function cc.Device:vibrate(float_duration) end
--[[
	Gets the DPI of device
	@return int   The DPI of device.
]]
function cc.Device:getDPI() end

cc.Application = {}
--[[
	@brief Get target platform
	@return [luaIde#Platform]
]]
function cc.Application:getTargetPlatform() end
--[[
	@brief Get current language config
	@return [luaIde#LanguageType]   Current language config
]]
function cc.Application:getCurrentLanguage() end
--[[
	@brief Get current language iso 639-1 code
	@return char   Current language iso 639-1 code
]]
function cc.Application:getCurrentLanguageCode() end
--[[
	@brief Open url in default browser
	@param String with url to open.
	@return bool   true if the resource located by the URL was successfully opened; otherwise false.
]]
function cc.Application:openURL(const_std_string_url) end
--[[
	@brief Get application version.
	@return std_string
]]
function cc.Application:getVersion() end
--[[
	@brief    Callback by Director to limit FPS.
	@param interval The time, expressed in seconds, between current frame and next.
]]
function cc.Application:setAnimationInterval(float_interval) end
--[[
	@brief    Get current application instance.
	@return [luaIde#cc.Application]   Current application instance pointer.
]]
function cc.Application:getInstance() end

--[[
	@SuperType[luaIde#cc.GLView]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/platform/android/CCGLViewImpl-android.h
]]
cc.GLViewImpl = {}
--[[
	@return [luaIde#cc.GLViewImpl]
]]
function cc.GLViewImpl:createWithRect(const_std_string_viewName,Rect_rect,float_frameZoomFactor) end
--[[
	static function
	@return [luaIde#cc.GLViewImpl]
]]
function cc.GLViewImpl:create(const_std_string_viewname) end
--[[
	@return [luaIde#cc.GLViewImpl]
]]
function cc.GLViewImpl:createWithFullScreen(const_std_string_viewName) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCAnimationCache.h
]]
cc.AnimationCache = {}
--[[
	Returns a Animation that was previously added.
	If the name is not found it will return nil.
	You should retain the returned copy if you are going to use it.
	@return [luaIde#cc.Animation]   A Animation that was previously added. If the name is not found it will return nil.
]]
function cc.AnimationCache:getAnimation(const_std_string_name) end
--[[
	Adds a Animation with a name.
	@param animation An animation.
	@param name The name of animation.
]]
function cc.AnimationCache:addAnimation(Animation_animation,const_std_string_name) end
--[[
	@return bool
]]
function cc.AnimationCache:init() end
--[[
	Adds an animation from an NSDictionary.
	Make sure that the frames were previously loaded in the SpriteFrameCache.
	@param dictionary An NSDictionary.
	@param plist The path of the relative file,it use to find the plist path for load SpriteFrames.
	@since v1.1
	@js NA
]]
function cc.AnimationCache:addAnimationsWithDictionary(const_ValueMap_dictionary,const_std_string_plist) end
--[[
	Deletes a Animation from the cache.
	@param name The name of animation.
]]
function cc.AnimationCache:removeAnimation(const_std_string_name) end
--[[
	@deprecated. Use removeAnimation() instead
	@js NA
	@lua NA
]]
function cc.AnimationCache:removeAnimation(const_std_string_name) end
--[[
	Purges the cache. It releases all the Animation objects and the shared instance.
	@js NA
]]
function cc.AnimationCache:destroyInstance() end
--[[
	Returns the shared instance of the Animation cache
	@js NA
	@return [luaIde#cc.AnimationCache]
]]
function cc.AnimationCache:getInstance() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCSpriteBatchNode.h
]]
cc.SpriteBatchNode = {}
--[[
	Append the child.
	@param sprite A Sprite.
]]
function cc.SpriteBatchNode:appendChild(Sprite_sprite) end
--[[
	Sprites use this to start sortChildren, don't call this manually.
]]
function cc.SpriteBatchNode:reorderBatch(bool_reorder) end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.SpriteBatchNode:getTexture() end
function cc.SpriteBatchNode:setTexture(Texture2D_texture) end
--[[
	Removes a child given a certain index. It will also cleanup the running actions depending on the cleanup parameter.
	@param index A certain index.
	@param doCleanup Whether or not to cleanup the running actions.
	@warning Removing a child from a SpriteBatchNode is very slow.
]]
function cc.SpriteBatchNode:removeChildAtIndex(ssize_t_index,bool_doCleanup) end
--[[
	Remove a sprite from Atlas.
	@param sprite A Sprite.
]]
function cc.SpriteBatchNode:removeSpriteFromAtlas(Sprite_sprite) end
--[[
	This is the opposite of "addQuadFromSprite.
	It add the sprite to the children and descendants array, but it doesn't update add it to the texture atlas
	@return [luaIde#cc.SpriteBatchNode]
]]
function cc.SpriteBatchNode:addSpriteWithoutQuad(Sprite_child,int_z,int_aTag) end
--[[
	Get the nearest index from the sprite in z.
	@param sprite The parent sprite.
	@param z Z order for drawing priority.
	@return ssize_t   Index.
]]
function cc.SpriteBatchNode:atlasIndexForChild(Sprite_sprite,int_z) end
--[[
	Increase the Atlas Capacity.
]]
function cc.SpriteBatchNode:increaseAtlasCapacity() end
--[[
	Get the Min image block index,in all child.
	@param sprite The parent sprite.
	@return ssize_t   Index.
]]
function cc.SpriteBatchNode:lowestAtlasIndexInChild(Sprite_sprite) end
--[[
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.SpriteBatchNode:getBlendFunc() end
--[[
	initializes a SpriteBatchNode with a texture2d and capacity of children.
	The capacity will be increased in 33% in runtime if it runs out of space.
	@return bool
]]
function cc.SpriteBatchNode:initWithTexture(Texture2D_tex,ssize_t_capacity) end
--[[
	Sets the TextureAtlas object.
	@param textureAtlas The TextureAtlas object.
]]
function cc.SpriteBatchNode:setTextureAtlas(TextureAtlas_textureAtlas) end
--[[
	reserves capacity for the batch node.
	If the current capacity is bigger, nothing happens.
	otherwise, a new capacity is allocated
]]
function cc.SpriteBatchNode:reserveCapacity(ssize_t_newCapacity) end
--[[
	@js NA
]]
function cc.SpriteBatchNode:removeAllChildrenWithCleanup(bool_cleanup) end
--[[
	Inserts a quad at a certain index into the texture atlas. The Sprite won't be added into the children array.
	This method should be called only when you are dealing with very big AtlasSprite and when most of the Sprite won't be updated.
	For example: a tile map (TMXMap) or a label with lots of characters (LabelBMFont).
]]
function cc.SpriteBatchNode:insertQuadFromSprite(Sprite_sprite,ssize_t_index) end
--[[
	initializes a SpriteBatchNode with a file image (.png, .jpeg, .pvr, etc) and a capacity of children.
	The capacity will be increased in 33% in runtime if it runs out of space.
	The file will be loaded using the TextureMgr.
	@js init
	@lua init
	@return bool
]]
function cc.SpriteBatchNode:initWithFile(const_std_string_fileImage,ssize_t_capacity) end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed.
	In js: var setBlendFunc(var src, var dst).
	@endcode
	@lua NA
]]
function cc.SpriteBatchNode:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Rebuild index with a sprite all child.
	@param parent The parent sprite.
	@param index The child index.
	@return ssize_t   Index.
]]
function cc.SpriteBatchNode:rebuildIndexInOrder(Sprite_parent,ssize_t_index) end
--[[
	Returns the TextureAtlas object.
	@return [luaIde#TextureAtlas]   The TextureAtlas object.
]]
function cc.SpriteBatchNode:getTextureAtlas() end
--[[
	Get the Max image block index,in all child.
	@param sprite The parent sprite.
	@return ssize_t   Index.
]]
function cc.SpriteBatchNode:highestAtlasIndexInChild(Sprite_sprite) end
--[[
	Creates a SpriteBatchNode with a file image (.png, .jpeg, .pvr, etc) and capacity of children.
	The capacity will be increased in 33% in runtime if it runs out of space.
	The file will be loaded using the TextureMgr.
	@param fileImage A file image (.png, .jpeg, .pvr, etc).
	@param capacity The capacity of children.
	@return [luaIde#cc.SpriteBatchNode]   Return an autorelease object.
]]
function cc.SpriteBatchNode:create(const_std_string_fileImage,ssize_t_capacity) end
--[[
	Creates a SpriteBatchNode with a texture2d and capacity of children.
	The capacity will be increased in 33% in runtime if it runs out of space.
	@param tex A texture2d.
	@param capacity The capacity of children.
	@return [luaIde#cc.SpriteBatchNode]   Return an autorelease object.
]]
function cc.SpriteBatchNode:createWithTexture(Texture2D_tex,ssize_t_capacity) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCSpriteFrameCache.h
]]
cc.SpriteFrameCache = {}
--[[
	@return bool
]]
function cc.SpriteFrameCache:reloadTexture(const_std_string_plist) end
--[[
	Adds multiple Sprite Frames from a plist file content. The texture will be associated with the created sprite frames.
	@js NA
	@lua addSpriteFrames
	@param plist_content Plist file content string.
	@param texture Texture pointer.
]]
function cc.SpriteFrameCache:addSpriteFramesWithFileContent(const_std_string_plist_content,Texture2D_texture) end
--[[
	Adds an sprite frame with a given name.
	If the name already exists, then the contents of the old name will be replaced with the new one.
	@param frame A certain sprite frame.
	@param frameName The name of the sprite frame.
]]
function cc.SpriteFrameCache:addSpriteFrame(SpriteFrame_frame,const_std_string_frameName) end
--[[
	Removes multiple Sprite Frames from a plist file.
	Sprite Frames stored in this file will be removed.
	It is convenient to call this method when a specific texture needs to be removed.
	@since v0.99.5
	@param plist The name of the plist that needs to removed.
]]
function cc.SpriteFrameCache:removeSpriteFramesFromFile(const_std_string_plist) end
--[[
	Initialize method.
	@return bool   if success return true.
]]
function cc.SpriteFrameCache:init() end
--[[
	Purges the dictionary of loaded sprite frames.
	Call this method if you receive the "Memory Warning".
	In the short term: it will free some resources preventing your app from being killed.
	In the medium term: it will allocate more resources.
	In the long term: it will be the same.
]]
function cc.SpriteFrameCache:removeSpriteFrames() end
--[[
	Removes unused sprite frames.
	Sprite Frames that have a retain count of 1 will be deleted.
	It is convenient to call this method after when starting a new Scene.
	@js NA
]]
function cc.SpriteFrameCache:removeUnusedSpriteFrames() end
--[[
	Removes multiple Sprite Frames from a plist file content.
	Sprite Frames stored in this file will be removed.
	It is convenient to call this method when a specific texture needs to be removed.
	@param plist_content The string of the plist content that needs to removed.
	@js NA
]]
function cc.SpriteFrameCache:removeSpriteFramesFromFileContent(const_std_string_plist_content) end
--[[
	Deletes an sprite frame from the sprite frame cache.
	@param name The name of the sprite frame that needs to removed.
]]
function cc.SpriteFrameCache:removeSpriteFrameByName(const_std_string_name) end
--[[
	Check if multiple Sprite Frames from a plist file have been loaded.
	@js NA
	@lua NA
	@param plist Plist file name.
	@return bool   True if the file is loaded.
]]
function cc.SpriteFrameCache:isSpriteFramesWithFileLoaded(const_std_string_plist) end
--[[
	Removes all Sprite Frames associated with the specified textures.
	It is convenient to call this method when a specific texture needs to be removed.
	@since v0.995.
	@param texture The texture that needs to removed.
]]
function cc.SpriteFrameCache:removeSpriteFramesFromTexture(Texture2D_texture) end
--[[
	Destroys the cache. It releases all the Sprite Frames and the retained instance.
	@js NA
]]
function cc.SpriteFrameCache:destroyInstance() end
--[[
	Returns the shared instance of the Sprite Frame cache.
	@return [luaIde#cc.SpriteFrameCache]   The instance of the Sprite Frame Cache.
	@js NA
]]
function cc.SpriteFrameCache:getInstance() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCParallaxNode.h
]]
cc.ParallaxNode = {}
--[[
	Adds a child to the container with a local z-order, parallax ratio and position offset.
	@param child A child node.
	@param z Z order for drawing priority.
	@param parallaxRatio A given parallax ratio.
	@param positionOffset A given position offset.
]]
function cc.ParallaxNode:addChild(Node__child,int_z,const_Vec2_parallaxRatio,const_Vec2_positionOffset) end
--[[
	
]]
function cc.ParallaxNode:addChild(Node__child,int_zOrder,int_tag) end
function cc.ParallaxNode:removeAllChildrenWithCleanup(bool_cleanup) end
--[[
	Create a Parallax node.
	@return [luaIde#cc.ParallaxNode]   An autoreleased ParallaxNode object.
]]
function cc.ParallaxNode:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTMXObjectGroup.h
]]
cc.TMXObjectGroup = {}
--[[
	Sets the offset position of child objects.
	@param offset The offset position of child objects.
]]
function cc.TMXObjectGroup:setPositionOffset(const_Vec2_offset) end
--[[
	Return the value for the specific property name.
	@param propertyName The specific property name.
	@return [luaIde#Value]   Return the value for the specific property name.
	@js NA
]]
function cc.TMXObjectGroup:getProperty(const_std_string_propertyName) end
--[[
	Gets the offset position of child objects.
	@return [luaIde#cc.Vec2]   The offset position of child objects.
]]
function cc.TMXObjectGroup:getPositionOffset() end
--[[
	Return the dictionary for the specific object name.
	It will return the 1st object found on the array for the given name.
	@return [luaIde#ValueMap]   Return the dictionary for the specific object name.
]]
function cc.TMXObjectGroup:getObject(const_std_string_objectName) end
--[[
	Gets the array of the objects.
	@return [luaIde#ValueVector]   The array of the objects.
]]
function cc.TMXObjectGroup:getObjects() end
--[[
	Set the group name.
	@param groupName A string,it is used to set the group name.
]]
function cc.TMXObjectGroup:setGroupName(const_std_string_groupName) end
--[[
	Gets the list of properties stored in a dictionary.
	@return [luaIde#ValueMap]   The list of properties stored in a dictionary.
]]
function cc.TMXObjectGroup:getProperties() end
--[[
	Get the group name.
	@return std_string   The group name.
]]
function cc.TMXObjectGroup:getGroupName() end
--[[
	Sets the list of properties.
	@param properties The list of properties.
]]
function cc.TMXObjectGroup:setProperties(const_ValueMap_properties) end
--[[
	Sets the array of the objects.
	@param objects The array of the objects.
]]
function cc.TMXObjectGroup:setObjects(const_ValueVector_objects) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTMXXMLParser.h
]]
cc.TMXLayerInfo = {}
function cc.TMXLayerInfo:setProperties(ValueMap_properties) end
--[[
	@return [luaIde#ValueMap]
]]
function cc.TMXLayerInfo:getProperties() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTMXXMLParser.h
]]
cc.TMXTilesetInfo = {}
--[[
	@return [luaIde#cc.Rect]
]]
function cc.TMXTilesetInfo:getRectForGID(uint32_t_gid) end

cc.TMXMapInfo = {}
function cc.TMXMapInfo:setCurrentString(const_std_string_currentString) end
--[[
	@return int
]]
function cc.TMXMapInfo:getHexSideLength() end
function cc.TMXMapInfo:setTileSize(const_Size_tileSize) end
--[[
	initializes a TMX format with a  tmx file
	@return bool
]]
function cc.TMXMapInfo:initWithTMXFile(const_std_string_tmxFile) end
--[[
	@return int
]]
function cc.TMXMapInfo:getOrientation() end
function cc.TMXMapInfo:setObjectGroups() end
function cc.TMXMapInfo:setLayers() end
--[[
	initializes parsing of an XML file, either a tmx (Map) file or tsx (Tileset) file
	@return bool
]]
function cc.TMXMapInfo:parseXMLFile(const_std_string_xmlFilename) end
--[[
	@return int
]]
function cc.TMXMapInfo:getParentElement() end
function cc.TMXMapInfo:setTMXFileName(const_std_string_fileName) end
--[[
	initializes parsing of an XML string, either a tmx (Map) string or tsx (Tileset) string
	@return bool
]]
function cc.TMXMapInfo:parseXMLString(const_std_string_xmlString) end
--[[
	@return [luaIde#Vector__TMXLayerInfo__]
]]
function cc.TMXMapInfo:getLayers() end
--[[
	@return int
]]
function cc.TMXMapInfo:getStaggerAxis() end
function cc.TMXMapInfo:setHexSideLength(int_hexSideLength) end
--[[
	@return [luaIde#Vector__TMXTilesetInfo__]
]]
function cc.TMXMapInfo:getTilesets() end
--[[
	@return int
]]
function cc.TMXMapInfo:getParentGID() end
function cc.TMXMapInfo:setParentElement(int_element) end
--[[
	initializes a TMX format with an XML string and a TMX resource path
	@return bool
]]
function cc.TMXMapInfo:initWithXML(const_std_string_tmxString,const_std_string_resourcePath) end
function cc.TMXMapInfo:setParentGID(int_gid) end
--[[
	@return int
]]
function cc.TMXMapInfo:getLayerAttribs() end
--[[
	@return [luaIde#cc.Size]
]]
function cc.TMXMapInfo:getTileSize() end
--[[
	@return [luaIde#ValueMapIntKey]
]]
function cc.TMXMapInfo:getTileProperties() end
--[[
	@return bool
]]
function cc.TMXMapInfo:isStoringCharacters() end
--[[
	@return std_string
]]
function cc.TMXMapInfo:getExternalTilesetFileName() end
--[[
	@return [luaIde#Vector__TMXObjectGroup__]
]]
function cc.TMXMapInfo:getObjectGroups() end
--[[
	@return std_string
]]
function cc.TMXMapInfo:getTMXFileName() end
function cc.TMXMapInfo:setStaggerIndex(int_staggerIndex) end
function cc.TMXMapInfo:setProperties(const_ValueMap_properties) end
function cc.TMXMapInfo:setOrientation(int_orientation) end
function cc.TMXMapInfo:setTileProperties(const_ValueMapIntKey_tileProperties) end
function cc.TMXMapInfo:setMapSize(const_Size_mapSize) end
--[[
	@return std_string
]]
function cc.TMXMapInfo:getCurrentString() end
function cc.TMXMapInfo:setStoringCharacters(bool_storingCharacters) end
function cc.TMXMapInfo:setStaggerAxis(int_staggerAxis) end
--[[
	@return [luaIde#cc.Size]
]]
function cc.TMXMapInfo:getMapSize() end
function cc.TMXMapInfo:setTilesets() end
--[[
	@return [luaIde#ValueMap]
]]
function cc.TMXMapInfo:getProperties() end
--[[
	@return int
]]
function cc.TMXMapInfo:getStaggerIndex() end
function cc.TMXMapInfo:setLayerAttribs(int_layerAttribs) end
--[[
	creates a TMX Format with a tmx file
	@return [luaIde#cc.TMXMapInfo]
]]
function cc.TMXMapInfo:create(const_std_string_tmxFile) end
--[[
	creates a TMX Format with an XML string and a TMX resource path
	@return [luaIde#cc.TMXMapInfo]
]]
function cc.TMXMapInfo:createWithXML(const_std_string_tmxString,const_std_string_resourcePath) end

--[[
	@SuperType[luaIde#cc.SpriteBatchNode]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCFastTMXLayer.h
]]
cc.TMXLayer = {}
--[[
	Returns the position in points of a given tile coordinate.
	@param tileCoordinate The tile Coordinate.
	@return [luaIde#cc.Vec2]   The position in points of a given tile coordinate.
]]
function cc.TMXLayer:getPositionAt(const_Vec2_tileCoordinate) end
--[[
	Set Layer orientation, which is the same as the map orientation.
	@param orientation Layer orientation, which is the same as the map orientation.
]]
function cc.TMXLayer:setLayerOrientation(int_orientation) end
--[[
	Size of the layer in tiles.
	@return [luaIde#cc.Size]   Size of the layer in tiles.
]]
function cc.TMXLayer:getLayerSize() end
--[[
	Set the size of the map's tile.
	@param size The new size of the map's tile.
]]
function cc.TMXLayer:setMapTileSize(const_Size_size) end
--[[
	Layer orientation, which is the same as the map orientation.
	@return int   Layer orientation, which is the same as the map orientation.
]]
function cc.TMXLayer:getLayerOrientation() end
--[[
	Set the properties to the layer.
	@param properties The properties to the layer.
]]
function cc.TMXLayer:setProperties(const_ValueMap_properties) end
--[[
	Set the tile layer name.
	@param layerName The new layer name.
]]
function cc.TMXLayer:setLayerName(const_std_string_layerName) end
--[[
	Removes a tile at given tile coordinate.
	@param tileCoordinate The tile Coordinate.
]]
function cc.TMXLayer:removeTileAt(const_Vec2_tileCoordinate) end
--[[
	@return bool
]]
function cc.TMXLayer:initWithTilesetInfo(TMXTilesetInfo_tilesetInfo,TMXLayerInfo_layerInfo,TMXMapInfo_mapInfo) end
--[[
	Creates the tiles.
]]
function cc.TMXLayer:setupTiles() end
--[[
	Sets the tile gid (gid = tile global id) at a given tile coordinate.
	The Tile GID can be obtained by using the method "tileGIDAt" or by using the TMX editor -> Tileset Mgr +1.
	If a tile is already placed at that position, then it will be removed.
	@param gid The gid value.
	@param tileCoordinate The tile coordinate.
]]
function cc.TMXLayer:setTileGID(int_gid,const_Vec2_tileCoordinate) end
--[[
	Sets the tile gid (gid = tile global id) at a given tile coordinate.
	The Tile GID can be obtained by using the method "tileGIDAt" or by using the TMX editor -> Tileset Mgr +1.
	If a tile is already placed at that position, then it will be removed.
	Use withFlags if the tile flags need to be changed as well.
	@param gid A integer value,it will be sets the tile gid.
	@param tileCoordinate The tile coordinate.
	@param flags A TMXTileFlags.
]]
function cc.TMXLayer:setTileGID(int_gid,const_Vec2_tileCoordinate,TMXTileFlags_flags) end
--[[
	Size of the map's tile (could be different from the tile's size).
	@return [luaIde#cc.Size]   Size of the map's tile (could be different from the tile's size).
]]
function cc.TMXLayer:getMapTileSize() end
--[[
	Return the value for the specific property name.
	@param propertyName The value for the specific property name.
	@return [luaIde#Value]   The value for the specific property name.
]]
function cc.TMXLayer:getProperty(const_std_string_propertyName) end
--[[
	Set the size of the layer in tiles.
	@param size The new size of the layer in tiles.
]]
function cc.TMXLayer:setLayerSize(const_Size_size) end
--[[
	Get the tile layer name.
	@return std_string   The tile layer name.
]]
function cc.TMXLayer:getLayerName() end
--[[
	Set the tileset information for the layer.
	@param info The new tileset information for the layer.
]]
function cc.TMXLayer:setTileSet(TMXTilesetInfo_info) end
--[[
	Tileset information for the layer.
	@return [luaIde#cc.TMXTilesetInfo]   Tileset information for the layer.
]]
function cc.TMXLayer:getTileSet() end
--[[
	Properties from the layer. They can be added using Tiled.
	@return [luaIde#ValueMap]   Properties from the layer. They can be added using Tiled.
]]
function cc.TMXLayer:getProperties() end
--[[
	Properties from the layer. They can be added using Tiled.
	@return [luaIde#ValueMap]   Properties from the layer. They can be added using Tiled.
]]
function cc.TMXLayer:getProperties() end
--[[
	Returns the tile (Sprite) at a given a tile coordinate.
	The returned Sprite will be already added to the TMXLayer. Don't add it again.
	The Sprite can be treated like any other Sprite: rotated, scaled, translated, opacity, color, etc.
	You can remove either by calling:
	- layer->removeChild(sprite, cleanup);
	@return [luaIde#cc.Sprite]   Returns the tile (Sprite) at a given a tile coordinate.
]]
function cc.TMXLayer:getTileAt(const_Vec2_tileCoordinate) end
--[[
	Creates a FastTMXLayer with an tileset info, a layer info and a map info.
	@param tilesetInfo An tileset info.
	@param layerInfo A layer info.
	@param mapInfo A map info.
	@return [luaIde#cc.TMXLayer]   Return an autorelease object.
]]
function cc.TMXLayer:create(TMXTilesetInfo_tilesetInfo,TMXLayerInfo_layerInfo,TMXMapInfo_mapInfo) end
--[[
	Set an sprite to the tile,with the tile coordinate and gid.
	@param sprite A Sprite.
	@param pos The tile coordinate.
	@param gid The tile gid.
]]
function cc.TMXLayer:setupTileSprite(Sprite_sprite,const_Vec2_pos,uint32_t_gid) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCFastTMXTiledMap.h
]]
cc.TMXTiledMap = {}
--[[
	Set object groups.
	@param groups An object groups.
]]
function cc.TMXTiledMap:setObjectGroups() end
--[[
	Return the value for the specific property name.
	@return [luaIde#Value]   Return the value for the specific property name.
]]
function cc.TMXTiledMap:getProperty(const_std_string_propertyName) end
--[[
	Set the map's size property measured in tiles.
	@param mapSize The map's size property measured in tiles.
]]
function cc.TMXTiledMap:setMapSize(const_Size_mapSize) end
--[[
	Return the TMXObjectGroup for the specific group.
	@return [luaIde#cc.TMXObjectGroup]   Return the TMXObjectGroup for the specific group.
]]
function cc.TMXTiledMap:getObjectGroup(const_std_string_groupName) end
--[[
	Get object groups.
	@return [luaIde#Vector__TMXObjectGroup__]   Object groups.
]]
function cc.TMXTiledMap:getObjectGroups() end
--[[
	initializes a TMX Tiled Map with a TMX file
	@return bool
]]
function cc.TMXTiledMap:initWithTMXFile(const_std_string_tmxFile) end
--[[
	The tiles's size property measured in pixels.
	@return [luaIde#cc.Size]   The tiles's size property measured in pixels.
]]
function cc.TMXTiledMap:getTileSize() end
--[[
	The map's size property measured in tiles.
	@return [luaIde#cc.Size]   The map's size property measured in tiles.
]]
function cc.TMXTiledMap:getMapSize() end
--[[
	initializes a TMX Tiled Map with a TMX formatted XML string and a path to TMX resources
	@return bool
]]
function cc.TMXTiledMap:initWithXML(const_std_string_tmxString,const_std_string_resourcePath) end
--[[
	Get properties.
	@return [luaIde#ValueMap]   Properties.
]]
function cc.TMXTiledMap:getProperties() end
--[[
	Set the tiles's size property measured in pixels.
	@param tileSize The tiles's size property measured in pixels.
]]
function cc.TMXTiledMap:setTileSize(const_Size_tileSize) end
--[[
	Set properties.
	@param properties An ValueMap Properties.
]]
function cc.TMXTiledMap:setProperties(const_ValueMap_properties) end
--[[
	Return the FastTMXLayer for the specific layer.
	@return [luaIde#cc.TMXLayer]   Return the FastTMXLayer for the specific layer.
]]
function cc.TMXTiledMap:getLayer(const_std_string_layerName) end
--[[
	Get map orientation.
	@return int   The map orientation.
]]
function cc.TMXTiledMap:getMapOrientation() end
--[[
	Set map orientation.
	@param mapOrientation The map orientation.
]]
function cc.TMXTiledMap:setMapOrientation(int_mapOrientation) end
--[[
	Creates a TMX Tiled Map with a TMX file.
	@return [luaIde#cc.TMXTiledMap]   An autorelease object.
]]
function cc.TMXTiledMap:create(const_std_string_tmxFile) end
--[[
	Initializes a TMX Tiled Map with a TMX formatted XML string and a path to TMX resources.
	@param tmxString A TMX formatted XML string.
	@param resourcePath A path to TMX resources.
	@return [luaIde#cc.TMXTiledMap]   An autorelease object.
]]
function cc.TMXTiledMap:createWithXML(const_std_string_tmxString,const_std_string_resourcePath) end
--[[
	Return properties dictionary for tile GID.
	@return [luaIde#Value]   Return properties dictionary for tile GID.
]]
function cc.TMXTiledMap:getPropertiesForGID(int_GID) end

--[[
	@SuperType[luaIde#cc.AtlasNode]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCTileMapAtlas.h
]]
cc.TileMapAtlas = {}
--[[
	initializes a TileMap with a tile file (atlas) with a map file and the width and height of each tile in points.
	The file will be loaded using the TextureMgr.
	@return bool
]]
function cc.TileMapAtlas:initWithTileFile(const_std_string_tile,const_std_string_mapFile,int_tileWidth,int_tileHeight) end
--[[
	dealloc the map from memory
]]
function cc.TileMapAtlas:releaseMap() end
--[[
	Returns a tile from position x,y.
	For the moment only channel R is used
	@return [luaIde#Color3B]
]]
function cc.TileMapAtlas:getTileAt(const_Vec2_position) end
--[[
	sets a tile at position x,y.
	For the moment only channel R is used
]]
function cc.TileMapAtlas:setTile(const_Color3B_tile,const_Vec2_position) end
--[[
	creates a TileMap with a tile file (atlas) with a map file and the width and height of each tile in points.
	The tile file will be loaded using the TextureMgr.
	@return [luaIde#cc.TileMapAtlas]
]]
function cc.TileMapAtlas:create(const_std_string_tile,const_std_string_mapFile,int_tileWidth,int_tileHeight) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/3d/CCMotionStreak3D.h
]]
cc.MotionStreak3D = {}
--[[
	Remove all living segments of the ribbon.
]]
function cc.MotionStreak3D:reset() end
function cc.MotionStreak3D:setTexture(Texture2D_texture) end
--[[
	@return [luaIde#cc.Texture2D]
]]
function cc.MotionStreak3D:getTexture() end
--[[
	Color used for the tint.
	@param colors The color used for the tint.
]]
function cc.MotionStreak3D:tintWithColor(const_Color3B_colors) end
--[[
	Get the direction of sweeping line segment
	@return [luaIde#cc.Vec3]
]]
function cc.MotionStreak3D:getSweepAxis() end
--[[
	@js NA
	@lua NA
]]
function cc.MotionStreak3D:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Sets the starting position initialized or not.
	@param bStartingPositionInitialized True if initialized the starting position.
]]
function cc.MotionStreak3D:setStartingPositionInitialized(bool_bStartingPositionInitialized) end
--[[
	@js NA
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.MotionStreak3D:getBlendFunc() end
--[[
	Is the starting position initialized or not.
	@return bool   True if the starting position is initialized.
]]
function cc.MotionStreak3D:isStartingPositionInitialized() end
--[[
	Get stroke.
	@return float   float stroke.
]]
function cc.MotionStreak3D:getStroke() end
--[[
	initializes a motion streak with fade in seconds, minimum segments, stroke's width, color and texture filename
	@return bool
]]
function cc.MotionStreak3D:initWithFade(float_fade,float_minSeg,float_stroke,const_Color3B_color,const_std_string_path) end
--[[
	initializes a motion streak with fade in seconds, minimum segments, stroke's width, color and texture
	@return bool
]]
function cc.MotionStreak3D:initWithFade(float_fade,float_minSeg,float_stroke,const_Color3B_color,Texture2D_texture) end
--[[
	Set the direction of sweeping line segment.
	@param sweepAxis Direction of sweeping line segment
]]
function cc.MotionStreak3D:setSweepAxis(const_Vec3_sweepAxis) end
--[[
	Set stroke.
	@param stroke The width of stroke.
]]
function cc.MotionStreak3D:setStroke(float_stroke) end
--[[
	Creates and initializes a motion streak with fade in seconds, minimum segments, stroke's width, color, texture filename.
	@param fade The fade time, in seconds.
	@param minSeg The minimum segments.
	@param stroke The width of stroke.
	@param color The color of stroke.
	@param path The texture file name of stoke.
	@return [luaIde#cc.MotionStreak3D]   An autoreleased MotionStreak3D object.
]]
function cc.MotionStreak3D:create(float_fade,float_minSeg,float_stroke,const_Color3B_color,const_std_string_path) end
--[[
	Creates and initializes a motion streak with fade in seconds, minimum segments, stroke's width, color, texture.
	@param fade The fade time, in seconds.
	@param minSeg The minimum segments.
	@param stroke The width of stroke.
	@param color The color of stroke.
	@param texture The texture name of stoke.
	@return [luaIde#cc.MotionStreak3D]   An autoreleased MotionStreak3D object.
]]
function cc.MotionStreak3D:create(float_fade,float_minSeg,float_stroke,const_Color3B_color,Texture2D_texture) end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/scripting/lua-bindings/manual/CCComponentLua.h
]]
cc.ComponentLua = {}
--[[
	This function is used to be invoked from lua side to get the corresponding script object of this component.
]]
function cc.ComponentLua:getScriptObject() end
function cc.ComponentLua:update(float_dt) end
--[[
	@return [luaIde#cc.ComponentLua]
]]
function cc.ComponentLua:create(const_std_string_scriptFileName) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocosbuilder/CCBAnimationManager.h
]]
cc.CCBAnimationManager = {}
function cc.CCBAnimationManager:moveAnimationsFromNode(cocos2d_Node_fromNode,cocos2d_Node_toNode) end
function cc.CCBAnimationManager:setAutoPlaySequenceId(int_autoPlaySequenceId) end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBAnimationManager:getDocumentCallbackNames() end
--[[
	@return [luaIde#cocos2d_Sequence]
]]
function cc.CCBAnimationManager:actionForSoundChannel(CCBSequenceProperty_channel) end
function cc.CCBAnimationManager:setBaseValue(const_cocos2d_Value_value,cocos2d_Node_pNode,const_std_string_propName) end
--[[
	@return [luaIde#cocos2d_Vector__cocos2d_Node__]
]]
function cc.CCBAnimationManager:getDocumentOutletNodes() end
--[[
	@return std_string
]]
function cc.CCBAnimationManager:getLastCompletedSequenceName() end
function cc.CCBAnimationManager:setRootNode(cocos2d_Node_pRootNode) end
function cc.CCBAnimationManager:runAnimationsForSequenceNamedTweenDuration(const_char_pName,float_fTweenDuration) end
function cc.CCBAnimationManager:addDocumentOutletName(std_string_name) end
--[[
	@return [luaIde#cocos2d_Vector__CCBSequence__]
]]
function cc.CCBAnimationManager:getSequences() end
--[[
	@return [luaIde#cocos2d_Size]
]]
function cc.CCBAnimationManager:getRootContainerSize() end
function cc.CCBAnimationManager:setDocumentControllerName(const_std_string_name) end
function cc.CCBAnimationManager:setObject(cocos2d_Ref_obj,cocos2d_Node_pNode,const_std_string_propName) end
--[[
	@return [luaIde#cocos2d_Size]
]]
function cc.CCBAnimationManager:getContainerSize(cocos2d_Node_pNode) end
--[[
	@return [luaIde#cocos2d_Sequence]
]]
function cc.CCBAnimationManager:actionForCallbackChannel(CCBSequenceProperty_channel) end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBAnimationManager:getDocumentOutletNames() end
function cc.CCBAnimationManager:addDocumentCallbackControlEvents(cocos2d_extension_Control_EventType_eventType) end
--[[
	@return bool
]]
function cc.CCBAnimationManager:init() end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBAnimationManager:getKeyframeCallbacks() end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBAnimationManager:getDocumentCallbackControlEvents() end
function cc.CCBAnimationManager:setRootContainerSize(const_cocos2d_Size_rootContainerSize) end
function cc.CCBAnimationManager:runAnimationsForSequenceIdTweenDuration(int_nSeqId,float_fTweenDuraiton) end
--[[
	@return char
]]
function cc.CCBAnimationManager:getRunningSequenceName() end
--[[
	@return int
]]
function cc.CCBAnimationManager:getAutoPlaySequenceId() end
function cc.CCBAnimationManager:addDocumentCallbackName(std_string_name) end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CCBAnimationManager:getRootNode() end
function cc.CCBAnimationManager:addDocumentOutletNode(cocos2d_Node_node) end
--[[
	@return float
]]
function cc.CCBAnimationManager:getSequenceDuration(const_char_pSequenceName) end
function cc.CCBAnimationManager:addDocumentCallbackNode(cocos2d_Node_node) end
function cc.CCBAnimationManager:runAnimationsForSequenceNamed(const_char_pName) end
--[[
	@return int
]]
function cc.CCBAnimationManager:getSequenceId(const_char_pSequenceName) end
--[[
	@return [luaIde#cocos2d_Vector__cocos2d_Node__]
]]
function cc.CCBAnimationManager:getDocumentCallbackNodes() end
function cc.CCBAnimationManager:setSequences() end
function cc.CCBAnimationManager:debug() end
--[[
	@return std_string
]]
function cc.CCBAnimationManager:getDocumentControllerName() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocosbuilder/CCBReader.h
]]
cc.CCBReader = {}
function cc.CCBReader:addOwnerOutletName(std_string_name) end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBReader:getOwnerCallbackNames() end
function cc.CCBReader:addDocumentCallbackControlEvents(cocos2d_extension_Control_EventType_eventType) end
function cc.CCBReader:setCCBRootPath(const_char_ccbRootPath) end
function cc.CCBReader:addOwnerOutletNode(cocos2d_Node_node) end
--[[
	@return [luaIde#cocos2d_Vector__cocos2d_Node__]
]]
function cc.CCBReader:getOwnerCallbackNodes() end
--[[
	@return bool
]]
function cc.CCBReader:readSoundKeyframesForSeq(CCBSequence_seq) end
--[[
	@return std_string
]]
function cc.CCBReader:getCCBRootPath() end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBReader:getOwnerCallbackControlEvents() end
--[[
	@return [luaIde#cocos2d_Vector__cocos2d_Node__]
]]
function cc.CCBReader:getOwnerOutletNodes() end
--[[
	@return std_string
]]
function cc.CCBReader:readUTF8() end
function cc.CCBReader:addOwnerCallbackControlEvents(cocos2d_extension_Control_EventType_type) end
--[[
	@return [luaIde#cocos2d_ValueVector]
]]
function cc.CCBReader:getOwnerOutletNames() end
--[[
	@return bool
]]
function cc.CCBReader:readCallbackKeyframesForSeq(CCBSequence_seq) end
--[[
	@return [luaIde#cocos2d_Vector__CCBAnimationManager__]
]]
function cc.CCBReader:getAnimationManagersForNodes() end
--[[
	@return [luaIde#cocos2d_Vector__cocos2d_Node__]
]]
function cc.CCBReader:getNodesWithAnimationManagers() end
function cc.CCBReader:setResolutionScale(float_scale) end

cc.SimpleAudioEngine = {}
--[[
	Stop all playing sound effects.
]]
function cc.SimpleAudioEngine:stopAllEffects() end
--[[
	Preload a compressed audio file.
	The compressed audio will be decoded to wave, then written into an internal buffer in SimpleAudioEngine.
	@param filePath The path of the effect file.
	@js NA
]]
function cc.SimpleAudioEngine:preloadEffect(const_char_filePath) end
--[[
	The volume of the effects within the range of 0.0 as the minimum and 1.0 as the maximum.
	@return float
]]
function cc.SimpleAudioEngine:getEffectsVolume() end
--[[
	Pause playing sound effect.
	@param soundId The return value of function playEffect.
]]
function cc.SimpleAudioEngine:pauseEffect(unsigned_int_soundId) end
--[[
	Play sound effect with a file path, pitch, pan and gain.
	@param filePath The path of the effect file.
	@param loop Determines whether to loop the effect playing or not. The default value is false.
	@param pitch Frequency, normal value is 1.0. Will also change effect play time.
	@param pan   Stereo effect, in the range of [-1..1] where -1 enables only left channel.
	@param gain  Volume, in the range of [0..1]. The normal value is 1.
	@return int   The sound id.
	@note Full support is under development, now there are limitations:
	- no pitch effect on Samsung Galaxy S2 with OpenSL backend enabled;
	- no pitch/pan/gain on win32.
]]
function cc.SimpleAudioEngine:playEffect(const_char_filePath,bool_loop,float_pitch,float_pan,float_gain) end
--[[
	Resume all playing sound effect.
]]
function cc.SimpleAudioEngine:resumeAllEffects() end
--[[
	Set the volume of sound effects.
	@param volume must be within the range of 0.0 as the minimum and 1.0 as the maximum.
]]
function cc.SimpleAudioEngine:setEffectsVolume(float_volume) end
--[[
	Stop playing sound effect.
	@param soundId The return value of function playEffect.
]]
function cc.SimpleAudioEngine:stopEffect(unsigned_int_soundId) end
--[[
	Pause all playing sound effect.
]]
function cc.SimpleAudioEngine:pauseAllEffects() end
--[[
	Unload the preloaded effect from internal buffer.
	@param filePath The path of the effect file.
]]
function cc.SimpleAudioEngine:unloadEffect(const_char_filePath) end
--[[
	Resume playing sound effect.
	@param soundId The return value of function playEffect.
]]
function cc.SimpleAudioEngine:resumeEffect(unsigned_int_soundId) end
--[[
	Returns a shared instance of the SimpleAudioEngine.
	@js NA
	@return [luaIde#cc.SimpleAudioEngine]
]]
function cc.SimpleAudioEngine:getInstance() end

cc.Controller = {}
--[[
	Activate receives key event from external key. e.g. back,menu.
	Controller receives only standard key which contained within enum Key by default.
	@warning The API only work on the android platform for support diversified game controller.
	@param externalKeyCode   External key code.
	@param receive   True if external key event on this controller should be receive, false otherwise.
]]
function cc.Controller:receiveExternalKeyEvent(int_externalKeyCode,bool_receive) end
--[[
	Gets the name of this Controller object.
	@return std_string
]]
function cc.Controller:getDeviceName() end
--[[
	Indicates whether the Controller is connected.
	@return bool
]]
function cc.Controller:isConnected() end
--[[
	Gets the Controller id.
	@return int
]]
function cc.Controller:getDeviceId() end
--[[
	Changes the tag that is used to identify the controller easily.
	@param tag   A integer that identifies the controller.
]]
function cc.Controller:setTag(int_tag) end
--[[
	Returns a tag that is used to identify the controller easily.
	@return int   An integer that identifies the controller.
]]
function cc.Controller:getTag() end
--[[
	Start discovering new controllers.
	@warning The API has an empty implementation on Android.
]]
function cc.Controller:startDiscoveryController() end
--[[
	Stop the discovery process.
	@warning The API has an empty implementation on Android.
]]
function cc.Controller:stopDiscoveryController() end
--[[
	Gets a Controller object with device ID.
	@param deviceId   A unique identifier to find the controller.
	@return [luaIde#cc.Controller]   A Controller object.
]]
function cc.Controller:getControllerByDeviceId(int_deviceId) end
--[[
	Gets a Controller object with tag.
	@param tag   An identifier to find the controller.
	@return [luaIde#cc.Controller]   A Controller object.
]]
function cc.Controller:getControllerByTag(int_tag) end

cc.CSLoader = {}
--[[
	static cocostudio::timeline::ActionTimelineNode* createActionTimelineNode(const std::string& filename);
	static cocostudio::timeline::ActionTimelineNode* createActionTimelineNode(const std::string& filename, int startIndex, int endIndex, bool loop);
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:createNodeFromJson(const_std_string_filename) end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:createNodeWithFlatBuffersFile(const_std_string_filename) end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:createNodeWithFlatBuffersFile(const_std_string_filename,const_ccNodeLoadCallback_callback) end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:loadNodeWithFile(const_std_string_fileName) end
function cc.CSLoader:setJsonPath(std_string_jsonPath) end
function cc.CSLoader:init() end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:loadNodeWithContent(const_std_string_content) end
--[[
	@return bool
]]
function cc.CSLoader:isRecordJsonPath() end
--[[
	@return std_string
]]
function cc.CSLoader:getJsonPath() end
function cc.CSLoader:setRecordJsonPath(bool_record) end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:createNodeWithFlatBuffersForSimulator(const_std_string_filename) end
function cc.CSLoader:destroyInstance() end
--[[
	@return [luaIde#cocos2d_Node]
]]
function cc.CSLoader:createNodeWithVisibleSize(const_std_string_filename) end
--[[
	@return [luaIde#cc.CSLoader]
]]
function cc.CSLoader:getInstance() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIVideoPlayer.h
]]
ccexp.VideoPlayer = {}
--[[
	@brief Get the local video file name.
	@return std_string   The video file name.
]]
function ccexp.VideoPlayer:getFileName() end
--[[
	@brief Get the URL of remoting video source.
	@return std_string   A remoting URL address.
]]
function ccexp.VideoPlayer:getURL() end
--[[
	Starts playback.
]]
function ccexp.VideoPlayer:play() end
--[[
	Causes the video player to keep aspect ratio or no when displaying the video.
	@param enable    Specify true to keep aspect ratio or false to scale the video until
	both dimensions fit the visible bounds of the view exactly.
]]
function ccexp.VideoPlayer:setKeepAspectRatioEnabled(bool_enable) end
--[[
	Stops playback.
]]
function ccexp.VideoPlayer:stop() end
--[[
	Causes the video player to enter or exit full-screen mode.
	@param fullscreen    Specify true to enter full-screen mode or false to exit full-screen mode.
]]
function ccexp.VideoPlayer:setFullScreenEnabled(bool_fullscreen) end
--[[
	Sets a file path as a video source for VideoPlayer.
]]
function ccexp.VideoPlayer:setFileName(const_std_string_videoPath) end
--[[
	Sets a URL as a video source for VideoPlayer.
]]
function ccexp.VideoPlayer:setURL(const_std_string__videoURL) end
--[[
	Indicates whether the video player keep aspect ratio when displaying the video.
	@return bool
]]
function ccexp.VideoPlayer:isKeepAspectRatioEnabled() end
--[[
	@brief A function which will be called when video is playing.
	@param event @see VideoPlayer::EventType.
]]
function ccexp.VideoPlayer:onPlayEvent(int_event) end
--[[
	Indicates whether the video player is in full-screen mode.
	@return bool   True if the video player is in full-screen mode, false otherwise.
]]
function ccexp.VideoPlayer:isFullScreenEnabled() end
--[[
	Checks whether the VideoPlayer is playing.
	@return bool   True if currently playing, false otherwise.
]]
function ccexp.VideoPlayer:isPlaying() end
--[[
	Seeks to specified time position.
	@param sec   The offset in seconds from the start to seek to.
]]
function ccexp.VideoPlayer:seekTo(float_sec) end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIWebView.h
]]
ccexp.WebView = {}
--[[
	SetOpacity of webview.
]]
function ccexp.WebView:setOpacityWebView(float_opacity) end
--[[
	Gets whether this WebView has a back history item.
	@return bool   WebView has a back history item.
]]
function ccexp.WebView:canGoBack() end
--[[
	Sets the main page content and base URL.
	@param string The content for the main page.
	@param baseURL The base URL for the content.
]]
function ccexp.WebView:loadHTMLString(const_std_string_string,const_std_string_baseURL) end
--[[
	Goes forward in the history.
]]
function ccexp.WebView:goForward() end
--[[
	Goes back in the history.
]]
function ccexp.WebView:goBack() end
--[[
	Set WebView should support zooming. The default value is false.
]]
function ccexp.WebView:setScalesPageToFit(const_bool_scalesPageToFit) end
--[[
	Loads the given fileName.
	@param fileName Content fileName.
]]
function ccexp.WebView:loadFile(const_std_string_fileName) end
--[[
	Loads the given URL. It doesn't clean cached data.
	@param url Content URL.
]]
function ccexp.WebView:loadURL(const_std_string_url) end
--[[
	Loads the given URL with cleaning cached data or not.
	@param url Content URL.
	@cleanCachedData Whether to clean cached data.
]]
function ccexp.WebView:loadURL(const_std_string_url,bool_cleanCachedData) end
--[[
	Set whether the webview bounces at end of scroll of WebView.
]]
function ccexp.WebView:setBounces(bool_bounce) end
--[[
	Evaluates JavaScript in the context of the currently displayed page.
]]
function ccexp.WebView:evaluateJS(const_std_string_js) end
--[[
	set the background transparent
]]
function ccexp.WebView:setBackgroundTransparent() end
--[[
	Get the Javascript callback.
	@return [luaIde#ccWebViewCallback]
]]
function ccexp.WebView:getOnJSCallback() end
--[[
	Gets whether this WebView has a forward history item.
	@return bool   WebView has a forward history item.
]]
function ccexp.WebView:canGoForward() end
--[[
	Stops the current load.
]]
function ccexp.WebView:stopLoading() end
--[[
	getOpacity of webview.
	@return float
]]
function ccexp.WebView:getOpacityWebView() end
--[[
	Reloads the current URL.
]]
function ccexp.WebView:reload() end
--[[
	Set javascript interface scheme.
	@see WebView::setOnJSCallback()
]]
function ccexp.WebView:setJavascriptInterfaceScheme(const_std_string_scheme) end
--[[
	Allocates and initializes a WebView.
	@return [luaIde#ccexp.WebView]
]]
function ccexp.WebView:create() end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControl.h
]]
cc.Control = {}
--[[
	Tells whether the control is enabled.
]]
function cc.Control:setEnabled(bool_bEnabled) end
--[[
	Sends action messages for the given control events.
	@param controlEvents A bitmask whose set flags specify the control events for
	which action messages are sent. See "CCControlEvent" for bitmask constants.
]]
function cc.Control:sendActionsForControlEvents(EventType_controlEvents) end
--[[
	A Boolean value that determines the control selected state.
]]
function cc.Control:setSelected(bool_bSelected) end
--[[
	@return bool
]]
function cc.Control:isEnabled() end
--[[
	Updates the control layout using its current internal state.
]]
function cc.Control:needsLayout() end
--[[
	@return bool
]]
function cc.Control:hasVisibleParents() end
--[[
	@return bool
]]
function cc.Control:isSelected() end
--[[
	Returns a boolean value that indicates whether a touch is inside the bounds
	of the receiver. The given touch must be relative to the world.
	@param touch A Touch object that represents a touch.
	@return bool   Whether a touch is inside the receiver's rect.
]]
function cc.Control:isTouchInside(Touch__touch) end
--[[
	A Boolean value that determines whether the control is highlighted.
]]
function cc.Control:setHighlighted(bool_bHighlighted) end
--[[
	Returns a point corresponding to the touch location converted into the
	control space coordinates.
	@param touch A Touch object that represents a touch.
	@return [luaIde#cc.Vec2]
]]
function cc.Control:getTouchLocation(Touch_touch) end
--[[
	@return bool
]]
function cc.Control:isHighlighted() end
--[[
	Creates a Control object
	@return [luaIde#cc.Control]
]]
function cc.Control:create() end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlButton.h
]]
cc.ControlButton = {}
--[[
	@return bool
]]
function cc.ControlButton:isPushed() end
--[[
	Sets the title label to use for the specified state.
	If a property is not specified for a state, the default is to use
	the ButtonStateNormal value.
	@param label The title label to use for the specified state.
	@param state The state that uses the specified title. The values are described
	in "CCControlState".
]]
function cc.ControlButton:setTitleLabelForState(Node_label,State_state) end
function cc.ControlButton:setAdjustBackgroundImage(bool_adjustBackgroundImage) end
--[[
	Sets the title string to use for the specified state.
	If a property is not specified for a state, the default is to use
	the ButtonStateNormal value.
	@param title The title string to use for the specified state.
	@param state The state that uses the specified title. The values are described
	in "CCControlState".
]]
function cc.ControlButton:setTitleForState(const_std_string_title,State_state) end
--[[
	@return bool
]]
function cc.ControlButton:initWithBackgroundSprite(cocos2d_ui_Scale9Sprite_sprite) end
--[[
	@return float
]]
function cc.ControlButton:getTitleTTFSizeForState(State_state) end
function cc.ControlButton:setTitleTTFForState(const_std_string_fntFile,State_state) end
function cc.ControlButton:setTitleTTFSizeForState(float_size,State_state) end
--[[
	Returns the background sprite used for a state.
	@param state The state that uses the background sprite. Possible values are
	described in "CCControlState".
	@return [luaIde#cocos2d_ui_Scale9Sprite]
]]
function cc.ControlButton:getBackgroundSpriteForState(State_state) end
--[[
	@return bool
]]
function cc.ControlButton:initWithTitleAndFontNameAndFontSize(const_std_string_title,const_std_string_fontName,float_fontSize) end
--[[
	Sets the font of the label, changes the label to a BMFont if necessary.
	@param fntFile The name of the font to change to
	@param state The state that uses the specified fntFile. The values are described
	in "CCControlState".
]]
function cc.ControlButton:setTitleBMFontForState(const_std_string_fntFile,State_state) end
--[[
	@return std_string
]]
function cc.ControlButton:getTitleTTFForState(State_state) end
--[[
	Returns the title color used for a state.
	@param state The state that uses the specified color. The values are described
	in "CCControlState".
	@return [luaIde#Color3B]   The color of the title for the specified state.
]]
function cc.ControlButton:getTitleColorForState(State_state) end
--[[
	Sets the color of the title to use for the specified state.
	@param color The color of the title to use for the specified state.
	@param state The state that uses the specified color. The values are described
	in "CCControlState".
]]
function cc.ControlButton:setTitleColorForState(const_Color3B_color,State_state) end
--[[
	Adjust the background image. YES by default. If the property is set to NO, the
	background will use the preferred size of the background image.
	@return bool
]]
function cc.ControlButton:doesAdjustBackgroundImage() end
--[[
	Sets the background spriteFrame to use for the specified button state.
	@param spriteFrame The background spriteFrame to use for the specified state.
	@param state The state that uses the specified image. The values are described
	in "CCControlState".
]]
function cc.ControlButton:setBackgroundSpriteFrameForState(SpriteFrame__spriteFrame,State_state) end
--[[
	Sets the background sprite to use for the specified button state.
	@param sprite The background sprite to use for the specified state.
	@param state The state that uses the specified image. The values are described
	in "CCControlState".
]]
function cc.ControlButton:setBackgroundSpriteForState(cocos2d_ui_Scale9Sprite_sprite,State_state) end
--[[
	@return std_string
]]
function cc.ControlButton:getTitleBMFontForState(State_state) end
--[[
	Returns the title label used for a state.
	@param state The state that uses the title label. Possible values are described
	in "CCControlState".
	@return [luaIde#cc.Node]
]]
function cc.ControlButton:getTitleLabelForState(State_state) end
--[[
	set the margins at once (so we only have to do one call of needsLayout)
]]
function cc.ControlButton:setMargins(int_marginH,int_marginV) end
--[[
	@return std_string
]]
function cc.ControlButton:getCurrentTitle() end
--[[
	@return bool
]]
function cc.ControlButton:initWithLabelAndBackgroundSprite(Node_label,cocos2d_ui_Scale9Sprite_backgroundSprite,bool_adjustBackGroundSize) end
--[[
	Returns the title used for a state.
	@param state The state that uses the title. Possible values are described in
	"CCControlState".
	@return std_string   The title for the specified state.
]]
function cc.ControlButton:getTitleForState(State_state) end
--[[
	@return [luaIde#cc.ControlButton]
]]
function cc.ControlButton:create() end
--[[
	@return [luaIde#cc.ControlButton]
]]
function cc.ControlButton:create(Node_label,cocos2d_ui_Scale9Sprite_backgroundSprite) end
--[[
	@return [luaIde#cc.ControlButton]
]]
function cc.ControlButton:create(Node_label,cocos2d_ui_Scale9Sprite_backgroundSprite,bool_adjustBackGroundSize) end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlHuePicker.h
]]
cc.ControlHuePicker = {}
--[[
	@return bool
]]
function cc.ControlHuePicker:initWithTargetAndPos(Node_target,Vec2_pos) end
function cc.ControlHuePicker:setHue(float_val) end
function cc.ControlHuePicker:setHuePercentage(float_val) end
--[[
	@return [luaIde#cc.ControlHuePicker]
]]
function cc.ControlHuePicker:create(Node_target,Vec2_pos) end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlSaturationBrightnessPicker.h
]]
cc.ControlSaturationBrightnessPicker = {}
--[[
	@return bool
]]
function cc.ControlSaturationBrightnessPicker:initWithTargetAndPos(Node_target,Vec2_pos) end
--[[
	@return [luaIde#cc.ControlSaturationBrightnessPicker]
]]
function cc.ControlSaturationBrightnessPicker:create(Node_target,Vec2_pos) end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlColourPicker.h
]]
cc.ControlColourPicker = {}
--[[
	virtual ~ControlColourPicker();
]]
function cc.ControlColourPicker:hueSliderValueChanged(Ref__sender,Control_EventType_controlEvent) end
function cc.ControlColourPicker:colourSliderValueChanged(Ref__sender,Control_EventType_controlEvent) end
--[[
	@return [luaIde#cc.ControlColourPicker]
]]
function cc.ControlColourPicker:create() end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlPotentiometer.h
]]
cc.ControlPotentiometer = {}
function cc.ControlPotentiometer:setValue(float_value) end
--[[
	@return float
]]
function cc.ControlPotentiometer:getMaximumValue() end
--[[
	Factorize the event dispatch into these methods.
]]
function cc.ControlPotentiometer:potentiometerBegan(Vec2_location) end
function cc.ControlPotentiometer:setMaximumValue(float_maximumValue) end
--[[
	@return float
]]
function cc.ControlPotentiometer:getMinimumValue() end
--[[
	@return float
]]
function cc.ControlPotentiometer:getValue() end
--[[
	Returns the distance between the point1 and point2.
	@return float
]]
function cc.ControlPotentiometer:distanceBetweenPointAndPoint(Vec2_point1,Vec2_point2) end
function cc.ControlPotentiometer:potentiometerEnded(Vec2_location) end
function cc.ControlPotentiometer:setMinimumValue(float_minimumValue) end
--[[
	Initializes a potentiometer with a track sprite and a progress bar.
	@param trackSprite   Sprite, that is used as a background.
	@param progressTimer ProgressTimer, that is used as a progress bar.
	@return bool
]]
function cc.ControlPotentiometer:initWithTrackSprite_ProgressTimer_ThumbSprite(Sprite_trackSprite,ProgressTimer_progressTimer,Sprite_thumbSprite) end
function cc.ControlPotentiometer:potentiometerMoved(Vec2_location) end
--[[
	Creates potentiometer with a track filename and a progress filename.
	@return [luaIde#cc.ControlPotentiometer]
]]
function cc.ControlPotentiometer:create(const_char_backgroundFile,const_char_progressFile,const_char_thumbFile) end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlSlider.h
]]
cc.ControlSlider = {}
--[[
	Initializes a slider with a background sprite, a progress bar and a thumb
	item.
	@param backgroundSprite          Sprite, that is used as a background.
	@param progressSprite            Sprite, that is used as a progress bar.
	@param thumbSprite               Sprite, that is used as a thumb.
	@return bool
]]
function cc.ControlSlider:initWithSprites(Sprite__backgroundSprite,Sprite_progressSprite,Sprite_thumbSprite) end
--[[
	Initializes a slider with a background sprite, a progress bar and a thumb
	item.
	@param backgroundSprite          Sprite, that is used as a background.
	@param progressSprite            Sprite, that is used as a progress bar.
	@param thumbSprite               Sprite, that is used as a thumb.
	@param selectedThumbSprite       Sprite, that is used as a selected thumb.
	@return bool
]]
function cc.ControlSlider:initWithSprites(Sprite__backgroundSprite,Sprite_progressSprite,Sprite_thumbSprite,Sprite_selectedThumbSprite) end
function cc.ControlSlider:setMaximumValue(float_val) end
function cc.ControlSlider:setValue(float_val) end
--[[
	@return [luaIde#cc.Vec2]
]]
function cc.ControlSlider:locationFromTouch(Touch_touch) end
function cc.ControlSlider:setMinimumValue(float_val) end
--[[
	Creates slider with a background filename, a progress filename and a
	thumb image filename.
	@return [luaIde#cc.ControlSlider]
]]
function cc.ControlSlider:create(const_char_bgFile,const_char_progressFile,const_char_thumbFile) end
--[[
	Creates a slider with a given background sprite and a progress bar and a
	thumb item.
	@see initWithSprites
	@return [luaIde#cc.ControlSlider]
]]
function cc.ControlSlider:create(Sprite__backgroundSprite,Sprite_pogressSprite,Sprite_thumbSprite) end
--[[
	Creates slider with a background filename, a progress filename, a thumb
	and a selected thumb image filename.
	@return [luaIde#cc.ControlSlider]
]]
function cc.ControlSlider:create(const_char_bgFile,const_char_progressFile,const_char_thumbFile,const_char_selectedThumbSpriteFile) end
--[[
	Creates a slider with a given background sprite and a progress bar, a thumb
	and a selected thumb .
	@see initWithSprites
	@return [luaIde#cc.ControlSlider]
]]
function cc.ControlSlider:create(Sprite__backgroundSprite,Sprite_pogressSprite,Sprite_thumbSprite,Sprite_selectedThumbSprite) end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlStepper.h
]]
cc.ControlStepper = {}
function cc.ControlStepper:setValue(double_value) end
function cc.ControlStepper:setStepValue(double_stepValue) end
--[[
	@return bool
]]
function cc.ControlStepper:initWithMinusSpriteAndPlusSprite(Sprite_minusSprite,Sprite_plusSprite) end
--[[
	Set the numeric value of the stepper. If send is true, the Control::EventType::VALUE_CHANGED is sent.
]]
function cc.ControlStepper:setValueWithSendingEvent(double_value,bool_send) end
function cc.ControlStepper:setMaximumValue(double_maximumValue) end
function cc.ControlStepper:setWraps(bool_wraps) end
--[[
	Start the autorepeat increment/decrement.
]]
function cc.ControlStepper:startAutorepeat() end
--[[
	Update the layout of the stepper with the given touch location.
]]
function cc.ControlStepper:updateLayoutUsingTouchLocation(Vec2_location) end
--[[
	@return bool
]]
function cc.ControlStepper:isContinuous() end
--[[
	Stop the autorepeat.
]]
function cc.ControlStepper:stopAutorepeat() end
function cc.ControlStepper:setMinimumValue(double_minimumValue) end
--[[
	@return double
]]
function cc.ControlStepper:getValue() end
--[[
	@return [luaIde#cc.ControlStepper]
]]
function cc.ControlStepper:create(Sprite_minusSprite,Sprite_plusSprite) end

--[[
	@SuperType[luaIde#cc.Control]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCControlExtension/CCControlSwitch.h
]]
cc.ControlSwitch = {}
--[[
	Set the state of the switch to On or Off, optionally animating the transition.
	@param isOn YES if the switch should be turned to the On position; NO if it
	should be turned to the Off position. If the switch is already in the
	designated position, nothing happens.
	@param animated YES to animate the "flipping" of the switch; otherwise NO.
]]
function cc.ControlSwitch:setOn(bool_isOn,bool_animated) end
--[[
	@return [luaIde#cc.Vec2]
]]
function cc.ControlSwitch:locationFromTouch(Touch_touch) end
--[[
	@return bool
]]
function cc.ControlSwitch:isOn() end
--[[
	Initializes a switch with a mask sprite, on/off sprites for on/off states and a thumb sprite.
	@return bool
]]
function cc.ControlSwitch:initWithMaskSprite(Sprite_maskSprite,Sprite__onSprite,Sprite__offSprite,Sprite__thumbSprite) end
--[[
	Initializes a switch with a mask sprite, on/off sprites for on/off states, a thumb sprite and an on/off labels.
	@return bool
]]
function cc.ControlSwitch:initWithMaskSprite(Sprite_maskSprite,Sprite__onSprite,Sprite__offSprite,Sprite__thumbSprite,Label_onLabel,Label_offLabel) end
--[[
	@return bool
]]
function cc.ControlSwitch:hasMoved() end
--[[
	Creates a switch with a mask sprite, on/off sprites for on/off states, a thumb sprite and an on/off labels.
	@return [luaIde#cc.ControlSwitch]
]]
function cc.ControlSwitch:create(Sprite_maskSprite,Sprite__onSprite,Sprite__offSprite,Sprite__thumbSprite,Label_onLabel,Label_offLabel) end
--[[
	Creates a switch with a mask sprite, on/off sprites for on/off states and a thumb sprite.
	@return [luaIde#cc.ControlSwitch]
]]
function cc.ControlSwitch:create(Sprite_maskSprite,Sprite__onSprite,Sprite__offSprite,Sprite__thumbSprite) end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIScrollView.h
]]
cc.ScrollView = {}
--[[
	Changes scroll direction of scrollview.
	@see `Direction`
	@param dir Scroll direction enum.
]]
function cc.ScrollView:setDirection(Direction_dir) end
--[[
	Query scroll direction of scrollview.
	@see `Direction`      Direction::VERTICAL means vertical scroll, Direction::HORIZONTAL means horizontal scroll
	@return [luaIde#Direction]   Scrollview scroll direction.
]]
function cc.ScrollView:getDirection() end
--[[
	Create an empty ScrollView.
	@return [luaIde#cc.ScrollView]   A ScrollView instance.
]]
function cc.ScrollView:create() end
--[[
	Scroll inner container to top boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToTop(float_timeInSec,bool_attenuated) end
--[[
	Scroll inner container to horizontal percent position of scrollview.
	@param percent A value between 0 and 100.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToPercentHorizontal(float_percent,float_timeInSec,bool_attenuated) end
--[[
	@brief Set the scroll bar's opacity
	@param the scroll bar's opacity
]]
function cc.ScrollView:setScrollBarOpacity(GLubyte_opacity) end
--[[
	@brief Toggle scroll bar enabled.
	@param enabled True if enable scroll bar, false otherwise.
]]
function cc.ScrollView:setScrollBarEnabled(bool_enabled) end
--[[
	@brief Query inertia scroll state.
	@return bool   True if inertia is enabled, false otherwise.
]]
function cc.ScrollView:isInertiaScrollEnabled() end
--[[
	Scroll inner container to both direction percent position of scrollview.
	@param percent A value between 0 and 100.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToPercentBothDirection(const_Vec2_percent,float_timeInSec,bool_attenuated) end
--[[
	@return [luaIde#cc.Vec2]   How far the scroll view is scrolled in both axes, combined as a Vec2
]]
function cc.ScrollView:getScrolledPercentBothDirection() end
--[[
	@brief Set the scroll bar's color
	@param the scroll bar's color
]]
function cc.ScrollView:setScrollBarColor(const_Color3B_color) end
--[[
	Scroll inner container to bottom and left boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToBottomLeft(float_timeInSec,bool_attenuated) end
--[[
	Get inner container of scrollview.
	Inner container is a child of scrollview.
	@return [luaIde#ccui.Layout]   Inner container pointer.
]]
function cc.ScrollView:getInnerContainer() end
--[[
	Move inner container to bottom boundary of scrollview.
]]
function cc.ScrollView:jumpToBottom() end
--[[
	Set inner container position
	@param pos Inner container position.
]]
function cc.ScrollView:setInnerContainerPosition(const_Vec2_pos) end
--[[
	Scroll inner container to top and left boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToTopLeft(float_timeInSec,bool_attenuated) end
--[[
	Move inner container to top and right boundary of scrollview.
]]
function cc.ScrollView:jumpToTopRight() end
--[[
	Move inner container to top boundary of scrollview.
]]
function cc.ScrollView:jumpToTop() end
--[[
	Change inner container size of scrollview.
	Inner container size must be larger than or equal scrollview's size.
	@param size Inner container size.
]]
function cc.ScrollView:setInnerContainerSize(const_Size_size) end
--[[
	Get inner container position
	@return [luaIde#cc.Vec2]   The inner container position.
]]
function cc.ScrollView:getInnerContainerPosition() end
--[[
	@return float   How far the scroll view is scrolled in the vertical axis
]]
function cc.ScrollView:getScrolledPercentVertical() end
--[[
	@brief Query bounce state.
	@return bool   True if bounce is enabled, false otherwise.
]]
function cc.ScrollView:isBounceEnabled() end
--[[
	Move inner container to vertical percent position of scrollview.
	@param percent A value between 0 and 100.
]]
function cc.ScrollView:jumpToPercentVertical(float_percent) end
--[[
	Add callback function which will be called  when scrollview event triggered.
	@param callback A callback function with type of `ccScrollViewCallback`.
]]
function cc.ScrollView:addEventListener(const_ccScrollViewCallback_callback) end
--[[
	@brief Set scroll bar auto hide time
	@param scroll bar auto hide time
]]
function cc.ScrollView:setScrollBarAutoHideTime(float_autoHideTime) end
--[[
	@return bool   Whether the ScrollView is currently scrolling because of a bounceback or inertia slowdown.
]]
function cc.ScrollView:isAutoScrolling() end
--[[
	@brief Set the horizontal scroll bar position from left-bottom corner.
	@param positionFromCorner The position from left-bottom corner
]]
function cc.ScrollView:setScrollBarPositionFromCornerForHorizontal(const_Vec2_positionFromCorner) end
--[[
	@brief Toggle whether enable scroll inertia while scrolling.
	@param enabled True if enable inertia, false otherwise.
]]
function cc.ScrollView:setInertiaScrollEnabled(bool_enabled) end
--[[
	@brief Set scroll bar auto hide state
	@param scroll bar auto hide state
]]
function cc.ScrollView:setScrollBarAutoHideEnabled(bool_autoHideEnabled) end
--[[
	@brief Get the scroll bar's color
	@return [luaIde#Color3B]   the scroll bar's color
]]
function cc.ScrollView:getScrollBarColor() end
--[[
	@brief Set the scroll bar's width
	@param width The scroll bar's width
]]
function cc.ScrollView:setScrollBarWidth(float_width) end
--[[
	Move inner container to top and left boundary of scrollview.
]]
function cc.ScrollView:jumpToTopLeft() end
--[[
	@brief Query scroll bar state.
	@return bool   True if scroll bar is enabled, false otherwise.
]]
function cc.ScrollView:isScrollBarEnabled() end
--[[
	Move inner container to bottom and right boundary of scrollview.
]]
function cc.ScrollView:jumpToBottomRight() end
--[[
	@brief Set the touch total time threshold
	@param the touch total time threshold
]]
function cc.ScrollView:setTouchTotalTimeThreshold(float_touchTotalTimeThreshold) end
--[[
	@brief Get the touch total time threshold
	@return float   the touch total time threshold
]]
function cc.ScrollView:getTouchTotalTimeThreshold() end
--[[
	@brief Get the horizontal scroll bar's position from right-top corner.
	@return [luaIde#cc.Vec2]   positionFromCorner
]]
function cc.ScrollView:getScrollBarPositionFromCornerForHorizontal() end
--[[
	@return float   How far the scroll view is scrolled in the horizontal axis
]]
function cc.ScrollView:getScrolledPercentHorizontal() end
--[[
	@brief Toggle bounce enabled when scroll to the edge.
	@param enabled True if enable bounce, false otherwise.
]]
function cc.ScrollView:setBounceEnabled(bool_enabled) end
--[[
	Immediately stops inner container scroll initiated by any of the "scrollTo*" member functions
]]
function cc.ScrollView:stopAutoScroll() end
--[[
	Scroll inner container to top and right boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToTopRight(float_timeInSec,bool_attenuated) end
--[[
	@return bool   Whether the user is currently dragging the ScrollView to scroll it
]]
function cc.ScrollView:isScrolling() end
--[[
	Scroll inner container to left boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToLeft(float_timeInSec,bool_attenuated) end
--[[
	Move inner container to both direction percent position of scrollview.
	@param percent   A value between 0 and 100.
]]
function cc.ScrollView:jumpToPercentBothDirection(const_Vec2_percent) end
--[[
	Scroll inner container to vertical percent position of scrollview.
	@param percent A value between 0 and 100.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToPercentVertical(float_percent,float_timeInSec,bool_attenuated) end
--[[
	Scroll inner container to bottom boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToBottom(float_timeInSec,bool_attenuated) end
--[[
	@brief Get the scroll bar's opacity
	@return [luaIde#GLubyte]   the scroll bar's opacity
]]
function cc.ScrollView:getScrollBarOpacity() end
--[[
	Scroll inner container to bottom and right boundary of scrollview.
	@param timeInSec Time in seconds
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToBottomRight(float_timeInSec,bool_attenuated) end
--[[
	@brief Set the scroll bar positions from the left-bottom corner (horizontal) and right-top corner (vertical).
	@param positionFromCorner The position from the left-bottom corner (horizontal) and right-top corner (vertical).
]]
function cc.ScrollView:setScrollBarPositionFromCorner(const_Vec2_positionFromCorner) end
--[[
	@brief Set the vertical scroll bar position from right-top corner.
	@param positionFromCorner The position from right-top corner
]]
function cc.ScrollView:setScrollBarPositionFromCornerForVertical(const_Vec2_positionFromCorner) end
--[[
	@brief Get the scroll bar's auto hide time
	@return float   the scroll bar's auto hide time
]]
function cc.ScrollView:getScrollBarAutoHideTime() end
--[[
	Move inner container to left boundary of scrollview.
]]
function cc.ScrollView:jumpToLeft() end
--[[
	Scroll inner container to right boundary of scrollview.
	@param timeInSec Time in seconds.
	@param attenuated Whether scroll speed attenuate or not.
]]
function cc.ScrollView:scrollToRight(float_timeInSec,bool_attenuated) end
--[[
	@brief Get the vertical scroll bar's position from right-top corner.
	@return [luaIde#cc.Vec2]   positionFromCorner
]]
function cc.ScrollView:getScrollBarPositionFromCornerForVertical() end
--[[
	@brief Get the scroll bar's width
	@return float   the scroll bar's width
]]
function cc.ScrollView:getScrollBarWidth() end
--[[
	@brief Query scroll bar auto hide state
	@return bool   True if scroll bar auto hide is enabled, false otherwise.
]]
function cc.ScrollView:isScrollBarAutoHideEnabled() end
--[[
	Move inner container to bottom and left boundary of scrollview.
]]
function cc.ScrollView:jumpToBottomLeft() end
--[[
	Move inner container to right boundary of scrollview.
]]
function cc.ScrollView:jumpToRight() end
--[[
	Get inner container size of scrollview.
	Inner container size must be larger than or equal scrollview's size.
	@return [luaIde#cc.Size]   The inner container size.
]]
function cc.ScrollView:getInnerContainerSize() end
--[[
	Move inner container to horizontal percent position of scrollview.
	@param percent   A value between 0 and 100.
]]
function cc.ScrollView:jumpToPercentHorizontal(float_percent) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCScrollView/CCTableViewCell.h
]]
cc.TableViewCell = {}
--[[
	Cleans up any resources linked to this cell and resets <code>idx</code> property.
]]
function cc.TableViewCell:reset() end
--[[
	The index used internally by SWTableView and its subclasses
	@return ssize_t
]]
function cc.TableViewCell:getIdx() end
function cc.TableViewCell:setIdx(ssize_t_uIdx) end

--[[
	@SuperType[luaIde#cc.ScrollView]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/GUI/CCScrollView/CCTableView.h
]]
cc.TableView = {}
--[[
	Updates the content of the cell at a given index.
	@param idx index to find a cell
]]
function cc.TableView:updateCellAtIndex(ssize_t_idx) end
--[[
	determines how cell is ordered and filled in the view.
]]
function cc.TableView:setVerticalFillOrder(VerticalFillOrder_order) end
function cc.TableView:scrollViewDidZoom(ScrollView_view) end
function cc.TableView:_updateContentSize() end
--[[
	@return [luaIde#VerticalFillOrder]
]]
function cc.TableView:getVerticalFillOrder() end
--[[
	Removes a cell at a given index
	@param idx index to find a cell
]]
function cc.TableView:removeCellAtIndex(ssize_t_idx) end
--[[
	@return bool
]]
function cc.TableView:initWithViewSize(Size_size,Node_container) end
--[[
	Overrides
]]
function cc.TableView:scrollViewDidScroll(ScrollView_view) end
--[[
	reloads data from data source.  the view will be refreshed.
]]
function cc.TableView:reloadData() end
--[[
	Inserts a new cell at a given index
	@param idx location to insert
]]
function cc.TableView:insertCellAtIndex(ssize_t_idx) end
--[[
	Returns an existing cell at a given index. Returns nil if a cell is nonexistent at the moment of query.
	@param idx index
	@return [luaIde#cc.TableViewCell]   a cell at a given index
]]
function cc.TableView:cellAtIndex(ssize_t_idx) end
--[[
	Dequeues a free cell if available. nil if not.
	@return [luaIde#cc.TableViewCell]   free cell
]]
function cc.TableView:dequeueCell() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/assets-manager/AssetsManager.h
]]
cc.AssetsManager = {}
--[[
	@brief Sets storage path.
	@param storagePath The path to store downloaded resources.
	@warning The path should be a valid path.
]]
function cc.AssetsManager:setStoragePath(const_char_storagePath) end
--[[
	@brief Sets package url.
]]
function cc.AssetsManager:setPackageUrl(const_char_packageUrl) end
--[[
	@brief Check out if there is a new version resource.
	You may use this method before updating, then let user determine whether
	he wants to update resources.
	@return bool
]]
function cc.AssetsManager:checkUpdate() end
--[[
	@brief Gets storage path.
	@return char
]]
function cc.AssetsManager:getStoragePath() end
--[[
	@brief Download new package if there is a new version, and uncompress downloaded zip file.
	Ofcourse it will set search path that stores downloaded files.
]]
function cc.AssetsManager:update() end
--[[
	@brief Sets connection time out in seconds
]]
function cc.AssetsManager:setConnectionTimeout(unsigned_int_timeout) end
--[[
	@brief Gets version file url.
]]
function cc.AssetsManager:setVersionFileUrl(const_char_versionFileUrl) end
--[[
	@brief Gets url of package.
	@return char
]]
function cc.AssetsManager:getPackageUrl() end
--[[
	@brief Gets connection time out in seconds
	@return int
]]
function cc.AssetsManager:getConnectionTimeout() end
--[[
	@brief Gets current version code.
	@return std_string
]]
function cc.AssetsManager:getVersion() end
--[[
	@brief Gets version file url.
	@return char
]]
function cc.AssetsManager:getVersionFileUrl() end
--[[
	@brief Deletes recorded version code.
]]
function cc.AssetsManager:deleteVersion() end
--[[
	@brief To access within scripting environment
	@return [luaIde#cc.AssetsManager]
]]
function cc.AssetsManager:create(const_char_packageUrl,const_char_versionFileUrl,const_char_storagePath,ErrorCallback_errorCallback,ProgressCallback_progressCallback,SuccessCallback_successCallback) end

--[[
	@SuperType[luaIde#cc.EventCustom]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/assets-manager/CCEventAssetsManagerEx.h
]]
cc.EventAssetsManagerEx = {}
--[[
	@return [luaIde#cocos2d_extension_AssetsManagerEx]
]]
function cc.EventAssetsManagerEx:getAssetsManagerEx() end
--[[
	@return std_string
]]
function cc.EventAssetsManagerEx:getAssetId() end
--[[
	@return int
]]
function cc.EventAssetsManagerEx:getCURLECode() end
--[[
	@return std_string
]]
function cc.EventAssetsManagerEx:getMessage() end
--[[
	@return int
]]
function cc.EventAssetsManagerEx:getCURLMCode() end
--[[
	@return float
]]
function cc.EventAssetsManagerEx:getPercentByFile() end
--[[
	@return [luaIde#EventCode]
]]
function cc.EventAssetsManagerEx:getEventCode() end
--[[
	@return float
]]
function cc.EventAssetsManagerEx:getPercent() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/assets-manager/Manifest.h
]]
cc.Manifest = {}
--[[
	@brief Gets remote manifest file url.
	@return std_string
]]
function cc.Manifest:getManifestFileUrl() end
--[[
	@brief Check whether the version informations have been fully loaded
	@return bool
]]
function cc.Manifest:isVersionLoaded() end
--[[
	@brief Check whether the manifest have been fully loaded
	@return bool
]]
function cc.Manifest:isLoaded() end
--[[
	@brief Gets remote package url.
	@return std_string
]]
function cc.Manifest:getPackageUrl() end
--[[
	@brief Gets manifest version.
	@return std_string
]]
function cc.Manifest:getVersion() end
--[[
	@brief Gets remote version file url.
	@return std_string
]]
function cc.Manifest:getVersionFileUrl() end
--[[
	@brief Get the search paths list related to the Manifest.
	@return [luaIde#std_vector__std_string__]
]]
function cc.Manifest:getSearchPaths() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/assets-manager/AssetsManagerEx.h
]]
cc.AssetsManagerEx = {}
--[[
	@brief Gets the current update state.
	@return [luaIde#State]
]]
function cc.AssetsManagerEx:getState() end
--[[
	@brief Function for retrieving the max concurrent task count
	@return int
]]
function cc.AssetsManagerEx:getMaxConcurrentTask() end
--[[
	@brief  Check out if there is a new version of manifest.
	You may use this method before updating, then let user determine whether
	he wants to update resources.
]]
function cc.AssetsManagerEx:checkUpdate() end
--[[
	@brief Set the verification function for checking whether downloaded asset is correct, e.g. using md5 verification
	@param callback  The verify callback function
]]
function cc.AssetsManagerEx:setVerifyCallback() end
--[[
	@brief Gets storage path.
	@return std_string
]]
function cc.AssetsManagerEx:getStoragePath() end
--[[
	@brief Update with the current local manifest.
]]
function cc.AssetsManagerEx:update() end
--[[
	@brief Set the handle function for comparing manifests versions
	@param handle    The compare function
]]
function cc.AssetsManagerEx:setVersionCompareHandle() end
--[[
	@brief Function for setting the max concurrent task count
]]
function cc.AssetsManagerEx:setMaxConcurrentTask(const_int_max) end
--[[
	@brief Function for retrieving the local manifest object
	@return [luaIde#cc.Manifest]
]]
function cc.AssetsManagerEx:getLocalManifest() end
--[[
	@brief Function for retrieving the remote manifest object
	@return [luaIde#cc.Manifest]
]]
function cc.AssetsManagerEx:getRemoteManifest() end
--[[
	@brief Reupdate all failed assets under the current AssetsManagerEx context
]]
function cc.AssetsManagerEx:downloadFailedAssets() end
--[[
	@brief Create function for creating a new AssetsManagerEx
	@param manifestUrl   The url for the local manifest file
	@param storagePath   The storage path for downloaded assets
	@warning   The cached manifest in your storage path have higher priority and will be searched first,
	only if it doesn't exist, AssetsManagerEx will use the given manifestUrl.
	@return [luaIde#cc.AssetsManagerEx]
]]
function cc.AssetsManagerEx:create(const_std_string_manifestUrl,const_std_string_storagePath) end

--[[
	@SuperType[luaIde#cc.EventListenerCustom]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/assets-manager/CCEventListenerAssetsManagerEx.h
]]
cc.EventListenerAssetsManagerEx = {}
--[[
	Initializes event with type and callback function
	@return bool
]]
function cc.EventListenerAssetsManagerEx:init(const_AssetsManagerEx_AssetsManagerEx) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/Particle3D/CCParticleSystem3D.h
]]
cc.ParticleSystem3D = {}
--[[
	remove affector by index
]]
function cc.ParticleSystem3D:removeAffector(int_index) end
--[[
	resume particle
]]
function cc.ParticleSystem3D:resumeParticleSystem() end
--[[
	remove all particle affector
]]
function cc.ParticleSystem3D:removeAllAffector() end
--[[
	add particle affector
]]
function cc.ParticleSystem3D:addAffector(Particle3DAffector_affector) end
--[[
	particle system play control
]]
function cc.ParticleSystem3D:startParticleSystem() end
--[[
	is enabled
	@return bool
]]
function cc.ParticleSystem3D:isEnabled() end
--[[
	return particle render
	@return [luaIde#Particle3DRender]
]]
function cc.ParticleSystem3D:getRender() end
--[[
	set emitter for particle system, can set your own particle emitter
]]
function cc.ParticleSystem3D:setEmitter(Particle3DEmitter_emitter) end
--[[
	@return bool
]]
function cc.ParticleSystem3D:isKeepLocal() end
--[[
	get particle quota
	@return int
]]
function cc.ParticleSystem3D:getParticleQuota() end
--[[
	pause particle
]]
function cc.ParticleSystem3D:pauseParticleSystem() end
--[[
	get particle playing state
	@return [luaIde#State]
]]
function cc.ParticleSystem3D:getState() end
--[[
	get alive particles count
	@return int
]]
function cc.ParticleSystem3D:getAliveParticleCount() end
--[[
	set particle quota
]]
function cc.ParticleSystem3D:setParticleQuota(unsigned_int_quota) end
--[[
	override function
]]
function cc.ParticleSystem3D:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	set particle render, can set your own particle render
]]
function cc.ParticleSystem3D:setRender(Particle3DRender_render) end
--[[
	stop particle
]]
function cc.ParticleSystem3D:stopParticleSystem() end
function cc.ParticleSystem3D:setKeepLocal(bool_keepLocal) end

--[[
	@SuperType[luaIde#cc.ParticleSystem3D]
	/Users/k0204/Downloads/cocos2d-x-3.16/extensions/Particle3D/PU/CCPUParticleSystem3D.h
]]
cc.PUParticleSystem3D = {}
--[[
	@return bool
]]
function cc.PUParticleSystem3D:initWithFilePath(const_std_string_filePath) end
--[[
	Returns the velocity scale, defined in the particle system, but passed to the technique for convenience.
	@return float
]]
function cc.PUParticleSystem3D:getParticleSystemScaleVelocity() end
function cc.PUParticleSystem3D:setEmittedSystemQuota(unsigned_int_quota) end
--[[
	default particle depth
	@return float
]]
function cc.PUParticleSystem3D:getDefaultDepth() end
--[[
	@return int
]]
function cc.PUParticleSystem3D:getEmittedSystemQuota() end
function cc.PUParticleSystem3D:clearAllParticles() end
--[[
	@return std_string
]]
function cc.PUParticleSystem3D:getMaterialName() end
function cc.PUParticleSystem3D:calulateRotationOffset() end
--[[
	Return the maximum velocity a particle can have, even if the velocity of the particle has been set higher (either by initialisation of the particle or by means of an affector).
	@return float
]]
function cc.PUParticleSystem3D:getMaxVelocity() end
function cc.PUParticleSystem3D:forceUpdate(float_delta) end
--[[
	@return float
]]
function cc.PUParticleSystem3D:getTimeElapsedSinceStart() end
function cc.PUParticleSystem3D:removeAllBehaviourTemplate() end
--[[
	@return int
]]
function cc.PUParticleSystem3D:getEmittedEmitterQuota() end
--[[
	Forces emission of particles.
	@remarks The number of requested particles are the exact number that are emitted. No down-scaling is applied.
]]
function cc.PUParticleSystem3D:forceEmission(PUEmitter_emitter,unsigned_requested) end
function cc.PUParticleSystem3D:addListener(PUListener_listener) end
--[[
	@return bool
]]
function cc.PUParticleSystem3D:isMarkedForEmission() end
--[[
	default particle width
	@return float
]]
function cc.PUParticleSystem3D:getDefaultWidth() end
function cc.PUParticleSystem3D:setEmittedEmitterQuota(unsigned_int_quota) end
function cc.PUParticleSystem3D:setMarkedForEmission(bool_isMarked) end
--[[
	@return [luaIde#cc.PUParticleSystem3D]
]]
function cc.PUParticleSystem3D:clone() end
--[[
	add particle affector
]]
function cc.PUParticleSystem3D:addEmitter(PUEmitter_emitter) end
function cc.PUParticleSystem3D:addBehaviourTemplate(PUBehaviour_behaviour) end
function cc.PUParticleSystem3D:setDefaultWidth(const_float_width) end
function cc.PUParticleSystem3D:copyAttributesTo(PUParticleSystem3D_system) end
function cc.PUParticleSystem3D:setMaterialName(const_std_string_name) end
--[[
	@return [luaIde#cc.PUParticleSystem3D]
]]
function cc.PUParticleSystem3D:getParentParticleSystem() end
function cc.PUParticleSystem3D:removeListener(PUListener_listener) end
--[[
	Set the maximum velocity a particle can have.
]]
function cc.PUParticleSystem3D:setMaxVelocity(float_maxVelocity) end
--[[
	default particle height
	@return float
]]
function cc.PUParticleSystem3D:getDefaultHeight() end
--[[
	@return [luaIde#cc.Vec3]
]]
function cc.PUParticleSystem3D:getDerivedPosition() end
--[[
	If the orientation of the particle system has been changed since the last update, the passed vector is rotated accordingly.
]]
function cc.PUParticleSystem3D:rotationOffset(Vec3_pos) end
function cc.PUParticleSystem3D:removeAllEmitter() end
function cc.PUParticleSystem3D:setParticleSystemScaleVelocity(float_scaleVelocity) end
--[[
	@return [luaIde#cc.Vec3]
]]
function cc.PUParticleSystem3D:getDerivedScale() end
function cc.PUParticleSystem3D:setDefaultHeight(const_float_height) end
function cc.PUParticleSystem3D:removeAllListener() end
--[[
	@return bool
]]
function cc.PUParticleSystem3D:initSystem(const_std_string_filePath) end
--[[
	@return bool
]]
function cc.PUParticleSystem3D:makeParticleLocal(PUParticle3D_particle) end
function cc.PUParticleSystem3D:removerAllObserver() end
function cc.PUParticleSystem3D:setDefaultDepth(const_float_depth) end
function cc.PUParticleSystem3D:addObserver(PUObserver_observer) end
--[[
	@return [luaIde#cc.PUParticleSystem3D]
]]
function cc.PUParticleSystem3D:create() end
--[[
	@return [luaIde#cc.PUParticleSystem3D]
]]
function cc.PUParticleSystem3D:create(const_std_string_filePath,const_std_string_materialPath) end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/navmesh/CCNavMeshAgent.h
]]
cc.NavMeshAgent = {}
--[[
	set maximal speed of agent
]]
function cc.NavMeshAgent:setMaxSpeed(float_maxSpeed) end
--[[
	synchronize parameter to node.
]]
function cc.NavMeshAgent:syncToNode() end
--[[
	Traverse OffMeshLink manuall
]]
function cc.NavMeshAgent:completeOffMeshLink() end
--[[
	get separation weight
	@return float
]]
function cc.NavMeshAgent:getSeparationWeight() end
--[[
	Set automatic Traverse OffMeshLink
]]
function cc.NavMeshAgent:setAutoTraverseOffMeshLink(bool_isAuto) end
--[[
	get current velocity
	@return [luaIde#cc.Vec3]
]]
function cc.NavMeshAgent:getCurrentVelocity() end
--[[
	synchronize parameter to agent.
]]
function cc.NavMeshAgent:syncToAgent() end
--[[
	Check agent arrived OffMeshLink
	@return bool
]]
function cc.NavMeshAgent:isOnOffMeshLink() end
--[[
	set separation weight
]]
function cc.NavMeshAgent:setSeparationWeight(float_weight) end
--[[
	pause movement
]]
function cc.NavMeshAgent:pause() end
function cc.NavMeshAgent:getUserData() end
--[[
	Set automatic Orientation
]]
function cc.NavMeshAgent:setAutoOrientation(bool_isAuto) end
--[[
	get agent height
	@return float
]]
function cc.NavMeshAgent:getHeight() end
--[[
	get maximal speed of agent
	@return float
]]
function cc.NavMeshAgent:getMaxSpeed() end
--[[
	Get current OffMeshLink informatio
	@return [luaIde#OffMeshLinkData]
]]
function cc.NavMeshAgent:getCurrentOffMeshLinkData() end
--[[
	get agent radius
	@return float
]]
function cc.NavMeshAgent:getRadius() end
--[[
	synchronization between node and agent is time consuming, you can skip some synchronization using this function
]]
function cc.NavMeshAgent:setSyncFlag(const_NavMeshAgentSyncFlag_flag) end
--[[
	@return [luaIde#NavMeshAgentSyncFlag]
]]
function cc.NavMeshAgent:getSyncFlag() end
--[[
	resume movement
]]
function cc.NavMeshAgent:resume() end
--[[
	stop movement
]]
function cc.NavMeshAgent:stop() end
--[[
	set maximal acceleration of agen
]]
function cc.NavMeshAgent:setMaxAcceleration(float_maxAcceleration) end
--[[
	Set the reference axes of agent's orientation
	@param rotRefAxes The value of reference axes in local coordinate system.
]]
function cc.NavMeshAgent:setOrientationRefAxes(const_Vec3_rotRefAxes) end
--[[
	get maximal acceleration of agen
	@return float
]]
function cc.NavMeshAgent:getMaxAcceleration() end
--[[
	set agent height
]]
function cc.NavMeshAgent:setHeight(float_height) end
function cc.NavMeshAgent:setUserData(void_data) end
--[[
	get obstacle avoidance type
	@return char
]]
function cc.NavMeshAgent:getObstacleAvoidanceType() end
--[[
	get current velocity
	@return [luaIde#cc.Vec3]
]]
function cc.NavMeshAgent:getVelocity() end
--[[
	set agent radius
]]
function cc.NavMeshAgent:setRadius(float_radius) end
--[[
	set obstacle avoidance type
]]
function cc.NavMeshAgent:setObstacleAvoidanceType(unsigned_char_type) end
--[[
	@return std_string
]]
function cc.NavMeshAgent:getNavMeshAgentComponentName() end
--[[
	Create agent
	@param param The parameters of agent.
	@return [luaIde#cc.NavMeshAgent]
]]
function cc.NavMeshAgent:create(const_NavMeshAgentParam_param) end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/navmesh/CCNavMeshObstacle.h
]]
cc.NavMeshObstacle = {}
--[[
	@return [luaIde#NavMeshObstacleSyncFlag]
]]
function cc.NavMeshObstacle:getSyncFlag() end
--[[
	@return bool
]]
function cc.NavMeshObstacle:initWith(float_radius,float_height) end
--[[
	synchronize parameter to obstacle.
]]
function cc.NavMeshObstacle:syncToObstacle() end
--[[
	synchronize parameter to node.
]]
function cc.NavMeshObstacle:syncToNode() end
--[[
	Get height of obstacle
	@return float
]]
function cc.NavMeshObstacle:getHeight() end
--[[
	synchronization between node and obstacle is time consuming, you can skip some synchronization using this function
]]
function cc.NavMeshObstacle:setSyncFlag(const_NavMeshObstacleSyncFlag_flag) end
--[[
	Get radius of obstacle
	@return float
]]
function cc.NavMeshObstacle:getRadius() end
--[[
	Create obstacle, shape is cylinder
	@param radius The radius of obstacle.
	@param height The height of obstacle.
	@return [luaIde#cc.NavMeshObstacle]
]]
function cc.NavMeshObstacle:create(float_radius,float_height) end
--[[
	@return std_string
]]
function cc.NavMeshObstacle:getNavMeshObstacleComponentName() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/navmesh/CCNavMesh.h
]]
cc.NavMesh = {}
--[[
	remove a obstacle from navmesh.
]]
function cc.NavMesh:removeNavMeshObstacle(NavMeshObstacle_obstacle) end
--[[
	remove a agent from navmesh.
]]
function cc.NavMesh:removeNavMeshAgent(NavMeshAgent_agent) end
--[[
	update navmesh.
]]
function cc.NavMesh:update(float_dt) end
--[[
	Check enabled debug draw.
	@return bool
]]
function cc.NavMesh:isDebugDrawEnabled() end
--[[
	add a agent to navmesh.
]]
function cc.NavMesh:addNavMeshAgent(NavMeshAgent_agent) end
--[[
	add a obstacle to navmesh.
]]
function cc.NavMesh:addNavMeshObstacle(NavMeshObstacle_obstacle) end
--[[
	Enable debug draw or disable.
]]
function cc.NavMesh:setDebugDrawEnable(bool_enable) end
--[[
	Internal method, the updater of debug drawing, need called each frame.
]]
function cc.NavMesh:debugDraw(Renderer_renderer) end
--[[
	Create navmesh
	@param navFilePath The NavMesh File path.
	@param geomFilePath The geometry File Path,include offmesh information,etc.
	@return [luaIde#cc.NavMesh]
]]
function cc.NavMesh:create(const_std_string_navFilePath,const_std_string_geomFilePath) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DShape.h
]]
cc.Physics3DShape = {}
--[[
	@return [luaIde#btCollisionShape]
]]
function cc.Physics3DShape:getbtShape() end
--[[
	@return bool
]]
function cc.Physics3DShape:initSphere(float_radius) end
--[[
	@return bool
]]
function cc.Physics3DShape:initBox(const_cocos2d_Vec3_ext) end
--[[
	@return bool
]]
function cc.Physics3DShape:initCapsule(float_radius,float_height) end
--[[
	@return bool
]]
function cc.Physics3DShape:initCylinder(float_radius,float_height) end
--[[
	get shape type
	@return [luaIde#ShapeType]
]]
function cc.Physics3DShape:getShapeType() end
--[[
	create box shape
	@param extent The extent of sphere.
	@return [luaIde#cc.Physics3DShape]
]]
function cc.Physics3DShape:createBox(const_cocos2d_Vec3_extent) end
--[[
	create cylinder shape
	@param radius The radius of cylinder.
	@param height The height.
	@return [luaIde#cc.Physics3DShape]
]]
function cc.Physics3DShape:createCylinder(float_radius,float_height) end
--[[
	create convex hull
	@param points The vertices of convex hull
	@param numPoints The number of vertices.
	@return [luaIde#cc.Physics3DShape]
]]
function cc.Physics3DShape:createConvexHull(const_cocos2d_Vec3_points,int_numPoints) end
--[[
	create capsule shape
	@param radius The radius of capsule.
	@param height The height (cylinder part).
	@return [luaIde#cc.Physics3DShape]
]]
function cc.Physics3DShape:createCapsule(float_radius,float_height) end
--[[
	create sphere shape
	@param radius The radius of sphere.
	@return [luaIde#cc.Physics3DShape]
]]
function cc.Physics3DShape:createSphere(float_radius) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DObject.h
]]
cc.Physics3DObject = {}
--[[
	Set the user data.
]]
function cc.Physics3DObject:setUserData(void_userData) end
--[[
	Get the user data.
]]
function cc.Physics3DObject:getUserData() end
--[[
	Get the Physics3DObject Type.
	@return [luaIde#PhysicsObjType]
]]
function cc.Physics3DObject:getObjType() end
--[[
	Internal method. Set the pointer of Physics3DWorld.
]]
function cc.Physics3DObject:setPhysicsWorld(Physics3DWorld_world) end
--[[
	Get the world matrix of Physics3DObject.
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DObject:getWorldTransform() end
--[[
	Get the pointer of Physics3DWorld.
	@return [luaIde#cc.Physics3DWorld]
]]
function cc.Physics3DObject:getPhysicsWorld() end
--[[
	Set the mask of Physics3DObject.
]]
function cc.Physics3DObject:setMask(unsigned_int_mask) end
--[[
	Get the collision callback function.
	@return [luaIde#CollisionCallbackFunc]
]]
function cc.Physics3DObject:getCollisionCallback() end
--[[
	Get the mask of Physics3DObject.
	@return int
]]
function cc.Physics3DObject:getMask() end
--[[
	Check has collision callback function.
	@return bool
]]
function cc.Physics3DObject:needCollisionCallback() end

--[[
	@SuperType[luaIde#cc.Physics3DObject]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DObject.h
]]
cc.Physics3DRigidBody = {}
--[[
	Set the acceleration.
]]
function cc.Physics3DRigidBody:setGravity(const_cocos2d_Vec3_acceleration) end
--[[
	Get friction.
	@return float
]]
function cc.Physics3DRigidBody:getFriction() end
--[[
	Set the angular factor.
]]
function cc.Physics3DRigidBody:setAngularFactor(const_cocos2d_Vec3_angFac) end
--[[
	Set the angular factor, use unified factor.
]]
function cc.Physics3DRigidBody:setAngularFactor(float_angFac) end
function cc.Physics3DRigidBody:addConstraint(Physics3DConstraint_constraint) end
--[[
	Get the pointer of btRigidBody.
	@return [luaIde#btRigidBody]
]]
function cc.Physics3DRigidBody:getRigidBody() end
--[[
	Get total force.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getTotalForce() end
--[[
	Get the total number of constraints.
	@return int
]]
function cc.Physics3DRigidBody:getConstraintCount() end
--[[
	Apply a central force.
	@param   force the value of the force
]]
function cc.Physics3DRigidBody:applyCentralForce(const_cocos2d_Vec3_force) end
--[[
	Set mass and inertia.
]]
function cc.Physics3DRigidBody:setMassProps(float_mass,const_cocos2d_Vec3_inertia) end
--[[
	Set friction.
]]
function cc.Physics3DRigidBody:setFriction(float_frict) end
--[[
	Set kinematic object.
]]
function cc.Physics3DRigidBody:setKinematic(bool_kinematic) end
--[[
	Set linear damping and angular damping.
]]
function cc.Physics3DRigidBody:setDamping(float_lin_damping,float_ang_damping) end
--[[
	Apply a impulse.
	@param   impulse the value of the impulse
	@param   rel_pos the position of the impulse
]]
function cc.Physics3DRigidBody:applyImpulse(const_cocos2d_Vec3_impulse,const_cocos2d_Vec3_rel_pos) end
--[[
	Check rigid body is kinematic object.
	@return bool
]]
function cc.Physics3DRigidBody:isKinematic() end
--[[
	Apply a torque.
	@param   torque the value of the torque
]]
function cc.Physics3DRigidBody:applyTorque(const_cocos2d_Vec3_torque) end
--[[
	Set motion threshold, don't do continuous collision detection if the motion (in one step) is less then ccdMotionThreshold
]]
function cc.Physics3DRigidBody:setCcdMotionThreshold(float_ccdMotionThreshold) end
--[[
	Set rolling friction.
]]
function cc.Physics3DRigidBody:setRollingFriction(float_frict) end
--[[
	Get motion threshold.
	@return float
]]
function cc.Physics3DRigidBody:getCcdMotionThreshold() end
--[[
	Get the linear factor.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getLinearFactor() end
--[[
	Damps the velocity, using the given linearDamping and angularDamping.
]]
function cc.Physics3DRigidBody:applyDamping(float_timeStep) end
--[[
	Get the angular velocity.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getAngularVelocity() end
--[[
	@return bool
]]
function cc.Physics3DRigidBody:init(Physics3DRigidBodyDes_info) end
--[[
	Apply a torque impulse.
	@param   torque the value of the torque
]]
function cc.Physics3DRigidBody:applyTorqueImpulse(const_cocos2d_Vec3_torque) end
--[[
	Active or inactive.
]]
function cc.Physics3DRigidBody:setActive(bool_active) end
--[[
	Set the linear factor.
]]
function cc.Physics3DRigidBody:setLinearFactor(const_cocos2d_Vec3_linearFactor) end
--[[
	Set the linear velocity.
]]
function cc.Physics3DRigidBody:setLinearVelocity(const_cocos2d_Vec3_lin_vel) end
--[[
	Get the linear velocity.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getLinearVelocity() end
--[[
	Set swept sphere radius.
]]
function cc.Physics3DRigidBody:setCcdSweptSphereRadius(float_radius) end
--[[
	Apply a force.
	@param   force the value of the force
	@param   rel_pos the position of the force
]]
function cc.Physics3DRigidBody:applyForce(const_cocos2d_Vec3_force,const_cocos2d_Vec3_rel_pos) end
--[[
	Set the angular velocity.
]]
function cc.Physics3DRigidBody:setAngularVelocity(const_cocos2d_Vec3_ang_vel) end
--[[
	Apply a central impulse.
	@param   impulse the value of the impulse
]]
function cc.Physics3DRigidBody:applyCentralImpulse(const_cocos2d_Vec3_impulse) end
--[[
	Get the acceleration.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getGravity() end
--[[
	Get rolling friction.
	@return float
]]
function cc.Physics3DRigidBody:getRollingFriction() end
--[[
	Set the center of mass.
]]
function cc.Physics3DRigidBody:setCenterOfMassTransform(const_cocos2d_Mat4_xform) end
--[[
	Set the inverse of local inertia.
]]
function cc.Physics3DRigidBody:setInvInertiaDiagLocal(const_cocos2d_Vec3_diagInvInertia) end
function cc.Physics3DRigidBody:removeConstraint(Physics3DConstraint_constraint) end
--[[
	Get total torque.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getTotalTorque() end
--[[
	Get inverse of mass.
	@return float
]]
function cc.Physics3DRigidBody:getInvMass() end
--[[
	Get constraint by index.
	@return [luaIde#cc.Physics3DConstraint]
]]
function cc.Physics3DRigidBody:getConstraint(unsigned_int_idx) end
--[[
	Get restitution.
	@return float
]]
function cc.Physics3DRigidBody:getRestitution() end
--[[
	Get swept sphere radius.
	@return float
]]
function cc.Physics3DRigidBody:getCcdSweptSphereRadius() end
--[[
	Get hit friction.
	@return float
]]
function cc.Physics3DRigidBody:getHitFraction() end
--[[
	Get angular damping.
	@return float
]]
function cc.Physics3DRigidBody:getAngularDamping() end
--[[
	Get the inverse of local inertia.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getInvInertiaDiagLocal() end
--[[
	Get the center of mass.
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DRigidBody:getCenterOfMassTransform() end
--[[
	Get the angular factor.
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DRigidBody:getAngularFactor() end
--[[
	Set restitution.
]]
function cc.Physics3DRigidBody:setRestitution(float_rest) end
--[[
	Set hit friction.
]]
function cc.Physics3DRigidBody:setHitFraction(float_hitFraction) end
--[[
	Get linear damping.
	@return float
]]
function cc.Physics3DRigidBody:getLinearDamping() end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DComponent.h
]]
cc.Physics3DComponent = {}
--[[
	synchronize node transformation to physics
]]
function cc.Physics3DComponent:syncNodeToPhysics() end
--[[
	add this component to physics world, called by scene
]]
function cc.Physics3DComponent:addToPhysicsWorld(Physics3DWorld_world) end
--[[
	synchronize physics transformation to node
]]
function cc.Physics3DComponent:syncPhysicsToNode() end
--[[
	get physics object
	@return [luaIde#cc.Physics3DObject]
]]
function cc.Physics3DComponent:getPhysics3DObject() end
--[[
	set Physics object to the component
]]
function cc.Physics3DComponent:setPhysics3DObject(Physics3DObject_physicsObj) end
--[[
	synchronization between node and physics is time consuming, you can skip some synchronization using this function
]]
function cc.Physics3DComponent:setSyncFlag(PhysicsSyncFlag_syncFlag) end
--[[
	get the component name, it is used to find whether it is Physics3DComponent
	@return std_string
]]
function cc.Physics3DComponent:getPhysics3DComponentName() end

--[[
	@SuperType[luaIde#cc.Sprite3D]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysicsSprite3D.h
]]
cc.PhysicsSprite3D = {}
--[[
	synchronize node transformation to physics.
]]
function cc.PhysicsSprite3D:syncNodeToPhysics() end
--[[
	synchronize physics transformation to node.
]]
function cc.PhysicsSprite3D:syncPhysicsToNode() end
--[[
	Get the Physics3DObject.
	@return [luaIde#cc.Physics3DObject]
]]
function cc.PhysicsSprite3D:getPhysicsObj() end
--[[
	Set synchronization flag, see Physics3DComponent.
]]
function cc.PhysicsSprite3D:setSyncFlag(Physics3DComponent_PhysicsSyncFlag_syncFlag) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DWorld.h
]]
cc.Physics3DWorld = {}
--[[
	set gravity for the physics world
]]
function cc.Physics3DWorld:setGravity(const_Vec3_gravity) end
--[[
	Simulate one frame.
]]
function cc.Physics3DWorld:stepSimulate(float_dt) end
--[[
	@return bool
]]
function cc.Physics3DWorld:needCollisionChecking() end
function cc.Physics3DWorld:collisionChecking() end
function cc.Physics3DWorld:setGhostPairCallback() end
--[[
	Remove all Physics3DObjects.
]]
function cc.Physics3DWorld:removeAllPhysics3DObjects() end
--[[
	Check debug drawing is enabled.
	@return bool
]]
function cc.Physics3DWorld:isDebugDrawEnabled() end
--[[
	Remove all Physics3DConstraint.
]]
function cc.Physics3DWorld:removeAllPhysics3DConstraints() end
--[[
	get current gravity
	@return [luaIde#cc.Vec3]
]]
function cc.Physics3DWorld:getGravity() end
--[[
	Remove a Physics3DConstraint.
]]
function cc.Physics3DWorld:removePhysics3DConstraint(Physics3DConstraint_constraint) end
--[[
	Add a Physics3DObject.
]]
function cc.Physics3DWorld:addPhysics3DObject(Physics3DObject_physicsObj) end
--[[
	Enable or disable debug drawing.
]]
function cc.Physics3DWorld:setDebugDrawEnable(bool_enableDebugDraw) end
--[[
	Remove a Physics3DObject.
]]
function cc.Physics3DWorld:removePhysics3DObject(Physics3DObject_physicsObj) end
--[[
	Add a Physics3DConstraint.
]]
function cc.Physics3DWorld:addPhysics3DConstraint(Physics3DConstraint_constraint,bool_disableCollisionsBetweenLinkedObjs) end
--[[
	Internal method, the updater of debug drawing, need called each frame.
]]
function cc.Physics3DWorld:debugDraw(cocos2d_Renderer_renderer) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DConstraint.h
]]
cc.Physics3DConstraint = {}
--[[
	set enable or not
]]
function cc.Physics3DConstraint:setEnabled(bool_enabled) end
--[[
	set the impulse that break the constraint
]]
function cc.Physics3DConstraint:setBreakingImpulse(float_impulse) end
--[[
	get user data
]]
function cc.Physics3DConstraint:getUserData() end
--[[
	get the impulse that break the constraint
	@return float
]]
function cc.Physics3DConstraint:getBreakingImpulse() end
--[[
	get rigid body a
	@return [luaIde#cc.Physics3DRigidBody]
]]
function cc.Physics3DConstraint:getBodyA() end
--[[
	is it enabled
	@return bool
]]
function cc.Physics3DConstraint:isEnabled() end
--[[
	get override number of solver iterations
	@return int
]]
function cc.Physics3DConstraint:getOverrideNumSolverIterations() end
--[[
	get rigid body b
	@return [luaIde#cc.Physics3DRigidBody]
]]
function cc.Physics3DConstraint:getBodyB() end
--[[
	override the number of constraint solver iterations used to solve this constraint, -1 will use the default number of iterations, as specified in SolverInfo.m_numIterations
]]
function cc.Physics3DConstraint:setOverrideNumSolverIterations(int_overrideNumIterations) end
--[[
	get constraint type
	@return [luaIde#ConstraintType]
]]
function cc.Physics3DConstraint:getConstraintType() end
--[[
	get user data
]]
function cc.Physics3DConstraint:setUserData(void_userData) end
--[[
	@return [luaIde#btTypedConstraint]
]]
function cc.Physics3DConstraint:getbtContraint() end

--[[
	@SuperType[luaIde#cc.Physics3DConstraint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DConstraint.h
]]
cc.Physics3DPointToPointConstraint = {}
--[[
	get pivot point in A's local space
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DPointToPointConstraint:getPivotPointInA() end
--[[
	get pivot point in B's local space
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DPointToPointConstraint:getPivotPointInB() end
--[[
	@return bool
]]
function cc.Physics3DPointToPointConstraint:init(Physics3DRigidBody_rbA,const_cocos2d_Vec3_pivotPointInA) end
--[[
	set pivot point in A's local space
]]
function cc.Physics3DPointToPointConstraint:setPivotPointInA(const_cocos2d_Vec3_pivotA) end
--[[
	set pivot point in B's local space
]]
function cc.Physics3DPointToPointConstraint:setPivotPointInB(const_cocos2d_Vec3_pivotB) end
--[[
	create point to point constraint, limits the translation of local pivot point of rigid body A
	@param rbA The rigid body going to be fixed
	@param pivotPointInA local pivot point in A's local space
	@return [luaIde#cc.Physics3DPointToPointConstraint]   created constraint
]]
function cc.Physics3DPointToPointConstraint:create(Physics3DRigidBody_rbA,const_cocos2d_Vec3_pivotPointInA) end
--[[
	create point to point constraint, make the local pivot points of 2 rigid bodies match in worldspace.
	@param rbA The rigid body A going to be fixed
	@param rbB The rigid body B going to be fixed
	@param pivotPointInA local pivot point in A's local space
	@param pivotPointInB local pivot point in B's local space
	@return [luaIde#cc.Physics3DPointToPointConstraint]   created constraint
]]
function cc.Physics3DPointToPointConstraint:create(Physics3DRigidBody_rbA,Physics3DRigidBody_rbB,const_cocos2d_Vec3_pivotPointInA,const_cocos2d_Vec3_pivotPointInB) end

--[[
	@SuperType[luaIde#cc.Physics3DConstraint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DConstraint.h
]]
cc.Physics3DHingeConstraint = {}
--[[
	get hinge angl
	@return float
]]
function cc.Physics3DHingeConstraint:getHingeAngle() end
--[[
	get hinge angl
	@return float
]]
function cc.Physics3DHingeConstraint:getHingeAngle(const_cocos2d_Mat4_transA,const_cocos2d_Mat4_transB) end
--[[
	get motor target velocit
	@return float
]]
function cc.Physics3DHingeConstraint:getMotorTargetVelosity() end
--[[
	get rigid body A's frame offset
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DHingeConstraint:getFrameOffsetA() end
--[[
	get rigid body B's frame offset
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DHingeConstraint:getFrameOffsetB() end
--[[
	set max motor impulse
]]
function cc.Physics3DHingeConstraint:setMaxMotorImpulse(float_maxMotorImpulse) end
--[[
	enable angular motor
]]
function cc.Physics3DHingeConstraint:enableAngularMotor(bool_enableMotor,float_targetVelocity,float_maxMotorImpulse) end
--[[
	get upper limi
	@return float
]]
function cc.Physics3DHingeConstraint:getUpperLimit() end
--[[
	get max motor impuls
	@return float
]]
function cc.Physics3DHingeConstraint:getMaxMotorImpulse() end
--[[
	get lower limi
	@return float
]]
function cc.Physics3DHingeConstraint:getLowerLimit() end
--[[
	set use frame offse
]]
function cc.Physics3DHingeConstraint:setUseFrameOffset(bool_frameOffsetOnOff) end
--[[
	get enable angular moto
	@return bool
]]
function cc.Physics3DHingeConstraint:getEnableAngularMotor() end
--[[
	maintain a given angular target.
]]
function cc.Physics3DHingeConstraint:enableMotor(bool_enableMotor) end
--[[
	get B's fram
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DHingeConstraint:getBFrame() end
--[[
	set frames for rigid body A and B
]]
function cc.Physics3DHingeConstraint:setFrames(const_cocos2d_Mat4_frameA,const_cocos2d_Mat4_frameB) end
--[[
	access for UseFrameOffse
	@return bool
]]
function cc.Physics3DHingeConstraint:getUseFrameOffset() end
--[[
	set angular only
]]
function cc.Physics3DHingeConstraint:setAngularOnly(bool_angularOnly) end
--[[
	set limit
]]
function cc.Physics3DHingeConstraint:setLimit(float_low,float_high,float__softness,float__biasFactor,float__relaxationFactor) end
--[[
	get angular onl
	@return bool
]]
function cc.Physics3DHingeConstraint:getAngularOnly() end
--[[
	set axi
]]
function cc.Physics3DHingeConstraint:setAxis(const_cocos2d_Vec3_axisInA) end
--[[
	get A's frame
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DHingeConstraint:getAFrame() end
--[[
	create hinge constraint
	@param rbA rigid body A
	@param rbAFrame rigid body A's frame
	@param useReferenceFrameA use frame A as reference
	@return [luaIde#cc.Physics3DHingeConstraint]
]]
function cc.Physics3DHingeConstraint:create(Physics3DRigidBody_rbA,const_cocos2d_Mat4_rbAFrame,bool_useReferenceFrameA) end
--[[
	create hinge constraint
	@param rbA rigid body A
	@param pivotInA pivot in rigid body A's local space
	@param axisInA axis in rigid body A's local space
	@param useReferenceFrameA use frame A as reference
	@return [luaIde#cc.Physics3DHingeConstraint]
]]
function cc.Physics3DHingeConstraint:create(Physics3DRigidBody_rbA,const_cocos2d_Vec3_pivotInA,const_cocos2d_Vec3_axisInA,bool_useReferenceFrameA) end
--[[
	create hinge constraint
	@param rbA rigid body A
	@param rbB rigid body B
	@param pivotInA pivot point in A's local space
	@param pivotInB pivot point in B's local space
	@param axisInA axis in A's local space
	@param axisInB axis in B's local space
	@param useReferenceFrameA use frame A as reference
	@return [luaIde#cc.Physics3DHingeConstraint]
]]
function cc.Physics3DHingeConstraint:create(Physics3DRigidBody_rbA,Physics3DRigidBody_rbB,const_cocos2d_Vec3_pivotInA,const_cocos2d_Vec3_pivotInB,cocos2d_Vec3_axisInA,cocos2d_Vec3_axisInB,bool_useReferenceFrameA) end
--[[
	create hinge constraint
	@param rbA rigid body A
	@param rbB rigid body B
	@param rbAFrame rigid body A's frame
	@param rbBFrame rigid body B's frame
	@param useReferenceFrameA use frame A as reference
	@return [luaIde#cc.Physics3DHingeConstraint]
]]
function cc.Physics3DHingeConstraint:create(Physics3DRigidBody_rbA,Physics3DRigidBody_rbB,const_cocos2d_Mat4_rbAFrame,const_cocos2d_Mat4_rbBFrame,bool_useReferenceFrameA) end

--[[
	@SuperType[luaIde#cc.Physics3DConstraint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DConstraint.h
]]
cc.Physics3DSliderConstraint = {}
function cc.Physics3DSliderConstraint:setPoweredAngMotor(bool_onOff) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getDampingLimAng() end
function cc.Physics3DSliderConstraint:setRestitutionOrthoLin(float_restitutionOrthoLin) end
function cc.Physics3DSliderConstraint:setRestitutionDirLin(float_restitutionDirLin) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getLinearPos() end
--[[
	get A's frame offse
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DSliderConstraint:getFrameOffsetA() end
--[[
	get B's frame offse
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DSliderConstraint:getFrameOffsetB() end
function cc.Physics3DSliderConstraint:setPoweredLinMotor(bool_onOff) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getDampingDirAng() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getRestitutionLimLin() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getSoftnessOrthoAng() end
function cc.Physics3DSliderConstraint:setSoftnessOrthoLin(float_softnessOrthoLin) end
function cc.Physics3DSliderConstraint:setSoftnessLimLin(float_softnessLimLin) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getAngularPos() end
function cc.Physics3DSliderConstraint:setRestitutionLimAng(float_restitutionLimAng) end
--[[
	set upper linear limi
]]
function cc.Physics3DSliderConstraint:setUpperLinLimit(float_upperLimit) end
function cc.Physics3DSliderConstraint:setDampingDirLin(float_dampingDirLin) end
--[[
	get upper angular limi
	@return float
]]
function cc.Physics3DSliderConstraint:getUpperAngLimit() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getDampingDirLin() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getSoftnessDirAng() end
--[[
	@return bool
]]
function cc.Physics3DSliderConstraint:getPoweredAngMotor() end
--[[
	set lower angular limi
]]
function cc.Physics3DSliderConstraint:setLowerAngLimit(float_lowerLimit) end
--[[
	set upper angular limi
]]
function cc.Physics3DSliderConstraint:setUpperAngLimit(float_upperLimit) end
function cc.Physics3DSliderConstraint:setTargetLinMotorVelocity(float_targetLinMotorVelocity) end
function cc.Physics3DSliderConstraint:setDampingLimAng(float_dampingLimAng) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getRestitutionLimAng() end
--[[
	access for UseFrameOffse
	@return bool
]]
function cc.Physics3DSliderConstraint:getUseFrameOffset() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getSoftnessOrthoLin() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getDampingOrthoAng() end
--[[
	set use frame offse
]]
function cc.Physics3DSliderConstraint:setUseFrameOffset(bool_frameOffsetOnOff) end
--[[
	set lower linear limi
]]
function cc.Physics3DSliderConstraint:setLowerLinLimit(float_lowerLimit) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getRestitutionDirLin() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getTargetLinMotorVelocity() end
--[[
	get lower linear limi
	@return float
]]
function cc.Physics3DSliderConstraint:getLowerLinLimit() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getSoftnessLimLin() end
function cc.Physics3DSliderConstraint:setDampingOrthoAng(float_dampingOrthoAng) end
function cc.Physics3DSliderConstraint:setSoftnessDirAng(float_softnessDirAng) end
--[[
	@return bool
]]
function cc.Physics3DSliderConstraint:getPoweredLinMotor() end
function cc.Physics3DSliderConstraint:setRestitutionOrthoAng(float_restitutionOrthoAng) end
function cc.Physics3DSliderConstraint:setDampingDirAng(float_dampingDirAng) end
--[[
	set frames for rigid body A and
]]
function cc.Physics3DSliderConstraint:setFrames(const_cocos2d_Mat4_frameA,const_cocos2d_Mat4_frameB) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getRestitutionOrthoAng() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getMaxAngMotorForce() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getDampingOrthoLin() end
--[[
	get upper linear limi
	@return float
]]
function cc.Physics3DSliderConstraint:getUpperLinLimit() end
function cc.Physics3DSliderConstraint:setMaxLinMotorForce(float_maxLinMotorForce) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getRestitutionOrthoLin() end
function cc.Physics3DSliderConstraint:setTargetAngMotorVelocity(float_targetAngMotorVelocity) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getSoftnessLimAng() end
function cc.Physics3DSliderConstraint:setRestitutionDirAng(float_restitutionDirAng) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getDampingLimLin() end
--[[
	get lower angular limi
	@return float
]]
function cc.Physics3DSliderConstraint:getLowerAngLimit() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getRestitutionDirAng() end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getTargetAngMotorVelocity() end
function cc.Physics3DSliderConstraint:setRestitutionLimLin(float_restitutionLimLin) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getMaxLinMotorForce() end
function cc.Physics3DSliderConstraint:setDampingOrthoLin(float_dampingOrthoLin) end
function cc.Physics3DSliderConstraint:setSoftnessOrthoAng(float_softnessOrthoAng) end
function cc.Physics3DSliderConstraint:setDampingLimLin(float_dampingLimLin) end
function cc.Physics3DSliderConstraint:setSoftnessDirLin(float_softnessDirLin) end
function cc.Physics3DSliderConstraint:setMaxAngMotorForce(float_maxAngMotorForce) end
--[[
	@return float
]]
function cc.Physics3DSliderConstraint:getSoftnessDirLin() end
function cc.Physics3DSliderConstraint:setSoftnessLimAng(float_softnessLimAng) end
--[[
	use A's frame as linear referenc
	@return bool
]]
function cc.Physics3DSliderConstraint:getUseLinearReferenceFrameA() end
--[[
	create slider constraint
	@param rbA rigid body A
	@param rbB rigid body B
	@param frameInA frame in A's local space
	@param frameInB frame in B's local space
	@param useLinearReferenceFrameA use fixed frame A for linear limits
	@return [luaIde#cc.Physics3DSliderConstraint]
]]
function cc.Physics3DSliderConstraint:create(Physics3DRigidBody_rbA,Physics3DRigidBody_rbB,const_cocos2d_Mat4_frameInA,const_cocos2d_Mat4_frameInB,bool_useLinearReferenceFrameA) end

--[[
	@SuperType[luaIde#cc.Physics3DConstraint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DConstraint.h
]]
cc.Physics3DConeTwistConstraint = {}
--[[
	get B's fram
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DConeTwistConstraint:getBFrame() end
--[[
	set fix thres
]]
function cc.Physics3DConeTwistConstraint:setFixThresh(float_fixThresh) end
--[[
	get B's frame offse
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DConeTwistConstraint:getFrameOffsetB() end
--[[
	get A's frame offse
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DConeTwistConstraint:getFrameOffsetA() end
--[[
	get fix thres
	@return float
]]
function cc.Physics3DConeTwistConstraint:getFixThresh() end
--[[
	get swing span
	@return float
]]
function cc.Physics3DConeTwistConstraint:getSwingSpan2() end
--[[
	get swing span
	@return float
]]
function cc.Physics3DConeTwistConstraint:getSwingSpan1() end
--[[
	set max motor impuls
]]
function cc.Physics3DConeTwistConstraint:setMaxMotorImpulse(float_maxMotorImpulse) end
--[[
	set A and B's fram
]]
function cc.Physics3DConeTwistConstraint:setFrames(const_cocos2d_Mat4_frameA,const_cocos2d_Mat4_frameB) end
--[[
	get twist angl
	@return float
]]
function cc.Physics3DConeTwistConstraint:getTwistAngle() end
--[[
	get point for angl
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3DConeTwistConstraint:GetPointForAngle(float_fAngleInRadians,float_fLength) end
--[[
	set max motor impulse normaliz
]]
function cc.Physics3DConeTwistConstraint:setMaxMotorImpulseNormalized(float_maxMotorImpulse) end
--[[
	get twist spa
	@return float
]]
function cc.Physics3DConeTwistConstraint:getTwistSpan() end
--[[
	set dampin
]]
function cc.Physics3DConeTwistConstraint:setDamping(float_damping) end
--[[
	set limits
	@param swingSpan1 swing span1
	@param swingSpan2 swing span2
	@param twistSpan twist span
	@param softness 0->1, recommend ~0.8->1. Describes % of limits where movement is free. Beyond this softness %, the limit is gradually enforced until the "hard" (1.0) limit is reached.
	@param biasFactor 0->1?, recommend 0.3 +/-0.3 or so. Strength with which constraint resists zeroth order (angular, not angular velocity) limit violation.
	@param relaxationFactor 0->1, recommend to stay near 1. the lower the value, the less the constraint will fight velocities which violate the angular limits.
]]
function cc.Physics3DConeTwistConstraint:setLimit(float_swingSpan1,float_swingSpan2,float_twistSpan,float_softness,float_biasFactor,float_relaxationFactor) end
--[[
	get A's fram
	@return [luaIde#cocos2d_Mat4]
]]
function cc.Physics3DConeTwistConstraint:getAFrame() end
--[[
	enable moto
]]
function cc.Physics3DConeTwistConstraint:enableMotor(bool_b) end
--[[
	create cone twist constraint
	rbA rigid body A
	frameA A's local frame
	@return [luaIde#cc.Physics3DConeTwistConstraint]
]]
function cc.Physics3DConeTwistConstraint:create(Physics3DRigidBody_rbA,const_cocos2d_Mat4_frameA) end
--[[
	create cone twist constraint
	rbA rigid body A
	rbB rigid body B
	frameA rigid body A's local frame
	frameB rigid body B's local frame
	@return [luaIde#cc.Physics3DConeTwistConstraint]
]]
function cc.Physics3DConeTwistConstraint:create(Physics3DRigidBody_rbA,Physics3DRigidBody_rbB,const_cocos2d_Mat4_frameA,const_cocos2d_Mat4_frameB) end

--[[
	@SuperType[luaIde#cc.Physics3DConstraint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics3d/CCPhysics3DConstraint.h
]]
cc.Physics3D6DofConstraint = {}
--[[
	set linear lower limi
]]
function cc.Physics3D6DofConstraint:setLinearLowerLimit(const_cocos2d_Vec3_linearLower) end
--[[
	get linear lower limi
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3D6DofConstraint:getLinearLowerLimit() end
--[[
	get angular upper limi
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3D6DofConstraint:getAngularUpperLimit() end
--[[
	access for UseFrameOffse
	@return bool
]]
function cc.Physics3D6DofConstraint:getUseFrameOffset() end
--[[
	get linear upper limi
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3D6DofConstraint:getLinearUpperLimit() end
--[[
	set angular lower limi
]]
function cc.Physics3D6DofConstraint:setAngularLowerLimit(const_cocos2d_Vec3_angularLower) end
--[[
	is limited?
	@param limitIndex first 3 are linear, next 3 are angular
	@return bool
]]
function cc.Physics3D6DofConstraint:isLimited(int_limitIndex) end
--[[
	set use frame offse
]]
function cc.Physics3D6DofConstraint:setUseFrameOffset(bool_frameOffsetOnOff) end
--[[
	set linear upper limi
]]
function cc.Physics3D6DofConstraint:setLinearUpperLimit(const_cocos2d_Vec3_linearUpper) end
--[[
	get angular lower limi
	@return [luaIde#cocos2d_Vec3]
]]
function cc.Physics3D6DofConstraint:getAngularLowerLimit() end
--[[
	set angular upper limi
]]
function cc.Physics3D6DofConstraint:setAngularUpperLimit(const_cocos2d_Vec3_angularUpper) end
--[[
	create 6 dof constraint
	@param rbA rigid body A
	@param rbB rigid body B
	@param frameInA frame in A's local space
	@param frameInB frame in B's local space
	@param useLinearReferenceFrameA use fixed frame A for linear limits
	@return [luaIde#cc.Physics3D6DofConstraint]
]]
function cc.Physics3D6DofConstraint:create(Physics3DRigidBody_rbA,Physics3DRigidBody_rbB,const_cocos2d_Mat4_frameInA,const_cocos2d_Mat4_frameInB,bool_useLinearReferenceFrameA) end
--[[
	create 6 dof constraint
	@param rbB rigid body B
	@param frameInB frame in B's local space
	@param useLinearReferenceFrameB use fixed frame B for linear limits
	@return [luaIde#cc.Physics3D6DofConstraint]
]]
function cc.Physics3D6DofConstraint:create(Physics3DRigidBody_rbB,const_cocos2d_Mat4_frameInB,bool_useLinearReferenceFrameB) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShape = {}
--[[
	Get this shape's friction.
	@return float   A float number.
]]
function cc.PhysicsShape:getFriction() end
--[[
	Set the group of body.
	Collision groups let you specify an integral group index. You can have all fixtures with the same group index always collide (positive index) or never collide (negative index).
	@param group An integer number, it have high priority than bit masks.
]]
function cc.PhysicsShape:setGroup(int_group) end
--[[
	Set this shape's density.
	It will change the body's mass this shape attaches.
	@param density A float number.
]]
function cc.PhysicsShape:setDensity(float_density) end
--[[
	Get the mass of this shape.
	@return float   A float number.
]]
function cc.PhysicsShape:getMass() end
--[[
	Get this shape's PhysicsMaterial object.
	@return [luaIde#cc.PhysicsMaterial]   A PhysicsMaterial object reference.
]]
function cc.PhysicsShape:getMaterial() end
function cc.PhysicsShape:setSensor(bool_sensor) end
--[[
	Get a mask that defines which categories of physics bodies can collide with this physics body.
	@return int   An integer number.
]]
function cc.PhysicsShape:getCollisionBitmask() end
--[[
	Return this shape's area.
	@return float   A float number.
]]
function cc.PhysicsShape:getArea() end
--[[
	Set a mask that defines which categories this physics body belongs to.
	Every physics body in a scene can be assigned to up to 32 different categories, each corresponding to a bit in the bit mask. You define the mask values used in your game. In conjunction with the collisionBitMask and contactTestBitMask properties, you define which physics bodies interact with each other and when your game is notified of these interactions.
	@param bitmask An integer number, the default value is 0xFFFFFFFF (all bits set).
]]
function cc.PhysicsShape:setCategoryBitmask(int_bitmask) end
--[[
	Get the group of body.
	@return int   An integer number.
]]
function cc.PhysicsShape:getGroup() end
--[[
	Set this shape's moment.
	It will change the body's moment this shape attaches.
	@param moment A float number.
]]
function cc.PhysicsShape:setMoment(float_moment) end
--[[
	Test point is inside this shape or not.
	@param point A Vec2 object.
	@return bool   A bool object.
]]
function cc.PhysicsShape:containsPoint(const_Vec2_point) end
--[[
	Get a mask that defines which categories this physics body belongs to.
	@return int   An integer number.
]]
function cc.PhysicsShape:getCategoryBitmask() end
--[[
	@return bool
]]
function cc.PhysicsShape:isSensor() end
--[[
	Return this shape's type.
	@return [luaIde#Type]   A Type object.
]]
function cc.PhysicsShape:getType() end
--[[
	Get a mask that defines which categories of bodies cause intersection notifications with this physics body.
	@return int   An integer number.
]]
function cc.PhysicsShape:getContactTestBitmask() end
--[[
	Get this shape's center position.
	This function should be overridden in inherit classes.
	@return [luaIde#cc.Vec2]   A Vec2 object.
]]
function cc.PhysicsShape:getCenter() end
--[[
	Get this shape's density.
	@return float   A float number.
]]
function cc.PhysicsShape:getDensity() end
--[[
	Set this shape's mass.
	It will change the body's mass this shape attaches.
	@param mass A float number.
]]
function cc.PhysicsShape:setMass(float_mass) end
--[[
	Get this shape's tag.
	@return int   An integer number.
]]
function cc.PhysicsShape:getTag() end
--[[
	Calculate the default moment value.
	This function should be overridden in inherit classes.
	@return float   A float number, equals 0.0.
]]
function cc.PhysicsShape:calculateDefaultMoment() end
--[[
	A mask that defines which categories of physics bodies can collide with this physics body.
	When two physics bodies contact each other, a collision may occur. This body's collision mask is compared to the other body's category mask by performing a logical AND operation. If the result is a non-zero value, then this body is affected by the collision. Each body independently chooses whether it wants to be affected by the other body. For example, you might use this to avoid collision calculations that would make negligible changes to a body's velocity.
	@param bitmask An integer number, the default value is 0xFFFFFFFF (all bits set).
]]
function cc.PhysicsShape:setCollisionBitmask(int_bitmask) end
--[[
	Get this shape's moment.
	@return float   A float number.
]]
function cc.PhysicsShape:getMoment() end
--[[
	Get this shape's position offset.
	This function should be overridden in inherit classes.
	@return [luaIde#cc.Vec2]   A Vec2 object.
]]
function cc.PhysicsShape:getOffset() end
--[[
	Get this shape's restitution.
	@return float   A float number.
]]
function cc.PhysicsShape:getRestitution() end
--[[
	Set this shape's friction.
	It will change the shape's friction.
	@param friction A float number.
]]
function cc.PhysicsShape:setFriction(float_friction) end
--[[
	Set this shape's material.
	It will change the shape's mass, elasticity and friction.
	@param material A PhysicsMaterial object.
]]
function cc.PhysicsShape:setMaterial(const_PhysicsMaterial_material) end
--[[
	Set this shape's tag.
	@param tag An integer number that identifies a shape object.
]]
function cc.PhysicsShape:setTag(int_tag) end
--[[
	A mask that defines which categories of bodies cause intersection notifications with this physics body.
	When two bodies share the same space, each body's category mask is tested against the other body's contact mask by performing a logical AND operation. If either comparison results in a non-zero value, an PhysicsContact object is created and passed to the physics world’s delegate. For best performance, only set bits in the contacts mask for interactions you are interested in.
	@param bitmask An integer number, the default value is 0x00000000 (all bits cleared).
]]
function cc.PhysicsShape:setContactTestBitmask(int_bitmask) end
--[[
	Set this shape's restitution.
	It will change the shape's elasticity.
	@param restitution A float number.
]]
function cc.PhysicsShape:setRestitution(float_restitution) end
--[[
	Get the body that this shape attaches.
	@return [luaIde#cc.PhysicsBody]   A PhysicsBody object pointer.
]]
function cc.PhysicsShape:getBody() end

--[[
	@SuperType[luaIde#cc.PhysicsShape]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapeCircle = {}
--[[
	Get the circle's radius.
	@return float   A float number.
]]
function cc.PhysicsShapeCircle:getRadius() end
--[[
	Creates a PhysicsShapeCircle with specified value.
	@param   radius A float number, it is the circle's radius.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return [luaIde#cc.PhysicsShapeCircle]    An autoreleased PhysicsShapeCircle object pointer.
]]
function cc.PhysicsShapeCircle:create(float_radius,const_PhysicsMaterial_material,const_Vec2_offset) end
--[[
	Calculate the area of a circle with specified radius.
	@param radius A float number
	@return float   A float number
]]
function cc.PhysicsShapeCircle:calculateArea(float_radius) end
--[[
	@return float
]]
function cc.PhysicsShapeCircle:calculateArea() end
--[[
	Calculate the moment of a circle with specified value.
	@param mass A float number
	@param radius A float number
	@param offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return float   A float number
]]
function cc.PhysicsShapeCircle:calculateMoment(float_mass,float_radius,const_Vec2_offset) end

--[[
	@SuperType[luaIde#cc.PhysicsShape]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapePolygon = {}
--[[
	Get this polygon's points array count.
	@return int   An integer number.
]]
function cc.PhysicsShapePolygon:getPointsCount() end
--[[
	Get a point of this polygon's points array.
	@param i A index of this polygon's points array.
	@return [luaIde#cc.Vec2]   A point value.
]]
function cc.PhysicsShapePolygon:getPoint(int_i) end

--[[
	@SuperType[luaIde#cc.PhysicsShapePolygon]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapeBox = {}
--[[
	Get this box's width and height.
	@return [luaIde#cc.Size]   An Size object.
]]
function cc.PhysicsShapeBox:getSize() end
--[[
	Creates a PhysicsShapeBox with specified value.
	@param   size Size contains this box's width and height.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return [luaIde#cc.PhysicsShapeBox]    An autoreleased PhysicsShapeBox object pointer.
]]
function cc.PhysicsShapeBox:create(const_Size_size,const_PhysicsMaterial_material,const_Vec2_offset,float_radius) end

--[[
	@SuperType[luaIde#cc.PhysicsShape]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapeEdgeSegment = {}
--[[
	Get this edge's end position.
	@return [luaIde#cc.Vec2]   A Vec2 object.
]]
function cc.PhysicsShapeEdgeSegment:getPointB() end
--[[
	Get this edge's begin position.
	@return [luaIde#cc.Vec2]   A Vec2 object.
]]
function cc.PhysicsShapeEdgeSegment:getPointA() end
--[[
	Creates a PhysicsShapeEdgeSegment with specified value.
	@param   a It's the edge's begin position.
	@param   b It's the edge's end position.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   border It's a edge's border width.
	@return [luaIde#cc.PhysicsShapeEdgeSegment]    An autoreleased PhysicsShapeEdgeSegment object pointer.
]]
function cc.PhysicsShapeEdgeSegment:create(const_Vec2_a,const_Vec2_b,const_PhysicsMaterial_material,float_border) end

--[[
	@SuperType[luaIde#cc.PhysicsShape]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapeEdgePolygon = {}
--[[
	Get this polygon's points array count.
	@return int   An integer number.
]]
function cc.PhysicsShapeEdgePolygon:getPointsCount() end

--[[
	@SuperType[luaIde#cc.PhysicsShapeEdgePolygon]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapeEdgeBox = {}
--[[
	Creates a PhysicsShapeEdgeBox with specified value.
	@param   size Size contains this box's width and height.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   border It's a edge's border width.
	@param   offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return [luaIde#cc.PhysicsShapeEdgeBox]    An autoreleased PhysicsShapeEdgeBox object pointer.
]]
function cc.PhysicsShapeEdgeBox:create(const_Size_size,const_PhysicsMaterial_material,float_border,const_Vec2_offset) end

--[[
	@SuperType[luaIde#cc.PhysicsShape]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsShape.h
]]
cc.PhysicsShapeEdgeChain = {}
--[[
	Get this chain's points array count.
	@return int   An integer number.
]]
function cc.PhysicsShapeEdgeChain:getPointsCount() end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsBody.h
]]
cc.PhysicsBody = {}
--[[
	Whether this physics body is affected by the physics world's gravitational force.
	@return bool
]]
function cc.PhysicsBody:isGravityEnabled() end
--[[
	reset all the force applied to body.
]]
function cc.PhysicsBody:resetForces() end
--[[
	get the max of velocity
	@return float
]]
function cc.PhysicsBody:getVelocityLimit() end
--[[
	Set the group of body.
	Collision groups let you specify an integral group index. You can have all fixtures with the same group index always collide (positive index) or never collide (negative index).
	It have high priority than bit masks.
]]
function cc.PhysicsBody:setGroup(int_group) end
--[[
	Get the body mass.
	@return float
]]
function cc.PhysicsBody:getMass() end
--[[
	Return bitmask of first shape.
	@return int   If there is no shape in body, return default value.(0xFFFFFFFF)
]]
function cc.PhysicsBody:getCollisionBitmask() end
--[[
	set the body rotation offset
	@return float
]]
function cc.PhysicsBody:getRotationOffset() end
--[[
	get the body rotation.
	@return float
]]
function cc.PhysicsBody:getRotation() end
--[[
	Get the body moment of inertia.
	@return float
]]
function cc.PhysicsBody:getMoment() end
--[[
	Applies a immediate force to body.
	@param impulse The impulse is applies to this body.
	@param offset A Vec2 object, it is the offset from the body's center of gravity in world coordinates.
]]
function cc.PhysicsBody:applyImpulse(const_Vec2_impulse,const_Vec2_offset) end
--[[
	set body rotation offset, it's the rotation witch relative to node
]]
function cc.PhysicsBody:setRotationOffset(float_rotation) end
--[[
	Applies a continuous force to body.
	@param force The force is applies to this body.
	@param offset A Vec2 object, it is the offset from the body's center of gravity in world coordinates.
]]
function cc.PhysicsBody:applyForce(const_Vec2_force,const_Vec2_offset) end
--[[
	@brief Add a shape to body.
	@param shape The shape to be added.
	@param addMassAndMoment If this is true, the shape's mass and moment will be added to body. The default is true.
	@return [luaIde#cc.PhysicsShape]   This shape's pointer if added success or nullptr if failed.
]]
function cc.PhysicsBody:addShape(PhysicsShape_shape,bool_addMassAndMoment) end
--[[
	Applies a torque force to body.
	@param torque The torque is applies to this body.
]]
function cc.PhysicsBody:applyTorque(float_torque) end
--[[
	get the max of angular velocity
	@return float
]]
function cc.PhysicsBody:getAngularVelocityLimit() end
--[[
	set the max of angular velocity
]]
function cc.PhysicsBody:setAngularVelocityLimit(float_limit) end
--[[
	Get the velocity of a body.
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:getVelocity() end
--[[
	get linear damping.
	@return float
]]
function cc.PhysicsBody:getLinearDamping() end
--[[
	Remove all shapes.
	@param reduceMassAndMoment If this is true, the body mass and moment will be reduced by shape. The default is true.
]]
function cc.PhysicsBody:removeAllShapes(bool_reduceMassAndMoment) end
--[[
	Set angular damping.
	It is used to simulate fluid or air friction forces on the body.
	@param damping The value is 0.0f to 1.0f.
]]
function cc.PhysicsBody:setAngularDamping(float_damping) end
--[[
	set the max of velocity
]]
function cc.PhysicsBody:setVelocityLimit(float_limit) end
--[[
	set body to rest
]]
function cc.PhysicsBody:setResting(bool_rest) end
--[[
	get body position offset.
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:getPositionOffset() end
--[[
	A mask that defines which categories this physics body belongs to.
	Every physics body in a scene can be assigned to up to 32 different categories, each corresponding to a bit in the bit mask. You define the mask values used in your game. In conjunction with the collisionBitMask and contactTestBitMask properties, you define which physics bodies interact with each other and when your game is notified of these interactions.
	@param bitmask An integer number, the default value is 0xFFFFFFFF (all bits set).
]]
function cc.PhysicsBody:setCategoryBitmask(int_bitmask) end
--[[
	get the world body added to.
	@return [luaIde#cc.PhysicsWorld]
]]
function cc.PhysicsBody:getWorld() end
--[[
	get the angular velocity of a body
	@return float
]]
function cc.PhysicsBody:getAngularVelocity() end
--[[
	get the body position.
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:getPosition() end
--[[
	Set the body is affected by the physics world's gravitational force or not.
]]
function cc.PhysicsBody:setGravityEnable(bool_enable) end
--[[
	Return group of first shape.
	@return int   If there is no shape in body, return default value.(0)
]]
function cc.PhysicsBody:getGroup() end
--[[
	@brief Set the body moment of inertia.
	@note If you need add/subtract moment to body, don't use setMoment(getMoment() +/- moment), because the moment of body may be equal to PHYSICS_INFINITY, it will cause some unexpected result, please use addMoment() instead.
]]
function cc.PhysicsBody:setMoment(float_moment) end
--[[
	Get the body's tag.
	@return int
]]
function cc.PhysicsBody:getTag() end
--[[
	Convert the local point to world.
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:local2World(const_Vec2_point) end
--[[
	Return bitmask of first shape.
	@return int   If there is no shape in body, return default value.(0xFFFFFFFF)
]]
function cc.PhysicsBody:getCategoryBitmask() end
--[[
	@brief Set dynamic to body.
	A dynamic body will effect with gravity.
]]
function cc.PhysicsBody:setDynamic(bool_dynamic) end
--[[
	Get the first shape of the body shapes.
	@return [luaIde#cc.PhysicsShape]   The first shape in this body.
]]
function cc.PhysicsBody:getFirstShape() end
--[[
	Get the body shapes.
	@return [luaIde#Vector__PhysicsShape__]   A Vector<PhysicsShape*> object contains PhysicsShape pointer.
]]
function cc.PhysicsBody:getShapes() end
--[[
	Return bitmask of first shape.
	@return int   If there is no shape in body, return default value.(0x00000000)
]]
function cc.PhysicsBody:getContactTestBitmask() end
--[[
	Set the angular velocity of a body.
	@param velocity The angular velocity is set to this body.
]]
function cc.PhysicsBody:setAngularVelocity(float_velocity) end
--[[
	Convert the world point to local.
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:world2Local(const_Vec2_point) end
--[[
	@brief Remove a shape from body.
	@param shape Shape the shape to be removed.
	@param reduceMassAndMoment If this is true, the body mass and moment will be reduced by shape. The default is true.
]]
function cc.PhysicsBody:removeShape(PhysicsShape_shape,bool_reduceMassAndMoment) end
--[[
	@brief Remove a shape from body.
	@param tag The tag of the shape to be removed.
	@param reduceMassAndMoment If this is true, the body mass and moment will be reduced by shape. The default is true.
]]
function cc.PhysicsBody:removeShape(int_tag,bool_reduceMassAndMoment) end
--[[
	@brief Set the body mass.
	@attention If you need add/subtract mass to body, don't use setMass(getMass() +/- mass), because the mass of body may be equal to PHYSICS_INFINITY, it will cause some unexpected result, please use addMass() instead.
]]
function cc.PhysicsBody:setMass(float_mass) end
--[[
	@brief Add moment of inertia to body.
	@param moment If _moment(moment of the body) == PHYSICS_INFINITY, it remains.
	if moment == PHYSICS_INFINITY, _moment will be PHYSICS_INFINITY.
	if moment == -PHYSICS_INFINITY, _moment will not change.
	if moment + _moment <= 0, _moment will equal to MASS_DEFAULT(1.0)
	other wise, moment = moment + _moment;
]]
function cc.PhysicsBody:addMoment(float_moment) end
--[[
	Set the velocity of a body.
	@param velocity The velocity is set to this body.
]]
function cc.PhysicsBody:setVelocity(const_Vec2_velocity) end
--[[
	Set linear damping.
	it is used to simulate fluid or air friction forces on the body.
	@param damping The value is 0.0f to 1.0f.
]]
function cc.PhysicsBody:setLinearDamping(float_damping) end
--[[
	A mask that defines which categories of physics bodies can collide with this physics body.
	When two physics bodies contact each other, a collision may occur. This body's collision mask is compared to the other body's category mask by performing a logical AND operation. If the result is a non-zero value, then this body is affected by the collision. Each body independently chooses whether it wants to be affected by the other body. For example, you might use this to avoid collision calculations that would make negligible changes to a body's velocity.
	@param bitmask An integer number, the default value is 0xFFFFFFFF (all bits set).
]]
function cc.PhysicsBody:setCollisionBitmask(int_bitmask) end
--[[
	set body position offset, it's the position witch relative to node
]]
function cc.PhysicsBody:setPositionOffset(const_Vec2_position) end
--[[
	Set the body is allow rotation or not
]]
function cc.PhysicsBody:setRotationEnable(bool_enable) end
--[[
	Whether the body can rotation.
	@return bool
]]
function cc.PhysicsBody:isRotationEnabled() end
--[[
	Get the rigid body of chipmunk.
	@return [luaIde#cpBody]
]]
function cc.PhysicsBody:getCPBody() end
--[[
	Get angular damping.
	@return float
]]
function cc.PhysicsBody:getAngularDamping() end
--[[
	Get the angular velocity of a body at a local point
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:getVelocityAtLocalPoint(const_Vec2_point) end
--[[
	Whether the body is at rest.
	@return bool
]]
function cc.PhysicsBody:isResting() end
--[[
	@brief Add mass to body.
	@param mass If _mass(mass of the body) == PHYSICS_INFINITY, it remains.
	if mass == PHYSICS_INFINITY, _mass will be PHYSICS_INFINITY.
	if mass == -PHYSICS_INFINITY, _mass will not change.
	if mass + _mass <= 0, _mass will equal to MASS_DEFAULT(1.0)
	other wise, mass = mass + _mass;
]]
function cc.PhysicsBody:addMass(float_mass) end
--[[
	get the shape of the body.
	@param   tag   An integer number that identifies a PhysicsShape object.
	@return [luaIde#cc.PhysicsShape]   A PhysicsShape object pointer or nullptr if no shapes were found.
]]
function cc.PhysicsBody:getShape(int_tag) end
--[[
	set the body's tag.
]]
function cc.PhysicsBody:setTag(int_tag) end
--[[
	get the angular velocity of a body at a world point
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsBody:getVelocityAtWorldPoint(const_Vec2_point) end
--[[
	A mask that defines which categories of bodies cause intersection notifications with this physics body.
	When two bodies share the same space, each body's category mask is tested against the other body's contact mask by performing a logical AND operation. If either comparison results in a non-zero value, an PhysicsContact object is created and passed to the physics world’s delegate. For best performance, only set bits in the contacts mask for interactions you are interested in.
	@param bitmask An integer number, the default value is 0x00000000 (all bits cleared).
]]
function cc.PhysicsBody:setContactTestBitmask(int_bitmask) end
--[[
	remove the body from the world it added to
]]
function cc.PhysicsBody:removeFromWorld() end
--[[
	@brief Test the body is dynamic or not.
	A dynamic body will effect with gravity.
	@return bool
]]
function cc.PhysicsBody:isDynamic() end
--[[
	get the node the body set to.
	@return [luaIde#cc.Node]
]]
function cc.PhysicsBody:getNode() end
--[[
	Create a body contains a box shape.
	@param   size Size contains this box's width and height.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:createBox(const_Size_size,const_PhysicsMaterial_material,const_Vec2_offset) end
--[[
	Create a body contains a EdgeSegment shape.
	@param   a It's the edge's begin position.
	@param   b It's the edge's end position.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   border It's a edge's border width.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:createEdgeSegment(const_Vec2_a,const_Vec2_b,const_PhysicsMaterial_material,float_border) end
--[[
	Create a body with default mass and moment.
	This default mass value is 1.0.
	This default moment value is 200.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:create() end
--[[
	Create a body with mass and default moment.
	@param mass This body's mass.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:create(float_mass) end
--[[
	Create a body with mass and moment.
	@param mass This body's mass.
	@param moment This body's moment.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:create(float_mass,float_moment) end
--[[
	Create a body contains a EdgeBox shape.
	@param   size Size contains this box's width and height.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   border It's a edge's border width.
	@param   offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:createEdgeBox(const_Size_size,const_PhysicsMaterial_material,float_border,const_Vec2_offset) end
--[[
	Create a body contains a circle.
	@param   radius A float number, it is the circle's radius.
	@param   material A PhysicsMaterial object, the default value is PHYSICSSHAPE_MATERIAL_DEFAULT.
	@param   offset A Vec2 object, it is the offset from the body's center of gravity in body local coordinates.
	@return [luaIde#cc.PhysicsBody]    An autoreleased PhysicsBody object pointer.
]]
function cc.PhysicsBody:createCircle(float_radius,const_PhysicsMaterial_material,const_Vec2_offset) end

--[[
	@SuperType[luaIde#cc.EventCustom]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsContact.h
]]
cc.PhysicsContact = {}
--[[
	Get contact data.
	@return [luaIde#cc.PhysicsContactData]
]]
function cc.PhysicsContact:getContactData() end
--[[
	Get the event code
	@return [luaIde#EventCode]
]]
function cc.PhysicsContact:getEventCode() end
--[[
	Get previous contact data
	@return [luaIde#cc.PhysicsContactData]
]]
function cc.PhysicsContact:getPreContactData() end
--[[
	Get contact shape A.
	@return [luaIde#cc.PhysicsShape]
]]
function cc.PhysicsContact:getShapeA() end
--[[
	Get contact shape B.
	@return [luaIde#cc.PhysicsShape]
]]
function cc.PhysicsContact:getShapeB() end

cc.PhysicsContactPreSolve = {}
--[[
	Get friction between two bodies
	@return float
]]
function cc.PhysicsContactPreSolve:getFriction() end
--[[
	Get restitution between two bodies
	@return float
]]
function cc.PhysicsContactPreSolve:getRestitution() end
--[[
	Set the friction
]]
function cc.PhysicsContactPreSolve:setFriction(float_friction) end
--[[
	Ignore the rest of the contact presolve and postsolve callbacks.
]]
function cc.PhysicsContactPreSolve:ignore() end
--[[
	Get surface velocity between two bodies
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsContactPreSolve:getSurfaceVelocity() end
--[[
	Set the surface velocity
]]
function cc.PhysicsContactPreSolve:setSurfaceVelocity(const_Vec2_velocity) end
--[[
	Set the restitution
]]
function cc.PhysicsContactPreSolve:setRestitution(float_restitution) end

cc.PhysicsContactPostSolve = {}
--[[
	Get friction between two bodies
	@return float
]]
function cc.PhysicsContactPostSolve:getFriction() end
--[[
	Get surface velocity between two bodies
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsContactPostSolve:getSurfaceVelocity() end
--[[
	Get restitution between two bodies
	@return float
]]
function cc.PhysicsContactPostSolve:getRestitution() end

--[[
	@SuperType[luaIde#cc.EventListenerCustom]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsContact.h
]]
cc.EventListenerPhysicsContact = {}
--[[
	Create the listener.
	@return [luaIde#cc.EventListenerPhysicsContact]
]]
function cc.EventListenerPhysicsContact:create() end

--[[
	@SuperType[luaIde#cc.EventListenerPhysicsContact]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsContact.h
]]
cc.EventListenerPhysicsContactWithBodies = {}
--[[
	@return bool
]]
function cc.EventListenerPhysicsContactWithBodies:hitTest(PhysicsShape_shapeA,PhysicsShape_shapeB) end
--[[
	Create the listener.
	@return [luaIde#cc.EventListenerPhysicsContactWithBodies]
]]
function cc.EventListenerPhysicsContactWithBodies:create(PhysicsBody_bodyA,PhysicsBody_bodyB) end

--[[
	@SuperType[luaIde#cc.EventListenerPhysicsContact]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsContact.h
]]
cc.EventListenerPhysicsContactWithShapes = {}
--[[
	@return bool
]]
function cc.EventListenerPhysicsContactWithShapes:hitTest(PhysicsShape_shapeA,PhysicsShape_shapeB) end
--[[
	Create the listener.
	@return [luaIde#cc.EventListenerPhysicsContactWithShapes]
]]
function cc.EventListenerPhysicsContactWithShapes:create(PhysicsShape_shapeA,PhysicsShape_shapeB) end

--[[
	@SuperType[luaIde#cc.EventListenerPhysicsContact]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsContact.h
]]
cc.EventListenerPhysicsContactWithGroup = {}
--[[
	@return bool
]]
function cc.EventListenerPhysicsContactWithGroup:hitTest(PhysicsShape_shapeA,PhysicsShape_shapeB) end
--[[
	Create the listener.
	@return [luaIde#cc.EventListenerPhysicsContactWithGroup]
]]
function cc.EventListenerPhysicsContactWithGroup:create(int_group) end

cc.PhysicsJoint = {}
--[[
	Get physics body a connected to this joint
	@return [luaIde#cc.PhysicsBody]
]]
function cc.PhysicsJoint:getBodyA() end
--[[
	Get physics body b connected to this joint
	@return [luaIde#cc.PhysicsBody]
]]
function cc.PhysicsJoint:getBodyB() end
--[[
	Get the max force setting.
	@return float
]]
function cc.PhysicsJoint:getMaxForce() end
--[[
	Set the max force between two bodies.
]]
function cc.PhysicsJoint:setMaxForce(float_force) end
--[[
	Determines if the joint is enable.
	@return bool
]]
function cc.PhysicsJoint:isEnabled() end
--[[
	Enable/Disable the joint.
]]
function cc.PhysicsJoint:setEnable(bool_enable) end
--[[
	Enable/disable the collision between two bodies.
]]
function cc.PhysicsJoint:setCollisionEnable(bool_enable) end
--[[
	Get the physics world
	@return [luaIde#cc.PhysicsWorld]
]]
function cc.PhysicsJoint:getWorld() end
--[[
	Set this joint's tag.
	@param tag An integer number that identifies a PhysicsJoint.
]]
function cc.PhysicsJoint:setTag(int_tag) end
--[[
	Remove the joint from the world.
]]
function cc.PhysicsJoint:removeFormWorld() end
--[[
	Determines if the collision is enable.
	@return bool
]]
function cc.PhysicsJoint:isCollisionEnabled() end
--[[
	Get this joint's tag.
	@return int   An integer number.
]]
function cc.PhysicsJoint:getTag() end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointFixed = {}
--[[
	@return bool
]]
function cc.PhysicsJointFixed:createConstraints() end
--[[
	Create a fixed joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param anchr It's the pivot position.
	@return [luaIde#cc.PhysicsJointFixed]   A object pointer.
]]
function cc.PhysicsJointFixed:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_anchr) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointLimit = {}
--[[
	Set the anchor point on body b
]]
function cc.PhysicsJointLimit:setAnchr2(const_Vec2_anchr2) end
--[[
	Set the anchor point on body a
]]
function cc.PhysicsJointLimit:setAnchr1(const_Vec2_anchr1) end
--[[
	Set the max distance of the anchor points
]]
function cc.PhysicsJointLimit:setMax(float_max) end
--[[
	Get the anchor point on body b
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointLimit:getAnchr2() end
--[[
	Get the anchor point on body a
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointLimit:getAnchr1() end
--[[
	@return bool
]]
function cc.PhysicsJointLimit:createConstraints() end
--[[
	Get the allowed min distance of the anchor points
	@return float
]]
function cc.PhysicsJointLimit:getMin() end
--[[
	Get the allowed max distance of the anchor points
	@return float
]]
function cc.PhysicsJointLimit:getMax() end
--[[
	Set the min distance of the anchor points
]]
function cc.PhysicsJointLimit:setMin(float_min) end
--[[
	Create a limit joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param anchr1 Anchr1 is the anchor point on body a.
	@param anchr2 Anchr2 is the anchor point on body b.
	@return [luaIde#cc.PhysicsJointLimit]   A object pointer.
]]
function cc.PhysicsJointLimit:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_anchr1,const_Vec2_anchr2) end
--[[
	Create a limit joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param anchr1 Anchr1 is the anchor point on body a.
	@param anchr2 Anchr2 is the anchor point on body b.
	@param min Define the allowed min distance of the anchor points.
	@param max Define the allowed max distance of the anchor points.
	@return [luaIde#cc.PhysicsJointLimit]   A object pointer.
]]
function cc.PhysicsJointLimit:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_anchr1,const_Vec2_anchr2,float_min,float_max) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointPin = {}
--[[
	@return bool
]]
function cc.PhysicsJointPin:createConstraints() end
--[[
	Create a pin joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param pivot It's the pivot position.
	@return [luaIde#cc.PhysicsJointPin]   A object pointer.
]]
function cc.PhysicsJointPin:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_pivot) end
--[[
	Create a pin joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param anchr1 Anchr1 is the anchor point on body a.
	@param anchr2 Anchr2 is the anchor point on body b.
	@return [luaIde#cc.PhysicsJointPin]   A object pointer.
]]
function cc.PhysicsJointPin:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_anchr1,const_Vec2_anchr2) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointDistance = {}
--[[
	@return bool
]]
function cc.PhysicsJointDistance:createConstraints() end
--[[
	Set the distance of the anchor points
]]
function cc.PhysicsJointDistance:setDistance(float_distance) end
--[[
	Get the distance of the anchor points
	@return float
]]
function cc.PhysicsJointDistance:getDistance() end
--[[
	Create a fixed distance joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param anchr1 Anchr1 is the anchor point on body a.
	@param anchr2 Anchr2 is the anchor point on body b.
	@return [luaIde#cc.PhysicsJointDistance]   A object pointer.
]]
function cc.PhysicsJointDistance:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_anchr1,const_Vec2_anchr2) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointSpring = {}
--[[
	Set the anchor point on body b
]]
function cc.PhysicsJointSpring:setAnchr2(const_Vec2_anchr2) end
--[[
	Set the anchor point on body a
]]
function cc.PhysicsJointSpring:setAnchr1(const_Vec2_anchr1) end
--[[
	Get the spring soft constant
	@return float
]]
function cc.PhysicsJointSpring:getDamping() end
--[[
	Set the spring constant
]]
function cc.PhysicsJointSpring:setStiffness(float_stiffness) end
--[[
	Get the distance of the anchor points
	@return float
]]
function cc.PhysicsJointSpring:getRestLength() end
--[[
	Get the anchor point on body b
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointSpring:getAnchr2() end
--[[
	Get the anchor point on body a
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointSpring:getAnchr1() end
--[[
	Get the spring constant
	@return float
]]
function cc.PhysicsJointSpring:getStiffness() end
--[[
	@return bool
]]
function cc.PhysicsJointSpring:createConstraints() end
--[[
	Set the distance of the anchor points
]]
function cc.PhysicsJointSpring:setRestLength(float_restLength) end
--[[
	Set the spring soft constant
]]
function cc.PhysicsJointSpring:setDamping(float_damping) end
--[[
	Create a fixed distance joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param anchr1 Anchr1 is the anchor point on body a.
	@param anchr2 Anchr2 is the anchor point on body b.
	@param stiffness It's the spring constant.
	@param damping It's how soft to make the damping of the spring.
	@return [luaIde#cc.PhysicsJointSpring]   A object pointer.
]]
function cc.PhysicsJointSpring:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_anchr1,const_Vec2_anchr2,float_stiffness,float_damping) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointGroove = {}
--[[
	Set the anchor point on body b
]]
function cc.PhysicsJointGroove:setAnchr2(const_Vec2_anchr2) end
--[[
	Set the line begin positio
]]
function cc.PhysicsJointGroove:setGrooveA(const_Vec2_grooveA) end
--[[
	Set the line end positio
]]
function cc.PhysicsJointGroove:setGrooveB(const_Vec2_grooveB) end
--[[
	Get the line begin positio
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointGroove:getGrooveA() end
--[[
	Get the line end positio
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointGroove:getGrooveB() end
--[[
	Get the anchor point on body b
	@return [luaIde#cc.Vec2]
]]
function cc.PhysicsJointGroove:getAnchr2() end
--[[
	@return bool
]]
function cc.PhysicsJointGroove:createConstraints() end
--[[
	Create a groove joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param grooveA The line begin position.
	@param grooveB The line end position.
	@param anchr2 Anchr2 is the anchor point on body b.
	@return [luaIde#cc.PhysicsJointGroove]   A object pointer.
]]
function cc.PhysicsJointGroove:construct(PhysicsBody_a,PhysicsBody_b,const_Vec2_grooveA,const_Vec2_grooveB,const_Vec2_anchr2) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointRotarySpring = {}
--[[
	Get the spring soft constant
	@return float
]]
function cc.PhysicsJointRotarySpring:getDamping() end
--[[
	Set the relative angle in radians from the body a to b
]]
function cc.PhysicsJointRotarySpring:setRestAngle(float_restAngle) end
--[[
	Get the spring constant
	@return float
]]
function cc.PhysicsJointRotarySpring:getStiffness() end
--[[
	@return bool
]]
function cc.PhysicsJointRotarySpring:createConstraints() end
--[[
	Set the spring constant
]]
function cc.PhysicsJointRotarySpring:setStiffness(float_stiffness) end
--[[
	Set the spring soft constant
]]
function cc.PhysicsJointRotarySpring:setDamping(float_damping) end
--[[
	Get the relative angle in radians from the body a to b
	@return float
]]
function cc.PhysicsJointRotarySpring:getRestAngle() end
--[[
	Create a damped rotary spring joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param stiffness It's the spring constant.
	@param damping It's how soft to make the damping of the spring.
	@return [luaIde#cc.PhysicsJointRotarySpring]   A object pointer.
]]
function cc.PhysicsJointRotarySpring:construct(PhysicsBody_a,PhysicsBody_b,float_stiffness,float_damping) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointRotaryLimit = {}
--[[
	Get the max rotation limit
	@return float
]]
function cc.PhysicsJointRotaryLimit:getMax() end
--[[
	@return bool
]]
function cc.PhysicsJointRotaryLimit:createConstraints() end
--[[
	Set the min rotation limit
]]
function cc.PhysicsJointRotaryLimit:setMin(float_min) end
--[[
	Set the max rotation limit
]]
function cc.PhysicsJointRotaryLimit:setMax(float_max) end
--[[
	Get the min rotation limit
	@return float
]]
function cc.PhysicsJointRotaryLimit:getMin() end
--[[
	Create a limit rotary joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param min It's min rotation limit in radians.
	@param max It's max rotation limit in radians.
	@return [luaIde#cc.PhysicsJointRotaryLimit]   A object pointer.
]]
function cc.PhysicsJointRotaryLimit:construct(PhysicsBody_a,PhysicsBody_b,float_min,float_max) end
--[[
	Create a limit rotary joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@return [luaIde#cc.PhysicsJointRotaryLimit]   A object pointer.
]]
function cc.PhysicsJointRotaryLimit:construct(PhysicsBody_a,PhysicsBody_b) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointRatchet = {}
--[[
	Get the ratchet angle
	@return float
]]
function cc.PhysicsJointRatchet:getAngle() end
--[[
	Set the ratchet angle
]]
function cc.PhysicsJointRatchet:setAngle(float_angle) end
--[[
	@return bool
]]
function cc.PhysicsJointRatchet:createConstraints() end
--[[
	Set the initial offset
]]
function cc.PhysicsJointRatchet:setPhase(float_phase) end
--[[
	Get the initial offset
	@return float
]]
function cc.PhysicsJointRatchet:getPhase() end
--[[
	Set the distance between "clicks"
]]
function cc.PhysicsJointRatchet:setRatchet(float_ratchet) end
--[[
	Get the distance between "clicks"
	@return float
]]
function cc.PhysicsJointRatchet:getRatchet() end
--[[
	Create a ratchet joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param phase Phase is the initial offset to use when deciding where the ratchet angles are.
	@param ratchet Ratchet is the distance between "clicks".
	@return [luaIde#cc.PhysicsJointRatchet]   A object pointer.
]]
function cc.PhysicsJointRatchet:construct(PhysicsBody_a,PhysicsBody_b,float_phase,float_ratchet) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointGear = {}
--[[
	Set the ratio
]]
function cc.PhysicsJointGear:setRatio(float_ratchet) end
--[[
	Get the angular offset of the two bodies
	@return float
]]
function cc.PhysicsJointGear:getPhase() end
--[[
	Set the angular offset of the two bodies
]]
function cc.PhysicsJointGear:setPhase(float_phase) end
--[[
	@return bool
]]
function cc.PhysicsJointGear:createConstraints() end
--[[
	Get the ratio
	@return float
]]
function cc.PhysicsJointGear:getRatio() end
--[[
	Create a gear joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param phase Phase is the initial angular offset of the two bodies.
	@param ratio Ratio is always measured in absolute terms.
	@return [luaIde#cc.PhysicsJointGear]   A object pointer.
]]
function cc.PhysicsJointGear:construct(PhysicsBody_a,PhysicsBody_b,float_phase,float_ratio) end

--[[
	@SuperType[luaIde#cc.PhysicsJoint]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/physics/CCPhysicsJoint.h
]]
cc.PhysicsJointMotor = {}
--[[
	Set the relative angular velocity
]]
function cc.PhysicsJointMotor:setRate(float_rate) end
--[[
	Get the relative angular velocity
	@return float
]]
function cc.PhysicsJointMotor:getRate() end
--[[
	@return bool
]]
function cc.PhysicsJointMotor:createConstraints() end
--[[
	Create a motor joint.
	@param a A is the body to connect.
	@param b B is the body to connect.
	@param rate Rate is the desired relative angular velocity.
	@return [luaIde#cc.PhysicsJointMotor]   A object pointer.
]]
function cc.PhysicsJointMotor:construct(PhysicsBody_a,PhysicsBody_b,float_rate) end

cc.PhysicsWorld = {}
--[[
	set the gravity value of this physics world.
	@param gravity A gravity value of this physics world.
]]
function cc.PhysicsWorld:setGravity(const_Vec2_gravity) end
--[[
	Get all the bodies that in this physics world.
	@return [luaIde#Vector__PhysicsBody__]   A Vector<PhysicsBody*>& object contains all bodies in this physics world.
]]
function cc.PhysicsWorld:getAllBodies() end
--[[
	set the number of update of the physics world in a second.
	0 - disable fixed step system
	default value is 0
]]
function cc.PhysicsWorld:setFixedUpdateRate(int_updatesPerSecond) end
--[[
	set the number of substeps in an update of the physics world.
	One physics update will be divided into several substeps to increase its accuracy.
	@param steps An integer number, default value is 1.
]]
function cc.PhysicsWorld:setSubsteps(int_steps) end
--[[
	To control the step of physics.
	If you want control it by yourself( fixed-timestep for example ), you can set this to false and call step by yourself.
	@attention If you set auto step to false, setSpeed setSubsteps and setUpdateRate won't work, you need to control the time step by yourself.
	@param autoStep A bool object, default value is true.
]]
function cc.PhysicsWorld:setAutoStep(bool_autoStep) end
--[[
	Adds a joint to this physics world.
	This joint will be added to this physics world at next frame.
	@attention If this joint is already added to another physics world, it will be removed from that world first and then add to this world.
	@param   joint   A pointer to an existing PhysicsJoint object.
]]
function cc.PhysicsWorld:addJoint(PhysicsJoint_joint) end
--[[
	Remove all joints from this physics world.
	@attention This function is invoked in the destructor of this physics world, you do not use this api in common.
	@param   destroy   true all joints will be destroyed after remove from this world, false otherwise.
]]
function cc.PhysicsWorld:removeAllJoints(bool_destroy) end
--[[
	Get the debug draw mask.
	@return int   An integer number.
]]
function cc.PhysicsWorld:getDebugDrawMask() end
--[[
	Get the auto step of this physics world.
	@return bool   A bool object.
]]
function cc.PhysicsWorld:isAutoStep() end
--[[
	Remove a body from this physics world.
	If this world is not locked, the body is removed immediately, otherwise at next frame.
	@attention If this body has joints, those joints will be removed also.
	@param   body   A pointer to an existing PhysicsBody object.
]]
function cc.PhysicsWorld:removeBody(PhysicsBody_body) end
--[[
	Remove body by tag.
	If this world is not locked, the object is removed immediately, otherwise at next frame.
	@attention If this body has joints, those joints will be removed also.
	@param   tag   An integer number that identifies a PhysicsBody object.
]]
function cc.PhysicsWorld:removeBody(int_tag) end
--[[
	Remove a joint from this physics world.
	If this world is not locked, the joint is removed immediately, otherwise at next frame.
	If this joint is connected with a body, it will be removed from the body also.
	@param   joint   A pointer to an existing PhysicsJoint object.
	@param   destroy   true this joint will be destroyed after remove from this world, false otherwise.
]]
function cc.PhysicsWorld:removeJoint(PhysicsJoint_joint,bool_destroy) end
--[[
	Get physics shapes that contains the point.
	All shapes contains the point will be pushed in a Vector<PhysicsShape*> object.
	@attention The point must lie inside a shape.
	@param   point   A Vec2 object contains the position of the point.
	@return [luaIde#Vector__PhysicsShape__]   A Vector<PhysicsShape*> object contains all found PhysicsShape pointer.
]]
function cc.PhysicsWorld:getShapes(const_Vec2_point) end
--[[
	The step for physics world.
	The times passing for simulate the physics.
	@attention You need to setAutoStep(false) first before it can work.
	@param   delta   A float number.
]]
function cc.PhysicsWorld:step(float_delta) end
--[[
	Set the debug draw mask of this physics world.
	This physics world will draw shapes and joints by DrawNode according to mask.
	@param mask Mask has four value:DEBUGDRAW_NONE, DEBUGDRAW_SHAPE, DEBUGDRAW_JOINT, DEBUGDRAW_CONTACT and DEBUGDRAW_ALL, default is DEBUGDRAW_NONE
]]
function cc.PhysicsWorld:setDebugDrawMask(int_mask) end
--[[
	Get the gravity value of this physics world.
	@return [luaIde#cc.Vec2]   A Vec2 object.
]]
function cc.PhysicsWorld:getGravity() end
--[[
	Set the update rate of this physics world
	Update rate is the value of EngineUpdateTimes/PhysicsWorldUpdateTimes.
	Set it higher can improve performance, set it lower can improve accuracy of physics world simulation.
	@attention if you setAutoStep(false), this won't work.
	@param rate An integer number, default value is 1.0.
]]
function cc.PhysicsWorld:setUpdateRate(int_rate) end
--[[
	get the number of substeps
	@return int
]]
function cc.PhysicsWorld:getFixedUpdateRate() end
--[[
	Get the number of substeps of this physics world.
	@return int   An integer number.
]]
function cc.PhysicsWorld:getSubsteps() end
--[[
	Get the speed of this physics world.
	@return float   A float number.
]]
function cc.PhysicsWorld:getSpeed() end
--[[
	Get the update rate of this physics world.
	@return int   An integer number.
]]
function cc.PhysicsWorld:getUpdateRate() end
--[[
	Remove all bodies from physics world.
	If this world is not locked, those body are removed immediately, otherwise at next frame.
]]
function cc.PhysicsWorld:removeAllBodies() end
--[[
	Set the speed of this physics world.
	@attention if you setAutoStep(false), this won't work.
	@param speed  A float number. Speed is the rate at which the simulation executes. default value is 1.0.
]]
function cc.PhysicsWorld:setSpeed(float_speed) end
--[[
	Get the nearest physics shape that contains the point.
	Query this physics world at point and return the closest shape.
	@param   point   A Vec2 object contains the position of the point.
	@return [luaIde#cc.PhysicsShape]   A PhysicsShape object pointer or nullptr if no shapes were found
]]
function cc.PhysicsWorld:getShape(const_Vec2_point) end
--[[
	Get a body by tag.
	@param   tag   An integer number that identifies a PhysicsBody object.
	@return [luaIde#cc.PhysicsBody]   A PhysicsBody object pointer or nullptr if no shapes were found.
]]
function cc.PhysicsWorld:getBody(int_tag) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/spine/SkeletonRenderer.h
]]
sp.SkeletonRenderer = {}
function sp.SkeletonRenderer:setTimeScale(float_scale) end
--[[
	@return bool
]]
function sp.SkeletonRenderer:getDebugSlotsEnabled() end
function sp.SkeletonRenderer:setDebugSlotsEnabled(bool_enabled) end
function sp.SkeletonRenderer:setDebugBonesEnabled(bool_enabled) end
--[[
	@return bool
]]
function sp.SkeletonRenderer:getDebugBonesEnabled() end
--[[
	@return float
]]
function sp.SkeletonRenderer:getTimeScale() end
--[[
	@return [luaIde#spSkeleton]
]]
function sp.SkeletonRenderer:getSkeleton() end

--[[
	@SuperType[luaIde#sp.SkeletonRenderer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/spine/SkeletonAnimation.h
]]
sp.SkeletonAnimation = {}
--[[
	@return [luaIde#spAnimation]
]]
function sp.SkeletonAnimation:findAnimation(const_std_string_name) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionFrame.h
]]
ccs.ActionFrame = {}
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionFrame:getAction(float_duration) end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@param duration   the source ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionFrame:getAction(float_duration,ActionFrame_srcFrame) end
--[[
	Gets the type of action frame
	@return int   the type of action frame
]]
function ccs.ActionFrame:getFrameType() end
--[[
	Changes the time of action frame
	@param fTime  the time of action frame
]]
function ccs.ActionFrame:setFrameTime(float_fTime) end
--[[
	Changes the easing type.
	@param easingType the easing type.
]]
function ccs.ActionFrame:setEasingType(int_easingType) end
--[[
	Gets the time of action frame
	@return float   fTime  the time of action frame
]]
function ccs.ActionFrame:getFrameTime() end
--[[
	Gets the index of action frame
	@return int   the index of action frame
]]
function ccs.ActionFrame:getFrameIndex() end
--[[
	Changes the type of action frame
	@param frameType   the type of action frame
]]
function ccs.ActionFrame:setFrameType(int_frameType) end
--[[
	Changes the index of action frame
	@param index   the index of action frame
]]
function ccs.ActionFrame:setFrameIndex(int_index) end
--[[
	Set the ActionInterval easing parameter.
	@param parameter   the parameter for frame ease
]]
function ccs.ActionFrame:setEasingParameter() end
--[[
	Gets the easing type.
	@return int   the easing type.
]]
function ccs.ActionFrame:getEasingType() end

--[[
	@SuperType[luaIde#ccs.ActionFrame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionFrame.h
]]
ccs.ActionMoveFrame = {}
--[[
	Changes the move action position.
	@param the move action position.
]]
function ccs.ActionMoveFrame:setPosition(cocos2d_Vec2_pos) end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionMoveFrame:getAction(float_duration) end
--[[
	Gets the move action position.
	@return [luaIde#cocos2d_Vec2]   the move action position.
]]
function ccs.ActionMoveFrame:getPosition() end

--[[
	@SuperType[luaIde#ccs.ActionFrame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionFrame.h
]]
ccs.ActionScaleFrame = {}
--[[
	Changes the scale action scaleY.
	@param rotation the scale action scaleY.
]]
function ccs.ActionScaleFrame:setScaleY(float_scaleY) end
--[[
	Changes the scale action scaleX.
	@param the scale action scaleX.
]]
function ccs.ActionScaleFrame:setScaleX(float_scaleX) end
--[[
	Gets the scale action scaleY.
	@return float   the scale action scaleY.
]]
function ccs.ActionScaleFrame:getScaleY() end
--[[
	Gets the scale action scaleX.
	@return float   the scale action scaleX.
]]
function ccs.ActionScaleFrame:getScaleX() end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionScaleFrame:getAction(float_duration) end

--[[
	@SuperType[luaIde#ccs.ActionFrame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionFrame.h
]]
ccs.ActionRotationFrame = {}
--[[
	Changes rotate action rotation.
	@param rotation rotate action rotation.
]]
function ccs.ActionRotationFrame:setRotation(float_rotation) end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionRotationFrame:getAction(float_duration) end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@param duration   the source ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionRotationFrame:getAction(float_duration,ActionFrame_srcFrame) end
--[[
	Gets the rotate action rotation.
	@return float   the rotate action rotation.
]]
function ccs.ActionRotationFrame:getRotation() end

--[[
	@SuperType[luaIde#ccs.ActionFrame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionFrame.h
]]
ccs.ActionFadeFrame = {}
--[[
	Gets the fade action opacity.
	@return int   the fade action opacity.
]]
function ccs.ActionFadeFrame:getOpacity() end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionFadeFrame:getAction(float_duration) end
--[[
	Changes the fade action opacity.
	@param opacity the fade action opacity
]]
function ccs.ActionFadeFrame:setOpacity(int_opacity) end

--[[
	@SuperType[luaIde#ccs.ActionFrame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionFrame.h
]]
ccs.ActionTintFrame = {}
--[[
	Gets the tint action color.
	@return [luaIde#cocos2d_Color3B]   the tint action color.
]]
function ccs.ActionTintFrame:getColor() end
--[[
	Gets the ActionInterval of ActionFrame.
	@param duration   the duration time of ActionFrame
	@return [luaIde#cocos2d_ActionInterval]   ActionInterval
]]
function ccs.ActionTintFrame:getAction(float_duration) end
--[[
	Changes the tint action color.
	@param ccolor the tint action color
]]
function ccs.ActionTintFrame:setColor(cocos2d_Color3B_ccolor) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionObject.h
]]
ccs.ActionObject = {}
--[[
	Sets the current time of frame.
	@param fTime   the current time of frame
]]
function ccs.ActionObject:setCurrentTime(float_fTime) end
--[[
	Pause the action.
]]
function ccs.ActionObject:pause() end
--[[
	Sets name for object
	@param name    name of object
]]
function ccs.ActionObject:setName(const_char_name) end
--[[
	Sets the time interval of frame.
	@param fTime   the time interval of frame
]]
function ccs.ActionObject:setUnitTime(float_fTime) end
--[[
	Gets the total time of frame.
	@return float   the total time of frame
]]
function ccs.ActionObject:getTotalTime() end
--[[
	Gets name of object
	@return char   name of object
]]
function ccs.ActionObject:getName() end
--[[
	Stop the action.
]]
function ccs.ActionObject:stop() end
--[[
	Play the action.
]]
function ccs.ActionObject:play() end
--[[
	Play the action.
	@param func Action Call Back
]]
function ccs.ActionObject:play(cocos2d_CallFunc_func) end
--[[
	Gets the current time of frame.
	@return float   the current time of frame
]]
function ccs.ActionObject:getCurrentTime() end
--[[
	Removes a ActionNode which play the action.
	@param node    the ActionNode which play the action
]]
function ccs.ActionObject:removeActionNode(ActionNode_node) end
--[[
	Gets if the action will loop play.
	@return bool     that if the action will loop play
]]
function ccs.ActionObject:getLoop() end
--[[
	Adds a ActionNode to play the action.
	@param node    the ActionNode which will play the action
]]
function ccs.ActionObject:addActionNode(ActionNode_node) end
--[[
	Gets the time interval of frame.
	@return float   the time interval of frame
]]
function ccs.ActionObject:getUnitTime() end
--[[
	Return if the action is playing.
	@return bool   true if the action is playing, false the otherwise
]]
function ccs.ActionObject:isPlaying() end
--[[
	update frame metho
]]
function ccs.ActionObject:updateToFrameByTime(float_fTime) end
--[[
	Sets if the action will loop play.
	@param bLoop     that if the action will loop play
]]
function ccs.ActionObject:setLoop(bool_bLoop) end
--[[
	scheduler update functio
]]
function ccs.ActionObject:simulationActionUpdate(float_dt) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCActionManagerEx.h
]]
ccs.ActionManagerEx = {}
--[[
	Stop an Action with a name.
	@param jsonName  UI file name
	@param actionName  action name in the UIfile.
	@return [luaIde#ccs.ActionObject]    ActionObject which named as the param name
]]
function ccs.ActionManagerEx:stopActionByName(const_char_jsonName,const_char_actionName) end
--[[
	Gets an ActionObject with a name.
	@param jsonName  UI file name
	@param actionName  action name in the UI file.
	@return [luaIde#ccs.ActionObject]    ActionObject which named as the param name
]]
function ccs.ActionManagerEx:getActionByName(const_char_jsonName,const_char_actionName) end
--[[
	@return int
]]
function ccs.ActionManagerEx:getStudioVersionNumber() end
--[[
	Play an Action with a name.
	@param jsonName  UI file name
	@param actionName  action name in the UIfile.
	@return [luaIde#ccs.ActionObject]    ActionObject which named as the param name
]]
function ccs.ActionManagerEx:playActionByName(const_char_jsonName,const_char_actionName) end
--[[
	Play an Action with a name.
	@param jsonName  UI file name
	@param actionName  action name in the UIfile.
	@param func ui action call back
	@return [luaIde#ccs.ActionObject]
]]
function ccs.ActionManagerEx:playActionByName(const_char_jsonName,const_char_actionName,cocos2d_CallFunc_func) end
--[[
	Release all actions.
]]
function ccs.ActionManagerEx:releaseActions() end
--[[
	Purges ActionManager point.
	@js purge
	@lua destroyActionManager
]]
function ccs.ActionManagerEx:destroyInstance() end
--[[
	Gets the static instance of ActionManager.
	@js getInstance
	@lua getInstance
	@return [luaIde#ccs.ActionManagerEx]
]]
function ccs.ActionManagerEx:getInstance() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.BaseData = {}
--[[
	@return [luaIde#cocos2d_Color4B]
]]
function ccs.BaseData:getColor() end
function ccs.BaseData:setColor(const_cocos2d_Color4B_color) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.DisplayData = {}
function ccs.DisplayData:copy(DisplayData_displayData) end
--[[
	@return std_string
]]
function ccs.DisplayData:changeDisplayToTexture(const_std_string_displayName) end

--[[
	@SuperType[luaIde#ccs.DisplayData]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.SpriteDisplayData = {}
function ccs.SpriteDisplayData:copy(DisplayData_displayData) end

--[[
	@SuperType[luaIde#ccs.DisplayData]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.ArmatureDisplayData = {}
function ccs.ArmatureDisplayData:new() end 
function ccs.ArmatureDisplayData:create() end 


--[[
	@SuperType[luaIde#ccs.DisplayData]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.ParticleDisplayData = {}
function ccs.ParticleDisplayData:new() end 
function ccs.ParticleDisplayData:create() end 


--[[
	@SuperType[luaIde#ccs.BaseData]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.BoneData = {}
--[[
	@return [luaIde#ccs.DisplayData]
]]
function ccs.BoneData:getDisplayData(int_index) end
--[[
	@return bool
]]
function ccs.BoneData:init() end
function ccs.BoneData:addDisplayData(DisplayData_displayData) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.ArmatureData = {}
function ccs.ArmatureData:addBoneData(BoneData_boneData) end
--[[
	@return bool
]]
function ccs.ArmatureData:init() end
--[[
	@return [luaIde#ccs.BoneData]
]]
function ccs.ArmatureData:getBoneData(const_std_string_boneName) end

--[[
	@SuperType[luaIde#ccs.BaseData]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.FrameData = {}
function ccs.FrameData:copy(const_BaseData_baseData) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.MovementBoneData = {}
--[[
	@return bool
]]
function ccs.MovementBoneData:init() end
--[[
	@return [luaIde#ccs.FrameData]
]]
function ccs.MovementBoneData:getFrameData(int_index) end
function ccs.MovementBoneData:addFrameData(FrameData_frameData) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.MovementData = {}
--[[
	@return [luaIde#ccs.MovementBoneData]
]]
function ccs.MovementData:getMovementBoneData(const_std_string_boneName) end
function ccs.MovementData:addMovementBoneData(MovementBoneData_movBoneData) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.AnimationData = {}
--[[
	@return [luaIde#ccs.MovementData]
]]
function ccs.AnimationData:getMovement(const_std_string_movementName) end
--[[
	@return ssize_t
]]
function ccs.AnimationData:getMovementCount() end
function ccs.AnimationData:addMovement(MovementData_movData) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.ContourData = {}
--[[
	@return bool
]]
function ccs.ContourData:init() end
function ccs.ContourData:addVertex(cocos2d_Vec2_vertex) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDatas.h
]]
ccs.TextureData = {}
--[[
	@return [luaIde#ccs.ContourData]
]]
function ccs.TextureData:getContourData(int_index) end
--[[
	@return bool
]]
function ccs.TextureData:init() end
function ccs.TextureData:addContourData(ContourData_contourData) end

--[[
	@SuperType[luaIde#ccs.ProcessBase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCTween.h
]]
ccs.Tween = {}
--[[
	@return [luaIde#ccs.ArmatureAnimation]
]]
function ccs.Tween:getAnimation() end
function ccs.Tween:gotoAndPause(int_frameIndex) end
--[[
	Start the Process
	@param  movementBoneData  the MovementBoneData include all FrameData
	@param  durationTo the number of frames changing to this animation needs.
	@param  durationTween  the number of frames this animation actual last.
	@param  loop   whether the animation is loop
	loop < 0 : use the value from MovementData get from Action Editor
	loop = 0 : this animation is not loop
	loop > 0 : this animation is loop
	@param  tweenEasing    tween easing is used for calculate easing effect
	TWEEN_EASING_MAX : use the value from MovementData get from Action Editor
	-1 : fade out
	0  : line
	1  : fade in
	2  : fade in and out
]]
function ccs.Tween:play(MovementBoneData_movementBoneData,int_durationTo,int_durationTween,int_loop,int_tweenEasing) end
function ccs.Tween:gotoAndPlay(int_frameIndex) end
--[[
	Init with a Bone
	@param bone the Bone Tween will bind to
	@return bool
]]
function ccs.Tween:init(Bone_bone) end
function ccs.Tween:setAnimation(ArmatureAnimation_animation) end
--[[
	Create with a Bone
	@param bone the Bone Tween will bind to
	@return [luaIde#ccs.Tween]
]]
function ccs.Tween:create(Bone_bone) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCDisplayManager.h
]]
ccs.DisplayManager = {}
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.DisplayManager:getDisplayRenderNode() end
--[[
	@return [luaIde#cocos2d_Vec2]
]]
function ccs.DisplayManager:getAnchorPointInPoints() end
--[[
	@return [luaIde#DisplayType]
]]
function ccs.DisplayManager:getDisplayRenderNodeType() end
function ccs.DisplayManager:removeDisplay(int_index) end
function ccs.DisplayManager:setForceChangeDisplay(bool_force) end
--[[
	@return bool
]]
function ccs.DisplayManager:init(Bone_bone) end
--[[
	@return [luaIde#cocos2d_Size]
]]
function ccs.DisplayManager:getContentSize() end
--[[
	@return [luaIde#cocos2d_Rect]
]]
function ccs.DisplayManager:getBoundingBox() end
--[[
	Add display and use  _DisplayData init the display.
	If index already have a display, then replace it.
	If index is current display index, then also change display to _index
	@param     displayData it include the display information, like DisplayType.
	If you want to create a sprite display, then create a SpriteDisplayData param
	@param     index the index of the display you want to replace or add to
	-1 : append display from back
]]
function ccs.DisplayManager:addDisplay(DisplayData_displayData,int_index) end
--[[
	Check if the position is inside the bone.
	@return bool
]]
function ccs.DisplayManager:containPoint(cocos2d_Vec2__point) end
--[[
	Check if the position is inside the bone.
	@return bool
]]
function ccs.DisplayManager:containPoint(float_x,float_y) end
--[[
	Change display by index. You can just use this method to change display in the display list.
	The display list is just used for this bone, and it is the displays you may use in every frame.
	Note : if index is the same with prev index, the method will not effect
	@param index The index of the display you want to change
	@param force If true, then force change display to specified display, or current display will set to  display index edit in the flash every key frame.
]]
function ccs.DisplayManager:changeDisplayWithIndex(int_index,bool_force) end
function ccs.DisplayManager:changeDisplayWithName(const_std_string_name,bool_force) end
--[[
	@return bool
]]
function ccs.DisplayManager:isForceChangeDisplay() end
--[[
	@return int
]]
function ccs.DisplayManager:getCurrentDisplayIndex() end
--[[
	@return [luaIde#cocos2d_Vec2]
]]
function ccs.DisplayManager:getAnchorPoint() end
--[[
	@return [luaIde#cocos2d_Vector__DecorativeDisplay__]
]]
function ccs.DisplayManager:getDecorativeDisplayList() end
--[[
	Determines if the display is visible
	@see setVisible(bool)
	@return bool   true if the node is visible, false if the node is hidden.
]]
function ccs.DisplayManager:isVisible() end
--[[
	Sets whether the display is visible
	The default value is true, a node is default to visible
	@param visible   true if the node is visible, false if the node is hidden.
]]
function ccs.DisplayManager:setVisible(bool_visible) end
--[[
	@return [luaIde#ccs.DisplayManager]
]]
function ccs.DisplayManager:create(Bone_bone) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCBone.h
]]
ccs.Bone = {}
--[[
	@return bool
]]
function ccs.Bone:isTransformDirty() end
--[[
	Set blend function
]]
function ccs.Bone:setBlendFunc(const_cocos2d_BlendFunc_blendFunc) end
--[[
	@return bool
]]
function ccs.Bone:isIgnoreMovementBoneData() end
--[[
	! Update zorder
]]
function ccs.Bone:updateZOrder() end
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.Bone:getDisplayRenderNode() end
--[[
	@return bool
]]
function ccs.Bone:isBlendDirty() end
--[[
	Add a child to this bone, and it will let this child call setParent(Bone *parent) function to set self to it's parent
	@param     child  the child you want to add
]]
function ccs.Bone:addChildBone(Bone_child) end
--[[
	@return [luaIde#ccs.BaseData]
]]
function ccs.Bone:getWorldInfo() end
--[[
	@return [luaIde#ccs.Tween]
]]
function ccs.Bone:getTween() end
--[[
	Get parent bone
	@return [luaIde#ccs.Bone]   parent bone
]]
function ccs.Bone:getParentBone() end
--[[
	! Update color to render display
]]
function ccs.Bone:updateColor() end
--[[
	Whether or not the bone's transform property changed. if true, the bone will update the transform.
]]
function ccs.Bone:setTransformDirty(bool_dirty) end
--[[
	@return [luaIde#DisplayType]
]]
function ccs.Bone:getDisplayRenderNodeType() end
function ccs.Bone:removeDisplay(int_index) end
function ccs.Bone:setBoneData(BoneData_boneData) end
--[[
	Initializes an empty Bone with nothing init.
	@return bool
]]
function ccs.Bone:init() end
--[[
	Initializes a Bone with the specified name
	@param name Bone's name.
	@return bool
]]
function ccs.Bone:init(const_std_string_name) end
--[[
	Set parent bone.
	If parent is null, then also remove this bone from armature.
	It will not set the Armature, if you want to add the bone to a Armature, you should use Armature::addBone(Bone *bone, const char* parentName).
	@param parent  the parent bone.
	nullptr : remove this bone from armature
]]
function ccs.Bone:setParentBone(Bone_parent) end
--[[
	Add display and use displayData to init the display.
	If index already have a display, then replace it.
	If index is current display index, then also change display to _index
	@param displayData it include the display information, like DisplayType.
	If you want to create a sprite display, then create a SpriteDisplayData param
	@param index the index of the display you want to replace or add to
	-1 : append display from back
]]
function ccs.Bone:addDisplay(DisplayData_displayData,int_index) end
--[[
	@return [luaIde#cocos2d_BlendFunc]
]]
function ccs.Bone:getBlendFunc() end
--[[
	Remove itself from its parent.
	@param recursion    whether or not to remove childBone's display
]]
function ccs.Bone:removeFromParent(bool_recursion) end
--[[
	Get the ColliderBody list in this bone. The object in the Array is ColliderBody.
	@return [luaIde#ColliderDetector]
]]
function ccs.Bone:getColliderDetector() end
--[[
	@return [luaIde#ccs.Armature]
]]
function ccs.Bone:getChildArmature() end
--[[
	@return [luaIde#ccs.FrameData]
]]
function ccs.Bone:getTweenData() end
function ccs.Bone:changeDisplayWithIndex(int_index,bool_force) end
function ccs.Bone:changeDisplayWithName(const_std_string_name,bool_force) end
function ccs.Bone:setArmature(Armature_armature) end
--[[
	Set if blend function is dirty
]]
function ccs.Bone:setBlendDirty(bool_dirty) end
--[[
	Removes a child Bone
	@param     bone   the bone you want to remove
]]
function ccs.Bone:removeChildBone(Bone_bone,bool_recursion) end
function ccs.Bone:setChildArmature(Armature_childArmature) end
--[[
	@return [luaIde#cocos2d_Mat4]
]]
function ccs.Bone:getNodeToArmatureTransform() end
--[[
	@return [luaIde#ccs.DisplayManager]
]]
function ccs.Bone:getDisplayManager() end
--[[
	@return [luaIde#ccs.Armature]
]]
function ccs.Bone:getArmature() end
--[[
	@return [luaIde#ccs.BoneData]
]]
function ccs.Bone:getBoneData() end
--[[
	Allocates and initializes a bone.
	@return [luaIde#ccs.Bone]   A initialized bone which is marked as "autorelease".
]]
function ccs.Bone:create() end
--[[
	Allocates and initializes a bone.
	@param  name If name is not null, then set name to the bone's name
	@return [luaIde#ccs.Bone]   A initialized bone which is marked as "autorelease".
]]
function ccs.Bone:create(const_std_string_name) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCBatchNode.h
]]
ccs.BatchNode = {}
--[[
	@return [luaIde#ccs.BatchNode]
]]
function ccs.BatchNode:create() end

--[[
	@SuperType[luaIde#ccs.ProcessBase]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCArmatureAnimation.h
]]
ccs.ArmatureAnimation = {}
--[[
	@return float
]]
function ccs.ArmatureAnimation:getSpeedScale() end
--[[
	Play animation by animation name.
	@param  animationName  The animation name you want to play
	@param  durationTo The frames between two animation changing-over.
	It's meaning is changing to this animation need how many frames
	-1 : use the value from MovementData get from flash design panel
	@param  loop   Whether the animation is loop
	loop < 0 : use the value from MovementData get from flash design panel
	loop = 0 : this animation is not loop
	loop > 0 : this animation is loop
]]
function ccs.ArmatureAnimation:play(const_std_string_animationName,int_durationTo,int_loop) end
--[[
	Go to specified frame and pause current movement.
]]
function ccs.ArmatureAnimation:gotoAndPause(int_frameIndex) end
function ccs.ArmatureAnimation:playWithIndexes(int_durationTo,bool_loop) end
function ccs.ArmatureAnimation:setAnimationData(AnimationData_data) end
--[[
	Scale animation play speed.
	@param animationScale Scale value
]]
function ccs.ArmatureAnimation:setSpeedScale(float_speedScale) end
--[[
	@return [luaIde#ccs.AnimationData]
]]
function ccs.ArmatureAnimation:getAnimationData() end
--[[
	Go to specified frame and play current movement.
	You need first switch to the movement you want to play, then call this function.
	example : playByIndex(0);
	gotoAndPlay(0);
	playByIndex(1);
	gotoAndPlay(0);
	gotoAndPlay(15);
]]
function ccs.ArmatureAnimation:gotoAndPlay(int_frameIndex) end
--[[
	Init with a Armature
	@param armature The Armature ArmatureAnimation will bind to
	@return bool
]]
function ccs.ArmatureAnimation:init(Armature_armature) end
function ccs.ArmatureAnimation:playWithNames(int_durationTo,bool_loop) end
--[[
	Get movement count
	@return ssize_t
]]
function ccs.ArmatureAnimation:getMovementCount() end
function ccs.ArmatureAnimation:playWithIndex(int_animationIndex,int_durationTo,int_loop) end
--[[
	Get current movementID
	@return std_string   The name of current movement
]]
function ccs.ArmatureAnimation:getCurrentMovementID() end
--[[
	Create with a Armature
	@param armature The Armature ArmatureAnimation will bind to
	@return [luaIde#ccs.ArmatureAnimation]
]]
function ccs.ArmatureAnimation:create(Armature_armature) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCArmatureDataManager.h
]]
ccs.ArmatureDataManager = {}
--[[
	@return [luaIde#AnimationData__]
]]
function ccs.ArmatureDataManager:getAnimationDatas() end
--[[
	@brief    remove animation data
	@param     id the id of the animation data
]]
function ccs.ArmatureDataManager:removeAnimationData(const_std_string_id) end
--[[
	Add armature data
	@param id The id of the armature data
	@param armatureData ArmatureData *
]]
function ccs.ArmatureDataManager:addArmatureData(const_std_string_id,ArmatureData_armatureData,const_std_string_configFilePath) end
--[[
	@brief    Add ArmatureFileInfo, it is managed by ArmatureDataManager.
]]
function ccs.ArmatureDataManager:addArmatureFileInfo(const_std_string_configFilePath) end
--[[
	@brief    Add ArmatureFileInfo, it is managed by ArmatureDataManager.
]]
function ccs.ArmatureDataManager:addArmatureFileInfo(const_std_string_imagePath,const_std_string_plistPath,const_std_string_configFilePath) end
function ccs.ArmatureDataManager:removeArmatureFileInfo(const_std_string_configFilePath) end
--[[
	@return [luaIde#TextureData__]
]]
function ccs.ArmatureDataManager:getTextureDatas() end
--[[
	@brief    get texture data
	@param     id the id of the texture data you want to get
	@return [luaIde#ccs.TextureData]   TextureData *
]]
function ccs.ArmatureDataManager:getTextureData(const_std_string_id) end
--[[
	@brief    get armature data
	@param    id the id of the armature data you want to get
	@return [luaIde#ccs.ArmatureData]      ArmatureData *
]]
function ccs.ArmatureDataManager:getArmatureData(const_std_string_id) end
--[[
	@brief    get animation data from _animationDatas(Dictionary)
	@param     id the id of the animation data you want to get
	@return [luaIde#ccs.AnimationData]   AnimationData *
]]
function ccs.ArmatureDataManager:getAnimationData(const_std_string_id) end
--[[
	@brief    add animation data
	@param     id the id of the animation data
	@return AnimationData *
]]
function ccs.ArmatureDataManager:addAnimationData(const_std_string_id,AnimationData_animationData,const_std_string_configFilePath) end
--[[
	Init ArmatureDataManager
	@return bool
]]
function ccs.ArmatureDataManager:init() end
--[[
	@brief    remove armature data
	@param    id the id of the armature data you want to get
]]
function ccs.ArmatureDataManager:removeArmatureData(const_std_string_id) end
--[[
	@return [luaIde#ArmatureData__]
]]
function ccs.ArmatureDataManager:getArmatureDatas() end
--[[
	@brief    remove texture data
	@param     id the id of the texture data you want to get
]]
function ccs.ArmatureDataManager:removeTextureData(const_std_string_id) end
--[[
	@brief    add texture data
	@param     id the id of the texture data
	@return TextureData *
]]
function ccs.ArmatureDataManager:addTextureData(const_std_string_id,TextureData_textureData,const_std_string_configFilePath) end
--[[
	@brief    Judge whether or not need auto load sprite file
	@return bool
]]
function ccs.ArmatureDataManager:isAutoLoadSpriteFile() end
--[[
	@brief    Add sprite frame to CCSpriteFrameCache, it will save display name and it's relative image name
]]
function ccs.ArmatureDataManager:addSpriteFrameFromFile(const_std_string_plistPath,const_std_string_imagePath,const_std_string_configFilePath) end
function ccs.ArmatureDataManager:destroyInstance() end
--[[
	@return [luaIde#ccs.ArmatureDataManager]
]]
function ccs.ArmatureDataManager:getInstance() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCArmature.h
]]
ccs.Armature = {}
--[[
	Get a bone with the specified name
	@param name The bone's name you want to get
	@return [luaIde#ccs.Bone]
]]
function ccs.Armature:getBone(const_std_string_name) end
--[[
	Change a bone's parent with the specified parent name.
	@param bone The bone you want to change parent
	@param parentName The new parent's name.
]]
function ccs.Armature:changeBoneParent(Bone_bone,const_std_string_parentName) end
function ccs.Armature:setAnimation(ArmatureAnimation_animation) end
--[[
	@return [luaIde#ccs.Bone]
]]
function ccs.Armature:getBoneAtPoint(float_x,float_y) end
--[[
	@return bool
]]
function ccs.Armature:getArmatureTransformDirty() end
function ccs.Armature:setVersion(float_version) end
--[[
	Set contentsize and Calculate anchor point.
]]
function ccs.Armature:updateOffsetPoint() end
--[[
	@return [luaIde#ccs.Bone]
]]
function ccs.Armature:getParentBone() end
--[[
	Remove a bone with the specified name. If recursion it will also remove child Bone recursionly.
	@param bone The bone you want to remove
	@param recursion Determine whether remove the bone's child  recursion.
]]
function ccs.Armature:removeBone(Bone_bone,bool_recursion) end
--[[
	@return [luaIde#ccs.BatchNode]
]]
function ccs.Armature:getBatchNode() end
--[[
	Init the empty armature
	@return bool
]]
function ccs.Armature:init() end
--[[
	Init an armature with specified name
	@param name Armature name
	@return bool
]]
function ccs.Armature:init(const_std_string_name) end
function ccs.Armature:setParentBone(Bone_parentBone) end
function ccs.Armature:setBatchNode(BatchNode_batchNode) end
function ccs.Armature:setArmatureData(ArmatureData_armatureData) end
--[[
	Add a Bone to this Armature,
	@param bone  The Bone you want to add to Armature
	@param parentName   The parent Bone's name you want to add to . If it's  nullptr, then set Armature to its parent
]]
function ccs.Armature:addBone(Bone_bone,const_std_string_parentName) end
--[[
	@return [luaIde#ccs.ArmatureData]
]]
function ccs.Armature:getArmatureData() end
--[[
	@return float
]]
function ccs.Armature:getVersion() end
--[[
	@return [luaIde#ccs.ArmatureAnimation]
]]
function ccs.Armature:getAnimation() end
--[[
	@return [luaIde#cocos2d_Vec2]
]]
function ccs.Armature:getOffsetPoints() end
--[[
	@js NA
	@lua NA
]]
function ccs.Armature:setBlendFunc(const_cocos2d_BlendFunc_blendFunc) end
--[[
	Get Armature's bone dictionary
	@return [luaIde#Bone__]   Armature's bone dictionary
]]
function ccs.Armature:getBoneDic() end
--[[
	Allocates and initializes an armature.
	@return [luaIde#ccs.Armature]   An initialized armature which is marked as "autorelease".
]]
function ccs.Armature:create() end
--[[
	Allocates an armature, and use the ArmatureData named name in ArmatureDataManager to initializes the armature.
	@param  name Armature will use the name to find the ArmatureData to initializes it.
	@return [luaIde#ccs.Armature]   A initialized armature which is marked as "autorelease".
]]
function ccs.Armature:create(const_std_string_name) end

--[[
	@SuperType[luaIde#cc.Sprite]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCSkin.h
]]
ccs.Skin = {}
--[[
	@return [luaIde#ccs.Bone]
]]
function ccs.Skin:getBone() end
--[[
	@return [luaIde#cocos2d_Mat4]
]]
function ccs.Skin:getNodeToWorldTransformAR() end
function ccs.Skin:updateArmatureTransform() end
function ccs.Skin:setBone(Bone_bone) end
--[[
	@return [luaIde#ccs.Skin]
]]
function ccs.Skin:create() end
--[[
	@return [luaIde#ccs.Skin]
]]
function ccs.Skin:create(const_std_string_pszFileName) end
--[[
	@return [luaIde#ccs.Skin]
]]
function ccs.Skin:createWithSpriteFrameName(const_std_string_pszSpriteFrameName) end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCComAttribute.h
]]
ccs.ComAttribute = {}
--[[
	@return float
]]
function ccs.ComAttribute:getFloat(const_std_string_key,float_def) end
--[[
	@return std_string
]]
function ccs.ComAttribute:getString(const_std_string_key,const_std_string_def) end
function ccs.ComAttribute:setFloat(const_std_string_key,float_value) end
function ccs.ComAttribute:setString(const_std_string_key,const_std_string_value) end
--[[
	@return bool
]]
function ccs.ComAttribute:getBool(const_std_string_key,bool_def) end
function ccs.ComAttribute:setInt(const_std_string_key,int_value) end
--[[
	@return bool
]]
function ccs.ComAttribute:parse(const_std_string_jsonFile) end
--[[
	@return int
]]
function ccs.ComAttribute:getInt(const_std_string_key,int_def) end
function ccs.ComAttribute:setBool(const_std_string_key,bool_value) end
--[[
	@return [luaIde#ccs.ComAttribute]
]]
function ccs.ComAttribute:create() end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCComAudio.h
]]
ccs.ComAudio = {}
function ccs.ComAudio:stopAllEffects() end
--[[
	@return float
]]
function ccs.ComAudio:getEffectsVolume() end
function ccs.ComAudio:stopEffect(unsigned_int_nSoundId) end
--[[
	@return float
]]
function ccs.ComAudio:getBackgroundMusicVolume() end
--[[
	@return bool
]]
function ccs.ComAudio:willPlayBackgroundMusic() end
function ccs.ComAudio:setBackgroundMusicVolume(float_volume) end
--[[
	play the effect sound path in _filePath
]]
function ccs.ComAudio:start() end
function ccs.ComAudio:stopBackgroundMusic(bool_bReleaseData) end
function ccs.ComAudio:pauseBackgroundMusic() end
--[[
	@return bool
]]
function ccs.ComAudio:isBackgroundMusicPlaying() end
--[[
	@return bool
]]
function ccs.ComAudio:isLoop() end
function ccs.ComAudio:resumeAllEffects() end
function ccs.ComAudio:pauseAllEffects() end
function ccs.ComAudio:preloadBackgroundMusic(const_char_pszFilePath) end
function ccs.ComAudio:playBackgroundMusic(const_char_pszFilePath,bool_bLoop) end
function ccs.ComAudio:playBackgroundMusic() end
--[[
	stop the effect sound which started with latest start()
]]
function ccs.ComAudio:stop() end
--[[
	@return int
]]
function ccs.ComAudio:playEffect(const_char_pszFilePath,bool_bLoop) end
--[[
	@return int
]]
function ccs.ComAudio:playEffect() end
function ccs.ComAudio:preloadEffect(const_char_pszFilePath) end
function ccs.ComAudio:setLoop(bool_bLoop) end
function ccs.ComAudio:unloadEffect(const_char_pszFilePath) end
function ccs.ComAudio:rewindBackgroundMusic() end
function ccs.ComAudio:pauseEffect(unsigned_int_nSoundId) end
function ccs.ComAudio:resumeBackgroundMusic() end
function ccs.ComAudio:setFile(const_char_pszFilePath) end
function ccs.ComAudio:setEffectsVolume(float_volume) end
--[[
	@return char
]]
function ccs.ComAudio:getFile() end
function ccs.ComAudio:resumeEffect(unsigned_int_nSoundId) end
--[[
	@return [luaIde#ccs.ComAudio]
]]
function ccs.ComAudio:create() end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCComController.h
]]
ccs.ComController = {}
--[[
	@return [luaIde#ccs.ComController]
]]
function ccs.ComController:create() end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCComRender.h
]]
ccs.ComRender = {}
function ccs.ComRender:setNode(cocos2d_Node_node) end
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.ComRender:getNode() end
--[[
	@return [luaIde#ccs.ComRender]
]]
function ccs.ComRender:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCSGUIReader.h
]]
ccs.GUIReader = {}
function ccs.GUIReader:setFilePath(const_std_string_strFilePath) end
--[[
	@return [luaIde#cocos2d_ui_Widget]
]]
function ccs.GUIReader:widgetFromJsonFile(const_char_fileName) end
--[[
	@return std_string
]]
function ccs.GUIReader:getFilePath() end
--[[
	@return [luaIde#cocos2d_ui_Widget]
]]
function ccs.GUIReader:widgetFromBinaryFile(const_char_fileName) end
--[[
	@return int
]]
function ccs.GUIReader:getVersionInteger(const_char_str) end
function ccs.GUIReader:destroyInstance() end
--[[
	@return [luaIde#ccs.GUIReader]
]]
function ccs.GUIReader:getInstance() end

ccs.SceneReader = {}
function ccs.SceneReader:setTarget() end
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.SceneReader:createNodeWithSceneFile(const_std_string_fileName,AttachComponentType_attachComponent) end
--[[
	@return [luaIde#AttachComponentType]
]]
function ccs.SceneReader:getAttachComponentType() end
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.SceneReader:getNodeByTag(int_nTag) end
--[[
	@js purge
	@lua destroySceneReader
]]
function ccs.SceneReader:destroyInstance() end
--[[
	@return char
]]
function ccs.SceneReader:sceneReaderVersion() end
--[[
	@return [luaIde#ccs.SceneReader]
]]
function ccs.SceneReader:getInstance() end

ccs.ActionTimelineCache = {}
--[[
	Clone a action with the specified name from the container.
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:createActionFromJson(const_std_string_fileName) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:createActionWithFlatBuffersFile(const_std_string_fileName) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:loadAnimationActionWithFlatBuffersFile(const_std_string_fileName) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:createActionFromContent(const_std_string_fileName,const_std_string_content) end
function ccs.ActionTimelineCache:purge() end
function ccs.ActionTimelineCache:init() end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:loadAnimationActionWithContent(const_std_stringfileName,const_std_string_content) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:loadAnimationActionWithFile(const_std_string_fileName) end
--[[
	Remove action with filename, and also remove other resource relate with this file
]]
function ccs.ActionTimelineCache:removeAction(const_std_string_fileName) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:createActionWithFlatBuffersForSimulator(const_std_string_fileName) end
--[[
	Destroys the singleton
]]
function ccs.ActionTimelineCache:destroyInstance() end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineCache:createAction(const_std_string_fileName) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CSParseBinary_generated.h
]]
ccs.Frame = {}
function ccs.Frame:clone() end 
function ccs.Frame:setTweenType() end 
function ccs.Frame:setNode() end 
function ccs.Frame:setTimeline() end 
function ccs.Frame:isEnterWhenPassed() end 
function ccs.Frame:getTweenType() end 
function ccs.Frame:getEasingParams() end 
function ccs.Frame:setEasingParams() end 
function ccs.Frame:getFrameIndex() end 
function ccs.Frame:apply() end 
function ccs.Frame:isTween() end 
function ccs.Frame:setFrameIndex() end 
function ccs.Frame:setTween() end 
function ccs.Frame:getTimeline() end 
function ccs.Frame:getNode() end 


--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.VisibleFrame = {}
--[[
	@return bool
]]
function ccs.VisibleFrame:isVisible() end
function ccs.VisibleFrame:setVisible(bool_visible) end
--[[
	@return [luaIde#ccs.VisibleFrame]
]]
function ccs.VisibleFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CSParseBinary_generated.h
]]
ccs.TextureFrame = {}
function ccs.TextureFrame:new() end 
function ccs.TextureFrame:getTextureName() end 
function ccs.TextureFrame:setTextureName() end 
function ccs.TextureFrame:create() end 


--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.RotationFrame = {}
function ccs.RotationFrame:setRotation(float_rotation) end
--[[
	@return float
]]
function ccs.RotationFrame:getRotation() end
--[[
	@return [luaIde#ccs.RotationFrame]
]]
function ccs.RotationFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.SkewFrame = {}
--[[
	@return float
]]
function ccs.SkewFrame:getSkewY() end
function ccs.SkewFrame:setSkewX(float_skewx) end
function ccs.SkewFrame:setSkewY(float_skewy) end
--[[
	@return float
]]
function ccs.SkewFrame:getSkewX() end
--[[
	@return [luaIde#ccs.SkewFrame]
]]
function ccs.SkewFrame:create() end

--[[
	@SuperType[luaIde#ccs.SkewFrame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.RotationSkewFrame = {}
--[[
	@return [luaIde#ccs.RotationSkewFrame]
]]
function ccs.RotationSkewFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.PositionFrame = {}
--[[
	@return float
]]
function ccs.PositionFrame:getX() end
--[[
	@return float
]]
function ccs.PositionFrame:getY() end
function ccs.PositionFrame:setPosition(const_cocos2d_Point_position) end
function ccs.PositionFrame:setX(float_x) end
function ccs.PositionFrame:setY(float_y) end
--[[
	@return [luaIde#cocos2d_Point]
]]
function ccs.PositionFrame:getPosition() end
--[[
	@return [luaIde#ccs.PositionFrame]
]]
function ccs.PositionFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CSParseBinary_generated.h
]]
ccs.ScaleFrame = {}
function ccs.ScaleFrame:new() end 
function ccs.ScaleFrame:setScaleY() end 
function ccs.ScaleFrame:setScaleX() end 
function ccs.ScaleFrame:getScaleY() end 
function ccs.ScaleFrame:getScaleX() end 
function ccs.ScaleFrame:setScale() end 
function ccs.ScaleFrame:create() end 


--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.AnchorPointFrame = {}
function ccs.AnchorPointFrame:setAnchorPoint(const_cocos2d_Point_point) end
--[[
	@return [luaIde#cocos2d_Point]
]]
function ccs.AnchorPointFrame:getAnchorPoint() end
--[[
	@return [luaIde#ccs.AnchorPointFrame]
]]
function ccs.AnchorPointFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CSParseBinary_generated.h
]]
ccs.InnerActionFrame = {}
function ccs.InnerActionFrame:new() end 
function ccs.InnerActionFrame:getEndFrameIndex() end 
function ccs.InnerActionFrame:getStartFrameIndex() end 
function ccs.InnerActionFrame:getInnerActionType() end 
function ccs.InnerActionFrame:setEndFrameIndex() end 
function ccs.InnerActionFrame:setEnterWithName() end 
function ccs.InnerActionFrame:setSingleFrameIndex() end 
function ccs.InnerActionFrame:setStartFrameIndex() end 
function ccs.InnerActionFrame:getSingleFrameIndex() end 
function ccs.InnerActionFrame:setInnerActionType() end 
function ccs.InnerActionFrame:setAnimationName() end 
function ccs.InnerActionFrame:create() end 


--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CSParseBinary_generated.h
]]
ccs.ColorFrame = {}
function ccs.ColorFrame:new() end 
function ccs.ColorFrame:getColor() end 
function ccs.ColorFrame:setColor() end 
function ccs.ColorFrame:create() end 


--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.AlphaFrame = {}
--[[
	@return [luaIde#GLubyte]
]]
function ccs.AlphaFrame:getAlpha() end
function ccs.AlphaFrame:setAlpha(GLubyte_alpha) end
--[[
	@return [luaIde#ccs.AlphaFrame]
]]
function ccs.AlphaFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CSParseBinary_generated.h
]]
ccs.EventFrame = {}
function ccs.EventFrame:new() end 
function ccs.EventFrame:setEvent() end 
function ccs.EventFrame:init() end 
function ccs.EventFrame:getEvent() end 
function ccs.EventFrame:create() end 


--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.ZOrderFrame = {}
--[[
	@return int
]]
function ccs.ZOrderFrame:getZOrder() end
function ccs.ZOrderFrame:setZOrder(int_zorder) end
--[[
	@return [luaIde#ccs.ZOrderFrame]
]]
function ccs.ZOrderFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.BlendFuncFrame = {}
--[[
	@return [luaIde#cocos2d_BlendFunc]
]]
function ccs.BlendFuncFrame:getBlendFunc() end
function ccs.BlendFuncFrame:setBlendFunc(cocos2d_BlendFunc_blendFunc) end
--[[
	@return [luaIde#ccs.BlendFuncFrame]
]]
function ccs.BlendFuncFrame:create() end

--[[
	@SuperType[luaIde#ccs.Frame]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCFrame.h
]]
ccs.PlayableFrame = {}
--[[
	@param playact, express the interface in PlayableProtocol, should be "start"  or "stop"
]]
function ccs.PlayableFrame:setPlayableAct(std_string_playact) end
--[[
	@return std_string
]]
function ccs.PlayableFrame:getPlayableAct() end
--[[
	@return [luaIde#ccs.PlayableFrame]
]]
function ccs.PlayableFrame:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCTimeLine.h
]]
ccs.Timeline = {}
--[[
	@return [luaIde#ccs.Timeline]
]]
function ccs.Timeline:clone() end
function ccs.Timeline:gotoFrame(int_frameIndex) end
function ccs.Timeline:setNode(cocos2d_Node_node) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.Timeline:getActionTimeline() end
function ccs.Timeline:insertFrame(Frame_frame,int_index) end
function ccs.Timeline:setActionTag(int_tag) end
function ccs.Timeline:addFrame(Frame_frame) end
--[[
	@return [luaIde#cocos2d_Vector__Frame__]
]]
function ccs.Timeline:getFrames() end
--[[
	@return int
]]
function ccs.Timeline:getActionTag() end
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.Timeline:getNode() end
function ccs.Timeline:removeFrame(Frame_frame) end
function ccs.Timeline:setActionTimeline(ActionTimeline_action) end
function ccs.Timeline:stepToFrame(int_frameIndex) end
--[[
	@return [luaIde#ccs.Timeline]
]]
function ccs.Timeline:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCActionTimeline.h
]]
ccs.ActionTimelineData = {}
function ccs.ActionTimelineData:setActionTag(int_actionTag) end
--[[
	@return bool
]]
function ccs.ActionTimelineData:init(int_actionTag) end
--[[
	@return int
]]
function ccs.ActionTimelineData:getActionTag() end
--[[
	@return [luaIde#ccs.ActionTimelineData]
]]
function ccs.ActionTimelineData:create(int_actionTag) end

--[[
	@SuperType[luaIde#cc.Action]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCActionTimeline.h
]]
ccs.ActionTimeline = {}
--[[
	clear all the callback functions after frameIndexs in this actiontimeline
]]
function ccs.ActionTimeline:clearFrameEndCallFuncs() end
--[[
	add a frame end call back to animation's end frame
	@param animationName  @addFrameEndCallFunc, make the animationName as funcKey
	@param func the callback function
]]
function ccs.ActionTimeline:setAnimationEndCallFunc(const_std_string_animationName) end
--[[
	add Timeline to ActionTimeline
]]
function ccs.ActionTimeline:addTimeline(Timeline_timeline) end
--[[
	Get current frame.
	@return int
]]
function ccs.ActionTimeline:getCurrentFrame() end
--[[
	Start frame index of this actio
	@return int
]]
function ccs.ActionTimeline:getStartFrame() end
--[[
	Pause the animation.
]]
function ccs.ActionTimeline:pause() end
--[[
	@name implement Playable Protocol
]]
function ccs.ActionTimeline:start() end
--[[
	@return bool
]]
function ccs.ActionTimeline:init() end
function ccs.ActionTimeline:removeTimeline(Timeline_timeline) end
function ccs.ActionTimeline:clearFrameEventCallFunc() end
--[[
	Last frame callback will call when arriving last frame
]]
function ccs.ActionTimeline:setLastFrameCallFunc() end
--[[
	@return [luaIde#cocos2d_Vector__Timeline__]
]]
function ccs.ActionTimeline:getTimelines() end
function ccs.ActionTimeline:play(std_string_animationName,bool_loop) end
--[[
	@return [luaIde#AnimationInfo]
]]
function ccs.ActionTimeline:getAnimationInfo(const_std_string_animationName) end
--[[
	Resume the animation.
]]
function ccs.ActionTimeline:resume() end
--[[
	add a callback function after played frameIndex
	@param frameIndex the frame index call back after
	@param funcKey for identity the callback function
	@param func the callback function
]]
function ccs.ActionTimeline:addFrameEndCallFunc(int_frameIndex,const_std_string_funcKey) end
function ccs.ActionTimeline:removeAnimationInfo(std_string_animationName) end
--[[
	Get current animation speed.
	@return float
]]
function ccs.ActionTimeline:getTimeSpeed() end
--[[
	AnimationInf
]]
function ccs.ActionTimeline:addAnimationInfo(const_AnimationInfo_animationInfo) end
--[[
	@return int
]]
function ccs.ActionTimeline:getDuration() end
--[[
	Goto the specified frame index, and pause at this index.
	@param startIndex The animation will pause at this index.
]]
function ccs.ActionTimeline:gotoFrameAndPause(int_startIndex) end
--[[
	Whether or not Action is playing.
	@return bool
]]
function ccs.ActionTimeline:isPlaying() end
--[[
	clear callback functions after frameIndex
]]
function ccs.ActionTimeline:removeFrameEndCallFuncs(int_frameIndex) end
--[[
	Goto the specified frame index, and start playing from this index.
	@param startIndex The animation will play from this index.
]]
function ccs.ActionTimeline:gotoFrameAndPlay(int_startIndex) end
--[[
	Goto the specified frame index, and start playing from this index.
	@param startIndex The animation will play from this index.
	@param loop Whether or not the animation need loop.
]]
function ccs.ActionTimeline:gotoFrameAndPlay(int_startIndex,bool_loop) end
--[[
	Goto the specified frame index, and start playing from start index, end at end index.
	@param startIndex The animation will play from this index.
	@param endIndex The animation will end at this index.
	@param loop Whether or not the animation need loop.
]]
function ccs.ActionTimeline:gotoFrameAndPlay(int_startIndex,int_endIndex,bool_loop) end
--[[
	Goto the specified frame index, and start playing from start index, end at end index.
	@param startIndex The animation will play from this index.
	@param endIndex The animation will end at this index.
	@param currentFrameIndex set current frame index.
	@param loop Whether or not the animation need loop.
]]
function ccs.ActionTimeline:gotoFrameAndPlay(int_startIndex,int_endIndex,int_currentFrameIndex,bool_loop) end
--[[
	@return bool
]]
function ccs.ActionTimeline:IsAnimationInfoExists(const_std_string_animationName) end
--[[
	End frame of this action.
	When action play to this frame, if action is not loop, then it will stop,
	or it will play from start frame again.
	@return int
]]
function ccs.ActionTimeline:getEndFrame() end
--[[
	Set the animation speed, this will speed up or slow down the speed.
]]
function ccs.ActionTimeline:setTimeSpeed(float_speed) end
function ccs.ActionTimeline:clearLastFrameCallFunc() end
--[[
	duration of the whole actio
]]
function ccs.ActionTimeline:setDuration(int_duration) end
--[[
	Set current frame index, this will cause action plays to this frame.
]]
function ccs.ActionTimeline:setCurrentFrame(int_frameIndex) end
--[[
	remove callback function after frameIndex which identified with funcKey
]]
function ccs.ActionTimeline:removeFrameEndCallFunc(int_frameIndex,const_std_string_funcKey) end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimeline:create() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCActionTimelineNode.h
]]
ccs.ActionTimelineNode = {}
--[[
	@return [luaIde#cocos2d_Node]
]]
function ccs.ActionTimelineNode:getRoot() end
--[[
	@return [luaIde#ccs.ActionTimeline]
]]
function ccs.ActionTimelineNode:getActionTimeline() end
function ccs.ActionTimelineNode:setActionTimeline(ActionTimeline_action) end
--[[
	@return bool
]]
function ccs.ActionTimelineNode:init() end
function ccs.ActionTimelineNode:setRoot(cocos2d_Node_root) end
--[[
	@return [luaIde#ccs.ActionTimelineNode]
]]
function ccs.ActionTimelineNode:create(cocos2d_Node_root,ActionTimeline_action) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCBoneNode.h
]]
ccs.BoneNode = {}
--[[
	@return float
]]
function ccs.BoneNode:getDebugDrawWidth() end
--[[
	get child bone list
	@return [luaIde#cocos2d_Vector__BoneNode__]
]]
function ccs.BoneNode:getChildBones() end
function ccs.BoneNode:getBlendFunc() end
--[[
	@brief: get all bones in this bone tree
	@return [luaIde#cocos2d_Vector__BoneNode__]
]]
function ccs.BoneNode:getAllSubBones() end
--[[
	blendFunc
]]
function ccs.BoneNode:setBlendFunc(const_cocos2d_BlendFunc_blendFunc) end
--[[
	when bone's added to skeleton, DebugDrawEnabled controlled by skeleton's DebugDrawEnabled
]]
function ccs.BoneNode:setDebugDrawEnabled(bool_isDebugDraw) end
--[[
	get displayings rect in self transform
	@return [luaIde#cocos2d_Rect]
]]
function ccs.BoneNode:getVisibleSkinsRect() end
--[[
	@brief: get all skins in this bone tree
	@return [luaIde#cocos2d_Vector__SkinNode__]
]]
function ccs.BoneNode:getAllSubSkins() end
--[[
	@brief: display skin
	@param: hideOthers, set other skins invisible
]]
function ccs.BoneNode:displaySkin(SkinNode_skin,bool_hideOthers) end
--[[
	@brief: display all skins named skinName, if hide display only one skin,
	prefer to use display(SkinNode* skin, bool hideOthers = false)
	@param: hideOthers, set other skins invisible
]]
function ccs.BoneNode:displaySkin(const_std_string_skinName,bool_hideOthers) end
--[[
	@return bool
]]
function ccs.BoneNode:isDebugDrawEnabled() end
--[[
	@brief: add a skin
	@param: display, whether display this skin
]]
function ccs.BoneNode:addSkin(SkinNode_skin,bool_display) end
--[[
	@brief: add a skin
	@param: display, whether display this skin
	@param: hideOthers, whether hide other skins added to this bone
]]
function ccs.BoneNode:addSkin(SkinNode_skin,bool_display,bool_hideOthers) end
--[[
	get this bone's root skeleton, return null while bone is not in a skeleton
	@return [luaIde#ccs.SkeletonNode]
]]
function ccs.BoneNode:getRootSkeletonNode() end
--[[
	bone's debug draw's length
]]
function ccs.BoneNode:setDebugDrawLength(float_length) end
--[[
	get skins in this bone's children
	@return [luaIde#cocos2d_Vector__SkinNode__]
]]
function ccs.BoneNode:getSkins() end
--[[
	@return [luaIde#cocos2d_Vector__SkinNode__]
]]
function ccs.BoneNode:getVisibleSkins() end
--[[
	bone's debug draw's width
]]
function ccs.BoneNode:setDebugDrawWidth(float_width) end
--[[
	@return float
]]
function ccs.BoneNode:getDebugDrawLength() end
--[[
	bone's debug draw's width
]]
function ccs.BoneNode:setDebugDrawColor(const_cocos2d_Color4F_color) end
--[[
	@return [luaIde#cocos2d_Color4F]
]]
function ccs.BoneNode:getDebugDrawColor() end
--[[
	@return [luaIde#ccs.BoneNode]
]]
function ccs.BoneNode:create() end

--[[
	@SuperType[luaIde#ccs.BoneNode]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/ActionTimeline/CCSkeletonNode.h
]]
ccs.SkeletonNode = {}
--[[
	get bonenode in skeleton node by bone name
	@return [luaIde#ccs.BoneNode]
]]
function ccs.SkeletonNode:getBoneNode(const_std_string_boneName) end
--[[
	@brief: change displays
	@param: boneSkinNameMap, map <name of bone, name of skin to display which added to bone>
]]
function ccs.SkeletonNode:changeSkins(_boneSkinNameMap) end
--[[
	@brief: change displays
	@param: skinGroupName have
]]
function ccs.SkeletonNode:changeSkins(const_std_string_skinGroupName) end
--[[
	@brief: add a boneSkinNameMap as a SkinGroup named groupName
	@param: groupName, key
	@param: boneSkinNameMap, map <name of bone, name of skin to display which added to bone>
]]
function ccs.SkeletonNode:addSkinGroup(std_string_groupName,boneSkinNameMap) end
--[[
	get All bones in this skeleton, <bone's name, BoneNode>
	@return [luaIde#BoneNode__]
]]
function ccs.SkeletonNode:getAllSubBonesMap() end
--[[
	@return [luaIde#ccs.SkeletonNode]
]]
function ccs.SkeletonNode:create() end

--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/editor-support/cocostudio/CCComExtensionData.h
]]
ccs.ComExtensionData = {}
function ccs.ComExtensionData:setActionTag(int_actionTag) end
--[[
	@return std_string
]]
function ccs.ComExtensionData:getCustomProperty() end
--[[
	@return int
]]
function ccs.ComExtensionData:getActionTag() end
function ccs.ComExtensionData:setCustomProperty(const_std_string_customProperty) end
--[[
	@return [luaIde#ccs.ComExtensionData]
]]
function ccs.ComExtensionData:create() end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UILayoutParameter.h
]]
ccui.LayoutParameter = {}
--[[
	Create a copy of original LayoutParameter.
	@return [luaIde#ccui.LayoutParameter]   A LayoutParameter pointer.
]]
function ccui.LayoutParameter:clone() end
--[[
	Gets LayoutParameterType of LayoutParameter.
	@see LayoutParameterType.
	@return [luaIde#Type]   LayoutParameterType
]]
function ccui.LayoutParameter:getLayoutType() end
--[[
	Create a cloned instance of LayoutParameter.
	@return [luaIde#ccui.LayoutParameter]   A LayoutParameter pointer.
]]
function ccui.LayoutParameter:createCloneInstance() end
--[[
	Copy all the member field from argument LayoutParameter to self.
	@param model A LayoutParameter instance.
]]
function ccui.LayoutParameter:copyProperties(LayoutParameter_model) end
--[[
	Create a empty LayoutParameter.
	@return [luaIde#ccui.LayoutParameter]   A autorelease LayoutParameter instance.
]]
function ccui.LayoutParameter:create() end

--[[
	@SuperType[luaIde#ccui.LayoutParameter]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UILayoutParameter.h
]]
ccui.LinearLayoutParameter = {}
--[[
	Sets LinearGravity parameter for LayoutParameter.
	@see LinearGravity
	@param gravity Gravity in LinearGravity.
]]
function ccui.LinearLayoutParameter:setGravity(LinearGravity_gravity) end
--[[
	Gets LinearGravity parameter for LayoutParameter.
	@see LinearGravity
	@return [luaIde#LinearGravity]   LinearGravity
]]
function ccui.LinearLayoutParameter:getGravity() end
--[[
	Create a empty LinearLayoutParameter instance.
	@return [luaIde#ccui.LinearLayoutParameter]   A initialized LayoutParameter which is marked as "autorelease".
]]
function ccui.LinearLayoutParameter:create() end

--[[
	@SuperType[luaIde#ccui.LayoutParameter]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UILayoutParameter.h
]]
ccui.RelativeLayoutParameter = {}
--[[
	Sets RelativeAlign parameter for LayoutParameter.
	@see RelativeAlign
	@param align Relative align in  `RelativeAlign`.
]]
function ccui.RelativeLayoutParameter:setAlign(RelativeAlign_align) end
--[[
	Set widget name your widget want to relative to.
	@param name Relative widget name.
]]
function ccui.RelativeLayoutParameter:setRelativeToWidgetName(const_std_string_name) end
--[[
	Get a name of LayoutParameter in Relative Layout.
	@return std_string   name Relative name in string.
]]
function ccui.RelativeLayoutParameter:getRelativeName() end
--[[
	Get the relative widget name.
	@return std_string   name A relative widget name in string.
]]
function ccui.RelativeLayoutParameter:getRelativeToWidgetName() end
--[[
	Set a name for LayoutParameter in Relative Layout.
	@param name A string name.
]]
function ccui.RelativeLayoutParameter:setRelativeName(const_std_string_name) end
--[[
	Get RelativeAlign parameter for LayoutParameter.
	@see RelativeAlign
	@return [luaIde#RelativeAlign]    A RelativeAlign variable.
]]
function ccui.RelativeLayoutParameter:getAlign() end
--[[
	Create a RelativeLayoutParameter instance.
	@return [luaIde#ccui.RelativeLayoutParameter]   A initialized LayoutParameter which is marked as "autorelease".
]]
function ccui.RelativeLayoutParameter:create() end

--[[
	@SuperType[luaIde#cc.ProtectedNode]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIWidget.h
]]
ccui.Widget = {}
--[[
	Toggle layout component enable.
	@param enable Layout Component of a widget
]]
function ccui.Widget:setLayoutComponentEnabled(bool_enable) end
--[[
	Changes the percent that is widget's percent size
	@param percent that is widget's percent size
]]
function ccui.Widget:setSizePercent(const_Vec2_percent) end
--[[
	Get the user defined widget size.
	@return [luaIde#cc.Size]   User defined size.
]]
function ccui.Widget:getCustomSize() end
--[[
	Gets the left boundary position of this widget in parent's coordination system.
	@return float   The left boundary position of this widget.
]]
function ccui.Widget:getLeftBoundary() end
--[[
	Sets whether the widget should be flipped horizontally or not.
	@param flippedX true if the widget should be flipped horizontally, false otherwise.
]]
function ccui.Widget:setFlippedX(bool_flippedX) end
--[[
	Set callback name.
	@param callbackName A string representation of callback name.
]]
function ccui.Widget:setCallbackName(const_std_string_callbackName) end
--[[
	Gets the inner Renderer node of widget.
	For example, a button's Virtual Renderer is it's texture renderer.
	@return [luaIde#cc.Node]   Node pointer.
]]
function ccui.Widget:getVirtualRenderer() end
--[[
	@brief Allow widget touch events to propagate to its parents. Set false will disable propagation
	@param isPropagate  True to allow propagation, false otherwise.
	@since v3.3
]]
function ccui.Widget:setPropagateTouchEvents(bool_isPropagate) end
--[[
	Query whether unify size enable state.
	@return bool   true represent the widget use Unify Size, false represent the widget couldn't use Unify Size
]]
function ccui.Widget:isUnifySizeEnabled() end
--[[
	Get size percent of widget.
	@return [luaIde#cc.Vec2]   Percent size.
]]
function ccui.Widget:getSizePercent() end
--[[
	Set the percent(x,y) of the widget in OpenGL coordinates
	@param percent  The percent (x,y) of the widget in OpenGL coordinates
]]
function ccui.Widget:setPositionPercent(const_Vec2_percent) end
--[[
	Toggle widget swallow touch option.
	@brief Specify widget to swallow touches or not
	@param swallow True to swallow touch, false otherwise.
	@since v3.3
]]
function ccui.Widget:setSwallowTouches(bool_swallow) end
--[[
	Get the content size of widget.
	@warning This API exists mainly for keeping back compatibility.
	@return [luaIde#cc.Size]  
]]
function ccui.Widget:getLayoutSize() end
--[[
	Sets whether the widget is highlighted
	The default value is false, a widget is default to not highlighted
	@param highlight   true if the widget is highlighted, false if the widget is not highlighted.
]]
function ccui.Widget:setHighlighted(bool_highlight) end
--[[
	Changes the position type of the widget
	@see `PositionType`
	@param type  the position type of widget
]]
function ccui.Widget:setPositionType(PositionType_type) end
--[[
	Query whether the widget ignores user defined content size or not
	@return bool   True means ignore user defined content size, false otherwise.
]]
function ccui.Widget:isIgnoreContentAdaptWithSize() end
--[[
	Get the virtual renderer's size
	@return [luaIde#cc.Size]   Widget virtual renderer size.
]]
function ccui.Widget:getVirtualRendererSize() end
--[[
	Determines if the widget is highlighted
	@return bool   true if the widget is highlighted, false if the widget is not highlighted.
]]
function ccui.Widget:isHighlighted() end
--[[
	Gets LayoutParameter of widget.
	@see LayoutParameter
	@return [luaIde#ccui.LayoutParameter]   LayoutParameter
]]
function ccui.Widget:getLayoutParameter() end
--[[
	Gets LayoutParameter of widget.
	@see LayoutParameter
	@deprecated use `getLayoutParameter()` instead.
	@param type  Relative or Linear
	@return [luaIde#ccui.LayoutParameter]   LayoutParameter
]]
function ccui.Widget:getLayoutParameter(LayoutParameter_Type_type) end
--[[
	Gets the position type of the widget
	@see `PositionType`
	@return [luaIde#PositionType]   type  the position type of widget
]]
function ccui.Widget:getPositionType() end
--[[
	Gets the top boundary position of this widget in parent's coordination system.
	@return float   The top boundary position of this widget.
]]
function ccui.Widget:getTopBoundary() end
--[[
	Toggle whether ignore user defined content size for widget.
	Set true will ignore user defined content size which means
	the widget size is always equal to the return value of `getVirtualRendererSize`.
	@param ignore set member variable _ignoreSize to ignore
]]
function ccui.Widget:ignoreContentAdaptWithSize(bool_ignore) end
--[[
	When a widget is in a layout, you could call this method to get the next focused widget within a specified direction.
	If the widget is not in a layout, it will return itself
	@param direction the direction to look for the next focused widget in a layout
	@param current  the current focused widget
	@return [luaIde#ccui.Widget]   the next focused widget in a layout
]]
function ccui.Widget:findNextFocusedWidget(FocusDirection_direction,Widget_current) end
--[[
	Determines if the widget is enabled or not.
	@return bool   true if the widget is enabled, false if the widget is disabled.
]]
function ccui.Widget:isEnabled() end
--[[
	Query whether widget is focused or not.
	@return bool    whether the widget is focused or not
]]
function ccui.Widget:isFocused() end
--[[
	Gets the touch began point of widget when widget is selected.
	@return [luaIde#cc.Vec2]   the touch began point.
]]
function ccui.Widget:getTouchBeganPosition() end
--[[
	Determines if the widget is touch enabled
	@return bool   true if the widget is touch enabled, false if the widget is touch disabled.
]]
function ccui.Widget:isTouchEnabled() end
--[[
	Query callback name.
	@return std_string   The callback name.
]]
function ccui.Widget:getCallbackName() end
--[[
	Get the action tag.
	@return int   Action tag.
]]
function ccui.Widget:getActionTag() end
--[[
	Gets position of widget in world space.
	@return [luaIde#cc.Vec2]   Position of widget in world space.
]]
function ccui.Widget:getWorldPosition() end
--[[
	Query widget's focus enable state.
	@return bool   true represent the widget could accept focus, false represent the widget couldn't accept focus
]]
function ccui.Widget:isFocusEnabled() end
--[[
	Toggle widget focus status.
	@param focus  pass true to let the widget get focus or pass false to let the widget lose focus
]]
function ccui.Widget:setFocused(bool_focus) end
--[[
	Set the tag of action.
	@param tag  A integer tag value.
]]
function ccui.Widget:setActionTag(int_tag) end
--[[
	Sets whether the widget is touch enabled.
	The default value is false, a widget is default to touch disabled.
	@param enabled   True if the widget is touch enabled, false if the widget is touch disabled.
]]
function ccui.Widget:setTouchEnabled(bool_enabled) end
--[[
	Sets whether the widget should be flipped vertically or not.
	@param flippedY true if the widget should be flipped vertically, false otherwise.
]]
function ccui.Widget:setFlippedY(bool_flippedY) end
--[[
	Sets whether the widget is enabled
	true if the widget is enabled, widget may be touched , false if the widget is disabled, widget cannot be touched.
	Note: If you want to change the widget's appearance  to disabled state, you should also call  `setBright(false)`.
	The default value is true, a widget is default to enable touch.
	@param enabled Set to true to enable touch, false otherwise.
]]
function ccui.Widget:setEnabled(bool_enabled) end
--[[
	Gets the right boundary position of this widget in parent's coordination system.
	@return float   The right boundary position of this widget.
]]
function ccui.Widget:getRightBoundary() end
--[[
	To set the bright style of widget.
	@see BrightStyle
	@param style   BrightStyle::NORMAL means the widget is in normal state, BrightStyle::HIGHLIGHT means the widget is in highlight state.
]]
function ccui.Widget:setBrightStyle(BrightStyle_style) end
--[[
	Sets a LayoutParameter to widget.
	@see LayoutParameter
	@param parameter LayoutParameter pointer
]]
function ccui.Widget:setLayoutParameter(LayoutParameter_parameter) end
--[[
	Create a new widget copy of the original one.
	@return [luaIde#ccui.Widget]   A cloned widget copy of original.
]]
function ccui.Widget:clone() end
--[[
	Allow widget to accept focus.
	@param enable pass true/false to enable/disable the focus ability of a widget
]]
function ccui.Widget:setFocusEnabled(bool_enable) end
--[[
	Gets the bottom boundary position of this widget in parent's coordination system.
	@return float   The bottom boundary position of this widget.
]]
function ccui.Widget:getBottomBoundary() end
--[[
	Determines if the widget is bright
	@return bool   true if the widget is bright, false if the widget is dark.
]]
function ccui.Widget:isBright() end
--[[
	Dispatch a EventFocus through a EventDispatcher
	@param widgetLoseFocus  The widget which lose its focus
	@param widgetGetFocus he widget which get its focus
]]
function ccui.Widget:dispatchFocusEvent(Widget_widgetLoseFocus,Widget_widgetGetFocus) end
--[[
	Toggle use unify size.
	@param enable True to use unify size, false otherwise.
]]
function ccui.Widget:setUnifySizeEnabled(bool_enable) end
--[[
	Return whether the widget is propagate touch events to its parents or not
	@return bool   whether touch event propagation is allowed or not.
	@since v3.3
]]
function ccui.Widget:isPropagateTouchEvents() end
--[[
	Checks a point is in widget's content space.
	This function is used for determining touch area of widget.
	@param pt        The point in `Vec2`.
	@param camera    The camera look at widget, used to convert GL screen point to near/far plane.
	@param p         Point to a Vec3 for store the intersect point, if don't need them set to nullptr.
	@return bool   true if the point is in widget's content space, false otherwise.
]]
function ccui.Widget:hitTest(const_Vec2_pt,const_Camera_camera,Vec3_p) end
--[[
	Query whether layout component is enabled or not.
	@return bool   true represent the widget use Layout Component, false represent the widget couldn't use Layout Component.
]]
function ccui.Widget:isLayoutComponentEnabled() end
--[[
	when a widget calls this method, it will get focus immediately.
]]
function ccui.Widget:requestFocus() end
--[[
	Update all children's contents size and position recursively.
	@see `updateSizeAndPosition(const Size&)`
]]
function ccui.Widget:updateSizeAndPosition() end
--[[
	Update all children's contents size and position recursively.
]]
function ccui.Widget:updateSizeAndPosition(const_Size_parentSize) end
--[[
	This method is called when a focus change event happens
	@param widgetLostFocus  The widget which lose its focus
	@param widgetGetFocus  The widget which get its focus
]]
function ccui.Widget:onFocusChange(Widget_widgetLostFocus,Widget_widgetGetFocus) end
--[[
	Gets the touch move point of widget when widget is selected.
	@return [luaIde#cc.Vec2]   the touch move point.
]]
function ccui.Widget:getTouchMovePosition() end
--[[
	Gets the size type of widget.
	@see `SizeType`
	@return [luaIde#SizeType]
]]
function ccui.Widget:getSizeType() end
--[[
	Query callback type.
	@return std_string   Callback type string.
]]
function ccui.Widget:getCallbackType() end
--[[
	Gets the touch end point of widget when widget is selected.
	@return [luaIde#cc.Vec2]   the touch end point.
]]
function ccui.Widget:getTouchEndPosition() end
--[[
	Gets the percent (x,y) of the widget in OpenGL coordinates
	@see setPosition(const Vec2&)
	@return [luaIde#cc.Vec2]   The percent (x,y) of the widget in OpenGL coordinates
]]
function ccui.Widget:getPositionPercent() end
--[[
	@brief Propagate touch events to its parents
]]
function ccui.Widget:propagateTouchEvent(TouchEventType_event,Widget_sender,Touch_touch) end
--[[
	Returns the flag which indicates whether the widget is flipped horizontally or not.
	It not only flips the texture of the widget, but also the texture of the widget's children.
	Also, flipping relies on widget's anchor point.
	Internally, it just use setScaleX(-1) to flip the widget.
	@return bool   true if the widget is flipped horizontally, false otherwise.
]]
function ccui.Widget:isFlippedX() end
--[[
	Return the flag which indicates whether the widget is flipped vertically or not.
	It not only flips the texture of the widget, but also the texture of the widget's children.
	Also, flipping relies on widget's anchor point.
	Internally, it just use setScaleY(-1) to flip the widget.
	@return bool   true if the widget is flipped vertically, false otherwise.
]]
function ccui.Widget:isFlippedY() end
--[[
	Checks a point if in parent's area.
	@param pt A point in `Vec2`.
	@return bool   true if the point is in parent's area, false otherwise.
]]
function ccui.Widget:isClippingParentContainsPoint(const_Vec2_pt) end
--[[
	Changes the size type of widget.
	@see `SizeType`
	@param type that is widget's size type
]]
function ccui.Widget:setSizeType(SizeType_type) end
--[[
	@brief Sends the touch event to widget's parent, if a widget wants to handle touch event under another widget,
	it must override this function.
	@param  event  the touch event type, it could be BEGAN/MOVED/CANCELED/ENDED
	@param parent
	@param point
]]
function ccui.Widget:interceptTouchEvent(TouchEventType_event,Widget_sender,Touch_touch) end
--[[
	Sets whether the widget is bright
	The default value is true, a widget is default to bright
	@param bright   true if the widget is bright, false if the widget is dark.
]]
function ccui.Widget:setBright(bool_bright) end
--[[
	Set callback type.
	@param callbackType A string representation of callback type.
]]
function ccui.Widget:setCallbackType(const_std_string_callbackType) end
--[[
	Return whether the widget is swallowing touch or not
	@return bool   Whether touch is swallowed.
	@since v3.3
]]
function ccui.Widget:isSwallowTouches() end
--[[
	Call this method with parameter true to enable the Android Dpad focus navigation feature
	@param enable  set true to enable dpad focus navigation, otherwise disenable dpad focus navigation
]]
function ccui.Widget:enableDpadNavigation(bool_enable) end
--[[
	Return a current focused widget in your UI scene.
	No matter what widget object you call this method on , it will return you the exact one focused widget.
	@param isWidget  if your set isWidget to true, it will return the _realFocusedWidget which is always a widget
	otherwise, it will return a widget or a layout.
	@deprecated use `getCurrentFocusedWidget` instead.
	@return [luaIde#ccui.Widget]
]]
function ccui.Widget:getCurrentFocusedWidget(bool_isWidget) end
--[[
	Return a current focused widget in your UI scene.
	No matter what widget object you call this method on , it will return you the exact one focused widget.
	@return [luaIde#ccui.Widget]
]]
function ccui.Widget:getCurrentFocusedWidget() end
--[[
	Create and return a empty Widget instance pointer.
	@return [luaIde#ccui.Widget]
]]
function ccui.Widget:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UILayout.h
]]
ccui.Layout = {}
--[[
	Sets background color vector for layout.
	This setting only take effect when layout's color type is BackGroundColorType::GRADIENT
	@param vector The color vector in `Vec2`.
]]
function ccui.Layout:setBackGroundColorVector(const_Vec2_vector) end
--[[
	Change the clipping type of layout.
	On default, the clipping type is `ClippingType::STENCIL`.
	@see `ClippingType`
	@param type The clipping type of layout.
]]
function ccui.Layout:setClippingType(ClippingType_type) end
--[[
	Sets Color Type for layout's background
	@param type   @see `BackGroundColorType`
]]
function ccui.Layout:setBackGroundColorType(BackGroundColorType_type) end
--[[
	If a layout is loop focused which means that the focus movement will be inside the layout
	@param loop  pass true to let the focus movement loop inside the layout
]]
function ccui.Layout:setLoopFocus(bool_loop) end
--[[
	Set layout's background image color.
	@param color Background color value in `Color3B`.
]]
function ccui.Layout:setBackGroundImageColor(const_Color3B_color) end
--[[
	Get the layout's background color vector.
	@return [luaIde#cc.Vec2]   Background color vector.
]]
function ccui.Layout:getBackGroundColorVector() end
--[[
	@see `setClippingType(ClippingType)`
	@return [luaIde#ClippingType]
]]
function ccui.Layout:getClippingType() end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Layout:getRenderFile() end
--[[
	@return bool   If focus loop is enabled, then it will return true, otherwise it returns false. The default value is false.
]]
function ccui.Layout:isLoopFocus() end
--[[
	Remove the background image of layout.
]]
function ccui.Layout:removeBackGroundImage() end
--[[
	Get the layout's background color opacity.
	@return [luaIde#GLubyte]   Background color opacity value.
]]
function ccui.Layout:getBackGroundColorOpacity() end
--[[
	Gets if layout is clipping enabled.
	@return bool   if layout is clipping enabled.
]]
function ccui.Layout:isClippingEnabled() end
--[[
	Set opacity of background image.
	@param opacity Background image opacity in GLubyte.
]]
function ccui.Layout:setBackGroundImageOpacity(GLubyte_opacity) end
--[[
	Sets a background image for layout.
	@param fileName image file path.
	@param texType @see TextureResType.
]]
function ccui.Layout:setBackGroundImage(const_std_string_fileName,TextureResType_texType) end
--[[
	Set background color for layout
	The color only applies to layout when it's color type is BackGroundColorType::SOLIDE
	@param color Color in Color3B.
]]
function ccui.Layout:setBackGroundColor(const_Color3B_color) end
--[[
	Set start and end background color for layout.
	This setting only take effect when the layout's  color type is BackGroundColorType::GRADIENT
	@param startColor Color value in Color3B.
	@param endColor Color value in Color3B.
]]
function ccui.Layout:setBackGroundColor(const_Color3B_startColor,const_Color3B_endColor) end
--[[
	request to refresh widget layout
]]
function ccui.Layout:requestDoLayout() end
--[[
	Query background image's capInsets size.
	@return [luaIde#cc.Rect]   The background image capInsets.
]]
function ccui.Layout:getBackGroundImageCapInsets() end
--[[
	Query the layout's background color.
	@return [luaIde#Color3B]   Background color in Color3B.
]]
function ccui.Layout:getBackGroundColor() end
--[[
	Toggle layout clipping.
	If you do need clipping, you pass true to this function.
	@param enabled Pass true to enable clipping, false otherwise.
]]
function ccui.Layout:setClippingEnabled(bool_enabled) end
--[[
	Get color of layout's background image.
	@return [luaIde#Color3B]   Layout's background image color.
]]
function ccui.Layout:getBackGroundImageColor() end
--[[
	Query background image scale9 enable status.
	@return bool   Whether background image is scale9 enabled or not.
]]
function ccui.Layout:isBackGroundImageScale9Enabled() end
--[[
	Query the layout's background color type.
	@return [luaIde#BackGroundColorType]   The layout's background color type.
]]
function ccui.Layout:getBackGroundColorType() end
--[[
	Get the gradient background end color.
	@return [luaIde#Color3B]   Gradient background end color value.
]]
function ccui.Layout:getBackGroundEndColor() end
--[[
	Sets background color opacity of layout.
	@param opacity The opacity in `GLubyte`.
]]
function ccui.Layout:setBackGroundColorOpacity(GLubyte_opacity) end
--[[
	Get the opacity of layout's background image.
	@return [luaIde#GLubyte]   The opacity of layout's background image.
]]
function ccui.Layout:getBackGroundImageOpacity() end
--[[
	@return bool   To query whether the layout will pass the focus to its children or not. The default value is true
]]
function ccui.Layout:isPassFocusToChild() end
--[[
	Sets a background image capinsets for layout, it only affects the scale9 enabled background image
	@param capInsets  The capInsets in Rect.
]]
function ccui.Layout:setBackGroundImageCapInsets(const_Rect_capInsets) end
--[[
	Gets background image texture size.
	@return [luaIde#cc.Size]   background image texture size.
]]
function ccui.Layout:getBackGroundImageTextureSize() end
--[[
	force refresh widget layout
]]
function ccui.Layout:forceDoLayout() end
--[[
	Query layout type.
	@return [luaIde#Type]   Get the layout type.
]]
function ccui.Layout:getLayoutType() end
--[[
	@param pass To specify whether the layout pass its focus to its child
]]
function ccui.Layout:setPassFocusToChild(bool_pass) end
--[[
	Get the gradient background start color.
	@return [luaIde#Color3B]    Gradient background start color value.
]]
function ccui.Layout:getBackGroundStartColor() end
--[[
	Enable background image scale9 rendering.
	@param enabled  True means enable scale9 rendering for background image, false otherwise.
]]
function ccui.Layout:setBackGroundImageScale9Enabled(bool_enabled) end
--[[
	Change the layout type.
	@param type Layout type.
]]
function ccui.Layout:setLayoutType(Type_type) end
--[[
	Create a empty layout.
	@return [luaIde#ccui.Layout]
]]
function ccui.Layout:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIButton.h
]]
ccui.Button = {}
--[[
	@return [luaIde#cc.Size]
]]
function ccui.Button:getNormalTextureSize() end
--[[
	Query the button title content.
	@return std_string   Get the button's title content.
]]
function ccui.Button:getTitleText() end
--[[
	replaces the current Label node with a new one
]]
function ccui.Button:setTitleLabel(Label_label) end
--[[
	Change the font size of button's title
	@param size Title font size in float.
]]
function ccui.Button:setTitleFontSize(float_size) end
function ccui.Button:resetPressedRender() end
--[[
	Enable scale9 renderer.
	@param enable Set to true will use scale9 renderer, false otherwise.
]]
function ccui.Button:setScale9Enabled(bool_enable) end
function ccui.Button:resetDisabledRender() end
--[[
	Return the inner title renderer of Button.
	@return [luaIde#cc.Label]   The button title.
	@since v3.3
]]
function ccui.Button:getTitleRenderer() end
--[[
	@brief Return the nine-patch sprite of clicked state
	@return [luaIde#ccui.Scale9Sprite]   the nine-patch sprite of clicked state
	@since v3.9
]]
function ccui.Button:getRendererClicked() end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Button:getDisabledFile() end
--[[
	@brief Return a zoom scale
	@return float   the zoom scale in float
	@since v3.3
]]
function ccui.Button:getZoomScale() end
--[[
	Return the capInsets of disabled state scale9sprite.
	@return [luaIde#cc.Rect]   The disabled scale9 renderer capInsets.
]]
function ccui.Button:getCapInsetsDisabledRenderer() end
--[[
	Change the color of button's title.
	@param color The title color in Color3B.
]]
function ccui.Button:setTitleColor(const_Color3B_color) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Button:getNormalFile() end
function ccui.Button:resetNormalRender() end
--[[
	@brief Return the nine-patch sprite of disabled state
	@return [luaIde#ccui.Scale9Sprite]   the nine-patch sprite of disabled state
	@since v3.9
]]
function ccui.Button:getRendererDisabled() end
--[[
	Sets capInsets for button, only the disabled state scale9 renderer will be affected.
	@param capInsets  capInsets in Rect.
]]
function ccui.Button:setCapInsetsDisabledRenderer(const_Rect_capInsets) end
--[[
	Sets capInsets for button.
	The capInset affects  all button scale9 renderer only if `setScale9Enabled(true)` is called
	@param capInsets    capInset in Rect.
]]
function ccui.Button:setCapInsets(const_Rect_capInsets) end
--[[
	Load disabled state texture for button.
	@param disabled    dark state texture.
	@param texType    @see `TextureResType`
]]
function ccui.Button:loadTextureDisabled(const_std_string_disabled,TextureResType_texType) end
function ccui.Button:loadTextureDisabled(SpriteFrame_disabledSpriteFrame) end
--[[
	@return bool
]]
function ccui.Button:init() end
--[[
	Change the content of button's title.
	@param text The title in std::string.
]]
function ccui.Button:setTitleText(const_std_string_text) end
--[[
	Sets capInsets for button, only the normal state scale9 renderer will be affected.
	@param capInsets    capInsets in Rect.
]]
function ccui.Button:setCapInsetsNormalRenderer(const_Rect_capInsets) end
--[[
	Load selected state texture for button.
	@param selected    selected state texture.
	@param texType    @see `TextureResType`
]]
function ccui.Button:loadTexturePressed(const_std_string_selected,TextureResType_texType) end
function ccui.Button:loadTexturePressed(SpriteFrame_pressedSpriteFrame) end
--[[
	Change the font name of button's title
	@param fontName a font name string.
]]
function ccui.Button:setTitleFontName(const_std_string_fontName) end
--[[
	Return the capInsets of normal state scale9sprite.
	@return [luaIde#cc.Rect]   The normal scale9 renderer capInsets.
]]
function ccui.Button:getCapInsetsNormalRenderer() end
--[[
	Sets the title's text horizontal alignment.
	@param hAlignment see TextHAlignment
]]
function ccui.Button:setTitleAlignment(TextHAlignment_hAlignment) end
--[[
	Sets the title's text vertical alignment.
	@param hAlignment see TextHAlignment.
	@param vAlignment see TextVAlignment.
]]
function ccui.Button:setTitleAlignment(TextHAlignment_hAlignment,TextVAlignment_vAlignment) end
--[[
	Return the capInsets of pressed state scale9sprite.
	@return [luaIde#cc.Rect]   The pressed scale9 renderer capInsets.
]]
function ccui.Button:getCapInsetsPressedRenderer() end
--[[
	Query whether button is using scale9 renderer or not.
	@return bool   whether button use scale9 renderer or not.
]]
function ccui.Button:isScale9Enabled() end
--[[
	Load normal state texture for button.
	@param normal    normal state texture.
	@param texType    @see `TextureResType`
]]
function ccui.Button:loadTextureNormal(const_std_string_normal,TextureResType_texType) end
function ccui.Button:loadTextureNormal(SpriteFrame_normalSpriteFrame) end
--[[
	Sets capInsets for button, only the pressed state scale9 renderer will be affected.
	@param capInsets    capInsets in Rect
]]
function ccui.Button:setCapInsetsPressedRenderer(const_Rect_capInsets) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Button:getPressedFile() end
--[[
	returns the current Label being used
	@return [luaIde#cc.Label]
]]
function ccui.Button:getTitleLabel() end
--[[
	Query the font size of button title
	@return float   font size in float.
]]
function ccui.Button:getTitleFontSize() end
--[[
	@brief Return the nine-patch sprite of normal state
	@return [luaIde#ccui.Scale9Sprite]   the nine-patch sprite of normal state
	@since v3.9
]]
function ccui.Button:getRendererNormal() end
--[[
	Query the font name of button's title
	@return std_string   font name in std::string
]]
function ccui.Button:getTitleFontName() end
--[[
	Query the button title color.
	@return [luaIde#Color3B]   Color3B of button title.
]]
function ccui.Button:getTitleColor() end
--[[
	Enable zooming action when button is pressed.
	@param enabled Set to true will enable zoom effect, false otherwise.
]]
function ccui.Button:setPressedActionEnabled(bool_enabled) end
--[[
	@brief When user pressed the button, the button will zoom to a scale.
	The final scale of the button  equals (button original scale + _zoomScale)
	@since v3.3
]]
function ccui.Button:setZoomScale(float_scale) end
--[[
	Create a empty Button.
	@return [luaIde#ccui.Button]   A empty Button instance.
]]
function ccui.Button:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIAbstractCheckButton.h
]]
ccui.AbstractCheckButton = {}
--[[
	@return [luaIde#ResourceData]
]]
function ccui.AbstractCheckButton:getCrossDisabledFile() end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.AbstractCheckButton:getBackDisabledFile() end
--[[
	Load background selected state texture for check button.
	@param backGroundSelected    The background selected state image name.
	@param texType    @see `Widget::TextureResType`
]]
function ccui.AbstractCheckButton:loadTextureBackGroundSelected(const_std_string_backGroundSelected,TextureResType_texType) end
function ccui.AbstractCheckButton:loadTextureBackGroundSelected(SpriteFrame_spriteFrame) end
--[[
	Load background disabled state texture for checkbox.
	@param backGroundDisabled    The background disabled state texture name.
	@param texType    @see `Widget::TextureResType`
]]
function ccui.AbstractCheckButton:loadTextureBackGroundDisabled(const_std_string_backGroundDisabled,TextureResType_texType) end
function ccui.AbstractCheckButton:loadTextureBackGroundDisabled(SpriteFrame_spriteframe) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.AbstractCheckButton:getCrossNormalFile() end
--[[
	Change CheckBox state.
	Set to true will cause the CheckBox's state to "selected", false otherwise.
	@param selected Set to true will change CheckBox to selected state, false otherwise.
]]
function ccui.AbstractCheckButton:setSelected(bool_selected) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.AbstractCheckButton:getBackPressedFile() end
--[[
	@brief Return the sprite instance of front cross when disabled
	@return [luaIde#cc.Sprite]   the sprite instance of front cross when disabled
]]
function ccui.AbstractCheckButton:getRendererFrontCrossDisabled() end
--[[
	@brief Return the sprite instance of background
	@return [luaIde#cc.Sprite]   the sprite instance of background.
]]
function ccui.AbstractCheckButton:getRendererBackground() end
--[[
	Load cross texture for check button.
	@param crossTextureName    The cross texture name.
	@param texType    @see `Widget::TextureResType`
]]
function ccui.AbstractCheckButton:loadTextureFrontCross(const_std_string_crossTextureName,TextureResType_texType) end
function ccui.AbstractCheckButton:loadTextureFrontCross(SpriteFrame_spriteframe) end
--[[
	@brief Return the sprite instance of background when disabled
	@return [luaIde#cc.Sprite]   the sprite instance of background when disabled
]]
function ccui.AbstractCheckButton:getRendererBackgroundDisabled() end
--[[
	Query whether CheckBox is selected or not.
	@return bool   true means "selected", false otherwise.
]]
function ccui.AbstractCheckButton:isSelected() end
--[[
	@return bool
]]
function ccui.AbstractCheckButton:init() end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.AbstractCheckButton:getBackNormalFile() end
--[[
	@brief Return a zoom scale
	@return float   A zoom scale of Checkbox.
	@since v3.3
]]
function ccui.AbstractCheckButton:getZoomScale() end
--[[
	@brief Return the sprite instance of front cross
	@return [luaIde#cc.Sprite]   the sprite instance of front cross
]]
function ccui.AbstractCheckButton:getRendererFrontCross() end
--[[
	@brief Return the sprite instance of background when selected
	@return [luaIde#cc.Sprite]   the sprite instance of background when selected
]]
function ccui.AbstractCheckButton:getRendererBackgroundSelected() end
--[[
	Load background texture for check button.
	@param backGround   The background image name.
	@param type    @see `Widget::TextureResType`
]]
function ccui.AbstractCheckButton:loadTextureBackGround(const_std_string_backGround,TextureResType_type) end
function ccui.AbstractCheckButton:loadTextureBackGround(SpriteFrame_spriteFrame) end
--[[
	When user pressed the CheckBox, the button will zoom to a scale.
	The final scale of the CheckBox  equals (CheckBox original scale + _zoomScale)
	@since v3.3
]]
function ccui.AbstractCheckButton:setZoomScale(float_scale) end
--[[
	Load frontcross disabled texture for checkbox.
	@param frontCrossDisabled    The front cross disabled state texture name.
	@param texType    @see `Widget::TextureResType`
]]
function ccui.AbstractCheckButton:loadTextureFrontCrossDisabled(const_std_string_frontCrossDisabled,TextureResType_texType) end
function ccui.AbstractCheckButton:loadTextureFrontCrossDisabled(SpriteFrame_spriteframe) end

--[[
	@SuperType[luaIde#ccui.AbstractCheckButton]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UICheckBox.h
]]
ccui.CheckBox = {}
--[[
	Add a callback function which would be called when checkbox is selected or unselected.
	@param callback A std::function with type @see `ccCheckBoxCallback`
]]
function ccui.CheckBox:addEventListener(const_ccCheckBoxCallback_callback) end
--[[
	Create and return a empty CheckBox instance pointer.
	@return [luaIde#ccui.CheckBox]
]]
function ccui.CheckBox:create() end

--[[
	@SuperType[luaIde#ccui.AbstractCheckButton]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRadioButton.h
]]
ccui.RadioButton = {}
--[[
	Add a callback function which would be called when radio button is selected or unselected.
	@param callback A std::function with type @see `ccRadioButtonCallback`
]]
function ccui.RadioButton:addEventListener(const_ccRadioButtonCallback_callback) end
--[[
	Create and return a empty RadioButton instance pointer.
	@return [luaIde#ccui.RadioButton]
]]
function ccui.RadioButton:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRadioButton.h
]]
ccui.RadioButtonGroup = {}
--[[
	Remove a radio button from this group.
	@param radio button instance
]]
function ccui.RadioButtonGroup:removeRadioButton(RadioButton_radioButton) end
--[[
	Query whether no-selection is allowed or not.
	@param true means no-selection is allowed, false means no-selection is not allowed.
	@return bool
]]
function ccui.RadioButtonGroup:isAllowedNoSelection() end
--[[
	Get the index of selected radio button.
	@return int   the selected button's index. Returns -1 if no button is selected.
]]
function ccui.RadioButtonGroup:getSelectedButtonIndex() end
--[[
	Set a flag for allowing no-selection feature.
	If it is allowed, no radio button can be selected.
	If it is not allowed, one radio button must be selected all time except it is empty.
	Default is not allowed.
	@param true means allowing no-selection, false means disallowing no-selection.
]]
function ccui.RadioButtonGroup:setAllowedNoSelection(bool_allowedNoSelection) end
--[[
	Select a radio button by index without event dispatch.
	@param index of the radio button
]]
function ccui.RadioButtonGroup:setSelectedButtonWithoutEvent(int_index) end
--[[
	Select a radio button by instance without event dispatch.
	@param radio button instance
]]
function ccui.RadioButtonGroup:setSelectedButtonWithoutEvent(RadioButton_radioButton) end
--[[
	Add a callback function which would be called when radio button is selected or unselected.
	@param callback A std::function with type @see `ccRadioButtonGroupCallback`
]]
function ccui.RadioButtonGroup:addEventListener(const_ccRadioButtonGroupCallback_callback) end
--[[
	Remove all radio button from this group.
]]
function ccui.RadioButtonGroup:removeAllRadioButtons() end
--[[
	Get a radio button in this group by index.
	@param index of the radio button
	@return [luaIde#ccui.RadioButton]   radio button instance. Returns nullptr if out of index.
]]
function ccui.RadioButtonGroup:getRadioButtonByIndex(int_index) end
--[[
	Get the number of radio buttons in this group.
	@return ssize_t   the number of radio buttons in this group
]]
function ccui.RadioButtonGroup:getNumberOfRadioButtons() end
--[[
	Add a radio button into this group.
	@param radio button instance
]]
function ccui.RadioButtonGroup:addRadioButton(RadioButton_radioButton) end
--[[
	Select a radio button by index.
	@param index of the radio button
]]
function ccui.RadioButtonGroup:setSelectedButton(int_index) end
--[[
	Select a radio button by instance.
	@param radio button instance
]]
function ccui.RadioButtonGroup:setSelectedButton(RadioButton_radioButton) end
--[[
	Create and return a empty RadioButtonGroup instance pointer.
	@return [luaIde#ccui.RadioButtonGroup]
]]
function ccui.RadioButtonGroup:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIImageView.h
]]
ccui.ImageView = {}
--[[
	Load texture for imageview.
	@param fileName   file name of texture.
	@param texType    @see `Widget::TextureResType`
]]
function ccui.ImageView:loadTexture(const_std_string_fileName,TextureResType_texType) end
function ccui.ImageView:loadTexture(SpriteFrame_spriteframe) end
--[[
	Sets the source blending function.
	@param blendFunc A structure with source and destination factor to specify pixel arithmetic. e.g. {GL_ONE, GL_ONE}, {GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA}.
	@js NA
	@lua NA
]]
function ccui.ImageView:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	@return bool
]]
function ccui.ImageView:init() end
--[[
	Enable scale9 renderer.
	@param enabled Set to true will use scale9 renderer, false otherwise.
]]
function ccui.ImageView:setScale9Enabled(bool_enabled) end
--[[
	Updates the texture rect of the ImageView in points.
	It will call setTextureRect:rotated:untrimmedSize with rotated = NO, and utrimmedSize = rect.size.
]]
function ccui.ImageView:setTextureRect(const_Rect_rect) end
--[[
	Sets capInsets for imageview.
	The capInsets affects the ImageView's renderer only if `setScale9Enabled(true)` is called.
	@param capInsets    capinsets for imageview
]]
function ccui.ImageView:setCapInsets(const_Rect_capInsets) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.ImageView:getRenderFile() end
--[[
	Get ImageView's capInsets size.
	@return [luaIde#cc.Rect]   Query capInsets size in Rect
	@see `setCapInsets(const Rect&)`
]]
function ccui.ImageView:getCapInsets() end
--[[
	Query whether button is using scale9 renderer or not.
	@return bool   whether button use scale9 renderer or not.
]]
function ccui.ImageView:isScale9Enabled() end
--[[
	Create a empty ImageView.
	@return [luaIde#ccui.ImageView]
]]
function ccui.ImageView:create() end
--[[
	Create a  imageview  with a image name.
	@param imageFileName   file name of texture.
	@param texType    @see `Widget::TextureResType`
	@return [luaIde#ccui.ImageView]   A ImageView instance.
]]
function ccui.ImageView:create(const_std_string_imageFileName,TextureResType_texType) end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIText.h
]]
ccui.Text = {}
--[[
	Gets the font size of label.
	@return float   The font size.
]]
function ccui.Text:getFontSize() end
--[[
	@return std_string
]]
function ccui.Text:getString() end
--[[
	Disable all text effects, including shadow, outline and glow.
]]
function ccui.Text:disableEffect() end
--[[
	Disable specific text effect.
	Use LabelEffect parameter to specify which effect should be disabled.
	@see `LabelEffect`
]]
function ccui.Text:disableEffect(LabelEffect_effect) end
--[[
	Return current effect type.
	@return [luaIde#LabelEffect]
]]
function ccui.Text:getLabelEffectType() end
--[[
	Gets text color.
	@return [luaIde#Color4B]   Text color.
]]
function ccui.Text:getTextColor() end
--[[
	Sets text vertical alignment.
	@param alignment vertical text alignment type
]]
function ccui.Text:setTextVerticalAlignment(TextVAlignment_alignment) end
--[[
	Sets the font name of label.
	If you are trying to use a system font, you could just pass a font name
	If you are trying to use a TTF, you should pass a file path to the TTF file
	Usage:
	@code
	//create a system font UIText
	Text *text = Text::create("Hello", "Arial", 20);
	// it will change the font to system font no matter the previous font type is TTF or system font
	text->setFontName("Marfelt");
	//it will change the font to TTF font no matter the previous font type is TTF or system font
	text->setFontName("xxxx/xxx.ttf");
	@endcode
	@param name Font name.
]]
function ccui.Text:setFontName(const_std_string_name) end
--[[
	Sets the touch scale enabled of label.
	@param enabled Touch scale enabled of label.
]]
function ccui.Text:setTouchScaleChangeEnabled(bool_enabled) end
--[[
	Return shadow effect offset value.
	@return [luaIde#cc.Size]
]]
function ccui.Text:getShadowOffset() end
function ccui.Text:setString(const_std_string_text) end
--[[
	Return the outline effect size value.
	@return int
]]
function ccui.Text:getOutlineSize() end
--[[
	@return bool
]]
function ccui.Text:init() end
--[[
	Return the shadow effect blur radius.
	@return float
]]
function ccui.Text:getShadowBlurRadius() end
--[[
	Gets the touch scale enabled of label.
	@return bool    Touch scale enabled of label.
]]
function ccui.Text:isTouchScaleChangeEnabled() end
--[[
	Gets the font name.
	@return std_string   Font name.
]]
function ccui.Text:getFontName() end
--[[
	Sets the rendering size of the text, you should call this method
	along with calling `ignoreContentAdaptWithSize(false)`, otherwise the text area
	size is calculated by the real size of the text content.
	@param size The text rendering area size.
]]
function ccui.Text:setTextAreaSize(const_Size_size) end
--[[
	Gets the string length of the label.
	Note: This length will be larger than the raw string length,
	if you want to get the raw string length,
	you should call this->getString().size() instead.
	@return ssize_t    String length.
]]
function ccui.Text:getStringLength() end
--[[
	Gets the render size in auto mode.
	@return [luaIde#cc.Size]   The size of render size in auto mode.
]]
function ccui.Text:getAutoRenderSize() end
--[[
	Enable outline for the label.
	It only works on IOS and Android when you use System fonts.
	@param outlineColor The color of outline.
	@param outlineSize The size of outline.
]]
function ccui.Text:enableOutline(const_Color4B_outlineColor,int_outlineSize) end
--[[
	Return current effect color value.
	@return [luaIde#Color4B]
]]
function ccui.Text:getEffectColor() end
--[[
	Gets the font type.
	@return [luaIde#Type]   The font type.
]]
function ccui.Text:getType() end
--[[
	Gets text horizontal alignment.
	@return [luaIde#TextHAlignment]   Horizontal text alignment type
]]
function ccui.Text:getTextHorizontalAlignment() end
--[[
	Return whether the shadow effect is enabled.
	@return bool
]]
function ccui.Text:isShadowEnabled() end
--[[
	Sets the font size of label.
	@param size The font size.
]]
function ccui.Text:setFontSize(float_size) end
--[[
	Return the shadow effect color value.
	@return [luaIde#Color4B]
]]
function ccui.Text:getShadowColor() end
--[[
	Sets text color.
	@param color Text color.
]]
function ccui.Text:setTextColor(const_Color4B_color) end
--[[
	Only support for TTF.
	@param glowColor The color of glow.
]]
function ccui.Text:enableGlow(const_Color4B_glowColor) end
--[[
	Provides a way to treat each character like a Sprite.
	@warning No support system font.
	@return [luaIde#cc.Sprite]
]]
function ccui.Text:getLetter(int_lettetIndex) end
--[[
	Gets text vertical alignment.
	@return [luaIde#TextVAlignment]   Vertical text alignment type
]]
function ccui.Text:getTextVerticalAlignment() end
--[[
	Return the text rendering area size.
	@return [luaIde#cc.Size]   The text rendering area size.
]]
function ccui.Text:getTextAreaSize() end
--[[
	Sets text horizontal alignment.
	@param alignment Horizontal text alignment type
]]
function ccui.Text:setTextHorizontalAlignment(TextHAlignment_alignment) end
--[[
	Create a Text object.
	@return [luaIde#ccui.Text]   An autoreleased Text object.
]]
function ccui.Text:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UITextAtlas.h
]]
ccui.TextAtlas = {}
--[[
	Gets the string length of the label.
	Note: This length will be larger than the raw string length,
	if you want to get the raw string length, you should call this->getString().size() instead
	@return ssize_t    string length.
]]
function ccui.TextAtlas:getStringLength() end
--[[
	Get string value for labelatlas.
	@return std_string   The string value of TextAtlas.
]]
function ccui.TextAtlas:getString() end
--[[
	Set string value for labelatlas.
	@param value A given string needs to be displayed.
]]
function ccui.TextAtlas:setString(const_std_string_value) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.TextAtlas:getRenderFile() end
--[[
	@js NA
]]
function ccui.TextAtlas:adaptRenderers() end
--[[
	Create a TexAtlas object.
	@return [luaIde#ccui.TextAtlas]   An autoreleased TextAtlas object.
]]
function ccui.TextAtlas:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UILoadingBar.h
]]
ccui.LoadingBar = {}
--[[
	Changes the progress value of LoadingBar.
	@param percent   Percent value from 1 to 100.
]]
function ccui.LoadingBar:setPercent(float_percent) end
--[[
	Load texture for LoadingBar.
	@param texture   File name of texture.
	@param texType   Texture resource type,@see TextureResType.
]]
function ccui.LoadingBar:loadTexture(const_std_string_texture,TextureResType_texType) end
function ccui.LoadingBar:loadTexture(SpriteFrame_spriteframe) end
--[[
	Change the progress direction of LoadingBar.
	@see Direction  `LEFT` means progress left to right, `RIGHT` otherwise.
	@param direction Direction
]]
function ccui.LoadingBar:setDirection(Direction_direction) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.LoadingBar:getRenderFile() end
--[[
	Enable scale9 renderer.
	@param enabled Set to true will use scale9 renderer, false otherwise.
]]
function ccui.LoadingBar:setScale9Enabled(bool_enabled) end
--[[
	Set capInsets for LoadingBar.
	This setting only take effect when enable scale9 renderer.
	@param capInsets CapInset in `Rect`.
]]
function ccui.LoadingBar:setCapInsets(const_Rect_capInsets) end
--[[
	Get the progress direction of LoadingBar.
	@see Direction  `LEFT` means progress left to right, `RIGHT` otherwise.
	@return [luaIde#Direction]   LoadingBar progress direction.
]]
function ccui.LoadingBar:getDirection() end
--[[
	@brief Query LoadingBar's capInsets.
	@return [luaIde#cc.Rect]   CapInsets of LoadingBar.
]]
function ccui.LoadingBar:getCapInsets() end
--[[
	@brief Query whether LoadingBar is using scale9 renderer or not.
	@return bool   Whether LoadingBar uses scale9 renderer or not.
]]
function ccui.LoadingBar:isScale9Enabled() end
--[[
	Get the progress value of LoadingBar.
	@return float   Progress value from 1 to 100.
]]
function ccui.LoadingBar:getPercent() end
--[[
	Create an empty LoadingBar.
	@return [luaIde#ccui.LoadingBar]   A LoadingBar instance.
]]
function ccui.LoadingBar:create() end
--[[
	@brief Create a LoadingBar with a texture name and a predefined progress value.
	@param textureName LoadingBar background texture name.
	@param percentage A percentage in float.
	@return [luaIde#ccui.LoadingBar]   A LoadingBar instance.
]]
function ccui.LoadingBar:create(const_std_string_textureName,float_percentage) end

--[[
	@SuperType[luaIde#ccui.ScrollView]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIListView.h
]]
ccui.ListView = {}
--[[
	Set the gravity of ListView.
	@see `ListViewGravity`
]]
function ccui.ListView:setGravity(Gravity_gravity) end
--[[
	Removes the last item of ListView.
]]
function ccui.ListView:removeLastItem() end
--[[
	Get the left padding in ListView
	@return float   Left padding in float
]]
function ccui.ListView:getLeftPadding() end
--[[
	@brief Query the center item
	@return [luaIde#ccui.Widget]   An item instance.
]]
function ccui.ListView:getCenterItemInCurrentView() end
--[[
	@brief Query current selected widget's index.
	@return ssize_t   An index of a selected item.
]]
function ccui.ListView:getCurSelectedIndex() end
--[[
	Get the time in seconds to scroll between items.
	@return float   The time in seconds to scroll between items
	@see setScrollDuration(float)
]]
function ccui.ListView:getScrollDuration() end
--[[
	Query whether the magnetic out of boundary is allowed.
	@return bool
]]
function ccui.ListView:getMagneticAllowedOutOfBoundary() end
--[[
	@brief Query margin between each item in ListView.
	@return float   A margin in float.
]]
function ccui.ListView:getItemsMargin() end
--[[
	@brief Scroll to specific item
	@param positionRatioInView Specifies the position with ratio in list view's content size.
	@param itemAnchorPoint Specifies an anchor point of each item for position to calculate distance.
	@param timeInSec Scroll time
]]
function ccui.ListView:scrollToItem(ssize_t_itemIndex,const_Vec2_positionRatioInView,const_Vec2_itemAnchorPoint) end
--[[
	@brief Jump to specific item
	@param itemIndex Specifies the item's index
	@param positionRatioInView Specifies the position with ratio in list view's content size.
	@param itemAnchorPoint Specifies an anchor point of each item for position to calculate distance.
]]
function ccui.ListView:jumpToItem(ssize_t_itemIndex,const_Vec2_positionRatioInView,const_Vec2_itemAnchorPoint) end
--[[
	Change padding with top padding
	@param t Top padding in float
]]
function ccui.ListView:setTopPadding(float_t) end
--[[
	Return the index of specified widget.
	@param item  A widget pointer.
	@return ssize_t   The index of a given widget in ListView.
]]
function ccui.ListView:getIndex(Widget_item) end
--[[
	Insert a  custom item into the end of ListView.
	@param item An item in `Widget*`.
]]
function ccui.ListView:pushBackCustomItem(Widget_item) end
--[[
	@brief Set current selected widget's index and call TouchEventType::ENDED event.
	@param itemIndex A index of a selected item.
]]
function ccui.ListView:setCurSelectedIndex(int_itemIndex) end
--[[
	Insert a default item(create by cloning model) into listview at a give index.
	@param index  An index in ssize_t.
]]
function ccui.ListView:insertDefaultItem(ssize_t_index) end
--[[
	Set magnetic type of ListView.
	@see `MagneticType`
]]
function ccui.ListView:setMagneticType(MagneticType_magneticType) end
--[[
	Set magnetic allowed out of boundary.
]]
function ccui.ListView:setMagneticAllowedOutOfBoundary(bool_magneticAllowedOutOfBoundary) end
--[[
	Add an event click callback to ListView, then one item of Listview is clicked, the callback will be called.
	@param callback A callback function with type of `ccListViewCallback`.
]]
function ccui.ListView:addEventListener(const_ccListViewCallback_callback) end
--[[
	override methods
]]
function ccui.ListView:doLayout() end
--[[
	@brief Query the topmost item in horizontal list
	@return [luaIde#ccui.Widget]   An item instance.
]]
function ccui.ListView:getTopmostItemInCurrentView() end
--[[
	Change padding with left, top, right, and bottom padding.
	@param l Left padding in float.
	@param t Top margin in float.
	@param r Right margin in float.
	@param b Bottom margin in float.
]]
function ccui.ListView:setPadding(float_l,float_t,float_r,float_b) end
--[[
	@brief Remove all items in current ListView.
]]
function ccui.ListView:removeAllItems() end
--[[
	Get the right padding in ListView
	@return float   Right padding in float
]]
function ccui.ListView:getRightPadding() end
--[[
	@brief Query the bottommost item in horizontal list
	@return [luaIde#ccui.Widget]   An item instance.
]]
function ccui.ListView:getBottommostItemInCurrentView() end
--[[
	Return all items in a ListView.
	@return [luaIde#Vector__Widget__]  s A vector of widget pointers.
]]
function ccui.ListView:getItems() end
--[[
	@brief Query the leftmost item in horizontal list
	@return [luaIde#ccui.Widget]   An item instance.
]]
function ccui.ListView:getLeftmostItemInCurrentView() end
--[[
	Set the margin between each item in ListView.
	@param margin A margin in float.
]]
function ccui.ListView:setItemsMargin(float_margin) end
--[[
	Get magnetic type of ListView.
	@return [luaIde#MagneticType]
]]
function ccui.ListView:getMagneticType() end
--[[
	Return an item at a given index.
	@param index A given index in ssize_t.
	@return [luaIde#ccui.Widget]   A widget instance.
]]
function ccui.ListView:getItem(ssize_t_index) end
--[[
	Remove an item at given index.
	@param index A given index in ssize_t.
]]
function ccui.ListView:removeItem(ssize_t_index) end
--[[
	Get the top padding in ListView
	@return float   Top padding in float
]]
function ccui.ListView:getTopPadding() end
--[[
	Insert a default item(create by a cloned model) at the end of the listview.
]]
function ccui.ListView:pushBackDefaultItem() end
--[[
	Change padding with left padding
	@param l Left padding in float.
]]
function ccui.ListView:setLeftPadding(float_l) end
--[[
	@brief Query the closest item to a specific position in inner container.
	@param targetPosition Specifies the target position in inner container's coordinates.
	@param itemAnchorPoint Specifies an anchor point of each item for position to calculate distance.
	@return [luaIde#ccui.Widget]   An item instance if list view is not empty. Otherwise, returns null.
]]
function ccui.ListView:getClosestItemToPosition(const_Vec2_targetPosition,const_Vec2_itemAnchorPoint) end
--[[
	Change padding with bottom padding
	@param b Bottom padding in float
]]
function ccui.ListView:setBottomPadding(float_b) end
--[[
	Set the time in seconds to scroll between items.
	Subsequent calls of function 'scrollToItem', will take 'time' seconds for scrolling.
	@param time The seconds needed to scroll between two items. 'time' must be >= 0
	@see scrollToItem(ssize_t, const Vec2&, const Vec2&)
]]
function ccui.ListView:setScrollDuration(float_time) end
--[[
	@brief Query the closest item to a specific position in current view.
	For instance, to find the item in the center of view, call 'getClosestItemToPositionInCurrentView(Vec2::ANCHOR_MIDDLE, Vec2::ANCHOR_MIDDLE)'.
	@param positionRatioInView Specifies the target position with ratio in list view's content size.
	@param itemAnchorPoint Specifies an anchor point of each item for position to calculate distance.
	@return [luaIde#ccui.Widget]   An item instance if list view is not empty. Otherwise, returns null.
]]
function ccui.ListView:getClosestItemToPositionInCurrentView(const_Vec2_positionRatioInView,const_Vec2_itemAnchorPoint) end
--[[
	@brief Query the rightmost item in horizontal list
	@return [luaIde#ccui.Widget]   An item instance.
]]
function ccui.ListView:getRightmostItemInCurrentView() end
--[[
	Change padding with right padding
	@param r Right padding in float
]]
function ccui.ListView:setRightPadding(float_r) end
--[[
	Set an item model for listview.
	When calling `pushBackDefaultItem`, the model will be used as a blueprint and new model copy will be inserted into ListView.
	@param model  Model in `Widget*`.
]]
function ccui.ListView:setItemModel(Widget_model) end
--[[
	Get the bottom padding in ListView
	@return float   Bottom padding in float
]]
function ccui.ListView:getBottomPadding() end
--[[
	@brief Insert a custom widget into ListView at a given index.
	@param item A widget pointer to be inserted.
	@param index A given index in ssize_t.
]]
function ccui.ListView:insertCustomItem(Widget_item,ssize_t_index) end
--[[
	Create an empty ListView.
	@return [luaIde#ccui.ListView]   A ListView instance.
]]
function ccui.ListView:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UISlider.h
]]
ccui.Slider = {}
--[[
	Changes the progress direction of slider.
	@param percent  Percent value from 1 to 100.
]]
function ccui.Slider:setPercent(int_percent) end
--[[
	Query the maximum percent of Slider. The default value is 100.
	@since v3.7
	@return int   The maximum percent of the Slider.
]]
function ccui.Slider:getMaxPercent() end
--[[
	Load normal state texture for slider ball.
	@param normal    Normal state texture.
	@param resType    @see TextureResType .
]]
function ccui.Slider:loadSlidBallTextureNormal(const_std_string_normal,TextureResType_resType) end
function ccui.Slider:loadSlidBallTextureNormal(SpriteFrame_spriteframe) end
--[[
	Load dark state texture for slider progress bar.
	@param fileName   File path of texture.
	@param resType    @see TextureResType .
]]
function ccui.Slider:loadProgressBarTexture(const_std_string_fileName,TextureResType_resType) end
function ccui.Slider:loadProgressBarTexture(SpriteFrame_spriteframe) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Slider:getBallNormalFile() end
--[[
	@return [luaIde#cc.Sprite]
]]
function ccui.Slider:getSlidBallDisabledRenderer() end
--[[
	Sets if slider is using scale9 renderer.
	@param able True that using scale9 renderer, false otherwise.
]]
function ccui.Slider:setScale9Enabled(bool_able) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Slider:getBallPressedFile() end
--[[
	@brief Return a zoom scale
	@since v3.3
	@return float
]]
function ccui.Slider:getZoomScale() end
--[[
	Sets capinsets for progress bar slider, if slider is using scale9 renderer.
	@param capInsets Capinsets for progress bar slider.
	@js NA
]]
function ccui.Slider:setCapInsetProgressBarRenderer(const_Rect_capInsets) end
--[[
	@return [luaIde#cc.Node]
]]
function ccui.Slider:getSlidBallRenderer() end
--[[
	Add call back function called when slider's percent has changed to slider.
	@param callback An given call back function called when slider's percent has changed to slider.
]]
function ccui.Slider:addEventListener(const_ccSliderCallback_callback) end
--[[
	Set a large value could give more control to the precision.
	@since v3.7
	@param percent The max percent of Slider.
]]
function ccui.Slider:setMaxPercent(int_percent) end
--[[
	Load texture for slider bar.
	@param fileName   File name of texture.
	@param resType    @see TextureResType .
]]
function ccui.Slider:loadBarTexture(const_std_string_fileName,TextureResType_resType) end
function ccui.Slider:loadBarTexture(SpriteFrame_spriteframe) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Slider:getProgressBarFile() end
--[[
	Gets capinsets for bar slider, if slider is using scale9 renderer.
	@return [luaIde#cc.Rect]   capInsets Capinsets for bar slider.
]]
function ccui.Slider:getCapInsetsBarRenderer() end
--[[
	Gets capinsets for progress bar slider, if slider is using scale9 renderer.
	@return [luaIde#cc.Rect]   Capinsets for progress bar slider.
	@js NA
]]
function ccui.Slider:getCapInsetsProgressBarRenderer() end
--[[
	@return [luaIde#cc.Sprite]
]]
function ccui.Slider:getSlidBallPressedRenderer() end
--[[
	Load pressed state texture for slider ball.
	@param pressed    Pressed state texture.
	@param resType    @see TextureResType .
]]
function ccui.Slider:loadSlidBallTexturePressed(const_std_string_pressed,TextureResType_resType) end
function ccui.Slider:loadSlidBallTexturePressed(SpriteFrame_spriteframe) end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Slider:getBackFile() end
--[[
	Gets If slider is using scale9 renderer.
	@return bool   True that using scale9 renderer, false otherwise.
]]
function ccui.Slider:isScale9Enabled() end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.Slider:getBallDisabledFile() end
--[[
	Sets capinsets for bar slider, if slider is using scale9 renderer.
	@param capInsets Capinsets for bar slider.
]]
function ccui.Slider:setCapInsetsBarRenderer(const_Rect_capInsets) end
--[[
	Gets the progress direction of slider.
	@return int   percent Percent value from 1 to 100.
]]
function ccui.Slider:getPercent() end
--[[
	Sets capinsets for slider, if slider is using scale9 renderer.
	@param capInsets Capinsets for slider.
]]
function ccui.Slider:setCapInsets(const_Rect_capInsets) end
--[[
	Load disabled state texture for slider ball.
	@param disabled   Disabled state texture.
	@param resType    @see TextureResType .
]]
function ccui.Slider:loadSlidBallTextureDisabled(const_std_string_disabled,TextureResType_resType) end
function ccui.Slider:loadSlidBallTextureDisabled(SpriteFrame_spriteframe) end
--[[
	@return [luaIde#cc.Sprite]
]]
function ccui.Slider:getSlidBallNormalRenderer() end
--[[
	When user pressed the button, the button will zoom to a scale.
	The final scale of the button  equals (button original scale + _zoomScale)
	@since v3.3
]]
function ccui.Slider:setZoomScale(float_scale) end
--[[
	Create a slider widget.
	@return [luaIde#ccui.Slider]   An autoreleased Slider object.
]]
function ccui.Slider:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UITextField.h
]]
ccui.TextField = {}
--[[
	@brief Toggle attach with IME.
	@param attach True if attach with IME, false otherwise.
]]
function ccui.TextField:setAttachWithIME(bool_attach) end
--[[
	@brief Query the font size.
	@return int   The integer font size.
]]
function ccui.TextField:getFontSize() end
--[[
	Query the content of TextField.
	@deprecated Use @see `getString` instead.
	@return std_string   The string value of TextField.
]]
function ccui.TextField:getString() end
--[[
	Query the content of TextField.
	@return std_string   The string value of TextField.
]]
function ccui.TextField:getString() end
--[[
	@brief Change password style text.
	@param styleText The styleText for password mask, the default value is "*".
]]
function ccui.TextField:setPasswordStyleText(const_char_styleText) end
--[[
	@brief Whether it is ready to delete backward in TextField.
	@return bool   True is the delete backward is enabled, false otherwise.
]]
function ccui.TextField:getDeleteBackward() end
--[[
	@brief Query the text string color.
	@return [luaIde#Color4B]   The color of the text.
]]
function ccui.TextField:getTextColor() end
--[[
	@brief Get the placeholder of TextField.
	@return std_string   A placeholder string.
]]
function ccui.TextField:getPlaceHolder() end
--[[
	@brief Query whether the IME is attached or not.
	@return bool   True if IME is attached, false otherwise.
]]
function ccui.TextField:getAttachWithIME() end
--[[
	@brief Change the font name of TextField.
	@param name The font name string.
]]
function ccui.TextField:setFontName(const_std_string_name) end
--[[
	@brief Whether it is ready to get the inserted text or not.
	@return bool   True if the insert text is ready, false otherwise.
]]
function ccui.TextField:getInsertText() end
--[[
	@brief Toggle enable insert text mode
	@param insertText True if enable insert text, false otherwise.
]]
function ccui.TextField:setInsertText(bool_insertText) end
--[[
	Change content of TextField.
	@param text A string content.
]]
function ccui.TextField:setString(const_std_string_text) end
--[[
	@brief Query whether IME is detached or not.
	@return bool   True if IME is detached, false otherwise.
]]
function ccui.TextField:getDetachWithIME() end
--[[
	@brief Change the vertical text alignment.
	@param alignment A alignment arguments in @see `TextVAlignment`.
]]
function ccui.TextField:setTextVerticalAlignment(TextVAlignment_alignment) end
--[[
	Add a event listener to TextField, when some predefined event happens, the callback will be called.
	@param callback A callback function with type of `ccTextFieldCallback`.
]]
function ccui.TextField:addEventListener(const_ccTextFieldCallback_callback) end
--[[
	@brief Detach the IME.
]]
function ccui.TextField:didNotSelectSelf() end
--[[
	@brief Query the TextField's font name.
	@return std_string   The font name string.
]]
function ccui.TextField:getFontName() end
--[[
	@brief Change the text area size.
	@param size A delimitation zone.
]]
function ccui.TextField:setTextAreaSize(const_Size_size) end
--[[
	@brief Attach the IME for inputing.
]]
function ccui.TextField:attachWithIME() end
--[[
	@brief Query the input string length.
	@return int   A integer length value.
]]
function ccui.TextField:getStringLength() end
--[[
	@brief Get the renderer size in auto mode.
	@return [luaIde#cc.Size]   A delimitation zone.
]]
function ccui.TextField:getAutoRenderSize() end
--[[
	@brief Toggle enable password input mode.
	@param enable True if enable password input mode, false otherwise.
]]
function ccui.TextField:setPasswordEnabled(bool_enable) end
--[[
	@brief Query the placeholder string color.
	@return [luaIde#Color4B]   The color of placeholder.
]]
function ccui.TextField:getPlaceHolderColor() end
--[[
	@brief Query the password style text.
	@return char   A password style text.
]]
function ccui.TextField:getPasswordStyleText() end
--[[
	@brief Toggle maximize length enable
	@param enable True if enable maximize length, false otherwise.
]]
function ccui.TextField:setMaxLengthEnabled(bool_enable) end
--[[
	@brief Query whether password is enabled or not.
	@return bool   True if password is enabled, false otherwise.
]]
function ccui.TextField:isPasswordEnabled() end
--[[
	@brief Toggle enable delete backward mode.
	@param deleteBackward True is delete backward is enabled, false otherwise.
]]
function ccui.TextField:setDeleteBackward(bool_deleteBackward) end
--[[
	Set cursor position, if enabled
	@js NA
]]
function ccui.TextField:setCursorPosition(std_size_t_cursorPosition) end
--[[
	@brief Inquire the horizontal alignment
	@return [luaIde#TextHAlignment]   The horizontal alignment
]]
function ccui.TextField:getTextHorizontalAlignment() end
--[[
	@brief Change font size of TextField.
	@param size The integer font size.
]]
function ccui.TextField:setFontSize(int_size) end
--[[
	@brief Set placeholder of TextField.
	@param value The string value of placeholder.
]]
function ccui.TextField:setPlaceHolder(const_std_string_value) end
--[[
	Set cursor position to hit letter, if enabled
	@js NA
]]
function ccui.TextField:setCursorFromPoint(const_Vec2_point,const_Camera_camera) end
--[[
	@brief Change the placeholder color.
	@param color A color value in `Color3B`.
]]
function ccui.TextField:setPlaceHolderColor(const_Color3B_color) end
--[[
	@brief Change the placeholder color.
	@param color A color value in `Color4B`.
]]
function ccui.TextField:setPlaceHolderColor(const_Color4B_color) end
--[[
	@brief Change horizontal text alignment.
	@param alignment A alignment arguments in @see `TextHAlignment`.
]]
function ccui.TextField:setTextHorizontalAlignment(TextHAlignment_alignment) end
--[[
	@brief Change the text color.
	@param textColor The color value in `Color4B`.
]]
function ccui.TextField:setTextColor(const_Color4B_textColor) end
--[[
	Set char showing cursor.
	@js NA
]]
function ccui.TextField:setCursorChar(char_cursor) end
--[[
	@brief Query maximize input length of TextField.
	@return int   The integer value of maximize input length.
]]
function ccui.TextField:getMaxLength() end
--[[
	@brief Query whether max length is enabled or not.
	@return bool   True if maximize length is enabled, false otherwise.
]]
function ccui.TextField:isMaxLengthEnabled() end
--[[
	@brief Toggle detach with IME.
	@param detach True if detach with IME, false otherwise.
]]
function ccui.TextField:setDetachWithIME(bool_detach) end
--[[
	@brief Inquire the horizontal alignment
	@return [luaIde#TextVAlignment]   The horizontal alignment
]]
function ccui.TextField:getTextVerticalAlignment() end
--[[
	@brief Toggle enable touch area.
	@param enable True if enable touch area, false otherwise.
]]
function ccui.TextField:setTouchAreaEnabled(bool_enable) end
--[[
	@brief Change maximize input length limitation.
	@param length A character count in integer.
]]
function ccui.TextField:setMaxLength(int_length) end
--[[
	Set enable cursor use.
	@js NA
]]
function ccui.TextField:setCursorEnabled(bool_enabled) end
--[[
	@brief Set the touch size
	The touch size is used for @see `hitTest`.
	@param size A delimitation zone.
]]
function ccui.TextField:setTouchSize(const_Size_size) end
--[[
	@brief Get current touch size of TextField.
	@return [luaIde#cc.Size]   The TextField's touch size.
]]
function ccui.TextField:getTouchSize() end
--[[
	@brief Create an empty TextField.
	@return [luaIde#ccui.TextField]   A TextField instance.
]]
function ccui.TextField:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UITextBMFont.h
]]
ccui.TextBMFont = {}
--[[
	Gets the string length of the label.
	Note: This length will be larger than the raw string length,
	if you want to get the raw string length, you should call this->getString().size() instead
	@return ssize_t    string length.
]]
function ccui.TextBMFont:getStringLength() end
--[[
	get string value for labelbmfon
	@return std_string
]]
function ccui.TextBMFont:getString() end
--[[
	@return [luaIde#ResourceData]
]]
function ccui.TextBMFont:getRenderFile() end
--[[
	init a bitmap font atlas with an initial string and the FNT file
]]
function ccui.TextBMFont:setFntFile(const_std_string_fileName) end
--[[
	reset TextBMFont inner label
]]
function ccui.TextBMFont:resetRender() end
--[[
	Allocates and initializes.
	@return [luaIde#ccui.TextBMFont]
]]
function ccui.TextBMFont:create() end

--[[
	@SuperType[luaIde#ccui.ListView]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIPageView.h
]]
ccui.PageView = {}
--[[
	@brief Set space between page indicator's index nodes.
	@param spaceBetweenIndexNodes Space between nodes in pixel.
]]
function ccui.PageView:setIndicatorSpaceBetweenIndexNodes(float_spaceBetweenIndexNodes) end
--[[
	Insert a page into PageView at a given index.
	@param page  Page to be inserted.
	@param idx   A given index.
]]
function ccui.PageView:insertPage(Widget_page,int_idx) end
--[[
	@brief Set opacity of page indicator's index nodes.
	@param opacity New indicator node opacity.
]]
function ccui.PageView:setIndicatorIndexNodesOpacity(GLubyte_opacity) end
--[[
	@brief Set opacity of page indicator's selected index.
	@param color New opacity for selected (current) index.
]]
function ccui.PageView:setIndicatorSelectedIndexOpacity(GLubyte_opacity) end
--[[
	@brief Remove all pages of the PageView.
]]
function ccui.PageView:removeAllPages() end
function ccui.PageView:setAutoScrollStopEpsilon(float_epsilon) end
--[[
	@brief Set scale of page indicator's index nodes.
	@param indexNodesScale Scale of index nodes.
]]
function ccui.PageView:setIndicatorIndexNodesScale(float_indexNodesScale) end
--[[
	@brief Toggle page indicator enabled.
	@param enabled True if enable page indicator, false otherwise.
]]
function ccui.PageView:setIndicatorEnabled(bool_enabled) end
--[[
	@brief Set color of page indicator's selected index.
	@param color New color for selected (current) index.
]]
function ccui.PageView:setIndicatorSelectedIndexColor(const_Color3B_color) end
--[[
	@brief Add a page turn callback to PageView, then when one page is turning, the callback will be called.
	@param callback A page turning callback.
]]
function ccui.PageView:addEventListener(const_ccPageViewCallback_callback) end
--[[
	@brief Get the page indicator's position.
	@return [luaIde#cc.Vec2]   positionAsAnchorPoint
]]
function ccui.PageView:getIndicatorPosition() end
--[[
	Jump to a page with a given index without scrolling.
	This is the different between scrollToPage.
	@param index A given index in PageView. Index start from 0 to pageCount -1.
]]
function ccui.PageView:setCurrentPageIndex(ssize_t_index) end
--[[
	@brief Get the color of page indicator's index nodes.
	@return [luaIde#Color3B]   color
]]
function ccui.PageView:getIndicatorIndexNodesColor() end
--[[
	@brief Get the color of page indicator's selected index.
	@return [luaIde#Color3B]   color
]]
function ccui.PageView:getIndicatorSelectedIndexColor() end
--[[
	@brief Get scale of page indicator's index nodes.
	@return float   indexNodesScale
]]
function ccui.PageView:getIndicatorIndexNodesScale() end
--[[
	@brief Set the page indicator's position in page view.
	@param position The position in page view
]]
function ccui.PageView:setIndicatorPosition(const_Vec2_position) end
--[[
	@brief Get the opacity of page indicator's selected index.
	@return [luaIde#GLubyte]   opacity
]]
function ccui.PageView:getIndicatorSelectedIndexOpacity() end
--[[
	Scroll to a page with a given index.
	@param idx   A given index in the PageView. Index start from 0 to pageCount -1.
]]
function ccui.PageView:scrollToPage(ssize_t_idx) end
--[[
	Scroll to a page with a given index and with a given scroll time.
	@param idx   A given index in the PageView. Index start from 0 to pageCount -1.
	@param time  Scroll time must be >= 0. Otherwise last set scroll time will be used.
]]
function ccui.PageView:scrollToPage(ssize_t_idx,float_time) end
--[[
	@brief Set the page indicator's position using anchor point.
	@param positionAsAnchorPoint The position as anchor point.
]]
function ccui.PageView:setIndicatorPositionAsAnchorPoint(const_Vec2_positionAsAnchorPoint) end
--[[
	Scroll to a page with a given index.
	@param itemIndex   A given index in the PageView. Index start from 0 to pageCount -1.
]]
function ccui.PageView:scrollToItem(ssize_t_itemIndex) end
--[[
	Scroll to a item with a given index and with a given scroll time.
	@param idx   A given index in the PageView. Index start from 0 to pageCount -1.
	@param time  Scroll time must be >= 0. Otherwise last set scrolltime will be used.
]]
function ccui.PageView:scrollToItem(ssize_t_idx,float_time) end
--[[
	@brief Set color of page indicator's index nodes.
	@param color New indicator node color.
]]
function ccui.PageView:setIndicatorIndexNodesColor(const_Color3B_color) end
--[[
	@brief Get the opacity of page indicator's index nodes.
	@return [luaIde#GLubyte]   opacity
]]
function ccui.PageView:getIndicatorIndexNodesOpacity() end
--[[
	@brief Get the page indicator's position as anchor point.
	@return [luaIde#cc.Vec2]   positionAsAnchorPoint
]]
function ccui.PageView:getIndicatorPositionAsAnchorPoint() end
--[[
	Gets current displayed page index.
	@return ssize_t   current page index.
]]
function ccui.PageView:getCurrentPageIndex() end
--[[
	Remove a page of PageView.
	@param page  Page to be removed.
]]
function ccui.PageView:removePage(Widget_page) end
--[[
	sets texture for index nodes.
	@param fileName   File name of texture.
	@param resType    @see TextureResType .
]]
function ccui.PageView:setIndicatorIndexNodesTexture(const_std_string_texName,Widget_TextureResType_texType) end
--[[
	@brief Query page indicator state.
	@return bool   True if page indicator is enabled, false otherwise.
]]
function ccui.PageView:getIndicatorEnabled() end
--[[
	Remove a page at a given index of PageView.
	@param index  A given index.
]]
function ccui.PageView:removePageAtIndex(ssize_t_index) end
--[[
	@brief Get the space between page indicator's index nodes.
	@return float   spaceBetweenIndexNodes
]]
function ccui.PageView:getIndicatorSpaceBetweenIndexNodes() end
--[[
	Insert a page into the end of PageView.
	@param page Page to be inserted.
]]
function ccui.PageView:addPage(Widget_page) end
--[[
	Create an empty PageView.
	@return [luaIde#ccui.PageView]   A PageView instance.
]]
function ccui.PageView:create() end

ccui.Helper = {}
--[[
	@brief Convert a node's boundingBox rect into screen coordinates.
	@param node Any node pointer.
	@return [luaIde#cc.Rect]   A Rect in screen coordinates.
]]
function ccui.Helper:convertBoundingBoxToScreen(Node_node) end
--[[
	Change the active property of Layout's @see `LayoutComponent`
	@param active A boolean value.
]]
function ccui.Helper:changeLayoutSystemActiveState(bool_active) end
--[[
	Find a widget with a specific action tag from root widget
	This search will be recursive through all child widgets.
	@param root The be searched root widget.
	@param tag The widget action's tag.
	@return [luaIde#ccui.Widget]   Widget instance pointer.
]]
function ccui.Helper:seekActionWidgetByActionTag(Widget_root,int_tag) end
--[[
	Find a widget with a specific name from root widget.
	This search will be recursive through all child widgets.
	@param root      The be searched root widget.
	@param name      The widget name.
	@return [luaIde#ccui.Widget]   Widget instance pointer.
]]
function ccui.Helper:seekWidgetByName(Widget_root,const_std_string_name) end
--[[
	Find a widget with a specific tag from root widget.
	This search will be recursive through all child widgets.
	@param root      The be searched root widget.
	@param tag       The widget tag.
	@return [luaIde#ccui.Widget]   Widget instance pointer.
]]
function ccui.Helper:seekWidgetByTag(Widget_root,int_tag) end
--[[
	@brief  restrict capInsetSize, when the capInsets's width is larger than the textureSize, it will restrict to 0,
	the height goes the same way as width.
	@param  capInsets A user defined capInsets.
	@param  textureSize  The size of a scale9enabled texture
	@return [luaIde#cc.Rect]   a restricted capInset.
]]
function ccui.Helper:restrictCapInsetRect(const_Rect_capInsets,const_Size_textureSize) end
--[[
	Refresh object and it's children layout state
	@param rootNode   A Node* or Node* descendant instance pointer.
]]
function ccui.Helper:doLayout(Node_rootNode) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRichText.h
]]
ccui.RichElement = {}
--[[
	@return bool
]]
function ccui.RichElement:equalType(Type_type) end
--[[
	@brief Initialize a rich element with different arguments.
	@param tag A integer tag value.
	@param color A color in @see `Color3B`.
	@param opacity A opacity value in `GLubyte`.
	@return bool   True if initialize success, false otherwise.
]]
function ccui.RichElement:init(int_tag,const_Color3B_color,GLubyte_opacity) end
function ccui.RichElement:setColor(const_Color3B_color) end

--[[
	@SuperType[luaIde#ccui.RichElement]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRichText.h
]]
ccui.RichElementText = {}
function ccui.RichElementText:new() end 
function ccui.RichElementText:init() end 
function ccui.RichElementText:create() end 


--[[
	@SuperType[luaIde#ccui.RichElement]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRichText.h
]]
ccui.RichElementImage = {}
function ccui.RichElementImage:setHeight(int_height) end
--[[
	@brief Initialize a RichElementImage with various arguments.
	@param tag A integer tag value.
	@param color A color in Color3B.
	@param opacity A opacity in GLubyte.
	@param filePath A image file name.
	@param url uniform resource locator
	@param texType texture type, may be a valid file path, or a sprite frame name
	@return bool   True if initialize success, false otherwise.
]]
function ccui.RichElementImage:init(int_tag,const_Color3B_color,GLubyte_opacity,const_std_string_filePath,const_std_string_url,Widget_TextureResType_texType) end
function ccui.RichElementImage:setWidth(int_width) end
function ccui.RichElementImage:setUrl(const_std_string_url) end
--[[
	@brief Create a RichElementImage with various arguments.
	@param tag A integer tag value.
	@param color A color in Color3B.
	@param opacity A opacity in GLubyte.
	@param filePath A image file name.
	@param url uniform resource locator
	@param texType texture type, may be a valid file path, or a sprite frame name
	@return [luaIde#ccui.RichElementImage]   A RichElementImage instance.
]]
function ccui.RichElementImage:create(int_tag,const_Color3B_color,GLubyte_opacity,const_std_string_filePath,const_std_string_url,Widget_TextureResType_texType) end

--[[
	@SuperType[luaIde#ccui.RichElement]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRichText.h
]]
ccui.RichElementCustomNode = {}
--[[
	@brief Initialize a RichElementCustomNode with various arguments.
	@param tag A integer tag value.
	@param color A color in Color3B.
	@param opacity A opacity in GLubyte.
	@param customNode A custom node pointer.
	@return bool   True if initialize success, false otherwise.
]]
function ccui.RichElementCustomNode:init(int_tag,const_Color3B_color,GLubyte_opacity,Node_customNode) end
--[[
	@brief Create a RichElementCustomNode with various arguments.
	@param tag A integer tag value.
	@param color A color in Color3B.
	@param opacity A opacity in GLubyte.
	@param customNode A custom node pointer.
	@return [luaIde#ccui.RichElementCustomNode]   A RichElementCustomNode instance.
]]
function ccui.RichElementCustomNode:create(int_tag,const_Color3B_color,GLubyte_opacity,Node_customNode) end

--[[
	@SuperType[luaIde#ccui.RichElement]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRichText.h
]]
ccui.RichElementNewLine = {}
--[[
	@brief Create a RichElementNewLine with various arguments.
	@param tag A integer tag value.
	@param color A color in Color3B.
	@param opacity A opacity in GLubyte.
	@return [luaIde#ccui.RichElementNewLine]   A RichElementNewLine instance.
]]
function ccui.RichElementNewLine:create(int_tag,const_Color3B_color,GLubyte_opacity) end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRichText.h
]]
ccui.RichText = {}
--[[
	@brief Insert a RichElement at a given index.
	@param element A RichElement type.
	@param index A given index.
]]
function ccui.RichText:insertElement(RichElement_element,int_index) end
--[[
	@brief enable the outline of a-tag
]]
function ccui.RichText:setAnchorTextOutline(bool_enable,const_Color3B_outlineColor,int_outlineSize) end
--[[
	!< Set the font size. @param size the font size.
	@return float
]]
function ccui.RichText:getFontSize() end
--[[
	@brief Add a RichElement at the end of RichText.
	@param element A RichElement instance.
]]
function ccui.RichText:pushBackElement(RichElement_element) end
--[[
	!< return the current font color of a-tag
]]
function ccui.RichText:setAnchorTextBold(bool_enable) end
--[[
	!< Set the font color of a-tag. @param face the font color.
	@return std_string
]]
function ccui.RichText:getAnchorFontColor() end
--[[
	!< return the current text shadow offset of a-tag
	@return int
]]
function ccui.RichText:getAnchorTextShadowBlurRadius() end
--[[
	@brief enable the shadow of a-tag
]]
function ccui.RichText:setAnchorTextShadow(bool_enable,const_Color3B_shadowColor,const_Size_offset,int_blurRadius) end
--[[
	!< enable italic text of a-tag
	@return bool
]]
function ccui.RichText:isAnchorTextItalicEnabled() end
--[[
	!< return the current font face
]]
function ccui.RichText:setAnchorFontColor(const_std_string_color) end
--[[
	!< return the current font size
]]
function ccui.RichText:setFontFace(const_std_string_face) end
--[[
	!< return the current text shadow blur radius of a-tag
]]
function ccui.RichText:setAnchorTextGlow(bool_enable,const_Color3B_glowColor) end
--[[
	!< sets the horizontal alignment mode: LEFT, CENTER, or RIGHT
	@return [luaIde#HorizontalAlignment]
]]
function ccui.RichText:getHorizontalAlignment() end
--[[
	!< returns the current wrapping mode
]]
function ccui.RichText:setHorizontalAlignment(HorizontalAlignment_a) end
--[[
	!< valid style is italic text of a-tag?
]]
function ccui.RichText:setAnchorTextDel(bool_enable) end
--[[
	!< valid outline of a-tag?
	@return [luaIde#Color3B]
]]
function ccui.RichText:getAnchorTextOutlineColor3B() end
--[[
	!< convert a Color3B into a color string.
	@return std_string
]]
function ccui.RichText:stringWithColor4B(const_cocos2d_Color4B_color4b) end
--[[
	@return bool
]]
function ccui.RichText:initWithXML(const_std_string_xml,const_ValueMap_defaults,const_OpenUrlHandler_handleOpenUrl) end
--[[
	!< return the current font color of a-tag
	@return [luaIde#cocos2d_Color3B]
]]
function ccui.RichText:getAnchorFontColor3B() end
--[[
	@brief Rearrange all RichElement in the RichText.
	It's usually called internally.
]]
function ccui.RichText:formatText() end
--[[
	!< valid glow of a-tag?
	@return [luaIde#Color3B]
]]
function ccui.RichText:getAnchorTextGlowColor3B() end
function ccui.RichText:openUrl(const_std_string_url) end
--[[
	!< Set the font face. @param face the font face.
	@return std_string
]]
function ccui.RichText:getFontFace() end
--[[
	!< returns the current horizontal alignment mode
]]
function ccui.RichText:setFontColor(const_std_string_color) end
--[[
	!< enable the glow of a-tag
	@return bool
]]
function ccui.RichText:isAnchorTextGlowEnabled() end
--[[
	!< set the default values
	@return [luaIde#ValueMap]
]]
function ccui.RichText:getDefaults() end
--[[
	!< enable the underline of a-tag
	@return bool
]]
function ccui.RichText:isAnchorTextUnderlineEnabled() end
--[[
	!< Set the font color. @param color the #RRGGBB hexadecimal notation.
	@return std_string
]]
function ccui.RichText:getFontColor() end
--[[
	@return bool
]]
function ccui.RichText:isAnchorTextShadowEnabled() end
--[[
	!< return the current text outline color of a-tag
	@return int
]]
function ccui.RichText:getAnchorTextOutlineSize() end
--[[
	@brief Set vertical space between each RichElement.
	@param space Point in float.
]]
function ccui.RichText:setVerticalSpace(float_space) end
--[[
	!< enable the strikethrough of a-tag
	@return bool
]]
function ccui.RichText:isAnchorTextDelEnabled() end
--[[
	!< return the current text glow color of a-tag
]]
function ccui.RichText:setDefaults(const_ValueMap_defaults) end
function ccui.RichText:setWrapMode(WrapMode_wrapMode) end
--[[
	!< return the current font color
]]
function ccui.RichText:setFontSize(float_size) end
--[[
	@brief Remove a RichElement at a given index.
	@param index A integer index value.
]]
function ccui.RichText:removeElement(int_index) end
--[[
	@brief Remove specific RichElement.
	@param element A RichElement type.
]]
function ccui.RichText:removeElement(RichElement_element) end
--[[
	!< valid style is bold text of a-tag?
]]
function ccui.RichText:setAnchorTextItalic(bool_enable) end
--[[
	!< return the current text shadow color of a-tag
	@return [luaIde#cc.Size]
]]
function ccui.RichText:getAnchorTextShadowOffset() end
--[[
	!< enable bold text of a-tag
	@return bool
]]
function ccui.RichText:isAnchorTextBoldEnabled() end
--[[
	!< valid shadow of a-tag?
	@return [luaIde#Color3B]
]]
function ccui.RichText:getAnchorTextShadowColor3B() end
--[[
	!< convert a color string into a Color3B.
	@return std_string
]]
function ccui.RichText:stringWithColor3B(const_cocos2d_Color3B_color3b) end
--[[
	@return bool
]]
function ccui.RichText:isAnchorTextOutlineEnabled() end
--[[
	!< return the current font color
	@return [luaIde#Color3B]
]]
function ccui.RichText:getFontColor3B() end
--[[
	!< sets the wrapping mode: WRAP_PER_CHAR or WRAP_PER_WORD
	@return [luaIde#WrapMode]
]]
function ccui.RichText:getWrapMode() end
--[[
	!< valid strikethrough of a-tag?
]]
function ccui.RichText:setAnchorTextUnderline(bool_enable) end
--[[
	!< returns the default values
	@return [luaIde#cocos2d_Color3B]
]]
function ccui.RichText:color3BWithString(const_std_string_color) end
--[[
	@brief Create a empty RichText.
	@return [luaIde#ccui.RichText]   RichText instance.
]]
function ccui.RichText:create() end
--[[
	@brief Create a RichText from an XML
	@return [luaIde#ccui.RichText]   RichText instance.
]]
function ccui.RichText:createWithXML(const_std_string_xml,const_ValueMap_defaults,const_OpenUrlHandler_handleOpenUrl) end

--[[
	@SuperType[luaIde#ccui.Layout]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIHBox.h
]]
ccui.HBox = {}
--[[
	@return bool
]]
function ccui.HBox:initWithSize(const_Size_size) end
--[[
	Create a empty HBox instance.
	@return [luaIde#ccui.HBox]   A HBox instance pointer.
]]
function ccui.HBox:create() end
--[[
	Create a HBox with a certain size.
	@param size The content size of the layout.
	@return [luaIde#ccui.HBox]   A HBox instance pointer.
]]
function ccui.HBox:create(const_Size_size) end

--[[
	@SuperType[luaIde#ccui.Layout]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIVBox.h
]]
ccui.VBox = {}
--[[
	@return bool
]]
function ccui.VBox:initWithSize(const_Size_size) end
--[[
	Create a empty VBox instance.
	@return [luaIde#ccui.VBox]   A VBox instance pointer.
]]
function ccui.VBox:create() end
--[[
	Create a VBox with a certain size.
	@param size The content size of the layout.
	@return [luaIde#ccui.VBox]   A VBox instance pointer.
]]
function ccui.VBox:create(const_Size_size) end

--[[
	@SuperType[luaIde#ccui.Layout]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIRelativeBox.h
]]
ccui.RelativeBox = {}
--[[
	@return bool
]]
function ccui.RelativeBox:initWithSize(const_Size_size) end
--[[
	Create an empty RelativeBox instance.
	@return [luaIde#ccui.RelativeBox]   A RelativeBox instance.
]]
function ccui.RelativeBox:create() end
--[[
	@brief Create a RelativeBox with a fixed size.
	@param size Size in `Size`.
	@return [luaIde#ccui.RelativeBox]   A RelativeBox instance.
]]
function ccui.RelativeBox:create(const_Size_size) end

--[[
	@SuperType[luaIde#cc.Sprite]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UIScale9Sprite.h
]]
ccui.Scale9Sprite = {}
--[[
	Creates and returns a new sprite object with the specified cap insets.
	You use this method to add cap insets to a sprite or to change the existing
	cap insets of a sprite. In both cases, you get back a new image and the
	original sprite remains untouched.
	@param capInsets The values to use for the cap insets.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:resizableSpriteWithCapInsets(const_Rect_capInsets) end
--[[
	Change the state of 9-slice sprite.
	@see `State`
	@param state A enum value in State.
	@since v3.4
]]
function ccui.Scale9Sprite:setState(State_state) end
--[[
	@brief Change the bottom sprite's cap inset.
	@param bottomInset The values to use for the cap inset.
]]
function ccui.Scale9Sprite:setInsetBottom(float_bottomInset) end
--[[
	Initializes a 9-slice sprite with an sprite frame name and with the specified
	cap insets.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param spriteFrameName The sprite frame name.
	@param capInsets The values to use for the cap insets.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:initWithSpriteFrameName(const_std_string_spriteFrameName,const_Rect_capInsets) end
--[[
	Initializes a 9-slice sprite with an sprite frame name.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param spriteFrameName The sprite frame name.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:initWithSpriteFrameName(const_std_string_spriteFrameName) end
--[[
	@brief Change the top sprite's cap inset.
	@param topInset The values to use for the cap inset.
]]
function ccui.Scale9Sprite:setInsetTop(float_topInset) end
--[[
	@return bool
]]
function ccui.Scale9Sprite:init() end
--[[
	@brief Initializes a 9-slice sprite with an sprite instance.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param sprite The sprite instance.
	@param rect A delimitation zone.
	@param rotated Whether the sprite is rotated or not.
	@param capInsets The values to use for the cap insets.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:init(Sprite_sprite,const_Rect_rect,bool_rotated,const_Rect_capInsets) end
--[[
	@brief Initializes a 9-slice sprite with an sprite instance.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param sprite The sprite instance.
	@param rect A delimitation zone.
	@param capInsets The values to use for the cap insets.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:init(Sprite_sprite,const_Rect_rect,const_Rect_capInsets) end
--[[
	@brief Change the preferred size of Scale9Sprite.
	@param size A delimitation zone.
]]
function ccui.Scale9Sprite:setPreferredSize(const_Size_size) end
--[[
	@brief Change inner sprite's sprite frame.
	@param spriteFrame A sprite frame pointer.
	@param capInsets The values to use for the cap insets.
]]
function ccui.Scale9Sprite:setSpriteFrame(SpriteFrame__spriteFrame,const_Rect_capInsets) end
--[[
	Query the current bright state.
	@return [luaIde#State]   @see `State`
	@since v3.7
]]
function ccui.Scale9Sprite:getState() end
--[[
	@brief Query the bottom sprite's cap inset.
	@return float   The bottom sprite's cap inset.
]]
function ccui.Scale9Sprite:getInsetBottom() end
--[[
	@brief Toggle 9-slice feature.
	If Scale9Sprite is 9-slice disabled, the Scale9Sprite will rendered as a normal sprite.
	@warning: Don't use setScale9Enabled(false), use setRenderingType(RenderingType::SIMPLE) instead.
	The setScale9Enabled(false) is kept only for back back compatibility.
	@param enabled True to enable 9-slice, false otherwise.
	@js NA
]]
function ccui.Scale9Sprite:setScale9Enabled(bool_enabled) end
--[[
	@brief Query whether the Scale9Sprite is enable 9-slice or not.
	@return bool   True if 9-slice is enabled, false otherwise.
	@js NA
]]
function ccui.Scale9Sprite:isScale9Enabled() end
--[[
	@brief Query the right sprite's cap inset.
	@return float   The right sprite's cap inset.
]]
function ccui.Scale9Sprite:getInsetRight() end
--[[
	@brief Query the sprite's original size.
	@return [luaIde#cc.Size]   Sprite size.
]]
function ccui.Scale9Sprite:getOriginalSize() end
--[[
	Initializes a 9-slice sprite with a texture file, a delimitation zone and
	with the specified cap insets.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param file The name of the texture file.
	@param rect The rectangle that describes the sub-part of the texture that
	is the whole image. If the shape is the whole texture, set this to the
	texture's full rect.
	@param capInsets The values to use for the cap insets.
	@return bool   True if initialize success, false otherwise.
]]
function ccui.Scale9Sprite:initWithFile(const_std_string_file,const_Rect_rect,const_Rect_capInsets) end
--[[
	Initializes a 9-slice sprite with a texture file and with the specified cap
	insets.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param file The name of the texture file.
	@param capInsets The values to use for the cap insets.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:initWithFile(const_Rect_capInsets,const_std_string_file) end
--[[
	Initializes a 9-slice sprite with a texture file and a delimitation zone. The
	texture will be broken down into a 3×3 grid of equal blocks.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param file The name of the texture file.
	@param rect The rectangle that describes the sub-part of the texture that
	is the whole image. If the shape is the whole texture, set this to the
	texture's full rect.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:initWithFile(const_std_string_file,const_Rect_rect) end
--[[
	Initializes a 9-slice sprite with a texture file. The whole texture will be
	broken down into a 3×3 grid of equal blocks.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param file The name of the texture file.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:initWithFile(const_std_string_file) end
--[[
	@brief Query the top sprite's cap inset.
	@return float   The top sprite's cap inset.
]]
function ccui.Scale9Sprite:getInsetTop() end
--[[
	@brief Change the left sprite's cap inset.
	@param leftInset The values to use for the cap inset.
]]
function ccui.Scale9Sprite:setInsetLeft(float_leftInset) end
--[[
	Initializes a 9-slice sprite with an sprite frame and with the specified
	cap insets.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@param spriteFrame The sprite frame object.
	@param capInsets The values to use for the cap insets.
	@return bool   True if initializes success, false otherwise.
]]
function ccui.Scale9Sprite:initWithSpriteFrame(SpriteFrame_spriteFrame,const_Rect_capInsets) end
--[[
	@brief Query the Scale9Sprite's preferred size.
	@return [luaIde#cc.Size]   Scale9Sprite's preferred size.
]]
function ccui.Scale9Sprite:getPreferredSize() end
--[[
	@brief Query the left sprite's cap inset.
	@return float   The left sprite's cap inset.
]]
function ccui.Scale9Sprite:getInsetLeft() end
--[[
	@brief Change the right sprite's cap inset.
	@param rightInset The values to use for the cap inset.
]]
function ccui.Scale9Sprite:setInsetRight(float_rightInset) end
--[[
	@brief Create an empty Scale9Sprite.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:create() end
--[[
	Creates a 9-slice sprite with a texture file, a delimitation zone and
	with the specified cap insets.
	@see initWithFile(const char *file, const Rect& rect, const Rect& capInsets)
	@param file A texture file name.
	@param rect A delimitation zone.
	@param capInsets A specified cap insets.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:create(const_std_string_file,const_Rect_rect,const_Rect_capInsets) end
--[[
	Creates a 9-slice sprite with a texture file. The whole texture will be
	broken down into a 3×3 grid of equal blocks.
	@see initWithFile(const Rect& capInsets, const char *file)
	@param capInsets A specified cap insets.
	@param file A texture file name.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:create(const_Rect_capInsets,const_std_string_file) end
--[[
	Creates a 9-slice sprite with a texture file and a delimitation zone. The
	texture will be broken down into a 3×3 grid of equal blocks.
	@see initWithFile(const char *file, const Rect& rect)
	@param file A texture file name.
	@param rect A delimitation zone.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:create(const_std_string_file,const_Rect_rect) end
--[[
	Creates a 9-slice sprite with a texture file. The whole texture will be
	broken down into a 3×3 grid of equal blocks.
	@see initWithFile(const char *file)
	@param file A texture file name.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:create(const_std_string_file) end
--[[
	Creates a 9-slice sprite with an sprite frame name.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@see initWithSpriteFrameName(const char *spriteFrameName)
	@param spriteFrameName A sprite frame name.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:createWithSpriteFrameName(const_std_string_spriteFrameName) end
--[[
	Creates a 9-slice sprite with an sprite frame name and the centre of its zone.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@see initWithSpriteFrameName(const char *spriteFrameName, const Rect& capInsets)
	@param spriteFrameName A sprite frame name.
	@param capInsets A delimitation zone.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:createWithSpriteFrameName(const_std_string_spriteFrameName,const_Rect_capInsets) end
--[[
	Creates a 9-slice sprite with an sprite frame.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@see initWithSpriteFrame(SpriteFrame *spriteFrame)
	@param spriteFrame  A sprite frame pointer.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:createWithSpriteFrame(SpriteFrame_spriteFrame) end
--[[
	Creates a 9-slice sprite with an sprite frame and the centre of its zone.
	Once the sprite is created, you can then call its "setContentSize:" method
	to resize the sprite will all it's 9-slice goodness interact.
	It respects the anchorPoint too.
	@see initWithSpriteFrame(SpriteFrame *spriteFrame, const Rect& capInsets)
	@param spriteFrame A sprite frame pointer.
	@param capInsets  A delimitation zone.
	@return [luaIde#ccui.Scale9Sprite]   A Scale9Sprite instance.
]]
function ccui.Scale9Sprite:createWithSpriteFrame(SpriteFrame_spriteFrame,const_Rect_capInsets) end

--[[
	@SuperType[luaIde#ccui.Widget]
]]
ccui.EditBox = {}
function ccui.EditBox:new() end 
function ccui.EditBox:getFontSize() end 
function ccui.EditBox:keyboardDidShow() end 
function ccui.EditBox:getScriptEditBoxHandler() end 
function ccui.EditBox:getText() end 
function ccui.EditBox:getInputMode() end 
function ccui.EditBox:getPlaceholderFontName() end 
function ccui.EditBox:keyboardDidHide() end 
function ccui.EditBox:setPlaceholderFontName() end 
function ccui.EditBox:getPlaceholderFontSize() end 
function ccui.EditBox:getPlaceHolder() end 
function ccui.EditBox:setFontName() end 
function ccui.EditBox:registerScriptEditBoxHandler() end 
function ccui.EditBox:setPlaceholderFontSize() end 
function ccui.EditBox:setInputMode() end 
function ccui.EditBox:unregisterScriptEditBoxHandler() end 
function ccui.EditBox:keyboardWillShow() end 
function ccui.EditBox:setPlaceholderFontColor() end 
function ccui.EditBox:getReturnType() end 
function ccui.EditBox:setFontColor() end 
function ccui.EditBox:getFontName() end 
function ccui.EditBox:keyboardWillHide() end 
function ccui.EditBox:touchDownAction() end 
function ccui.EditBox:getFontColor() end 
function ccui.EditBox:getInputFlag() end 
function ccui.EditBox:getTextHorizontalAlignment() end 
function ccui.EditBox:setPlaceholderFont() end 
function ccui.EditBox:setFontSize() end 
function ccui.EditBox:initWithSizeAndBackgroundSprite() end 
function ccui.EditBox:setPlaceHolder() end 
function ccui.EditBox:setReturnType() end 
function ccui.EditBox:setInputFlag() end 
function ccui.EditBox:getMaxLength() end 
function ccui.EditBox:setText() end 
function ccui.EditBox:getPlaceholderFontColor() end 
function ccui.EditBox:setMaxLength() end 
function ccui.EditBox:setFont() end 
function ccui.EditBox:setTextHorizontalAlignment() end 
function ccui.EditBox:create() end 


--[[
	@SuperType[luaIde#cc.Component]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UILayoutComponent.h
]]
ccui.LayoutComponent = {}
--[[
	Toggle enable stretch width.
	@param isUsed True if enable stretch width, false otherwise.
]]
function ccui.LayoutComponent:setStretchWidthEnabled(bool_isUsed) end
--[[
	Change percent width of owner.
	@param percentWidth Percent Width in float.
]]
function ccui.LayoutComponent:setPercentWidth(float_percentWidth) end
--[[
	Query the anchor position.
	@return [luaIde#Point]   Anchor position to it's parent
]]
function ccui.LayoutComponent:getAnchorPosition() end
--[[
	Toggle position percentX enabled.
	@param isUsed  True if enable position percentX, false otherwise.
]]
function ccui.LayoutComponent:setPositionPercentXEnabled(bool_isUsed) end
--[[
	Toggle enable stretch height.
	@param isUsed True if stretch height is enabled, false otherwise.
]]
function ccui.LayoutComponent:setStretchHeightEnabled(bool_isUsed) end
--[[
	Toggle active enabled of LayoutComponent's owner.
	@param enable True if active layout component, false otherwise.
]]
function ccui.LayoutComponent:setActiveEnabled(bool_enable) end
--[[
	Query the right margin of owner relative to its parent.
	@return float   Right margin in float.
]]
function ccui.LayoutComponent:getRightMargin() end
--[[
	Query owner's content size.
	@return [luaIde#cc.Size]   Owner's content size.
]]
function ccui.LayoutComponent:getSize() end
--[[
	Change the anchor position to it's parent.
	@param point A value in (x,y) format.
]]
function ccui.LayoutComponent:setAnchorPosition(const_Point_point) end
--[[
	Refresh layout of the owner.
]]
function ccui.LayoutComponent:refreshLayout() end
--[[
	Query whether percent width is enabled or not.
	@return bool   True if percent width is enabled, false, otherwise.
]]
function ccui.LayoutComponent:isPercentWidthEnabled() end
--[[
	Change element's vertical dock type.
	@param vEage Vertical dock type @see `VerticalEdge`.
]]
function ccui.LayoutComponent:setVerticalEdge(VerticalEdge_vEage) end
--[[
	Query the top margin of owner relative to its parent.
	@return float   Top margin in float.
]]
function ccui.LayoutComponent:getTopMargin() end
--[[
	Change content size width of owner.
	@param width Content size width in float.
]]
function ccui.LayoutComponent:setSizeWidth(float_width) end
--[[
	Query the percent content size value.
	@return [luaIde#cc.Vec2]   Percent (x,y) in Vec2.
]]
function ccui.LayoutComponent:getPercentContentSize() end
--[[
	Query element vertical dock type.
	@return [luaIde#VerticalEdge]   Vertical dock type.
]]
function ccui.LayoutComponent:getVerticalEdge() end
--[[
	Toggle enable percent width.
	@param isUsed True if percent width is enabled, false otherwise.
]]
function ccui.LayoutComponent:setPercentWidthEnabled(bool_isUsed) end
--[[
	Query whether stretch width is enabled or not.
	@return bool   True if stretch width is enabled, false otherwise.
]]
function ccui.LayoutComponent:isStretchWidthEnabled() end
--[[
	Change left margin of owner relative to its parent.
	@param margin Margin in float.
]]
function ccui.LayoutComponent:setLeftMargin(float_margin) end
--[[
	Query content size width of owner.
	@return float   Content size width in float.
]]
function ccui.LayoutComponent:getSizeWidth() end
--[[
	Toggle position percentY enabled.
	@param isUsed True if position percentY is enabled, false otherwise.
]]
function ccui.LayoutComponent:setPositionPercentYEnabled(bool_isUsed) end
--[[
	Query size height of owner.
	@return float   Size height in float.
]]
function ccui.LayoutComponent:getSizeHeight() end
--[[
	Query the position percentY Y value.
	@return float   Position percent Y value in float.
]]
function ccui.LayoutComponent:getPositionPercentY() end
--[[
	Query the position percent X value.
	@return float   Position percent X value in float.
]]
function ccui.LayoutComponent:getPositionPercentX() end
--[[
	Change the top margin of owner relative to its parent.
	@param margin Margin in float.
]]
function ccui.LayoutComponent:setTopMargin(float_margin) end
--[[
	Query percent height of owner.
	@return float   Percent height in float.
]]
function ccui.LayoutComponent:getPercentHeight() end
--[[
	Query whether use percent content size or not.
	@return bool   True if using percent content size, false otherwise.
]]
function ccui.LayoutComponent:getUsingPercentContentSize() end
--[[
	Change position percentY value.
	@param percentMargin Margin in float.
]]
function ccui.LayoutComponent:setPositionPercentY(float_percentMargin) end
--[[
	Change position percent X value.
	@param percentMargin Margin in float.
]]
function ccui.LayoutComponent:setPositionPercentX(float_percentMargin) end
--[[
	Change right margin of owner relative to its parent.
	@param margin Margin in float.
]]
function ccui.LayoutComponent:setRightMargin(float_margin) end
--[[
	Whether position percentY is enabled or not.
	@see `setPositionPercentYEnabled`
	@return bool   True if position percentY is enabled, false otherwise.
]]
function ccui.LayoutComponent:isPositionPercentYEnabled() end
--[[
	Change percent height value of owner.
	@param percentHeight Percent height in float.
]]
function ccui.LayoutComponent:setPercentHeight(float_percentHeight) end
--[[
	Toggle enable percent only.
	@param enable True if percent only is enabled, false otherwise.
]]
function ccui.LayoutComponent:setPercentOnlyEnabled(bool_enable) end
--[[
	Change element's horizontal dock type.
	@param hEage Horizontal dock type @see `HorizontalEdge`
]]
function ccui.LayoutComponent:setHorizontalEdge(HorizontalEdge_hEage) end
function ccui.LayoutComponent:setPosition(const_Point_position) end
--[[
	Percent content size is used to adapt node's content size based on parent's content size.
	If set to true then node's content size will be changed based on the value set by @see setPercentContentSize
	@param isUsed True to enable percent content size, false otherwise.
]]
function ccui.LayoutComponent:setUsingPercentContentSize(bool_isUsed) end
--[[
	Query left margin of owner relative to its parent.
	@return float   Left margin in float.
]]
function ccui.LayoutComponent:getLeftMargin() end
--[[
	Query the owner's position.
	@return [luaIde#Point]   The owner's position.
]]
function ccui.LayoutComponent:getPosition() end
--[[
	Change size height of owner.
	@param height Size height in float.
]]
function ccui.LayoutComponent:setSizeHeight(float_height) end
--[[
	Whether position percentX is enabled or not.
	@return bool   True if position percentX is enable, false otherwise.
]]
function ccui.LayoutComponent:isPositionPercentXEnabled() end
--[[
	Query the bottom margin of owner relative to its parent.
	@return float   Bottom margin in float.
]]
function ccui.LayoutComponent:getBottomMargin() end
--[[
	Toggle enable percent height.
	@param isUsed True if percent height is enabled, false otherwise.
]]
function ccui.LayoutComponent:setPercentHeightEnabled(bool_isUsed) end
--[[
	Set percent content size.
	The value should be [0-1], 0 means the child's content size will be 0
	and 1 means the child's content size is the same as its parents.
	@param percent The percent (x,y) of the node in [0-1] scope.
]]
function ccui.LayoutComponent:setPercentContentSize(const_Vec2_percent) end
--[[
	Query whether percent height is enabled or not.
	@return bool   True if percent height is enabled, false otherwise.
]]
function ccui.LayoutComponent:isPercentHeightEnabled() end
--[[
	Query percent width of owner.
	@return float   percent width in float.
]]
function ccui.LayoutComponent:getPercentWidth() end
--[[
	Query element horizontal dock type.
	@return [luaIde#HorizontalEdge]   Horizontal dock type.
]]
function ccui.LayoutComponent:getHorizontalEdge() end
--[[
	Query whether stretch height is enabled or not.
	@return bool   True if stretch height is enabled, false otherwise.
]]
function ccui.LayoutComponent:isStretchHeightEnabled() end
--[[
	Change the bottom margin of owner relative to its parent.
	@param margin in float.
]]
function ccui.LayoutComponent:setBottomMargin(float_margin) end
--[[
	Change the content size of owner.
	@param size Content size in @see `Size`.
]]
function ccui.LayoutComponent:setSize(const_Size_size) end
--[[
	Bind a LayoutComponent to a specified node.
	If the node has already binded a LayoutComponent named __LAYOUT_COMPONENT_NAME, just return the LayoutComponent.
	Otherwise, create a new LayoutComponent and bind the LayoutComponent to the node.
	@param node A Node* instance pointer.
	@return [luaIde#ccui.LayoutComponent]   The binded LayoutComponent instance pointer.
]]
function ccui.LayoutComponent:bindLayoutComponent(Node_node) end

--[[
	@SuperType[luaIde#ccui.AbstractCheckButton]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UITabControl.h
]]
ccui.TabHeader = {}
--[[
	get the index this header in the TabControl
	@return int   -1 means not in any TabControl
]]
function ccui.TabHeader:getIndexInTabControl() end
--[[
	get the TabHeader text
	@return std_string   he TabHeader text
]]
function ccui.TabHeader:getTitleText() end
--[[
	Change the font size of TabHeader text
	@param size TabHeader text's font size in float.
]]
function ccui.TabHeader:setTitleFontSize(float_size) end
--[[
	Change the font name of TabHeader text
	@param fontName a font name string.
]]
function ccui.TabHeader:setTitleFontName(const_std_string_fontName) end
--[[
	get the font size of TabHeader text
	@return float   TabHeader text's font size in float.
]]
function ccui.TabHeader:getTitleFontSize() end
--[[
	get the font name of TabHeader text
	@return std_string   font name in std::string
]]
function ccui.TabHeader:getTitleFontName() end
--[[
	get the TabHeader text color.
	@return [luaIde#Color4B]   Color4B of TabHeader text.
]]
function ccui.TabHeader:getTitleColor() end
--[[
	Return the inner Label renderer of TabHeader.
	@return [luaIde#cc.Label]   The TabHeader Label.
]]
function ccui.TabHeader:getTitleRenderer() end
--[[
	Change the content of Header's text.
	@param text The Header's text.
]]
function ccui.TabHeader:setTitleText(const_std_string_text) end
--[[
	Change the color of he TabHeader text
	@param color The he TabHeader text's color in Color4B.
]]
function ccui.TabHeader:setTitleColor(const_Color4B_color) end
--[[
	Create and return a empty TabHeader instance pointer.
	@return [luaIde#ccui.TabHeader]
]]
function ccui.TabHeader:create() end

--[[
	@SuperType[luaIde#ccui.Widget]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/ui/UITabControl.h
]]
ccui.TabControl = {}
--[[
	set header width, affect all tab
	@param headerWidth each tab header's width
]]
function ccui.TabControl:setHeaderWidth(float_headerWidth) end
--[[
	remove the tab from this TabControl
	@param index The index of tab
]]
function ccui.TabControl:removeTab(int_index) end
--[[
	get the count of tabs in this TabControl
	@return [luaIde#size_t]   the count of tabs
]]
function ccui.TabControl:getTabCount() end
--[[
	@return [luaIde#TabControl_Dock]
]]
function ccui.TabControl:getHeaderDockPlace() end
--[[
	get current selected tab's index
	@return int   the current selected tab index
]]
function ccui.TabControl:getSelectedTabIndex() end
--[[
	insert tab, and init the position of header and container
	@param index The index tab should be
	@param header The header Button, will be a protected child in TabControl
	@param container The container, will be a protected child in TabControl
]]
function ccui.TabControl:insertTab(int_index,TabHeader_header,Layout_container) end
--[[
	ignore the textures' size in header, scale them with _headerWidth and _headerHeight
	@param ignore is `true`, the header's texture scale with _headerWidth and _headerHeight
	ignore is `false`, use the texture's size, do not scale them
]]
function ccui.TabControl:ignoreHeadersTextureSize(bool_ignore) end
--[[
	get tab header's width
	@return float   header's width
]]
function ccui.TabControl:getHeaderWidth() end
--[[
	the header dock place of header in TabControl
	@param dockPlace The strip place
]]
function ccui.TabControl:setHeaderDockPlace(TabControl_Dock_dockPlace) end
--[[
	set tab selected, switch the current selected tab and visible container
	@param index The index of tab
]]
function ccui.TabControl:setSelectTab(int_index) end
--[[
	set tab selected, switch the current selected tab and visible container
	@param tabHeader The tab instance
]]
function ccui.TabControl:setSelectTab(TabHeader_tabHeader) end
--[[
	get TabHeader
	@param index The index of tab
	@return [luaIde#ccui.TabHeader]
]]
function ccui.TabControl:getTabHeader(int_index) end
--[[
	get whether ignore the textures' size in header, scale them with _headerWidth and _headerHeight
	@return bool   whether ignore the textures' size in header
]]
function ccui.TabControl:isIgnoreHeadersTextureSize() end
--[[
	Add a callback function which would be called when selected tab changed
	@param callback A std::function with type @see `ccTabControlCallback`
]]
function ccui.TabControl:setTabChangedEventListener(const_ccTabControlCallback_callback) end
--[[
	set the delta zoom of selected tab
	@param zoom The delta zoom
]]
function ccui.TabControl:setHeaderSelectedZoom(float_zoom) end
--[[
	set header height, affect all tab
	@param headerHeight each tab header's height
]]
function ccui.TabControl:setHeaderHeight(float_headerHeight) end
--[[
	get the index of tabCell in TabView, return -1 if not exists in.
	@return int   the index of tabCell in TabView, `-1` means not exists in.
]]
function ccui.TabControl:indexOfTabHeader(const_TabHeader_tabCell) end
--[[
	get Container
	@param index The index of tab
	@return [luaIde#ccui.Layout]
]]
function ccui.TabControl:getTabContainer(int_index) end
--[[
	get the delta zoom of selected tab
	@return float   zoom, the delta zoom
]]
function ccui.TabControl:getHeaderSelectedZoom() end
--[[
	get tab header's height
	@return int   header's height
]]
function ccui.TabControl:getHeaderHeight() end
--[[
	@return [luaIde#ccui.TabControl]
]]
function ccui.TabControl:create() end

cc.AABB = {
	 _min= nil ,
	 _max= nil
}
--[[
	Reset min and max value.If you invoke this method, isEmpty() shall return true.
]]
function cc.AABB:reset() end
--[[
	Sets this bounding box to the specified values.
]]
function cc.AABB:set(const_Vec3_min,const_Vec3_max) end
--[[
	Transforms the bounding box by the given transformation matrix.
]]
function cc.AABB:transform(const_Mat4_mat) end
--[[
	Gets the center point of the bounding box.
	@return [luaIde#cc.Vec3]
]]
function cc.AABB:getCenter() end
--[[
	check the AABB object is empty(reset).
	@return bool
]]
function cc.AABB:isEmpty() end
--[[
	Near face, specified counter-clockwise looking towards the origin from the positive z-axis.
	verts[0] : left top front
	verts[1] : left bottom front
	verts[2] : right bottom front
	verts[3] : right top front
	Far face, specified counter-clockwise looking towards the origin from the negative z-axis.
	verts[4] : right top back
	verts[5] : right bottom back
	verts[6] : left bottom back
	verts[7] : left top back
]]
function cc.AABB:getCorners(Vec3_dst) end
--[[
	update the _min and _max from the given point.
]]
function cc.AABB:updateMinMax(const_Vec3_point,ssize_t_num) end
--[[
	check whether the point is in.
	@return bool
]]
function cc.AABB:containPoint(const_Vec3_point) end

cc.OBB = {
	 _center= nil ,
	 _xAxis= nil ,
	 _yAxis= nil ,
	 _zAxis= nil ,
	 _extents= nil
}
function cc.OBB:reset() end
--[[
	Specify obb values
]]
function cc.OBB:set(const_Vec3_center,const_Vec3__xAxis,const_Vec3__yAxis,const_Vec3__zAxis,const_Vec3__extents) end
--[[
	Transforms the obb by the given transformation matrix.
]]
function cc.OBB:transform(const_Mat4_mat) end
--[[
	Check point in
	@return bool
]]
function cc.OBB:containPoint(const_Vec3_point) end
--[[
	Check intersect with other
	@return bool
]]
function cc.OBB:intersects(const_OBB_box) end
--[[
	face to the obb's -z direction
	verts[0] : left top front
	verts[1] : left bottom front
	verts[2] : right bottom front
	verts[3] : right top front
	face to the obb's z direction
	verts[4] : right top back
	verts[5] : right bottom back
	verts[6] : left bottom back
	verts[7] : left top back
]]
function cc.OBB:getCorners(Vec3_verts) end

cc.Ray = {
	 _origin= nil ,
	 _direction= nil
}
--[[
	Sets this ray to the specified values.
	@param origin The ray's origin.
	@param direction The ray's direction.
]]
function cc.Ray:set(const_Vec3_origin,const_Vec3_direction) end
--[[
	Transforms this ray by the given transformation matrix.
	@param matrix The transformation matrix to transform by.
]]
function cc.Ray:transform(const_Mat4_matrix) end
--[[
	Check whether this ray intersects with the specified AABB.
	@return bool
]]
function cc.Ray:intersects(const_AABB_aabb,float_distance) end
--[[
	Check whether this ray intersects with the specified OBB.
	@return bool
]]
function cc.Ray:intersects(const_OBB_obb,float_distance) end
--[[
	@return [luaIde#cc.Vec3]
]]
function cc.Ray:intersects(const_Plane_plane) end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/scripting/js-bindings/manual/js_bindings_opengl.h
]]
cc.GLNode = {}
function cc.GLNode:create() end 
function cc.GLNode:setShaderProgram() end 


ScriptHandlerMgr = {}
--[[
	Get the instance of the ScriptHandlerMgr.
	@return [luaIde#ScriptHandlerMgr]   the instance of the ScriptHandlerMgr.
	@js NA
]]
function ScriptHandlerMgr:getInstance() end
--[[
	Remove the all relationship among the object, HandlerType and the reference index corresponding to the pointer of Lua function.
	Meanwhile, remove the reference of Lua function corresponding to the indexs the object has in the 'toluafix_refid_function_mapping' table.
	@param object the Ref object.
	@js NA
]]
function ScriptHandlerMgr:removeObjectAllHandlers(void_object) end

CCPoint = {}
function CCPoint:new() end 
function CCPoint:new_local() end 


CCRect = {}
function CCRect:new() end 
function CCRect:new_local() end 


CCSize = {}
function CCSize:new() end 
function CCSize:new_local() end 


--[[
	@SuperType[luaIde#CCObject]
]]
CCArray = {}
function CCArray:create() end 
function CCArray:createWithObject() end 
function CCArray:createWithArray() end 
function CCArray:createWithCapacity() end 
function CCArray:createWithContentsOfFile() end 
function CCArray:count() end 
function CCArray:capacity() end 
function CCArray:indexOfObject() end 
function CCArray:objectAtIndex() end 
function CCArray:lastObject() end 
function CCArray:randomObject() end 
function CCArray:isEqualToArray() end 
function CCArray:containsObject() end 
function CCArray:addObject() end 
function CCArray:addObjectsFromArray() end 
function CCArray:insertObject() end 
function CCArray:removeLastObject() end 
function CCArray:removeObject() end 
function CCArray:removeObjectAtIndex() end 
function CCArray:removeObjectsInArray() end 
function CCArray:removeAllObjects() end 
function CCArray:fastRemoveObject() end 
function CCArray:fastRemoveObjectAtIndex() end 
function CCArray:exchangeObject() end 
function CCArray:exchangeObjectAtIndex() end 
function CCArray:reverseObjects() end 
function CCArray:reduceMemoryFootprint() end 
function CCArray:replaceObjectAtIndex() end 


--[[
	@SuperType[luaIde#cc.Ref]
]]
CCString = {}
function CCString:intValue() end 
function CCString:uintValue() end 
function CCString:floatValue() end 
function CCString:doubleValue() end 
function CCString:boolValue() end 
function CCString:getCString() end 
function CCString:length() end 
function CCString:compare() end 
function CCString:isEqual() end 
function CCString:create() end 
function CCString:createWithData() end 
function CCString:createWithContentsOfFile() end 


--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLabelBMFont.h
]]
cc.LabelBMFont = {}
function cc.LabelBMFont:setLineBreakWithoutSpace(bool_breakWithoutSpace) end
--[[
	@return bool
]]
function cc.LabelBMFont:isOpacityModifyRGB() end
--[[
	@return [luaIde#cc.Sprite]
]]
function cc.LabelBMFont:getLetter(int_ID) end
--[[
	@return std_string
]]
function cc.LabelBMFont:getString() end
function cc.LabelBMFont:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	super method
]]
function cc.LabelBMFont:setString(const_std_string_newString) end
--[[
	init a bitmap font atlas with an initial string and the FNT file
	@return bool
]]
function cc.LabelBMFont:initWithString(const_std_string_str,const_std_string_fntFile,float_width,TextHAlignment_alignment,const_Vec2_imageOffset) end
function cc.LabelBMFont:setOpacityModifyRGB(bool_isOpacityModifyRGB) end
--[[
	@return std_string
]]
function cc.LabelBMFont:getFntFile() end
function cc.LabelBMFont:setFntFile(const_std_string_fntFile,const_Vec2_imageOffset) end
function cc.LabelBMFont:setAlignment(TextHAlignment_alignment) end
function cc.LabelBMFont:setWidth(float_width) end
--[[
	creates a bitmap font atlas with an initial string and the FNT file
	@return [luaIde#cc.LabelBMFont]
]]
function cc.LabelBMFont:create(const_std_string_str,const_std_string_fntFile,float_width,TextHAlignment_alignment,const_Vec2_imageOffset) end
--[[
	Creates an label.
	@return [luaIde#cc.LabelBMFont]
]]
function cc.LabelBMFont:create() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/2d/CCLabelTTF.h
]]
cc.LabelTTF = {}
--[[
	enable or disable shadow for the label
]]
function cc.LabelTTF:enableShadow(const_Size_shadowOffset,float_shadowOpacity,float_shadowBlur,bool_mustUpdateTexture) end
function cc.LabelTTF:setDimensions(const_Size_dim) end
--[[
	@return float
]]
function cc.LabelTTF:getFontSize() end
--[[
	@return std_string
]]
function cc.LabelTTF:getString() end
function cc.LabelTTF:setFlippedY(bool_flippedY) end
function cc.LabelTTF:setFlippedX(bool_flippedX) end
--[[
	set the text definition used by this label
]]
function cc.LabelTTF:setTextDefinition(const_FontDefinition_theDefinition) end
function cc.LabelTTF:setFontName(const_std_string_fontName) end
--[[
	@return [luaIde#TextHAlignment]
]]
function cc.LabelTTF:getHorizontalAlignment() end
--[[
	initializes the LabelTTF with a font name, alignment, dimension and font size
	@return bool
]]
function cc.LabelTTF:initWithStringAndTextDefinition(const_std_string_string,FontDefinition_textDefinition) end
--[[
	changes the string to render
	@warning Changing the string is as expensive as creating a new LabelTTF. To obtain better performance use LabelAtlas
]]
function cc.LabelTTF:setString(const_std_string_label) end
--[[
	set text tinting
]]
function cc.LabelTTF:setFontFillColor(const_Color3B_tintColor,bool_mustUpdateTexture) end
--[[
	enable or disable stroke
]]
function cc.LabelTTF:enableStroke(const_Color3B_strokeColor,float_strokeSize,bool_mustUpdateTexture) end
--[[
	@return [luaIde#cc.Size]
]]
function cc.LabelTTF:getDimensions() end
function cc.LabelTTF:setVerticalAlignment(TextVAlignment_verticalAlignment) end
function cc.LabelTTF:setFontSize(float_fontSize) end
--[[
	@return [luaIde#TextVAlignment]
]]
function cc.LabelTTF:getVerticalAlignment() end
--[[
	get the text definition used by this label
	@return [luaIde#cc.FontDefinition]
]]
function cc.LabelTTF:getTextDefinition() end
function cc.LabelTTF:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	@return std_string
]]
function cc.LabelTTF:getFontName() end
function cc.LabelTTF:setHorizontalAlignment(TextHAlignment_alignment) end
--[[
	disable shadow rendering
]]
function cc.LabelTTF:disableShadow(bool_mustUpdateTexture) end
--[[
	disable stroke
]]
function cc.LabelTTF:disableStroke(bool_mustUpdateTexture) end
--[[
	Creates an label.
	@return [luaIde#cc.LabelTTF]
]]
function cc.LabelTTF:create() end
--[[
	Create a label with string and a font definitio
	@return [luaIde#cc.LabelTTF]
]]
function cc.LabelTTF:createWithFontDefinition(const_std_string_string,FontDefinition_textDefinition) end

--[[
	@SuperType[luaIde#cc.Layer]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/scripting/lua-bindings/manual/cocosbuilder/CCBProxy.h
]]
cc.CCBProxy = {}
--[[
	Create a CCBReader object.
	@return [luaIde#cc.CCBReader]   a CCBReader object.
	@lua NA
	@js NA
]]
function cc.CCBProxy:createCCBReader() end
--[[
	Read a ccb file.
	@param pszFileName the string pointer point to the file name.
	@param pCCBReader the CCBreader object pointer.
	@param bSetOwner whether to set the owner or not.
	@return [luaIde#cc.Node]   a Node object pointer.
	@js NA
]]
function cc.CCBProxy:readCCBFromFile(const_char_pszFileName,CCBReader_pCCBReader,bool_bSetOwner) end
--[[
	Get the true type name of pNode.
	By using the dynamic_cast function, we could get the true type name of pNode.
	@param pNode the Node object used to query.
	@return char   a string pointer point to the true type name otherwise return "No Support".
	@js NA
]]
function cc.CCBProxy:getNodeTypeName(Node_pNode) end
--[[
	Set relationship between the Lua callback function reference index handle and the node.
	According to the different controlEvents values,we would choose different ScriptHandlerMgr::HandlerTyp.
	When node receive the events information should be passed on to Lua, it would find the Lua callback function by the Lua callback function reference index.
	@param node the node object should pass on the events information to Lua,when the events are triggered.
	@param handle the Lua callback function reference index.
	@param controlEvents the combination value of Control::EventType, default 0.
	@js NA
]]
function cc.CCBProxy:setCallback(Node_node,int_handle,int_controlEvents) end

--[[
	@SuperType[luaIde#cc.Ref]
	/Users/k0204/Downloads/cocos2d-x-3.16/cocos/scripting/lua-bindings/manual/cocostudio/CustomGUIReader.h
]]
ccs.CustomGUIReader = {}
--[[
	@return [luaIde#ccs.CustomGUIReader]
]]
function ccs.CustomGUIReader:create(std_string_className,int_createFunc,int_setPropsFunc) end

cc.WebSocket = {
	 url= nil ,
	 protocol= nil
}
--[[
	@brief Gets current state of connection.
	@return [luaIde#State]   State the state value could be State::CONNECTING, State::OPEN, State::CLOSING or State::CLOSED
]]
function cc.WebSocket:getReadyState() end
--[[
	@brief Closes the connection to server synchronously.
	@note It's a synchronous method, it will not return until websocket thread exits.
]]
function cc.WebSocket:close() end

--[[
	@SuperType[luaIde#cc.Ref]
]]
cc.XMLHttpRequest = {
	 responseType= nil ,
	 withCredentials= nil ,
	 timeout= nil ,
	 readyState= nil ,
	 status= nil ,
	 statusText= nil ,
	 responseText= nil ,
	 response= nil
}
function cc.XMLHttpRequest:new() end 
function cc.XMLHttpRequest:open() end 
function cc.XMLHttpRequest:send() end 
function cc.XMLHttpRequest:abort() end 
function cc.XMLHttpRequest:setRequestHeader() end 
function cc.XMLHttpRequest:getAllResponseHeaders() end 
function cc.XMLHttpRequest:getResponseHeader() end 
function cc.XMLHttpRequest:registerScriptHandler() end 
function cc.XMLHttpRequest:unregisterScriptHandler() end 


plugin.PluginProtocol = {}
--[[
	@return char
]]
function plugin.PluginProtocol:getPluginName() end
--[[
	@return std_string
]]
function plugin.PluginProtocol:getPluginVersion() end
--[[
	@return std_string
]]
function plugin.PluginProtocol:getSDKVersion() end
function plugin.PluginProtocol:setDebugMode(bool_bDebug) end

plugin.PluginManager = {}
function plugin.PluginManager:unloadPlugin(const_char_name) end
--[[
	@return [luaIde#plugin.PluginProtocol]
]]
function plugin.PluginManager:loadPlugin(const_char_name) end
--[[
	@return [luaIde#plugin.PluginManager]
]]
function plugin.PluginManager:getInstance() end

--[[
	@SuperType[luaIde#plugin.PluginProtocol]
	/Users/k0204/Downloads/cocos2d-x-3.16/plugin/protocols/include/ProtocolAnalytics.h
]]
plugin.ProtocolAnalytics = {}
function plugin.ProtocolAnalytics:logTimedEventBegin(const_char_eventId) end
function plugin.ProtocolAnalytics:logError(const_char_errorId,const_char_message) end
function plugin.ProtocolAnalytics:setCaptureUncaughtException(bool_enabled) end
function plugin.ProtocolAnalytics:setSessionContinueMillis(long_millis) end
function plugin.ProtocolAnalytics:logEvent(const_char_eventId,LogEventParamMap_paramMap) end
function plugin.ProtocolAnalytics:startSession(const_char_appKey) end
function plugin.ProtocolAnalytics:stopSession() end
function plugin.ProtocolAnalytics:logTimedEventEnd(const_char_eventId) end

--[[
	@SuperType[luaIde#plugin.PluginProtocol]
	/Users/k0204/Downloads/cocos2d-x-3.16/plugin/protocols/include/ProtocolIAP.h
]]
plugin.ProtocolIAP = {}
function plugin.ProtocolIAP:onPayResult(PayResultCode_ret,const_char_msg) end
function plugin.ProtocolIAP:configDeveloperInfo(TIAPDeveloperInfo_devInfo) end

--[[
	@SuperType[luaIde#plugin.PluginProtocol]
	/Users/k0204/Downloads/cocos2d-x-3.16/plugin/protocols/include/ProtocolAds.h
]]
plugin.ProtocolAds = {}
function plugin.ProtocolAds:showAds(TAdsInfo_info,AdsPos_pos) end
function plugin.ProtocolAds:hideAds(TAdsInfo_info) end
function plugin.ProtocolAds:queryPoints() end
function plugin.ProtocolAds:spendPoints(int_points) end
function plugin.ProtocolAds:configDeveloperInfo(TAdsDeveloperInfo_devInfo) end

--[[
	@SuperType[luaIde#plugin.PluginProtocol]
	/Users/k0204/Downloads/cocos2d-x-3.16/plugin/protocols/include/ProtocolShare.h
]]
plugin.ProtocolShare = {}
--[[
	@brief share result callback
]]
function plugin.ProtocolShare:onShareResult(ShareResultCode_ret,const_char_msg) end
--[[
	@brief config the share developer info
	@param devInfo This parameter is the info of developer,
	different plugin have different format
	@warning Must invoke this interface before other interfaces.
	And invoked only once.
]]
function plugin.ProtocolShare:configDeveloperInfo(TShareDeveloperInfo_devInfo) end

--[[
	@SuperType[luaIde#plugin.PluginProtocol]
	/Users/k0204/Downloads/cocos2d-x-3.16/plugin/protocols/include/ProtocolSocial.h
]]
plugin.ProtocolSocial = {}
function plugin.ProtocolSocial:showLeaderboard(const_char_leaderboardID) end
function plugin.ProtocolSocial:showAchievements() end
--[[
	@brief config the share developer info
	@param devInfo This parameter is the info of developer,
	different plugin have different format
	@warning Must invoke this interface before other interfaces.
	And invoked only once.
]]
function plugin.ProtocolSocial:configDeveloperInfo(TSocialDeveloperInfo_devInfo) end

--[[
	@SuperType[luaIde#plugin.PluginProtocol]
	/Users/k0204/Downloads/cocos2d-x-3.16/plugin/protocols/include/ProtocolUser.h
]]
plugin.ProtocolUser = {}
function plugin.ProtocolUser:configDeveloperInfo(TUserDeveloperInfo_devInfo) end
--[[
	@return std_string
]]
function plugin.ProtocolUser:getSessionID() end
--[[
	@return std_string
]]
function plugin.ProtocolUser:getAccessToken() end

plugin.AgentManager = {}
--[[
	@return [luaIde#plugin.ProtocolSocial]
]]
function plugin.AgentManager:getSocialPlugin() end
--[[
	@return [luaIde#plugin.ProtocolAds]
]]
function plugin.AgentManager:getAdsPlugin() end
function plugin.AgentManager:purge() end
--[[
	@return [luaIde#plugin.ProtocolUser]
]]
function plugin.AgentManager:getUserPlugin() end
--[[
	@return [luaIde#plugin.ProtocolIAP]
]]
function plugin.AgentManager:getIAPPlugin() end
--[[
	@return [luaIde#plugin.ProtocolShare]
]]
function plugin.AgentManager:getSharePlugin() end
--[[
	@return [luaIde#plugin.ProtocolAnalytics]
]]
function plugin.AgentManager:getAnalyticsPlugin() end
function plugin.AgentManager:destroyInstance() end
--[[
	@return [luaIde#plugin.AgentManager]
]]
function plugin.AgentManager:getInstance() end

plugin.FacebookAgent = {}
function plugin.FacebookAgent:activateApp() end
--[[
	@return std_string
]]
function plugin.FacebookAgent:getPermissionList() end
--[[
	@return std_string
]]
function plugin.FacebookAgent:getUserID() end
function plugin.FacebookAgent:logout() end
--[[
	@return std_string
]]
function plugin.FacebookAgent:getSDKVersion() end
--[[
	@return bool
]]
function plugin.FacebookAgent:isLoggedIn() end
--[[
	@return std_string
]]
function plugin.FacebookAgent:getAccessToken() end
function plugin.FacebookAgent:destroyInstance() end

--[[
	@SuperType[luaIde#cc.Node]
	/Users/k0204/Downloads/cocos2d-x-3.16/tests/cpp-tests/Classes/Sprite3DTest/DrawNode3D.h
]]
cc.DrawNode3D = {}
--[[
	@js NA
	@lua NA
	@return [luaIde#cc.BlendFunc]
]]
function cc.DrawNode3D:getBlendFunc() end
--[[
	@code
	When this function bound into js or lua,the parameter will be changed
	In js: var setBlendFunc(var src, var dst)
	@endcode
	@lua NA
]]
function cc.DrawNode3D:setBlendFunc(const_BlendFunc_blendFunc) end
--[[
	Draw 3D Line
]]
function cc.DrawNode3D:drawLine(const_cocos2d_Vec3_from,const_cocos2d_Vec3_to,const_Color4F_color) end
--[[
	Clear the geometry in the node's buffer.
]]
function cc.DrawNode3D:clear() end
--[[
	Draw 3D cube
	@param point to a vertex array who has 8 element.
	vertices[0]:Left-top-front,
	vertices[1]:Left-bottom-front,
	vertices[2]:Right-bottom-front,
	vertices[3]:Right-top-front,
	vertices[4]:Right-top-back,
	vertices[5]:Right-bottom-back,
	vertices[6]:Left-bottom-back,
	vertices[7]:Left-top-back.
	@param color
]]
function cc.DrawNode3D:drawCube(cocos2d_Vec3_vertices,const_Color4F_color) end
--[[
	creates and initialize a DrawNode3D node
	@return [luaIde#cocos2d_DrawNode3D]
]]
function cc.DrawNode3D:create() end

--[[
	@SuperType[luaIde#cc.Node]
]]
cc.ValueTypeJudgeInTable = {}
function cc.ValueTypeJudgeInTable:create() end 



 -- 以下为aipex.lua 内容  可自行添加
cc.Vec2 = {x = 1, y = 1}
cc.Vec3 = {x = 1, y = 1, z = 1}
cc.Vec4 = {x = 1, y = 1, z = 1, w = 1}
cc.Rect = {x = 1, y = 1, width = 1, height = 1}
cc.Color4b = {r = 1, g = 1, b = 1, a = 1}
cc.Color4f = {r = 1, g = 1, b = 1, a = 1}
cc.Color3b = {r = 1, g = 1, b = 1}
cc.Size = {width = 1, height = 1}
cc.PhysicsMaterial = {
	density = "",
	restitution = "",
	friction = ""
}

cc.BlendFunc = {
	src = "",
	dst = ""
	
}
cc.PhysicsContactData =
{
	points = {},
	normal = "",
	POINT_MAX = ""
}

cc.AffineTransform = {
	a = 1,
	b = 1,
	c = 1,
	d = 1,
	tx = 1,
	ty = 1
}
cc.FontDefinition = {
	fontName = "",
	fontSize = 1,
	fontAlignmentH = 1,
	fontAlignmentV = 1,
	fontFillColor = {r = 1, g = 1, b = 1},
	fontDimensions = {width = 1, height = 1},
	shadowEnabled = true,
	shadowOffset = {width = 1, height = 1},
	shadowBlur = 1,
	shadowOpacity = 1,
	shadowEnabled = 1,
	strokeColor = {r = 1, g = 1, b = 1},
	strokeSize = {width = 1, height = 1},
}
cc.TTFConfig = {
	fontFilePath = "",
	fontSize = {width = 1, height = 1},
	glyphs = 1,
	customGlyphs = "",
	distanceFieldEnabled = true,
	outlineSize = 1
}
cc.AffineTransform = {
	a = 1,
	b = 1,
	c = 1,
	d = 1,
	tx = 1,
	ty = 1
}

cc.Uniform = {
	location = 1,
	size = 1,
	type = 1,
	name = "1"
}
cc.VertexAttrib = {
	location = 1,
	size = 1,
	type = 1,
	name = "1"
}
cc.MeshVertexAttrib = {
	size = 1,
	type = 1,
	vertexAttrib = 1,
	attribSizeBytes = 1
	
}
cc.Quaternion = {
	x = 1,
	y = 1,
	z = 1,
	w = 1
}
cc.TexParams = {
	
	minFilter = 1,
	magFilter = 1,
	wrapS = 1,
	wrapT = 1
} 