//
//  MTDataAPIUrl.h
//  OrderSystemForZD
//
//  Created by Jason-景成 on 13-2-25.
//  Copyright (c) 2013年 Jason. All rights reserved.
//



#define OrderSystem_BASE [NSString stringWithFormat:@"http://115.29.111.28:8080/xyz"]

//URL Function
//登陆
#define OrderSystem_BASE_URL [NSString stringWithFormat:@"%@/signIn.do",OrderSystem_BASE]


#define OrderSystem_UPLOAD_IMAGE [NSString stringWithFormat:@"%@/uploadimg.do",OrderSystem_BASE]

//发型师列表
#define OrderSystem_STYLLIST [NSString stringWithFormat:@"%@/styllist.do",OrderSystem_BASE]

//修改发型师资料
#define OrderSystem_MODIFYSTYLLIST [NSString stringWithFormat:@"%@/modifyStyllist.do",OrderSystem_BASE]

//周排名
#define OrderSystem_RANKING [NSString stringWithFormat:@"%@/Ranking.do",OrderSystem_BASE]

//新闻，系统通告
#define OrderSystem_NEWS [NSString stringWithFormat:@"%@/systemNotices.do",OrderSystem_BASE]
//阅读通告
#define OrderSystem_READNEWS [NSString stringWithFormat:@"%@/readNotice.do",OrderSystem_BASE]

//评价
#define OrderSystem_SCORE [NSString stringWithFormat:@"%@/score.do",OrderSystem_BASE]

//SN码
#define OrderSystem_SNCODE [NSString stringWithFormat:@"%@/getSNcode.do",OrderSystem_BASE]

//预约
#define OrderSystem_APPOINTMENT [NSString stringWithFormat:@"%@/reserve.do",OrderSystem_BASE]

//修改预约
#define OrderSystem_APPOINTMENTUPDATE [NSString stringWithFormat:@"%@/updateReserveStatus.do",OrderSystem_BASE]

//领积分
#define OrderSystem_GETPOINT [NSString stringWithFormat:@"%@/getScoreByPhoneNumber.do",OrderSystem_BASE]


//#define OrderSystem_BASE_PATH [NSString stringWithFormat:@"/%@/",[MTUserDefault serviceName]]
//#define OrderSystem_TOKEN_URL [NSString stringWithFormat:@"?sid=%@",[MTUserDefault accessToken]]
//ItemService
#define OrderSystem_PATH_HOMES  @"ItemService/GetItemAll"
#define OrderSystem_PATH_SERIES @"ItemService/GetSeries"
#define OrderSystem_PATH_DESIGNS @"itemservice/getdesigns"
#define OrderSystem_PATH_STOCK  @"itemservice/getk3stockqty"
#define OrderSystem_PATH_PROMOTION @"itemservice/GetPromotions"
//MoreService
#define OrderSystem_PATH_MOREHOMES  @"ItemService/GetBoardItemAll"
#define OrderSystem_PATH_MORESERIES @"ItemService/GetBoardSeries"

//OrderService
#define OrderSystem_PATH_SUBMITE     @"OrderService/Submit"
#define OrderSystem_PATH_ADDIMAGE    @"OrderService/Add"
#define OrderSystem_PATH_ORDERS      @"OrderService/GetOrders"
#define OrderSystem_PATH_ORDERDETAIL @"OrderService/GetOrderDetails"
#define OrderSystem_PATH_ORDERDEL    @"OrderService/DelOrder"
#define OrderSystem_PATH_DISCOUNT    @"OrderService/GetDiscounts"
//SceneService
#define OrderSystem_PATH_SCENE                @"SceneService/GetSceneAll"
#define OrderSystem_PATH_SCENE_PICURL         @"SceneService/GetSceneUrls"
#define OrderSystem_PATH_SCENE_ID             @"SceneService/GetSceneIDs"
#define OrderSystem_PATH_SCENE_SINGLE         @"SceneService/GetScene"
#define OrderSystem_PATH_WINDOWS              @"sceneservice/getwindows"
#define OrderSystem_PATH_STYLES               @"sceneservice/getstyles"
#define OrderSystem_PATH_FUNCTIONS            @"sceneservice/getfunctions"
// BasicService
#define OrderSystem_PATH_LOGIN                @"basicservice/Login"
#define OrderSystem_PATH_GETVERSION  @"basicservice/TestGetVersion"
#define OrderSystem_PATH_ENTERPRISES          @"BasicService/GetEnterprise"
#define OrderSystem_PATH_CUSOTMENTERPRISES    @"BasicService/GetEnterprises"
#define OrderSystem_PATH_GPS                  @"BasicService/SendGPS"
#define OrderSystem_PATH_GPSHISTORY                  @"BasicService/GetGPSHistory"
#define OrderSystem_PATH_MESSAGE              @"basicservice/getmessage"
#define OrderSystem_PATH_MESSAGECOUNT              @"basicservice/getmessagecount"

