//
//  ViewController.m
//  google
//
//  Created by Bryan Fein on 8/12/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize locationManager, placePicker;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    self.googleMapView.delegate = self;
    [locationManager startUpdatingLocation];
    
    self.googleMapView.settings.compassButton = YES;
    self.googleMapView.settings.myLocationButton = YES;
    
    [self.googleMapView addObserver:self forKeyPath:@"myLocation" options:0 context:nil];
    
    }

-(BOOL)prefersStatusBarHidden {
    
    return YES;
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    self.googleMapView.myLocationEnabled = YES;

    [self CustomMarkers];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if([keyPath isEqualToString:@"myLocation"]) {
        CLLocation *currentLocation = [object myLocation];
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: currentLocation.coordinate.latitude
                                                       longitude: currentLocation.coordinate.longitude
                                                       zoom:15];
        
        self.googleMapView.camera = camera;

    }
}

-(void)CustomMarkers {
    
    GMSMarker *currentLocation = [[GMSMarker alloc]init];
    currentLocation.position = CLLocationCoordinate2DMake (40.741448, -73.989969);
    currentLocation.title = @"Current Location";
    currentLocation.snippet = @"New York";
    currentLocation.map = self.googleMapView;
    currentLocation.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    currentLocation.appearAnimation =kGMSMarkerAnimationPop;
    currentLocation.opacity = 1.0;
    
    
    GMSMarker *shakeShack = [[GMSMarker alloc]init];
    shakeShack.position = CLLocationCoordinate2DMake(40.741449, -73.988205);
    shakeShack.title = @"Shake Shack";
    shakeShack.snippet = @"New York";
    shakeShack.map = self.googleMapView;
    shakeShack.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    shakeShack.opacity = 1.0;
    shakeShack.appearAnimation =kGMSMarkerAnimationPop;
    shakeShack.userData = @"https://www.shakeshack.com/";
    
    
    GMSMarker *flatIronBuilding = [[GMSMarker alloc]init];
    flatIronBuilding.position = CLLocationCoordinate2DMake(40.74106, -73.989699);
    flatIronBuilding.title = @"Flat Iron Building";
    flatIronBuilding.snippet = @"New York";
    flatIronBuilding.map = self.googleMapView;
    flatIronBuilding.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    flatIronBuilding.opacity = 1.0;
    flatIronBuilding.appearAnimation =kGMSMarkerAnimationPop;
    flatIronBuilding.userData = @"https://en.wikipedia.org/wiki/Flatiron_Building";
    
}

- (IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex)
    {
        case 0:
            self.googleMapView.mapType =kGMSTypeNormal;
            break;
            
        case 1:
            self.googleMapView.mapType = kGMSTypeHybrid;
            break;
            
        case 2:
            self.googleMapView.mapType = kGMSTypeSatellite;
            break;
            
        case 3:
            self.googleMapView.mapType = kGMSTypeTerrain;
            
        default:
            break;
    }

}

-(void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
  
  //make space for the next view controller so you can avoid creating a segue issue
    //you arent using the webview on the storyboard, everything is done in code
    
    
    self.webView = [[WebViewController alloc]init];
    
//    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    self.webView = [mainStoryBoard instantiateViewControllerWithIdentifier:@"wb"];
//    
//    
    self.webView.webUrl = marker.userData;
    
    [self.navigationController pushViewController: self.webView animated:YES];

}

- (IBAction)places_button:(id)sender {
    {
        CLLocationCoordinate2D center = CLLocationCoordinate2DMake(40.741448, -73.989969);
        CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001);
        CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001);
        GMSCoordinateBounds *viewport = [[GMSCoordinateBounds alloc] initWithCoordinate:northEast
                                                                             coordinate:southWest];
        GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:viewport];
        placePicker = [[GMSPlacePicker alloc] initWithConfig:config];
        
        [placePicker pickPlaceWithCallback:^(GMSPlace *place, NSError *error) {
            if (error != nil) {
                NSLog(@"Pick Place error %@", [error localizedDescription]);
                return;
            }
            
            if (place != nil) {
                NSLog(@"Place name %@", place.name);
                NSLog(@"Place address %@", place.formattedAddress);
                NSLog(@"Place attributions %@", place.attributions.string);
            } else {
                NSLog(@"No place selected");
            }
        }];
    }
}


//IF you want to create a custom info window

//-(UIView *) mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
//
//    UIView *infoWindow = [[UIView alloc]init];
//    infoWindow.frame = CGRectMake(0, 0, 200, 70);
//    infoWindow.backgroundColor = [UIColor grayColor];
//
//    UILabel *titleLabel = [[UILabel alloc]init];
//    titleLabel.frame = CGRectMake(14, 11, 175, 16);
//
//    [infoWindow addSubview:titleLabel];
//    titleLabel.text = marker.title;
//
//    UILabel *snippitLabel = [[UILabel alloc]init];
//    snippitLabel.frame = CGRectMake(14, 11, 175, 16);
//    [infoWindow addSubview:snippitLabel];
//    titleLabel.text = marker.snippet;
//
//    return infoWindow;
//}

@end
