//
//  CreateBarcodeViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/5/31.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "CreateBarcodeViewController.h"
#import "LGFCreateBarcodeManager.h"
@interface CreateBarcodeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *barcodeImage;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@end

@implementation CreateBarcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)createButton:(UIButton *)sender {
    if (self.textField.text.length) {
        LGFCreateBarcodeManager *manager = [[LGFCreateBarcodeManager alloc] init];
       UIImage *image = [manager createBarcodeImageWithData:self.textField.text];
        self.barcodeImage.image = image;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
