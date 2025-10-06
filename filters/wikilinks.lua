-- wikilinks.lua: Convert [[Title]] to links to slugified file names in digital-garden/
local stringify = pandoc.utils.stringify
local function slug(s)
  s = s:lower():gsub("[^%w%s-]", ""):gsub("%s+", "-")
  return s
end

function Str(el)
  local text = el.text
  local t = text:match("%[%[(.-)%]%]")
  if t then
    local target = "digital-garden/" .. slug(t) .. ".html"
    return pandoc.RawInline('html', '<a href="/'.. target ..'">'.. t ..'</a>')
  end
end