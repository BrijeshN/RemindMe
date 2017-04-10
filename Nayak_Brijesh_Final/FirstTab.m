//
//  FirstTab.m
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "FirstTab.h"


@interface FirstTab ()


@end

@implementation FirstTab


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    courses = [[NSMutableArray alloc] init];
    removeCourses = [[NSMutableArray alloc] init];

  
    
}
-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)editCourses:(UIButton *)sender {
    
        sender.selected = !sender.selected;
        [self.tableView setEditing:sender.selected animated:YES];
    
    if(removeCourses.count){
        for(NSString *str in removeCourses){
            [courses removeObject:str];
        }
        [removeCourses removeAllObjects];
        [self.tableView reloadData];
    }
    
}

- (IBAction)addCourse:(id)sender {
    
    [courses addObject:self.courseName.text];
    [self.tableView reloadData];
    self.courseName.text = @"";
    
}


#pragma mark - Tabel View


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(courses > 0){
    return courses.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", courses[indexPath.row]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [removeCourses addObject:courses[indexPath.row]];
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [removeCourses removeObject:courses[indexPath.row]];
    
}


-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
    
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [courses removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}


@end
