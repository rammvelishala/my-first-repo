#!/bin/bash
#check the available space on file system
for ips in $(cat /home/ec2-user/scripts/ips.txt);
do
echo "-  -    -     -    -    -    -   -  -  -   - "
echo "Disk space utilization for $ips"
total=$(ssh -i /home/ec2-user/guruvayur-ec2-keypair.pem ec2-user@$ips df -h | grep /$ | awk '{print$2}')
available=$(ssh -i /home/ec2-user/guruvayur-ec2-keypair.pem ec2-user@$ips df -h | grep /$ | awk '{print$4}')
used=$(ssh -i /home/ec2-user/guruvayur-ec2-keypair.pem ec2-user@$ips df -hT | grep /$ | awk '{print$6}')
echo "total space = $total  -  Available space = $available  -  usedspace = $used"

#check the ram utilization
echo "Ram memory  utilzation for $ips"
t=$(ssh -i /home/ec2-user/guruvayur-ec2-keypair.pem ec2-user@$ips free -mth | grep "Mem:" | awk '{print($2)}')
rem=$(ssh -i /home/ec2-user/guruvayur-ec2-keypair.pem ec2-user@$ips free -mth | grep "Mem:" | awk '{print($3)}')
a=$(ssh -i /home/ec2-user/guruvayur-ec2-keypair.pem ec2-user@$ips free -mth | grep "Mem:" | awk '{print($7)}')
echo "total space = $t  -  Available space = $a  -  usedspace = $rem"
done
