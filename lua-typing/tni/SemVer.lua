---@meta _
-- Generated API for game version 0.13.3

---@class SemVer : Object
---@field Version Object # Constant value: ():<GDScript#-9223369676585625293>
---@field VersionRange Object # Constant value: ():<GDScript#-9223369676568848076>
---@field VersionComparatorUnary Object # Constant value: ():<GDScript#-9223369676552070859>
---@field VersionComparatorRange Object # Constant value: ():<GDScript#-9223369676535293642>
---@field VersionComparatorBinary Object # Constant value: ():<GDScript#-9223369676518516425>
---@field SemVerParsing Object # Constant value: ():<GDScript#-9223369676501739208>
local SemVer = {}
---@enum SemVer.VersionComparatorUnaryOp
SemVer.VersionComparatorUnaryOp = {
	["EQ"] = 0,
	["LT"] = 1,
	["LE"] = 2,
	["GT"] = 3,
	["GE"] = 4,
	["TILDE"] = 5,
	["CARET"] = 6,
}
---@enum SemVer.VersionComparatorBinaryOp
SemVer.VersionComparatorBinaryOp = {
	["AND"] = 0,
	["OR"] = 1,
}
