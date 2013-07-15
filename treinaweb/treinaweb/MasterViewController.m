//
//  MasterViewController.m
//  treinaweb
//
//  Created by Paulo Brazil Mazzeo on 22/12/12.
//  Copyright (c) 2012 Paulo Brazil Mazzeo. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Tweets", @"Tweets");
    }
    return self;
}
							
- (void)dealloc
{
	[_detailViewController release];
	[_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
	self.navigationItem.rightBarButtonItem = addButton;
	
	
    //cria url para request com a url do twitter
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=treinaweb&count=20"];
    //cria uma variável request iniciando com a url que criada acima
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    //seta o delegate do request para essa classe
    [request setDelegate:self];
    //inicia o request síncrono
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        //Pegando o retorno do request
        NSData *responseData = [request responseData];
        //passando o retorno para o método parseDAtaRequest
        [self parseDataRequest:responseData];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	
}


- (void)parseDataRequest:(NSData *)responseData
{
	
    NSError *error;
    NSArray *twts = [NSJSONSerialization JSONObjectWithData:responseData
													options:kNilOptions
													  error:&error];
    if (!twts) {
        NSLog(@"Error parsing JSON: %@", error);
    }
    else{
        self.tweets = twts;
    }
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _tweets.count;
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

/*
	NSDate *object = _objects[indexPath.row];
	cell.textLabel.text = [object description];
    return cell;
*/

    NSDictionary *tweet = [self.tweets objectAtIndex:indexPath.row];
    NSString *text = [tweet objectForKey:@"text"];
    
    // Configure the cell.
    cell.textLabel.text = text;
    return cell;





}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }

	NSDictionary *tweet = [self.tweets objectAtIndex:indexPath.row];
	self.detailViewController.detailItem = tweet;
 
    [self.navigationController pushViewController:self.detailViewController animated:YES];
	
		
/*
	NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
*/


}

@end
