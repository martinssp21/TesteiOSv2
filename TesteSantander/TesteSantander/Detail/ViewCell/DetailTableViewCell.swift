//
//  DetailTableViewCell.swift
//  TesteSantander
//
//  Created by Rodrigo Martins on 03/05/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var viewDetailCell: UIView!
    @IBOutlet weak var labelDetailTitulo: UILabel!
    @IBOutlet weak var labelDetailData: UILabel!
    @IBOutlet weak var labelDetailDescricao: UILabel!
    @IBOutlet weak var labelDetailValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupviewDetailCell() {
        self.viewDetailCell.layer.borderWidth = 1
        self.viewDetailCell.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8745098039, blue: 0.8901960784, alpha: 0.3)
        self.viewDetailCell.layer.shadowColor = #colorLiteral(red: 0.8509803922, green: 0.8862745098, blue: 0.9137254902, alpha: 1)
        self.viewDetailCell.layer.shadowOpacity = 1
        self.viewDetailCell.layer.cornerRadius = 6
        self.viewDetailCell.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.viewDetailCell.layer.shadowRadius = 10
    }
    
    func setupValuesForLabels(data : DetailResponse.DetailData){
        self.labelDetailTitulo.text = data.title
        self.labelDetailData.text = data.date
        self.labelDetailDescricao.text = data.desc
        self.labelDetailValor.text = data.value?.ToCurrency
    }

}
