#!/bin/bash
DB_INSTANCE="guruvayur-uat-mysql"

check_db_status() {
    db_status=$(aws rds describe-db-instances --db-instance-identifier "$DB_INSTANCE" --query "DBInstances[0].DBInstanceStatus" --output text)
    if [ "$db_status" = "available" ]; then
         return 0  # Database is available
    else
         return 1  # Database is not available
    fi
}
 
if check_db_status; then
sh /app-hosting/OLS.sh
sh /app-hosting/Admin.sh

else
    echo "Database is not available"
fi
