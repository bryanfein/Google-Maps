//
//  ViewController.h
//  google
//
//  Created by Bryan Fein on 8/12/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CustomLocation.h"
#import "WebViewController.h"

@import GoogleMaps;


@interface ViewController : UIViewController <GMSMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate, UISearchControllerDelegate>



@property (strong, nonatomic) UISearchBar * searchBar;
@property (strong, nonatomic) IBOutlet GMSMapView *googleMapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) GMSPlacePicker *placePicker;
@property (strong, nonatomic) WebViewController *webView;
@property (strong, nonatomic) NSString *url;



- (IBAction)setMap:(id)sender;

- (IBAction)places_button:(id)sender;


-(void)CustomMarkers;

@end

