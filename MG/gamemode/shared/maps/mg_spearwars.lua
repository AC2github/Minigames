local MAP = {}

MAP.Key = 30
MAP.Map = "mg_spearwars"
MAP.Name = "Spear Wars"
MAP.Desc = "Very fun map."
MAP.TeamBased = false
MAP.RoundBased = false
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )