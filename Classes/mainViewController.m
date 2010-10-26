//
//  mainViewController.h
//  landscapeRun
//
//  Created by maliy on 9/20/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import "mainViewController.h"


@implementation mainViewController

#pragma mark lifeCycle

- (id) init
{
	if (self = [super init])
	{
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

#pragma mark tableView delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 32;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSString *cellID = @"TEST_CELL_ID";
	UITableViewCell *rv = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (!rv)
	{
		rv = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
	}
	rv.textLabel.text = [NSString stringWithFormat:@"Item %02d", indexPath.row+1];
	return rv;
}

- (void) deselect:(UITableView *) tableView
{
	[tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSelector:@selector(deselect:) withObject:tableView afterDelay:0.5];
	
}


#pragma mark -

- (void) viewDidAppear:(BOOL) animated
{
}

- (void) viewDidDisappear:(BOOL) animated
{
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = NSLocalizedString(@"Starting on landscape mode", @"");
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	
	UIView *contentView = [[UIView alloc] initWithFrame:screenRect];
	contentView.autoresizesSubviews = YES;
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	contentView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
	
	self.view = contentView;
	[contentView release];

	UITableView *_tv = [[UITableView alloc] initWithFrame:self.view.bounds
													style:UITableViewStylePlain];
	_tv.delegate = self;
	_tv.dataSource = self;
	_tv.autoresizesSubviews = YES;
	_tv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_tv];
	[_tv release];

}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	
}



@end
