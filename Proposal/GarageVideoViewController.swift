//
//  GarageVideoViewController.swift
//  Proposal
//
//  Created by Samuel Tung on 2/28/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

class GarageVideoViewController: UIViewController {
    @IBOutlet weak var wv:UIWebView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutube(videoID: "aatbOXUfq50")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadYoutube(videoID:String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        wv.loadRequest(URLRequest(url: youtubeURL))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
