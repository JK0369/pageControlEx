//
//  ViewController.swift
//  PageControlEx
//
//  Created by 김종권 on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    let imageNames: [String] = ["wine", "bird", "balloon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    private func setUpView() {
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .lightGray // 페이지 표시 색상

        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black // 현재 페이지 표시 색상

        pageControl.numberOfPages = imageNames.count

        scrollView.delegate = self
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.bounces = false // 경계지점에서 bounce될건지 체크 (pageControl에서는 뒤 흰색배경이 보이므로 비활성화)

        scrollView.frame = UIScreen.main.bounds

        for (index, imageName) in imageNames.enumerated() {
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            imageView.frame = UIScreen.main.bounds
            imageView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollView.addSubview(imageView)
        }

        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(imageNames.count), height: UIScreen.main.bounds.height)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
