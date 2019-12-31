function data()
  local minorVersion = 0

  return {
    info = {
      minorVersion = minorVersion,
      severityAdd = "NONE",
      severityRemove = "NONE",
      name = _("Name"),
      description = _("Description"),
      tags = { "Script Mod" },
      authors = {
        {
          name = "MrWolfZ",
          role = 'CREATOR',
        },
      },
    },
    runFn = function (settings)
      -- the game tries to make the color chart a square if possible, adding a new column first
      -- if required, e.g. 64 colors result in an 8x8 grid, while 56 colors result in a 7x8 grid;
      -- this allows us to have 8 colors with 7 hues each

      -- first, we define the colors as RGB hex values

      local colors = {
        -- reds
        {
          'F8E0E0',
          'F5A9A9',
          'FA5858',
          'FF0000',
          'B40404',
          '610B0B',
          '2A0A0A',
        },

        -- oranges
        {
          'F8ECE0',
          'F5D0A9',
          'FAAC58',
          'FF8000',
          'B45F04',
          '61380B',
          '2A1B0A',
        },

        -- yellows
        {
          'F7F8E0',
          'F2F5A9',
          'F4FA58',
          'FFFF00',
          'AEB404',
          '5E610B',
          '292A0A',
        },

        -- greens
        {
          'E0F8E0',
          'A9F5A9',
          '58FA58',
          '00FF00',
          '04B404',
          '0B610B',
          '0A2A0A',
        },

        -- cyans
        {
          'E0F8F7',
          'A9F5F2',
          '58FAF4',
          '00FFFF',
          '04B4AE',
          '0B615E',
          '0A2A29',
        },

        -- blues
        {
          'E0E0F8',
          'A9A9F5',
          '5858FA',
          '0000FF',
          '0404B4',
          '0B0B61',
          '0A0A2A',
        },

        -- magentas
        {
          'F8E0F7',
          'F5A9F2',
          'FA58F4',
          'FF00FF',
          'B404AE',
          '610B5E',
          '2A0A29',
        },

        -- grays
        {
          'FFFFFF',
          'E6E6E6',
          'BDBDBD',
          '848484',
          '585858',
          '2E2E2E',
          '000000',
        },
      }

      -- the game requires the colors to be a one-dimensional array of RGB decimals in the range 0-1;
      -- we build this array by iterating over the colors above in the correct order and transforming
      -- each hex value to the correct range
      local nrOfRows = #colors[1]
      local nrOfColumns = #colors
      local result = {}

      local function hexToNormalizedDecimal(hexValue)
        return tonumber(hexValue, 16) / 255
      end

      for row = 1, nrOfRows do
        for column = 1, nrOfColumns do
          local hexValue = colors[column][row]
          local redValue = hexToNormalizedDecimal(string.sub(hexValue, 1, 2))
          local greenValue = hexToNormalizedDecimal(string.sub(hexValue, 3, 4))
          local blueValue = hexToNormalizedDecimal(string.sub(hexValue, 5, 6))

          local rgb = { redValue, greenValue, blueValue }

          table.insert(result, rgb)
        end
      end

      game.config.gui.lineColors = result
    end,
  }
end
