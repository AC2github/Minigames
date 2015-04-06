local MAP = {}

MAP.Key = 1
MAP.Map = "mg_helicopters_from_hell"
MAP.Name = "Helicopters"
MAP.Desc = "Very fun map."
MAP.TeamBased = false
MAP.RoundBased = true
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )