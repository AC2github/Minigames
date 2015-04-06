local MAP = {}

MAP.Key = 1
MAP.Map = "mg_runrace_jss"
MAP.Name = "RunRace"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )