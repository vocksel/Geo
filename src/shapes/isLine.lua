-- This thinness ratio approaches unity, and typically floats around 0.95 when
-- given points that make a line. We make the certainty a bit less to account
-- for any curvier lines.
local LINE_CERTAINTY = 0.85

type Array<T> = { [number]: T }

local function isLine(points: Array<Vector2>)
	if #points < 2 then
		return false
	end

	local perimeter = 0
	for i = 1, #points - 1 do
		perimeter += (points[i] - points[i + 1]).Magnitude
	end

	local length = (points[1] - points[#points]).Magnitude
	local thinnessRatio = length / perimeter

	return thinnessRatio >= LINE_CERTAINTY
end

return isLine
