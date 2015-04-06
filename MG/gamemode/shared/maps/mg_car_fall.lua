local MAP = {}

MAP.Key = 30
MAP.Map = "mg_car_fall"
MAP.Name = "Car Fall"
MAP.Desc = "Very fun map."
MAP.TeamBased = false
MAP.RoundBased = false
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )