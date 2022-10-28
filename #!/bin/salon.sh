#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


echo -e "\n~~~ Bem-vindo ao Salão da AlexC do Clash Royal! ~~~\n"

MAIN_MENU() {
if [[ $1 ]]
then
  echo -e "\n$1"
fi

echo -e "\nQual dos nossos serviços deseja usufruir?"
echo -e "\n1) Manicure;\n2) Pedicure;\n3) Maquiagem;\n4) Sair."
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
  1) AGENDA ;;
  2) AGENDA ;;
  3) AGENDA ;;
  4) SAIR ;;
  *) MAIN_MENU "Por favor, introduza uma opção válida."
esac
}

AGENDA() {
  # serviço escolhido
  SERVICE_SELECTED=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  
  # informação do cliente
  echo -e "\n Qual é o seu número de telemóvel?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

  # cliente não está na base de dados
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nQual é o seu nome?"
    read CUSTOMER_NAME
    # inserir novo cliente
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) 
    values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  # customer_id
  CUSTOMER_ID=$($PSQL "select customer_id from customers
  where phone='$CUSTOMER_PHONE'")

  # marcar hora
  echo -e "\nA que horas pretende agendar a sua marcação?"
  read SERVICE_TIME

  INSERT_APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time)
  values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  echo -e "\nI have put you down for a$SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

SAIR() {
  echo -e "\nObrigado pela visita, volte sempre!\n"
}


MAIN_MENU
