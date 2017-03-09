function DefaultStartFunction()
	--initialize status points and set online
	orion.SetPoint({name="MOTOR_LEFT_STAT @Logic", value=0, online=true})
	orion.SetPoint({name="MOTOR_RIGHT_STAT @Logic", value=0, online=true})
	orion.SetPoint({name="MOTOR_FORWARD_STAT @Logic", value=0, online=true})
	orion.SetPoint({name="MOTOR_BACKWARD_STAT @Logic", value=0, online=true})
end

function Motor_Ctrl(point)
	if orion.GetPoint(point).value == 1 then --only run if control is on
		--set outputs off first
		orion.SetPoint({name="Output01 @Card_B", value=0, online=true})
		orion.SetPoint({name="Output02 @Card_B", value=0, online=true})
		orion.SetPoint({name="Output03 @Card_B", value=0, online=true})
		orion.SetPoint({name="Output04 @Card_B", value=0, online=true})
		orion.SetPoint({name="Output01 @Card_A", value=0, online=true})
		orion.SetPoint({name="Output02 @Card_A", value=0, online=true})
		orion.SetPoint({name="Output03 @Card_A", value=0, online=true})
		orion.SetPoint({name="Output04 @Card_A", value=0, online=true})
		--set status points off
		orion.SetPoint({name="MOTOR_LEFT_STAT @Logic", value=0, online=true})
		orion.SetPoint({name="MOTOR_RIGHT_STAT @Logic", value=0, online=true})
		orion.SetPoint({name="MOTOR_FORWARD_STAT @Logic", value=0, online=true})
		orion.SetPoint({name="MOTOR_BACKWARD_STAT @Logic", value=0, online=true})
	
		if point == "MOTOR_LEFT_CTRL @Logic" then
			orion.EnableTimer("Motor_Left") --begin timer delay for left turn
		elseif point == "MOTOR_RIGHT_CTRL @Logic" then
			orion.EnableTimer("Motor_Right") --begin timer delay for right turn
		elseif point == "MOTOR_FORWARD_CTRL @Logic" then
			orion.EnableTimer("Motor_Forward") --begin timer delay for right turn
		elseif point == "MOTOR_BACKWARD_CTRL @Logic" then
			orion.EnableTimer("Motor_Backward") --begin timer delay for right turn
		end
		orion.SetPoint({name=point, value=0, online=true}) --turn control off
	end		
end

function Motor_Left_Timer()
	--set output 1B on
	orion.SetPoint({name="Output01 @Card_B", value=1, online=true})
	--set output 3B on
	orion.SetPoint({name="Output03 @Card_B", value=1, online=true})
	--set output 1A on
	orion.SetPoint({name="Output01 @Card_A", value=1, online=true})
	--set output 3A on
	orion.SetPoint({name="Output03 @Card_A", value=1, online=true})
	--set status point for left turn on
	orion.SetPoint({name="MOTOR_LEFT_STAT @Logic", value=1, online=true})
	--disable timer after one pass
	orion.DisableTimer("Motor_Left")
end

function Motor_Right_Timer()
	--set output 2B on
	orion.SetPoint({name="Output02 @Card_B", value=1, online=true})
	--set output 4B on
	orion.SetPoint({name="Output04 @Card_B", value=1, online=true})
	--set output 2A on
	orion.SetPoint({name="Output02 @Card_A", value=1, online=true})
	--set output 4A on
	orion.SetPoint({name="Output04 @Card_A", value=1, online=true})
	--set status point for right turn on
	orion.SetPoint({name="MOTOR_RIGHT_STAT @Logic", value=1, online=true})
	--disable timer after one pass
	orion.DisableTimer("Motor_Right")
end

function Motor_Forward_Timer()
	--set output 2B on
	orion.SetPoint({name="Output02 @Card_B", value=1, online=true})
	--set output 4B on
	orion.SetPoint({name="Output04 @Card_B", value=1, online=true})
	--set output 2A on
	orion.SetPoint({name="Output01 @Card_A", value=1, online=true})
	--set output 4A on
	orion.SetPoint({name="Output03 @Card_A", value=1, online=true})
	--set status point for right turn on
	orion.SetPoint({name="MOTOR_FORWARD_STAT @Logic", value=1, online=true})
	--disable timer after one pass
	orion.DisableTimer("Motor_Forward")
end

function Motor_Backward_Timer()
	--set output 2B on
	orion.SetPoint({name="Output01 @Card_B", value=1, online=true})
	--set output 4B on
	orion.SetPoint({name="Output03 @Card_B", value=1, online=true})
	--set output 2A on
	orion.SetPoint({name="Output02 @Card_A", value=1, online=true})
	--set output 4A on
	orion.SetPoint({name="Output04 @Card_A", value=1, online=true})
	--set status point for right turn on
	orion.SetPoint({name="MOTOR_BACKWARD_STAT @Logic", value=1, online=true})
	--disable timer after one pass
	orion.DisableTimer("Motor_Backward")
end

