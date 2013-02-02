//
//  NoteWindowController.m
//  Finch Note
//
//  Created by narango on 2/1/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import "NoteWindowController.h"
#import "AppDelegate.h"
#import "Entry.h"

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
    
    Entry *entry = (Entry *)[NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:_managedObjectContext];
    
    [entry setDate:[NSDate date]];
    [entry setText:@"Write a note!"];
    [entry setAutomatic: [NSNumber numberWithBool:YES]];
}

- (NSArray *)dateSortDescriptor {
    return [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
}

@end
