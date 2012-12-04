//
//  UITextView+PinchZoom.m
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//

#import "UITextView+PinchZoom.h"
#import "objc/runtime.h"

static int minFontSizeKey;
static int maxFontSizeKey;
static int zoomEnabledKey;

@implementation UITextView (PinchZoom)

- (void)setMaxFontSize:(CGFloat)maxFontSize
{
    objc_setAssociatedObject(self, &maxFontSizeKey, [NSNumber numberWithFloat:maxFontSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)maxFontSize
{
    return [objc_getAssociatedObject(self, &maxFontSizeKey) floatValue];
}

- (void)setMinFontSize:(CGFloat)maxFontSize
{
    objc_setAssociatedObject(self, &minFontSizeKey, [NSNumber numberWithFloat:maxFontSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)minFontSize
{
    return [objc_getAssociatedObject(self, &minFontSizeKey) floatValue];
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)gestureRecognizer
{
    UIFont *font = self.font;
    CGFloat pointSize = font.pointSize;
    NSString *fontName = font.fontName;

    pointSize = ((gestureRecognizer.velocity > 0) ? 1 : -1) * 1 + pointSize;

    pointSize = MIN(pointSize, self.maxFontSize);
    pointSize = MAX(pointSize, self.minFontSize);

    self.font = [UIFont fontWithName:fontName size:pointSize];
}


- (void)setZoomEnabled:(BOOL)zoomEnabled
{
    objc_setAssociatedObject(self, &zoomEnabledKey, [NSNumber numberWithBool:zoomEnabled], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (zoomEnabled) {
        self.minFontSize = self.minFontSize ?: 8;
        self.maxFontSize = self.maxFontSize ?: 42;
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
        [self addGestureRecognizer:pinchGestureRecognizer];
#if !__has_feature(objc_arc)
        [pinchGestureRecognizer release];
#endif
    }
}

- (BOOL)isZoomEnabled
{
    return [objc_getAssociatedObject(self, &zoomEnabledKey) boolValue];
}

@end
