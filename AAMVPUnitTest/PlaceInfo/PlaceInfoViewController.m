//
//  PlaceInfoViewController.m
//  AAMVPUnitTest
//

#import "PlaceInfoViewController.h"
#import "PlaceInfoPresenter.h"
@interface PlaceInfoViewController ()<PlaceInfoViewImpl>
@property (weak, nonatomic) IBOutlet UITextField *place;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation PlaceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _presenter = [[PlaceInfoPresenter alloc]initWithView:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onGetPlaceInfoPressed:(id)sender {
    [_presenter loadDate:_place.text];
}
-(void)showResult:(NSString*)res{
    _result.text = res;
}

@end
