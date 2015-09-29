//
//  AutoLayoutViewController.m
//  
//
//  Created by caijunrong on 15/9/14.
//
//

#import "AutoLayoutViewController.h"
#import "Business.h"
#import "Message.h"
#import "NSObject+AssociatedObject.h"
#import "UIControl+UIControl_XY.h"

@interface AutoLayoutViewController ()
@property (weak, nonatomic) IBOutlet UIButton *haiwaidaigou;
@property (weak, nonatomic) IBOutlet UIButton *zhidalianjie;
@property (nonatomic, strong) NSMutableArray *array;
- (IBAction)btnHaiWai:(id)sender;
- (IBAction)btnZhiDa:(id)sender;

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.haiwaidaigou.cjr_acceptEventInterval = 5.0f;
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


- (IBAction)btnHaiWai:(id)sender {
    
//    Business *bs = [[Business alloc]init];
//    [bs sendNoneMethod:@"iPhone"];
    
    
    Message *message = [Message new];
    [message sendMessage:@"Sam Lau"];
    
    NSObject *objc = [NSObject new];
    objc.associatedObject = @"Extend Category";
    NSLog(@"associatedObject is = %@", objc.associatedObject);
    
    
}

- (IBAction)btnZhiDa:(id)sender {
}
@end
