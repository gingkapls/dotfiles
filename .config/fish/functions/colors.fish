function colors
	set num 0
	flavours info (flavours current) | tail -n16 | while read color;
		printf "%02d %02X %s" $num $num $color\n
		set num (math $num+1)
	end
end
