local MAP = {}

MAP.Key = 13
MAP.Map = "mg_piratewars_extended_fixed"
MAP.Name = "Pirate Wars Orignal"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = { "weapon_crowbar" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )