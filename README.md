UITextView+PinchZoom
====================

Simple pinch-zoom category for UITextView.

Code works with and without ARC.

Library can be added to a project using [CocoaPods](http://cocoapods.org).

Usage:

    #import "UITextView+PinchZoom.h"

    //...

    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:textView];
    textView.zoomEnabled = YES;
    textView.minFontSize = 10;
    textView.maxFontSize = 40;
