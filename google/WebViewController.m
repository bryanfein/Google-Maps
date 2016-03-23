//
//  WebViewController.m
//  google
//
//  Created by Bryan Fein on 8/13/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize wkWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wkWebView = [[WKWebView alloc]initWithFrame:self.view.frame];
    
    NSURL *URL2 = [NSURL URLWithString:self.webUrl];
    
    [self setView:self.wkWebView];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL2];
    [self.wkWebView loadRequest:request];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
