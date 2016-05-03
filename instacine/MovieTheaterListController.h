//
//  FirstViewController.h
//  instacine
//
//  Created by Térence Marill on 22/04/2016.
//  Copyright © 2016 Térence Marill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MovieApiClient.h"
#import <HTMLReader/HTMLReader.h>

@interface MovieTheaterListController : UITableViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

