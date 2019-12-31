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
          'F6CECE',
          'F5A9A9',
          'F78181',
          'FA5858',
          'FE2E2E',
          'FF0000',
          'DF0101',
          'B40404',
          '8A0808',
          '610B0B',
          -- '3B0B0B',
        },

        -- oranges
        {
          'F6E3CE',
          'F5D0A9',
          'F7BE81',
          'FAAC58',
          'FE9A2E',
          'FF8000',
          'DF7401',
          'B45F04',
          '8A4B08',
          '61380B',
          -- '3B240B',
        },

        -- yellows
        {
          'F5F6CE',
          'F2F5A9',
          'F3F781',
          'F4FA58',
          'F7FE2E',
          'FFFF00',
          'D7DF01',
          'AEB404',
          '868A08',
          '5E610B',
          -- '393B0B',
        },

        -- lime greens
        -- {
        --   'E3F6CE',
        --   'D0F5A9',
        --   'BEF781',
        --   'ACFA58',
        --   '9AFE2E',
        --   '80FF00',
        --   '74DF00',
        --   '5FB404',
        --   '4B8A08',
        --   '38610B',
        --   -- '243B0B',
        -- },

        -- greens
        {
          'CEF6CE',
          'A9F5A9',
          '81F781',
          '58FA58',
          '2EFE2E',
          '00FF00',
          '01DF01',
          '04B404',
          '088A08',
          '0B610B',
          -- '0B3B0B',
        },

        -- turqoises
        -- {
        --   'CEF6E3',
        --   'A9F5D0',
        --   '81F7BE',
        --   '58FAAC',
        --   '2EFE9A',
        --   '00FF80',
        --   '01DF74',
        --   '04B45F',
        --   '088A4B',
        --   '0B6138',
        --   -- '0B3B24',
        -- },

        -- cyans
        {
          'CEF6F5',
          'A9F5F2',
          '81F7F3',
          '58FAF4',
          '2EFEF7',
          '00FFFF',
          '01DFD7',
          '04B4AE',
          '088A85',
          '0B615E',
          -- '0B3B39',
        },

        -- teals
        {
          'CEE3F6',
          'A9D0F5',
          '81BEF7',
          '58ACFA',
          '2E9AFE',
          '0080FF',
          '0174DF',
          '045FB4',
          '084B8A',
          '0B3861',
          -- '0B243B',
        },

        -- blues
        {
          'CECEF6',
          'A9A9F5',
          '8181F7',
          '5858FA',
          '2E2EFE',
          '0000FF',
          '0101DF',
          '0404B4',
          '08088A',
          '0B0B61',
          -- '0B0B3B',
        },

        -- purples
        {
          'E3CEF6',
          'D0A9F5',
          'BE81F7',
          'AC58FA',
          '9A2EFE',
          '8000FF',
          '7401DF',
          '5F04B4',
          '4B088A',
          '380B61',
          -- '240B3B',
        },

        -- magentas
        {
          'F6CEF5',
          'F5A9F2',
          'F781F3',
          'FA58F4',
          'FE2EF7',
          'FF00FF',
          'DF01D7',
          'B404AE',
          '8A0886',
          '610B5E',
          -- '3B0B39',
        },

        -- grays
        {
          'FFFFFF',
          'F2F2F2',
          -- 'E6E6E6',
          -- 'D8D8D8',
          'BDBDBD',
          'A4A4A4',
          '848484',
          '6E6E6E',
          '585858',
          '424242',
          -- '2E2E2E',
          '1C1C1C',
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
