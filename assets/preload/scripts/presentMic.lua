local ready = 'ready' -- don't touch this
local clash = 'crash' -- don't touch this

local allowCountdown = false

function onStartCountdown() -- No countdown yet
    if not allowCountdown then
	    return Function_Stop
	end

	if allowCountdown then
	    return Function_Continue
	end
end
function onCreate() --no countdown!
	setProperty('skipCountdown',true)
end

function onCreatePost() -- sprite loading
	makeLuaSprite('ready', ready, 0, 0)
	makeLuaSprite('clash', clash, 0, 0)
	setProperty('clash.alpha',0)
	
	runTimer('fadeTimer', 1.5, 1)
	playSound('ready')

	addLuaSprite('clash', true)
	addLuaSprite('ready', true)
	setObjectCamera('ready', 'hud')
	setObjectCamera('clash', 'hud')
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'ready', 0, 0.1, 'backOut')
		doTweenAlpha('popin', 'clash', 1, 0.2, 'backIn')
		playSound('clash')
		runTimer('clashtime', 1.5, 1)		
	end
	if tag == 'clashtime' then
	    doTweenAlpha('deleto', 'clash', 0, 0.2, 'backOut')
		allowCountdown = true
		startCountdown()
		
	end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
	    removeLuaSprite('ready', true)
	end
	if tag == 'deleto' then
	    removeLuaSprite('clash', true)
		
	end
end