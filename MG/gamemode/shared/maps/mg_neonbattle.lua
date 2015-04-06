local MAP = {}

MAP.Key = 1
MAP.Map = "mg_neonbattle"
MAP.Name = "Neon battle"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = { "weapon_crowbar" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )