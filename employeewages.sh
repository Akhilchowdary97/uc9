EMPLOYEE_PART_TIME=1
EMPLOYEE_FULL_TIME=2
EMPLOYEE_RATE_PER_HOUR=100
MAX_WORKING_DAYS=5
MAX_WORKING_HOURS=200


#Variable
totalWage=0             #camel case
total_working_days=0    #underscore
total_working_hours=0

#get employee wage per day
getEmployeeWage() {
        #switch - generate workDone per day
        case $1 in
                $EMPLOYEE_PART_TIME) workDone=4;;
                $EMPLOYEE_FULL_TIME) workDone=8;;
                *) workDone=0;;
        esac
        echo $workDone;
}

#calculate wage for each day
while [ $total_working_days -lt $MAX_WORKING_DAYS ]
do
        ((total_working_days++));
        workDone=$( getEmployeeWage $((RANDOM%3)) );
        tempWage=$((workDone*EMPLOYEE_RATE_PER_HOUR));
        total_working_hours=$((total_working_hours+workDone));
        totalWage=$((totalWage+tempWage));
done

echo "tempWage - " $tempWage
echo "totalWage - " $totalWage
