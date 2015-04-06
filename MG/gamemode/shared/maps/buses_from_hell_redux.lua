local MAP = {}

MAP.Key = 1
MAP.Map = "buses_from_hell_redux"
MAP.Name = "Buses"
MAP.Desc = "Very fun map."
MAP.TeamBased = false
MAP.RoundBased = true
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )