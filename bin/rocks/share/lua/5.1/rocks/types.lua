---@mod rocks.types
--
-- Copyright (C) 2023 Neorocks Org.
--
-- Version:    0.1.0
-- License:    GPLv3
-- Created:    05 Jul 2023
-- Updated:    27 Aug 2023
-- Homepage:   https://github.com/nvim-neorocks/rocks.nvim
-- Maintainers: NTBBloodbath <bloodbathalchemist@protonmail.com>, Vhyrro <vhyrro@gmail.com>, mrcjkb <marc@jakobi.dev>
--
---@brief [[
--
-- rocks.nvim internal type definitions.
--
---@brief ]]

---@class OutdatedRock: Rock
---@field public target_version string

---@class (exact) RockDependency
---@field public name string
---@field public version? string

--- internal-types.lua ends here
