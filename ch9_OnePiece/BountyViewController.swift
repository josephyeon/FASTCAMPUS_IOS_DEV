//
//  BountyViewController.swift
//  ch9_OnePiece
//
//  Created by 정현준 on 2021/03/24.
//  Copyright © 2021 hyeon. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: 2 - (2) 데이터 생성 (수배자 이름, 현상금)
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]

    // MARK: 4-(4)

    // MARK: 4-(4)-(1) 먼저, 3-(2)의 performSegue 수행 이전에 준비해둬야 할 것(데이터 전달)을 메서드로 작성해야함: prepare(for segue)

    // prepare(for segue: ...)는 이미 존재하는 함수 -> 오버라이딩으로 재작성
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    // MARK: 4-(4)-(2) Detail View Controller로 데이터 전달하는 명령어 작성 (힌트 작성)
        // "showDetail" segue를 실행하면,
        if segue.identifier == "showDetail"{
            // 세그웨이의 목적지는 DetailViewController이며 (타입캐스팅으로 설정)
            let vc = segue.destination as? DetailViewController

            // 타입이 Any 옵셔널인 sender를 index와 맞추기 위해 Int로 다운캐스팅
            if let index = sender as? Int {
                // DetailViewController의 이름과 현상금은 앞에 작성된 데이터로 설정
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: 1 - (1) UITableViewDataSource(1): 몇개의 셀을 보여줄건가?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return bountyList.count // MARK: 2 - (3) 데이터 갯수만큼 셀 보여줌
    }

    //MARK: 1 - (1) UITableViewDataSource(2): 테이블 뷰 어떻게 보여줄건가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // MARK: MARK: 2 - (4) 기본적으로 세팅된 UITableView가 아닌 아래에 커스텀 해놓은 ListCell로 보여주기 위해 guard let 이용한 타입 캐스팅 작성
        // guard let 구문이 동작 성공하면 바로 아래 구문들 실행
        // 타입캐스트 실패한 경우 그냥 UITableViewCell로 실행하게 설정 ( else{...} 구문)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }

        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"

        return cell
    }

    /* MARK: 2 - (5) (참고) if-else 구문으로 guard let 타입 캐스팅 작성하는 경우
     // guard문이 띄어쓰기가 덜 들어가기 때문에 효율적임
         if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {

             let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
             cell.imgView.image = img
             cell.nameLabel.text = nameList[indexPath.row]
             cell.bountyLabel.text = "\(bountyList[indexPath.row])"

             return cell

     } else {
             return UITableViewCell()

     } */

    //MARK: 1 - (2) UITableViewDelegate: 클릭했을 때 어떻게 동작할건가?
    // 셀 번호(row) 출력
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("===> \(indexPath.row)")

        //MARK: 3-(2) Bounty View에서 셀 터치시 Detail View로 화면전환
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        // performSegue: 뷰에서 뷰 전환을 수행 (SegueWay 수행)


    }

}
// MARK: 2 커스텀 셀 생성하고 어플리케이션에 구현하기
// MARK: 2 - (1) Custom Cell 생성
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}


// MARK: 3 셀 터치시 디테일 뷰 구현 (DetailViewController에서 작성)

// MARK: 4 선택된 데이터를 디테일 뷰로 넘기기 (DetailViewController에서 작성)

