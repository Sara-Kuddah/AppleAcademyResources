# Apple Academy Resources

 Apple Academy Resources is an API provide for Apple student all the cource resources Coding , Business and Design
 
 ##How to make an API call
 Read from uor API use GET method with the following urls
 
 ### get all resourcess url
 ```url
 https://apple-academy-resources.herokuapp.com/resources/
 ```
  ### get all Coding resourcess url
 ```url
 https://apple-academy-resources.herokuapp.com/resources/coding
 ```
   ### get all Business resourcess url
 ```url
 https://apple-academy-resources.herokuapp.com/resources/business
 ```
   ### get all Design resourcess url
 ```url
 https://apple-academy-resources.herokuapp.com/resources/design
 ```
 
Add new resource to uor API use POST method with the following url and JSON body

 ### Post new resourcess url
 ```url
 https://apple-academy-resources.herokuapp.com/resources
 ```
 ### Requst JSON Body Example:
 ```json
 {
        "id": "{{$ugid}}",
        "title": "Configuring your Xcode project to use source control",
        "pathName": "Coding",
        "link": "https://developer.apple.com/documentation/xcode/configuring-your-xcode-project-to-use-source-control"
    }
 ```
 
 Update one resource to uor API use PUT method with the following url and JSON body

 ### Update one resource url
 ```url
 https://apple-academy-resources.herokuapp.com/resources
 ```
 ### Requst JSON Body Example:
 ```json
 {
        "id": "AFFE9FDC-B6DC-4854-9ACC-9BB4CD24FA30",
        "title": "updated titel",
        "pathName": "updated pathName",
        "link": "updated link"
    }
 ```
 
  Delete one resource from uor API use DELETE method with the following url and JSON body

 ### Update one resource url
 ```url
 https://apple-academy-resources.herokuapp.com/resources
 ```
 ### Requst JSON Body Example:
 ```json
 {
        "id": "AFFE9FDC-B6DC-4854-9ACC-9BB4CD24FA30",
        "title": "Configuring your Xcode project to use source control",
        "pathName": "Coding",
        "link": "https://developer.apple.com/documentation/xcode/configuring-your-xcode-project-to-use-source-control"
    }
 ```
 
 ## We hope that tis API helps you , and we ar open for any feedback to make it better
 
