//
//  NoteWindowController.m
//  Finch Note
//
//  Created by narango on 2/1/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import "NoteWindowController.h"
#import "AppDelegate.h"

@implementation NoteWindowController

@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
         _managedObjectContext = [appDelegate managedObjectContext];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)addNote:(id)sender {
    NSLog(@"added note");
}

@end
