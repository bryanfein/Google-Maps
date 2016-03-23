//
//  CustomLocation.m
//  google
//
//  Created by Bryan Fein on 8/14/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import "CustomLocation.h"

@implementation CustomLocation


-(id)initWithTitle:(NSString *)title snippit:(NSString *)snippit map :(GMSMapView *)map placeUrl:(NSString*)placeUrl location:(CLLocationCoordinate2D)location {
    
    if( self = [super init])
    {
        self.title = title;
        self.snippet = snippit;
        self.map = map;
        self.userData = placeUrl;
 
        
    }
    return self;
}



@end
