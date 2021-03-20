//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Adele Fatkullina on 22.12.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    var image: UIImage?
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        //делиться контроллер
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        //отслеживать успешно ли доставлено сообщение или нет
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Success")
            }
        }
        //показать контроллер на экране
        present(shareController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
