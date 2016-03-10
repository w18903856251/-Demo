//
//  BaseGroupTableViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/10.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "BaseGroupTableViewController.h"
//定义statusbar navbar 高度
#define IOS_STATUSBAR_HEIGHT        20.f
#define IOS_NAVBAR_HEIGHT           44.f
@interface BaseGroupTableViewController ()
{
    NSMutableArray *m_Models;
}

@end

@implementation BaseGroupTableViewController


- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before {
    if(self = [super init]) {
        _cellIdentifier = identifier;
        _cellConfigureBefore = [before copy];
    }
    return self;
}

- (void)addModels:(NSArray *)models {
    if(!models) return;
    if(!m_Models) {
        m_Models = [[NSMutableArray alloc] init];
    }
    [m_Models addObjectsFromArray:models];
}

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return m_Models.count > indexPath.row ? m_Models[indexPath.row] : nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 100;

}
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return m_Models == nil ? 0: m_Models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    
    
    if(self.cellConfigureBefore) {
        self.cellConfigureBefore(cell, model,indexPath);
    }
    
    //debugLog(@"%ld",m_Models.count);
//    if ([cell respondsToSelector:@selector(configureCellWithModel:)]) {
//        [cell performSelector:@selector(configureCellWithModel:) withObject:model];
//    }
    
    return cell;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.groupTable     = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 0.f, SCREEN_WIDTH, SCREEN_HEIGHT-IOS_STATUSBAR_HEIGHT-IOS_NAVBAR_HEIGHT) style:UITableViewStylePlain];
   // _groupTable.backgroundView               = nil;
    //_groupTable.backgroundColor              = [UIColor yellowColor];
    self.groupTable.tableFooterView = [[UIView alloc]init];
//    [_groupTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    _groupTable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_groupTable];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
