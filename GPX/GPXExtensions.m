//
//  GPXExtensions.m
//  GPX Framework
//
//  Created by NextBusinessSystem on 12/04/06.
//  Copyright (c) 2012 NextBusinessSystem Co., Ltd. All rights reserved.
//

#import "GPXExtensions.h"
#import "GPXElementSubclass.h"
#import "GPXTrailsTrackExtensions.h"
#import "GPXTrailsTrackPointExtensions.h"
#import "GPXSoundscapeExtensions.h"

@implementation GPXExtensions {
    NSString *_speedValue;
    NSString *_courseValue;
}

#pragma mark - Instance

- (id)initWithXMLElement:(TBXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _garminExtensions = (GPXTrackPointExtensions *)[self childElementOfClass:[GPXTrackPointExtensions class] xmlElement:element];
        _trailsTrackExtensions = (GPXTrailsTrackExtensions *)[self childElementOfClass:[GPXTrailsTrackExtensions class] xmlElement:element];
        _trailsTrackPointExtensions = (GPXTrailsTrackPointExtensions *)[self childElementOfClass:[GPXTrailsTrackPointExtensions class] xmlElement:element];
        _soundscapeExtensions = (GPXSoundscapeExtensions *)[self childElementOfClass:[GPXSoundscapeExtensions class] xmlElement:element];
        
        _speedValue = [self textForSingleChildElementNamed:@"speed" xmlElement:element];
        _courseValue = [self textForSingleChildElementNamed:@"course" xmlElement:element];
    }
    return self;
}

#pragma mark - Public methods

- (double)speed
{
    if (!_speedValue) {
        return -1;
    }
    return [GPXType decimal:_speedValue];
}

- (void)setSpeed:(double)speed
{
    _speedValue = [GPXType valueForDecimal:speed];
}

- (double)course
{
    if (!_courseValue) {
        return -1;
    }
    return [GPXType decimal:_courseValue];
}

- (void)setCourse:(double)course
{
    _courseValue = [GPXType valueForDecimal:course];
}

#pragma mark - tag

+ (NSString *)tagName
{
    return @"extensions";
}


#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    
    if (_garminExtensions) {
        [_garminExtensions gpx:gpx indentationLevel:indentationLevel];
    }
    
    if (_trailsTrackExtensions) {
        [_trailsTrackExtensions gpx:gpx indentationLevel:indentationLevel];
    }
    
    if (_trailsTrackPointExtensions) {
        [_trailsTrackPointExtensions gpx:gpx indentationLevel:indentationLevel];
    }
    
    if (_soundscapeExtensions) {
        [_soundscapeExtensions gpx:gpx indentationLevel:indentationLevel];
    }
}

@end
