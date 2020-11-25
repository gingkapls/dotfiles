## A progressbar for rsync
function progsync 
	rsync -a --inplace --sparse --info=progress2 --out-format="%f" $argv | while read progval;
		set progress (echo $progval | awk '/%/ sub(/%/,"",$3) {print $3}')
		set speed (echo $progval | awk '/%/ {print $4}')
		notify-send "				   $speed        $progress%" -h int:value:$progress --app-name=progressbar -t 50000
		end
		makoctl dismiss -a
end

