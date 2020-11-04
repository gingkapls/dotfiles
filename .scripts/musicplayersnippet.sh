seq -s - 0  (math (mpc | awk 'FNR==2 {gsub(/[()%]/,,); print }') / 5) | sed 's/[0-9]//g'
