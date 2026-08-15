-- disables the bike music and keeps the regular overworld music playing
return function(mod)
  mod.hooks:wrap("music.select", function(next, song, ctx)
    if ctx.onBike and not ctx.battleKind and not ctx.surfing then
      return ctx.mapSong
    end
    return next(song, ctx)
  end)
end
