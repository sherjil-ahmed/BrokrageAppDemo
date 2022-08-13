# BrokrageAppDemo
InterviewCodingTest
Create a SQL Server Database (script can be found under Database Script folder) you may need to change the path of database files inside the script before runing.
db sCRIPT IS COMPATIBLE WITH sql Server 2012 Express edition
open the solution in VS 2017 or 2019 (Community edition)
change the connection strinng in web.config file as per your local sql server configuration (ServerName, Database Name, user id and password)
for quick reference, ERD.png is placed under database script folder.
willl share the online hosting link over email
to review the code, the mail file can be found "BrokrageAppDemo\BrokrageWebApi\Controllers\PoliciesController.cs"
as the requirement says to implement query policies only therefore I have created default query to return all policies and additional POST request for Policy Search/Filter/Sort
api can be like http://localhost:61519/api/policies
the result will be 
[{"PolicyId":1,"CustommerId":1,"InsurerId":1,"PolicyTypeId":1,"StatusId":2,"ClientId":1,"CustommerName":"ABC Joinery","InsurerName":"Aviva","PolicyType":"Public Liability","Premium":123.87,"Status":"Active","ClientName":"\"Achme Broker Ltd"},{"PolicyId":2,"CustommerId":2,"InsurerId":2,"PolicyTypeId":1,"StatusId":2,"ClientId":1,"CustommerName":"\"XYZ Plumbing","InsurerName":"Allianz","PolicyType":"Public Liability","Premium":2321.45,"Status":"Active","ClientName":"\"Achme Broker Ltd"},{"PolicyId":3,"CustommerId":3,"InsurerId":1,"PolicyTypeId":2,"StatusId":2,"ClientId":1,"CustommerName":"Fast Taxis","InsurerName":"Aviva","PolicyType":"Motor Fleet","Premium":59897.0,"Status":"Active","ClientName":"\"Achme Broker Ltd"},{"PolicyId":4,"CustommerId":3,"InsurerId":3,"PolicyTypeId":1,"StatusId":2,"ClientId":1,"CustommerName":"Fast Taxis","InsurerName":"QBE","PolicyType":"Public Liability","Premium":6845.0,"Status":"Active","ClientName":"\"Achme Broker Ltd"}]

formated result 

[
  {
    "PolicyId": 1,
    "CustommerId": 1,
    "InsurerId": 1,
    "PolicyTypeId": 1,
    "StatusId": 2,
    "ClientId": 1,
    "CustommerName": "ABC Joinery",
    "InsurerName": "Aviva",
    "PolicyType": "Public Liability",
    "Premium": 123.87,
    "Status": "Active",
    "ClientName": "\"Achme Broker Ltd"
  },
  {
    "PolicyId": 2,
    "CustommerId": 2,
    "InsurerId": 2,
    "PolicyTypeId": 1,
    "StatusId": 2,
    "ClientId": 1,
    "CustommerName": "\"XYZ Plumbing",
    "InsurerName": "Allianz",
    "PolicyType": "Public Liability",
    "Premium": 2321.45,
    "Status": "Active",
    "ClientName": "\"Achme Broker Ltd"
  },
  {
    "PolicyId": 3,
    "CustommerId": 3,
    "InsurerId": 1,
    "PolicyTypeId": 2,
    "StatusId": 2,
    "ClientId": 1,
    "CustommerName": "Fast Taxis",
    "InsurerName": "Aviva",
    "PolicyType": "Motor Fleet",
    "Premium": 59897,
    "Status": "Active",
    "ClientName": "\"Achme Broker Ltd"
  },
  {
    "PolicyId": 4,
    "CustommerId": 3,
    "InsurerId": 3,
    "PolicyTypeId": 1,
    "StatusId": 2,
    "ClientId": 1,
    "CustommerName": "Fast Taxis",
    "InsurerName": "QBE",
    "PolicyType": "Public Liability",
    "Premium": 6845,
    "Status": "Active",
    "ClientName": "\"Achme Broker Ltd"
  }
]
