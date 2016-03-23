//
//  CustomLocation.h
//  google
//
//  Created by Bryan Fein on 8/14/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>

@interface CustomLocation : GMSMarker


-(id)initWithTitle:(NSString *)title snippit:(NSString *)snippit map :(GMSMapView *)map placeUrl:(NSString*)placeUrl location:(CLLocationCoordinate2D)location;


@end
