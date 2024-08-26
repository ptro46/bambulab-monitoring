# bambulab-monitoring

## prerequisites

* curl
* jq
* openssl
* mosquitto_sub

## credentials

complete credentials file with your login and password to bambulab web site.

```bash
login : YOUR_LOGIN
password : YOUR_PASSWORD
```

## login

execute login.curl, this script produce 3 files, it use bambulab cloud api.
* login.json
* accessToken
* refreshToken

```bash
$> ./login.curl
```

## getDevice.curl

execute getDevice.curl, this script produce device.json, it use bambulab cloud api.

2 entries are importants 
* "dev_id": "HERE_DEVICE_ID",
* "dev_access_code": "HERE_DEVICE_ACCESS_CODE",

```bash
$> getDefices.curl
```
```json
{
  "message": "success",
  "code": null,
  "error": null,
  "devices": [
    {
      "dev_id": "HERE_DEVICE_ID",
      "name": "3DP-00M-045",
      "online": true,
      "print_status": "SUCCESS",
      "dev_model_name": "BL-P001",
      "dev_product_name": "X1 Carbon",
      "dev_access_code": "HERE_DEVICE_ACCESS_CODE",
      "nozzle_diameter": 0.4,
      "dev_structure": "CoreXY"
    }
  ]
}
```

## getProfile.curl

execute getProfile.curl, this script produce profile.json, it use bambulab cloud api.

```bash
$> getProfile.curl
```
```json
{
  "uid": 00000000000,
  "uidStr": "00000000000",
  "account": "fname@gmail.com",
  "name": "user_00000000000",
  "avatar": "https://public-cdn.bblmw.com/default/avatar.png",
  "fanCount": 0,
  "followCount": 0,
  "identifier": 1,
  "likeCount": 0,
  "collectionCount": 0,
  "downloadCount": 0,
  "productModels": [
    "X1 Carbon"
  ],
  "personal": {
    "bio": "",
    "links": [],
    "taskWeightSum": 5228,
    "taskLengthSum": 171805,
    "taskTimeSum": 603477,
    "backgroundUrl": "https://public-cdn.bblmw.com/default/background.png",
    "designsInfo": [],
    "userLevel": {
      "level": 6,
      "gradeType": 0
    }
  },
  "isNSFWShown": 0,
  "myLikeCount": 0,
  "favoritesCount": 0,
  "defaultLicense": "",
  "point": 0,
  "tpModelAccounts": [],
  "bannedPermission": {
    "whole": false,
    "comment": false,
    "upload": false,
    "redeem": false
  },
  "MWCount": {
    "myDesignDownloadCount": 0,
    "myInstanceDownloadCount": 0,
    "designCount": 0,
    "myDesignPrintCount": 0,
    "myInstancePrintCount": 0
  },
  "certificated": false,
  "setting": {
    "isLikeOpen": 0,
    "isFollowOpen": 0,
    "isFanOpen": 0,
    "isFirmwareBetaOpen": false,
    "recommendStatus": 0
  }
}
```


## getTask.curl

execute getTasks.curl, this script produce tasks.json, it use bambulab cloud api.

```bash
$> getTasks.curl
```
```json
{
  "total": 80,
  "hits": [
    {
      "id": 000000000,
      "designId": 0,
      "designTitle": "",
      "instanceId": 0,
      "modelId": "000000000000000",
      "title": "R2D3_plate_2",
      "cover": "https://bbl-prod-us-model.s3.dualstack.us-west-1.amazonaws.com/private/...",
      "status": 2,
      "feedbackStatus": 0,
      "startTime": "2024-08-26T07:21:53Z",
      "endTime": "2024-08-26T08:30:23Z",
      "weight": 18.38,
      "length": 606,
      "costTime": 3791,
      "profileId": 0000000000,
      "plateIndex": 2,
      "plateName": "",
      "deviceId": "0000000000",
      "amsDetailMapping": [
        {
          "ams": 0,
          "sourceColor": "FFFFFFFF",
          "targetColor": "FFFFFFFF",
          "filamentId": "GFA00",
          "filamentType": "PLA",
          "targetFilamentType": "",
          "weight": 18.38
        }
      ],
      "mode": "lan_file",
      "isPublicProfile": false,
      "isPrintable": true,
      "isDelete": false,
      "deviceModel": "X1 Carbon",
      "deviceName": "3DP-00M-045",
      "bedType": "textured_plate"
    },
    {
    }
  ]
}
```

## get-mqtt.sh

Edit file get-mqtt.sh, modify PRINTER_IP with your bambulab printer ip address, and PRINTER_PASSWD with value returned by getDevice.curl, line dev_access_code, this script get file blcert.pem if not present, and launch mosquitto tu read humidity index values.

```bash
./get-mqtt.sh
Connecting to YOUR_IP_ADDRESS
Can't use SSL_get_servername
depth=1 C=CN, O=BBL Technologies Co., Ltd, CN=BBL CA
verify error:num=19:self-signed certificate in certificate chain
verify return:1
depth=1 C=CN, O=BBL Technologies Co., Ltd, CN=BBL CA
verify return:1
depth=0 CN=00M09C431900045
verify return:1
DONE
humidity: 1
humidity: 1
humidity: 1
humidity: 1
humidity: 1
humidity: 1
humidity: 1
humidity: 1
```
