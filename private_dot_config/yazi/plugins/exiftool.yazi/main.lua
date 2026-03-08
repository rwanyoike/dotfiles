-- Ref: https://github.com/sxyazi/yazi/blob/main/yazi-plugin/preset/plugins/json.lua

local M = {}

function M:peek(job)
  local cmd = "exiftool"
  local child, err = Command(cmd)
    :arg({ "-u", tostring(job.file.url) })
    :stdout(Command.PIPED)
    :stderr(Command.PIPED)
    :spawn()

  if err then
    ya.preview_widget(
      job,
      ui.Text(string.format("Failed to start `%s`, error: %s", cmd, err))
        :area(job.area)
        :wrap(ui.Wrap.YES))
    return
  end

  local limit = job.area.h
  local i, lines = 0, ""

  repeat
    local next, event = child:read_line()
    if event ~= 0 then
      break
    end
    i = i + 1
    if i > job.skip then
      lines = lines .. next
    end
  until i >= job.skip + limit

  child:start_kill()

  if job.skip > 0 and i < job.skip + limit then
    ya.emit("peek", {
      math.max(0, i - limit),
      only_if = job.file.url,
      upper_bound = true,
    })
  else
    lines = lines:gsub("\t", string.rep(" ", rt.preview.tab_size))
    ya.preview_widget(
      job,
      ui.Text.parse(lines)
        :area(job.area)
        :wrap(rt.preview.wrap == "yes" and ui.Wrap.YES or ui.Wrap.NO)
    )
  end
end

function M:seek(job)
  require("code"):seek(job)
end

return M
