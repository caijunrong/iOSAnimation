//
//  AutoLayoutViewController.m
//  
//
//  Created by caijunrong on 15/9/14.
//
//

#import "AutoLayoutViewController.h"
#import "Business.h"

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
    // Do any additional setup after loading the view from its nib.
    _array = [[NSMutableArray alloc]init];
    NSLog(@"_array.count:%d",(int)_array.count);
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
    
    Business *bs = [[Business alloc]init];
    [bs sendNoneMethod:@"iPhone"];
    
}

- (IBAction)btnZhiDa:(id)sender {
}
@end
