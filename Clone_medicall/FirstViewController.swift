//
//  FirstViewController.swift
//  Clone_medicall
//
//  Created by JU HAN LEE on 2020/05/08.
//  Copyright © 2020 yht. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveNext(_ sender: UIButton) {
        //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
        guard let uvc =
            self.storyboard?.instantiateViewController(
            withIdentifier: "SndViewController")else{
            return
        }
        //화면 전환 애니메이션을 설정합니다.
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
        self.present(uvc, animated: true)
    }
}
