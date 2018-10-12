//
//  GPXSoundscapeExtensions.m
//  iOS-GPX-Framework
//
//  Created by Daniel Tsirulnikov on 10/11/18.
//

#import "GPXSoundscapeExtensions.h"
#import "GPXElementSubclass.h"

NSString *const kGPXSoundscapeExtensionsTagName =   @"gpxgd:TrackPointExtension";

NSString *const kElementHorizontalAccuracy =        @"gpxgd:hor_acc";
NSString *const kElementVerticalAccuracy =          @"gpxgd:ver_acc";

NSString *const kElementTrueHeading =               @"gpxgd:hdg_tru";
NSString *const kElementMagneticHeading =           @"gpxgd:hdg_mag";
NSString *const kElementHeadingAccuracy =           @"gpxgd:hdg_acc";

NSString *const kElementFloorLevel =                @"gpxgd:flr_lvl";

NSString *const kElementMotionActivity =            @"gpxgd:activity";

@interface GPXSoundscapeExtensions ()

@property (nonatomic, strong) NSString *horizontalAccuracyString;
@property (nonatomic, strong) NSString *verticalAccuracyString;

@property (nonatomic, strong) NSString *trueHeadingString;
@property (nonatomic, strong) NSString *magneticHeadingString;
@property (nonatomic, strong) NSString *headingAccuracyString;

@property (nonatomic, strong) NSString *floorLevelString;

@end

@implementation GPXSoundscapeExtensions

- (id)initWithXMLElement:(TBXMLElement *)element parent:(GPXElement *)parent
{
    self = [super initWithXMLElement:element parent:parent];
    if (self) {
        _horizontalAccuracyString = [self textForSingleChildElementNamed:kElementHorizontalAccuracy xmlElement:element];
        _verticalAccuracyString = [self textForSingleChildElementNamed:kElementVerticalAccuracy xmlElement:element];
        
        _trueHeadingString = [self textForSingleChildElementNamed:kElementTrueHeading xmlElement:element];
        _magneticHeadingString = [self textForSingleChildElementNamed:kElementMagneticHeading xmlElement:element];
        _headingAccuracyString = [self textForSingleChildElementNamed:kElementHeadingAccuracy xmlElement:element];
        
        _floorLevelString = [self textForSingleChildElementNamed:kElementFloorLevel xmlElement:element];
        
        _activity = [self textForSingleChildElementNamed:kElementMotionActivity xmlElement:element];
    }
    return self;
}

#pragma mark - Public methods

- (void)setHorizontalAccuracy:(NSNumber *)horizontalAccuracy {
    _horizontalAccuracyString = horizontalAccuracy ? [GPXType valueForDecimal:horizontalAccuracy.doubleValue] : nil;
}

- (NSNumber *)horizontalAccuracy {
    return _horizontalAccuracyString.length > 0 ? [NSNumber numberWithDouble:[GPXType decimal:_horizontalAccuracyString]] : nil;
}

- (void)setVerticalAccuracy:(NSNumber *)verticalAccuracy {
    _verticalAccuracyString = verticalAccuracy ? [GPXType valueForDecimal:verticalAccuracy.doubleValue] : nil;
}

- (NSNumber *)verticalAccuracy {
    return _verticalAccuracyString.length > 0 ? [NSNumber numberWithDouble:[GPXType decimal:_verticalAccuracyString]] : nil;
}

- (void)setTrueHeading:(NSNumber *)trueHeading {
    _trueHeadingString = trueHeading ? [GPXType valueForDecimal:trueHeading.doubleValue] : nil;
}

- (NSNumber *)trueHeading {
    return _trueHeadingString.length > 0 ? [NSNumber numberWithDouble:[GPXType decimal:_trueHeadingString]] : nil;
}

- (void)setMagneticHeading:(NSNumber *)magneticHeading {
    _magneticHeadingString = magneticHeading ? [GPXType valueForDecimal:magneticHeading.doubleValue] : nil;
}

- (NSNumber *)magneticHeading {
    return _magneticHeadingString.length > 0 ? [NSNumber numberWithDouble:[GPXType decimal:_magneticHeadingString]] : nil;
}

- (void)setHeadingAccuracy:(NSNumber *)headingAccuracy {
    _headingAccuracyString = headingAccuracy ? [GPXType valueForDecimal:headingAccuracy.doubleValue] : nil;
}

- (NSNumber *)headingAccuracy {
    return _headingAccuracyString.length > 0 ? [NSNumber numberWithDouble:[GPXType decimal:_headingAccuracyString]] : nil;
}

- (void)setFloorLevel:(NSNumber *)floorLevel {
    _floorLevelString = floorLevel ? floorLevel.stringValue : nil;
}

- (NSNumber *)floorLevel {
    return _floorLevelString.length > 0 ? [NSNumber numberWithInteger:_floorLevelString.integerValue] : nil;
}

#pragma mark - tag

+ (NSString *)tagName
{
    return kGPXSoundscapeExtensionsTagName;
}

#pragma mark - GPX

- (void)addChildTagToGpx:(NSMutableString *)gpx indentationLevel:(NSInteger)indentationLevel
{
    [super addChildTagToGpx:gpx indentationLevel:indentationLevel];
    
    if (_horizontalAccuracyString) [self gpx:gpx addPropertyForValue:_horizontalAccuracyString tagName:kElementHorizontalAccuracy indentationLevel:indentationLevel];
    if (_verticalAccuracyString) [self gpx:gpx addPropertyForValue:_verticalAccuracyString tagName:kElementVerticalAccuracy indentationLevel:indentationLevel];
    
    if (_trueHeadingString) [self gpx:gpx addPropertyForValue:_trueHeadingString tagName:kElementTrueHeading indentationLevel:indentationLevel];
    if (_magneticHeadingString) [self gpx:gpx addPropertyForValue:_magneticHeadingString tagName:kElementMagneticHeading indentationLevel:indentationLevel];
    if (_headingAccuracyString) [self gpx:gpx addPropertyForValue:_headingAccuracyString tagName:kElementHeadingAccuracy indentationLevel:indentationLevel];
    
    if (_floorLevelString) [self gpx:gpx addPropertyForValue:_floorLevelString tagName:kElementFloorLevel indentationLevel:indentationLevel];
    
    if (_activity) [self gpx:gpx addPropertyForValue:_activity tagName:kElementMotionActivity indentationLevel:indentationLevel];
}

@end
