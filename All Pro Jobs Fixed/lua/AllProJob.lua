if not tweak_data then return end
local _jobs_index = tweak_data.narrative._jobs_index or nil
local _level_index = tweak_data.levels._level_index or nil
if not _jobs_index or not _level_index then return end
local _prof_jobs_index = {}

for id, data in ipairs( _jobs_index or {} ) do
	local _bool = data:find("_prof") or false
	if _bool then
		_prof_jobs_index[data] = 1
	else
		_prof_jobs_index[data] = 0
	end
end

for id, data in ipairs( _jobs_index or {} ) do
	local _bool = data:find("_prof") or false
	if not _bool then
		local data_prog = tostring(data .. "_prof")
		if not tweak_data.narrative.jobs[data_prog] then
			tweak_data.narrative.jobs[data_prog] = deep_clone(tweak_data.narrative.jobs[data])
			tweak_data.narrative.jobs[data_prog].professional = true
			tweak_data.narrative.jobs[data_prog].region = "professional"
		end
		if _prof_jobs_index[data_prog] ~= 1 then
			table.insert(_jobs_index, data_prog)
		end
		local level_id = tweak_data.narrative.jobs[data_prog].chain.level_id or ""
		if level_id ~= "" and not tweak_data.levels[level_id] then
			tweak_data.levels[data_prog] = deep_clone(tweak_data.levels[data])
			table.insert(_level_index, data_prog)
		end
	end	
end