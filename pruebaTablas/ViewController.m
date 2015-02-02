//
//  ViewController.m
//  pruebaTablas
//
//  Created by Marcos on 1/29/15.
//  Copyright (c) 2015 Marcos. All rights reserved.
//

#import "ViewController.h"

NSMutableArray * scores;
NSUInteger pos;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scores = [[NSMutableArray alloc] init];
    
    // Inicializamos losv alores del array
    [scores addObject:@"001. 15/01/2014 15:00"];
    [scores addObject:@"002. 15/01/2014 15:00"];
    [scores addObject:@"003. 15/01/2014 15:00"];
    [scores addObject:@"004. 15/01/2014 15:00"];
    [scores addObject:@"005. 15/01/2014 15:00"];
    [scores addObject:@"006. 15/01/2014 15:00"];
    [scores addObject:@"007. 15/01/2014 15:00"];
    [scores addObject:@"008. 15/01/2014 15:00"];
    [scores addObject:@"009. 15/01/2014 15:00"];
    [scores addObject:@"010. 15/01/2014 15:00"];
    [scores addObject:@"011. 15/01/2014 15:00"];
    [scores addObject:@"012. 15/01/2014 15:00"];
    [scores addObject:@"013. 15/01/2014 15:00"];
    [scores addObject:@"014. 15/01/2014 15:00"];
    [scores addObject:@"015. 15/01/2014 15:00"];
    
    [scores addObject:@"057. 28/01/2014 15:00"];
    
    [scores sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return -[obj1 compare:obj2 options:NSNumericSearch];
    }];
    pos = [scores indexOfObject: @"057. 28/01/2014 15:00"];

    [self.myTable  setContentOffset:CGPointMake(0,( pos * 44 )) animated:YES];
    [self.myTable reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [scores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [scores objectAtIndex:indexPath.row];
    
    return cell;
}


@end
