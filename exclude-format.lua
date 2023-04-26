--- exclude-format.lua – Keeps parts of a document out of selected output formats.
---
--- Copyright: © 2023 Robert Bachmann
--- License: MIT – see LICENSE for details

-- Makes sure users know if their pandoc version is too old for this
-- filter.
PANDOC_VERSION:must_be_at_least '3'

-- strip path for lua filters
local format = FORMAT:match('^.+[\\/](.+)%.lua$')
if format == nil then
  format = FORMAT:gsub('%.lua$', '')
end
local needle = string.format(' %s ', string.lower(format))

local function filter_div(elem)
  local exclude_from = elem.attributes['exclude-format']

  if not exclude_from or type(exclude_from) ~= 'string' then
    return nil -- keep as-is
  end

  exclude_from = ' ' .. string.lower(exclude_from) .. ' '
  exclude_from = string.gsub(exclude_from, "[%s,]+", " ")

  if string.find(exclude_from, needle, 1, true) then
    return {} -- remove it
  end

  elem.attributes['exclude-format'] = nil

  return elem
end

return {
  { Div = filter_div }
}
