echo "____________________________________________________________________________________________________"
d=$(date +"%d%m%Y_%H%M")
echo $d
total_space=$(free -mt | awk '{print $2}' | head -n 2 | tail -n 1)
free_space=$(free -mt | awk '{print $4}' | head -n 2 | tail -n 1)
#Now putting the condition that if the free RAM space falls below 40% of the total RAM available then clear the cache.
threshold=$((40*$total_space/100))
if [ $free_space -lt $threshold ]
then
echo "RAM data before clearing cache"
free -mth
sync; echo 1 > /proc/sys/vm/drop_caches
echo "RAM data after clearing cache"
free -mth
else
echo "RAM utilization is proper. No action needed"
free -mth
fi
echo "____________________________________________________________________________________________________"


