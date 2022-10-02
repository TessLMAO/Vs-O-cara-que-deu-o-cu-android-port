local angleshit = -1

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Smash Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'bg/ATTACKNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 0);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let BF's notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Smash Note' then
		runTimer('smush',0.02);
		characterPlayAnim('dad', 'smash', true);
		setProperty('dad.specialAnim', true);
		playSound('whoosh');
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Smash Note' then
			setProperty('health', 0);
	end
end

function onTimerCompleted(t,l,ll)
	
	if t == 'smush' then
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
	end

end