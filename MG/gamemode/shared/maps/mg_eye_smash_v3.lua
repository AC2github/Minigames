local MAP = {}

MAP.Key = 1
MAP.Map = "mg_eye_smash_v3"
MAP.Name = "Eye smash"
MAP.Desc = "Very fun map."
MAP.TeamBased = false
MAP.RoundBased = false
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )