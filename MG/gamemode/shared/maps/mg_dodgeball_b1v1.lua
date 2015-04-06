local MAP = {}

MAP.Map = "mg_dodgeball_b1v1"
MAP.Name = "Dodgeball"
MAP.Desc = "Default Garrysmod Map."
MAP.TeamBased = false
MAP.RoundBased = false
MAP.Red = { "weapon_crowbar" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )