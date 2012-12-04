//
//  UITextView+PinchZoom.h
//
//  Created by Stan Serebryakov <cfr@gmx.us> on 04.12.12.
//

#import <UIKit/UIKit.h>

@interface UITextView (PinchZoom)

@property CGFloat maxFontSize, minFontSize;

@property (getter = isZoomEnabled) BOOL zoomEnabled;

@end
