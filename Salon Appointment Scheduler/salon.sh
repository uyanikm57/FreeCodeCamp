#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "
#PRINT SERVICES LIST
SERVICE_LIST() {
  if [[ $1 ]]
  then
   echo -e $1
  fi

  # echo -e "\nPlease Select a Service!"
  echo "$($PSQL "SELECT * FROM SERVICES")" | while read SERVICE_ID BAR SERVICE_NAME
  do
  echo -e "$SERVICE_ID) $SERVICE_NAME"
  done

  #READ SELECTED SERVICE
  read SERVICE_ID_SELECTED
   #IF SERVICE DOES NOT EXIST
   if [[ -z $($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED") ]]
   then
   #RETURN SERVICE LIST
   SERVICE_LIST "\nSELECTED SERVICES DOES NOT EXIST"
   else
   SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
   echo -e "\n$SERVICE_ID_SELECTED) $SERVICE_NAME_SELECTED SELECTED"

   #READ CUSTOMER PHONE
   echo -e "\nWhat is ur phone number?"
   read CUSTOMER_PHONE
   if [[ -z $($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'") ]]
   then
   #READ CUSTOMER NAME
   echo -e "\nWhat is ur Name?"
   read CUSTOMER_NAME
   #INSERT CUSTOMER PHONE AND NAME
   ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
   if [[ $ADD_CUSTOMER_RESULT = "INSERT 0 1" ]]
   then
   echo "NEW CUSTOMER ADDED:$CUSTOMER_NAME , $CUSTOMER_PHONE"
   
   fi

   fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # READ APPOINTMENT TIME
   echo -e "\nWhen u want to make an appoientment?"
   read SERVICE_TIME
   #INSERT APPOINTMENT
   ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
   if [[ $ADD_APPOINTMENT_RESULT = "INSERT 0 1"  ]]
   then
   echo -e "I have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME. "
   fi


   fi


}

# CALL SERVICE LIST AS START
SERVICE_LIST