// Customers
#define OrderSystem_PATH_CUSOTMERS            @"CustomerService/GetCustomers"
#define OrderSystem_PATH_CUSOTMERS_ACTIVITYS  @"CustomerService/GetActivitys"
#define OrderSystem_PATH_CUSOTMERS_ORDERS     @"CustomerService/GetOrders"
#define OrderSystem_PATH_SUBMITE_RECORDS      @"CustomerService/SubmitActivity"
#define OrderSystem_PATH_CUSTOMER_ADD         @"CustomerService/AddCust"
#define OrderSystem_PATH_CUSTOMER_ADDCUSTOMER         @"CustomerService/AddCustomer"
#define OrderSystem_PATH_CUSTOMER_DELCUSTOMER         @"CustomerService/DelCustomer"
#define OrderSystem_PATH_CUSTOMER_MODCUSTOMER         @"CustomerService/ModCustomer"
#define OrderSystem_PATH_CUSOTMERS_ORDERS     @"CustomerService/GetOrders"
#define OrderSystem_PATH_CUSOTMERS_WAYS       @"CustomerService/GetWays"
#define OrderSystem_PATH_CUSOTMERS_CITYS      @"CustomerService/GetCitys"
#define OrderSystem_PATH_CUSOTMERS_VILLAGES   @"CustomerService/GetVillages"
//Visits
#define OrderSystem_PATH_VISITS            @"OrderService/GetCustomerBack"
#define OrderSystem_PATH_VISIT_MODVISIT            @"OrderService/ModCustomerBack"
//NOrder
#define OrderSystem_PATH_NORDER                       @"OrderService/GetNOrder"
#define OrderSystem_PATH_SUBMIT_NORDER            @"OrderService/SubmitNOrder"

//ChartMsg
#define OrderSystem_PATH_CHARTMSG             @"chatservice/getchatmsg"
#define OrderSystem_PATH_CHARTGETALLMSG       @"chatservice/getchatall"
#define OrderSystem_PATH_SENDCHARTMSG         @"chatservice/sendchatmsg"
#define OrderSystem_PATH_SENDCHARTPIC         @"chatservice/sendchatpic"
#define OrderSystem_PATH_GETNOREADNUM         @"chatservice/getchatmsgcount"
//ReportService
#define OrderSystem_PATH_REPORTINFO           @"ReportService/GetReportList"
#define OrderSystem_PATH_REPORT               @"ReportService/Create"
//AuthenticationService
#define OrderSystem_PATH_SIGNUP               @"AuthenticationService/Add"

#define OrderSystem_PATH_MD5s                 @"basicservice/getMD5s"
#define OrderSystem_PATH_BAIDUMD5s                 @"basicservice/GetBaiduMD5s"
#define OrderSystem_PATH_BAIDUBEEBOXMD5s                 @"basicservice/GetBaiduBeeBoxMD5s"

#define OrderSystem_PATH_LOACTION          @"LocationService/GetLocation"


//MemberService
#define OrderSystem_PATH_ATTRIBUTES                 @"MemberService/GetVIPSelectionAll"

//Creadit
#define OrderSystem_PATH_CREADIT_GETCREADIT           @"MemberService/GetCredit"
#define OrderSystem_PATH_CREADIT_SETCREADIT         @"MemberService/SetCredit"

//Gift
#define OrderSystem_PATH_GIFT_GETGIFT           @"MemberService/GetGifts"
#define OrderSystem_PATH_GIFT_ADDGIFT        @"MemberService/AddorModGift"
#define OrderSystem_PATH_GIFT_ADDGIFTS        @"MemberService/AddorModGifts"
#define OrderSystem_PATH_GIFT_DELGIFT        @"MemberService/DelGift"

//MarketingActivity
#define OrderSystem_PATH_MACTIVITY_GETMACTIVITY           @"MemberService/GetMarketingActivitys"
#define OrderSystem_PATH_MACTIVITY_ADDMACTIVITY       @"MemberService/AddorModMarketingActivity"
#define OrderSystem_PATH_MACTIVITY_DELMACTIVITY        @"MemberService/DELMarketingActivity"
//<<<<<<< .mine

//Expense
#define OrderSystem_PATH_EXPENSE_GETVIPCONSUMES           @"MemberService/GetVIPConsumes"
#define OrderSystem_PATH_EXPENSE_SETVIPCONSUME           @"MemberService/SubmitVIPConsume"
#define OrderSystem_PATH_EXPENSE_SETVIPCONSUMES           @"MemberService/SubmitVIPConsumes"

//=======

//VIPTask
#define OrderSystem_PATH_VIPTASK_GETVIPTASK           @"MemberService/GetVIPTasks"
#define OrderSystem_PATH_VIPTASK_SETVIPTASK       @"MemberService/AddorModVIPTask"
#define OrderSystem_PATH_VIPTASK_DELVIPTASK        @"MemberService/DELVIPTask"

//VIPServiceTrack
#define OrderSystem_PATH_VIPSERVICETRACK_GETVIPSERVICETRACK       @"MemberService/GetVIPServiceTracks"
#define OrderSystem_PATH_VIPSERVICETRACK_SETVIPSERVICETRACK       @"MemberService/AddorModVIPServiceTrack"
#define OrderSystem_PATH_VIPSERVICETRACK_DELVIPSERVICETRACK       @"MemberService/DELVIPServiceTrack"

//VIPCareTrack
#define OrderSystem_PATH_VIPCARETRACK_GETVIPCARETRACK       @"MemberService/GetVIPCareTracks"
#define OrderSystem_PATH_VIPCARETRACK_SETVIPCARETRACK       @"MemberService/AddorModVIPCareTrack"
#define OrderSystem_PATH_VIPCARETRACK_DELVIPCARETRACK       @"MemberService/DELVIPCareTrack"

//VIPComplain
#define OrderSystem_PATH_VIPCOMPLAIN_GETVIPCOMPLAIN       @"MemberService/GetVIPComplains"
#define OrderSystem_PATH_VIPCOMPLAIN_SETVIPCOMPLAIN       @"MemberService/AddorModVIPComplain"
#define OrderSystem_PATH_VIPCOMPLAIN_DELVIPCOMPLAIN       @"MemberService/DELVIPComplain"
