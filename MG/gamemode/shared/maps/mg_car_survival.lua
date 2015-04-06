local MAP = {}

MAP.Map = "mg_car_survival"
MAP.Name = "Car Survive"
MAP.Desc = "Default Garrysmod Map."
MAP.TeamBased = false
MAP.RoundBased = false
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )