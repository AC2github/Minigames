
function MakePlayerMenu( Type, GiveTo )
	local Frame = vgui.Create("DMGMenu")
	Frame:SetSize( 400, 120 )
	Frame:Center( )
	
	local OurPlayer = nil
	
	local Name = vgui.Create("DLabel", Frame )
	Name:SetPos( 25, 20 )
	Name:SetText("Player:")
	Name:SetFont("ScoreboardText")
	Name:SizeToContents( )
	
	local NameText = vgui.Create("DTextEntry", Frame )
	NameText:SetPos( 95, 20 )
	NameText:SetSize( 295, 20 )
	
	for k, v in pairs( player.GetAll( ) ) do
		if GiveTo == v:UserID( ) then 
			OurPlayer = v
		end
	end
	
	NameText:SetValue( OurPlayer:Name( ) )
	NameText:SetEditable( false )
	
	local Amount = vgui.Create("DLabel", Frame )
	Amount:SetPos( 25, 45 )
	
	if Type == "give" then
		Amount:SetText("Amount:")
	else
		Amount:SetText("Messsage:")
	end
	Amount:SetFont("ScoreboardText")
	
	local ToGive = vgui.Create("DTextEntry", Frame )
	ToGive:SetPos( 95, 45 )
	ToGive:SetSize( 295, 20 )
	
	local Send = vgui.Create("DButton", Frame )
	Send:SetSize( 185, 30 )
	Send:SetPos( 10, 80 )
	
	if Type == "give" then
		Send:SetText("Give")
	else
		Send:SetText("Send")
	end
	
	Send.DoClick = function( )
		if Type == "give" then
			RunConsoleCommand( "mg_give", GiveTo, ToGive:GetValue( ) )
		else
			RunConsoleCommand( "mg_pm", GiveTo, ToGive:GetValue( ) )
		end
		Frame:Close( )
	end
	
	local Close = vgui.Create("DButton", Frame )
	Close:SetSize( 185, 30 )
	Close:SetPos( 205, 80 )
	Close:SetText("Close")
	
	Close.DoClick = function( ) Frame:Close( ) end
end