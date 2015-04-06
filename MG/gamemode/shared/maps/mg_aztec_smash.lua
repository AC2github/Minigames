local MAP = {}

MAP.Key = 30
MAP.Map = "mg_aztec_smash"
MAP.Name = "Aztec Smash"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = {}
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )