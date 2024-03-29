//
//  SearchListTVC.swift
//  Weather
//
//  Created by Naveen Chowdary on 05/05/23.
//

import UIKit

class SearchListTVC: UITableViewCell {

    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var citySubtitle: UILabel!
    
    var location: SearchResultModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }

    private func setupDesign() {
        cityTitle.textColor = Color.darkestText
        citySubtitle.textColor = Color.darkerText
    }
    
    func configure(for location: SearchResultModel) {
        self.location = location
        setupLabels()
        stopSkeletonLoading()
    }
    
    func configureAsLoadingCell() {
        self.cityTitle.text = "Loading City.."
        self.citySubtitle.text = "Loading Country.."
        startSkeletonLoading()
        self.location = nil
    }
    
    private func setupLabels() {
        cityTitle.text = location?.name
        let state = location?.state ?? ""
        let country = location?.country ?? ""
        citySubtitle.text = state
        if state.isEmpty {
            citySubtitle.text = country
        } else {
            citySubtitle.text = state + ", " + country
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.configureAsLoadingCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension SearchListTVC: SkeletonLoading {
    var skeletableViews: [UIView] {
        return [
            cityTitle,
            citySubtitle
        ]
    }
    
    func updateSkeletonDesign(isEnding: Bool) {
        return
    }
    
    
}
