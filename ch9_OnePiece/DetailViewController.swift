//
//  DetailViewController.swift
//  ch9_OnePiece
//
//  Created by 정현준 on 2021/03/24.
//  Copyright © 2021 hyeon. All rights reserved.
//

import UIKit




class DetailViewController: UIViewController {

    // MARK: 4 선택된 데이터를 디테일 뷰로 넘기기
    // MARK: 4-(1) 디테일 뷰에서 나타나는 인터페이스 인스턴스 생성

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    // MARK: 4-(2) 이름, 현상금 인스턴스 생성 ... 여기서는 인스턴스만 생성하고 데이터 연결은 bounty view에서 작성함
    
    var name: String?
    var bounty: Int?

    /* 참고) 이미지에 대해서 생성 안하는 이유? ... BountyViewController 중에서
    let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
    cell.imgView.image = img
    cell.nameLabel.text = nameList[indexPath.row]
    cell.bountyLabel.text = "\(bountyList[indexPath.row])"

    Asset에 리딩된 이미지 이름이 곧 nameList의 이름이기 때문에 따로 자동으로 불러옴
     */

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: 4-(3) updateUI()라는 메서드를 만들어서 이름, 현상금, 이미지가 Detail View에서도 나타나도록 작성 (4-(4)는 Bounty View Controller로)
        updateUI()


    }

    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }

    // 4-(4)는 Bounty View에 작성

    /* MARK: 4-(1) ~ (4) 흐름정리
     BountyViewController에서 prepare()이용해서 Detail View로 넘어갈 데이터 사전지정
     -> 작성된 사항 바탕으로 performSegue 실행
     -> Segue를 통해서 Detail View로 넘어옴
     -> 메모리에 DetailViewController가 올라가서 수행 시작
     -> DetailViewController에서 세팅한 name과 bounty 인스턴스로 앞에서 지정된 데이터 전달
     -> 이를 바탕으로 updateUI()가 작동
     -> Datail View 구현
     */


    //MARK: 3 디테일 뷰 컨트롤러 생성 및 구현
    // MARK: 3-(1) 버튼 클릭시 액션 설정 : dismiss 사용
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        // 참고) completion .. 닫고 난 후 활동 기재
    }

    //MARK: 3-(2) Bounty View에서 Detail View로 화면전환 구현 (DetailViewController에서 작성함)
}
