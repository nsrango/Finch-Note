//
//  EntryCellView.m
//  Finch Note
//
//  Created by narango on 1/31/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import "EntryCellView.h"

@implementation EntryCellView

@synthesize entryTextField;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[entryTextField cell] setUsesSingleLineMode:YES];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing for each cell here.
}

- (void)selected
{
    NSLog(@"entrySelected");
    //convert from single line mode to multi-line mode
    //NSLog(@"trying to find the textfieldcell: %@", [entryTextField cell]);
    [[entryTextField cell] setUsesSingleLineMode:NO];
    [[entryTextField cell] setLineBreakMode: NSLineBreakByWordWrapping];
}

- (void)deselected  
{
    NSLog(@"entryDeselected");
    //convert from multi-line mode to single line mode
    [[entryTextField cell] setUsesSingleLineMode:YES];
    [[entryTextField cell] setLineBreakMode: NSLineBreakByTruncatingTail];
}

- (NSInteger)expandedHeight
{
    NSSize size = [entryTextField frame].size;
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:[entryTextField attributedStringValue]];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithContainerSize:NSMakeSize(size.width, FLT_MAX)];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];

    [textContainer setLineFragmentPadding:2.0];
    [layoutManager glyphRangeForTextContainer:textContainer];
    
    size.height = [layoutManager usedRectForTextContainer:textContainer].size.height;
    return size.height+50;
}

@end
