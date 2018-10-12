//
//  GPXExtensions.h
//  GPX Framework
//
//  Created by NextBusinessSystem on 12/04/06.
//  Copyright (c) 2012 NextBusinessSystem Co., Ltd. All rights reserved.
//

#import "GPXElement.h"
#import "GPXTrackPointExtensions.h"

@class GPXTrailsTrackExtensions;
@class GPXTrailsTrackPointExtensions;
@class GPXSoundscapeExtensions;

/** You can add extend GPX by adding your own elements from another schema here. 
 */
@interface GPXExtensions : GPXElement

@property (strong) GPXTrackPointExtensions *garminExtensions;
@property (strong) GPXTrailsTrackExtensions *trailsTrackExtensions;
@property (strong) GPXTrailsTrackPointExtensions *trailsTrackPointExtensions;
@property (strong) GPXSoundscapeExtensions *soundscapeExtensions;

/// Backwards compatibility
/// Speed and course are now in the Garmin TrackPoint extension
@property (nonatomic, assign) CLLocationSpeed speed;
@property (nonatomic, assign) CLLocationDirection course;

@end
