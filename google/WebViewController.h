//
//  WebViewController.h
//  google
//
//  Created by Bryan Fein on 8/13/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@interface WebViewController : UIViewController  <NSURLSessionDelegate, WKUIDelegate>


@property (nonatomic, strong) NSString *webUrl;
@property (nonatomic,strong) WKWebView *wkWebView;


@end
