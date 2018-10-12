//
//  GPXSoundscapeExtensions.h
//  iOS-GPX-Framework
//
//  Created by Daniel Tsirulnikov on 10/11/18.
//

#import "GPXElement.h"
@import CoreLocation;

@interface GPXSoundscapeExtensions : GPXElement

@property (strong, nonatomic) NSNumber *horizontalAccuracy;
@property (strong, nonatomic) NSNumber *verticalAccuracy;

@property (strong, nonatomic) NSNumber *trueHeading;
@property (strong, nonatomic) NSNumber *magneticHeading;
@property (strong, nonatomic) NSNumber *headingAccuracy;

@property (strong, nonatomic) NSNumber *floorLevel;

/// examples: stationary, walking, running, automotive, cycling
@property (strong, nonatomic) NSString *activity;

@end
