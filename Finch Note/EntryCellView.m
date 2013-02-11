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
        // Initialization code here.
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
    NSLog(@"trying to find the textfieldcell: %@", [entryTextField cell]);
    [[entryTextField cell] setUsesSingleLineMode:NO];
}

- (void)deselected  
{
    NSLog(@"entryDeselected");
    //convert from multi-line mode to single line mode
    [[entryTextField cell] setUsesSingleLineMode:YES];
}

@end
