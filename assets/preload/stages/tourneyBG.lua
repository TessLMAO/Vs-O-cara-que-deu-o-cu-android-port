local xx = 450
local yy = 380
local xx2 = 900
local yy2 = 380
local ofs = 50
local followchars = true
local wuh = false
local bruh = false
local whyisthislikethisfuckman = false

function onCreate()	
	precacheImage('characters/Deku_Sad')
	precacheImage('characters/amimir')
	precacheImage('bg/smash')
	
	makeLuaSprite('bg', 'bg/tourneybg', -1400, -1000)
	setScrollFactor('bg', 0.9, 0.9)
	scaleObject('bg', 3.0, 3.0)
	
	makeLuaSprite('sky', 'bg/roofsky', -1000, -300)
	setScrollFactor('sky', 0.9, 0.9)
	scaleObject('sky', 2.0, 2.0)
	
	makeLuaSprite('whiteness', nil, 0, 0)
	makeGraphic('whiteness', screenWidth, screenHeight, 'FFFFFF')
	setScrollFactor('whiteness', 0.1, 0.1)
	
	makeLuaSprite('FLASHBANG', nil, 0, 0)
	makeGraphic('FLASHBANG', screenWidth, screenHeight, 'FFFFFF')
	setObjectCamera('FLASHBANG', 'camHud')
	setProperty('FLASHBANG.alpha',0)
	
	makeAnimatedLuaSprite('smashu','bg/smash', 400, -550)
    addAnimationByPrefix('smashu','bop','smash idle', 14, false)
	setProperty('smashu.alpha',0)
	scaleObject('smashu', 2,2);
	
	addLuaSprite('whiteness', false)
	addLuaSprite('sky', false)
	addLuaSprite('bg', false)
	addLuaSprite('smashu', true)
	addLuaSprite('FLASHBANG', false)
	
	setPropertyFromClass('GameOverSubstate', 'characterName', 'amimir')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'horn')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ' ')
end

function onCreatePost()	
	makeLuaSprite('warning', 'bg/smashwarning', 0, 0)
	setObjectCamera('warning', 'hud')
	setScrollFactor('warning', 0, 0)
	setProperty('warning.alpha', 0)
	addLuaSprite('warning', true)
end

function onSongStart()
runTimer('warning',5)
end


function onEvent(name, value1, value2)
	if name == "BG Freaks Expression" then
		alpha = tonumber(value1)
		speed = tonumber(value2)

		doTweenAlpha('ech','warning',alpha,speed,'quadInOut')
	end
	
	if name == "Sappy" then
		cry = tonumber(value1)
		if cry == 0 then
			cameraFlash('camHUD', 'FFFFFF', 0.3, false)
			setProperty('FLASHBANG.alpha',1)
			doTweenAlpha('flashbanger', 'FLASHBANG', 0, 8.0, 'cubeIn')
			triggerEvent('Change Character', 'dad', 'deku-sad')
			setProperty('bg.alpha',0)
			setProperty('boyfriend.alpha',0)
			wuh = true
			setProperty('defaultCamZoom', 0.7)
			xx = 50
			yy = 380
			xx2 = 50
			yy2 = 380
			ofs = 0
			setProperty('healthBar.alpha',0)
			setProperty('healthBarBG.alpha',0)
			setProperty('healthBack.alpha',0)
			setProperty('healthBar.alpha',0)
			setProperty('iconP1.alpha',0)
			setProperty('iconP2.alpha',0)
			setProperty('scoreTxt.alpha',0)
			setProperty('timeBar.alpha',0)
			setProperty('timeTxt.alpha',0)
		elseif cry == 1 then
			doTweenAlpha('gone', 'camHUD', 0, 1.0, 'cubeIn');
			setProperty('dad.alpha',0)
			removeLuaSprite('sky', true)
			setProperty('defaultCamZoom', 1.8)
			wuh = false
			whyisthislikethisfuckman = true
			bruh = true
		end
	end
	
	if name == "SMASH" then
		triggerEvent('Change Character', 'dad', 'deku')
		playSound('chargeup', 0.2)
		setProperty('bg.alpha',1)
		removeLuaSprite('sky', true)
		doTweenAlpha('flashbangerr', 'FLASHBANG', 0, 2.0, 'cubeIn');
		doTweenAlpha('huddy', 'camHUD', 1, 0.1, 'cubeIn')
		setProperty('dad.alpha',1)
		setProperty('boyfriend.alpha',1)
		setProperty('healthBar.alpha',1)
		setProperty('healthBarBG.alpha',1)
		setProperty('healthBack.alpha',1)
		setProperty('healthBar.alpha',1)
		setProperty('iconP1.alpha',1)
		setProperty('iconP2.alpha',1)
		setProperty('scoreTxt.alpha',1)
		setProperty('timeBar.alpha',1)
		setProperty('timeTxt.alpha',1)
		bruh = false
		whyisthislikethisfuckman = false
		setProperty('defaultCamZoom', 0.7)
	end
	
	if name == "SMASH End" then
		triggerEvent('Screen Shake', 0.02, 0.03)
		triggerEvent('Camera Follow Pos', 900, 380)
		xx = 450
		yy = 380
		xx2 = 900
		yy2 = 380
		ofs = 50
	end
	
	if name == "wuh" then
		huh = tonumber(value1)
		if huh == 0 then
			bruh = false
			xx = 450
			yy = 380
			xx2 = 900
			yy2 = 380
		elseif huh == 1 then
			bruh = true
			xx = 600
			yy = 380
			xx2 = 600
			yy2 = 380
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Smash Note Init' then
		setProperty('smashu.alpha',1)
		objectPlayAnimation('smashu', 'bop', true)
		runTimer('smesh',0.7)
    end
	if noteType == 'Smash Note' then
		setProperty('smashu.alpha',1)
		objectPlayAnimation('smashu', 'bop', true)
		runTimer('smesh',0.7)
    end
end

function onTimerCompleted(t,l,ll)
	
	if t == 'smesh' then
		setProperty('smashu.alpha', 0)
		elseif t == 'warning' then
removeLuaSprite('warning', true)
	end

end

function onTweenCompleted(tag)
if tag == 'flashbangerr' then
removeLuaSprite('FLASHBANG', true)
	end
end

function onUpdate(elapsed)
     if followchars == true then
        if mustHitSection == false then
			if wuh == false then
				if bruh == false then
				setProperty('defaultCamZoom', 0.5)
				else
					if whyisthislikethisfuckman == false then
						setProperty('defaultCamZoom', 0.8)
					else
						setProperty('defaultCamZoom', 1.8)
					end
				end
			else
				setProperty('defaultCamZoom', 0.7)
			end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
			if wuh == false then
				if bruh == false then
				setProperty('defaultCamZoom', 0.5)
				else
					if whyisthislikethisfuckman == false then
						setProperty('defaultCamZoom', 0.8)
					else
						setProperty('defaultCamZoom', 1.8)
					end
				end
			else
				setProperty('defaultCamZoom', 0.7)
			end
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	else
        triggerEvent('Camera Follow Pos','','')
	end
end