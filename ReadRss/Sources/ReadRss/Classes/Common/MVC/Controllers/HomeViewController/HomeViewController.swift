//
//  HomeViewController.swift
//  QuizShow
//
//  Created by Tinh Ngo on 9/12/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MenuDelegate {
    
    @IBOutlet weak var tableViewHome: UITableView!
    let indentifierCell:String = "cells"
    var urlRSS:String = "http://vnreview.vn/feed/-/rss/13414"
    var titRSS:String = "Home"
    
    let showDetailsIndentifier = "ShowDetails"
    
    var posts = RssManager(url: "http://vnreview.vn/feed/-/rss/home").posts
    @IBOutlet weak var menuLefConstrains: NSLayoutConstraint!
    
    // Menu Lef
    @IBOutlet weak var contentMenuLef: UIView!
    @IBOutlet weak var headMenuLef: UIView!
    @IBOutlet weak var obitanView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuLefConstrains.constant = -UIScreen.main.bounds.width*2
        createMenuLef()
        
        self.tableViewHome.delegate = self
        self.tableViewHome.dataSource = self
        // no lines where there aren't cells
        self.tableViewHome.tableFooterView = UIView(frame: CGRect.zero)
        self.tableViewHome.separatorStyle = .none
        self.tableViewHome.separatorColor = UIColor.clear
        // add button lef bar
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(moveMenu))
        // title
        self.title = titRSS
        
        // add gesture
        dismissMenuLef()
        addButtonNavigationBar()
        swipeGesture()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.location(in: view)
            print("move",position.x)
            print("move",position.y)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.location(in: view)
            print("began",position.x)
            print("began",position.y)
            
        }
    }

    
    func addButtonNavigationBar(){
        
        let imgMenuLef = UIImage(named: "menulef")
        let buttonMenuLef: UIButton = UIButton()
        buttonMenuLef.setImage(imgMenuLef, for: UIControlState.normal)
        buttonMenuLef.addTarget(self, action: #selector(HomeViewController.moveMenu), for: UIControlEvents.touchDown)
        buttonMenuLef.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barMenuLef  = UIBarButtonItem(customView: buttonMenuLef)
        
        self.navigationItem.setLeftBarButton(barMenuLef, animated: false)
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imgMenuLef, style: .plain, target: self, action: #selector(moveMenu))
    }
    
    
    func swipeGesture(){
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(HomeViewController.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLef = UISwipeGestureRecognizer(target: self, action: #selector(HomeViewController.respondToSwipeGesture(gesture:)))
        swipeLef.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLef)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                self.menuLefConstrains.constant = 0
                self.view.layoutIfNeeded()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                self.menuLefConstrains.constant = -UIScreen.main.bounds.width*2
                self.view.layoutIfNeeded()
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    

    func dismissMenuLef(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(HomeViewController.moveMenu))
        self.obitanView.addGestureRecognizer(tap)
    }
    
    func actionMenu(category: Category) {
        moveMenu()
        self.title = category.name
        posts = RssManager(url: category.link!).posts
        self.tableViewHome.reloadData()
        print(category.name)
        
    }
    
    func moveMenu() -> Void {
        
       // print("Menu lef")
        
        if menuLefConstrains.constant == 0 {
            
//            self.menuLefConstrains.constant = -UIScreen.main.bounds.width*2
//            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                self.menuLefConstrains.constant = -UIScreen.main.bounds.width*2
                self.view.layoutIfNeeded()
                }, completion: nil)
            
        }else if menuLefConstrains.constant < 0 {
            
//            self.menuLefConstrains.constant = 0
//            self.view.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                self.menuLefConstrains.constant = 0
                self.view.layoutIfNeeded()
                }, completion: nil)
            
        }
    }
    
    func createMenuLef(){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MenuLefTable") as? MenuLefViewController {
            
            vc.delegate = self
            self.addChildViewController(vc)
            Common.addAndFillSubviewIntoParentview(subview: vc.view, parentview: contentMenuLef)
            vc.didMove(toParentViewController: self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        blurImage()
        

    }
    
       
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showDetailsIndentifier {
            if let destination = segue.destination as? DetailsViewController{
                let path = tableViewHome.indexPathForSelectedRow
                // let cell = tableViewHome.cellForRow(at: path!)
                destination.link = ((posts.object(at: (path?.row)!) as AnyObject).value(forKey: "link") as? String)!
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableViewHome.cellForRow(at: indexPath) {
            self.performSegue(withIdentifier: showDetailsIndentifier, sender: self)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewHome.dequeueReusableCell(withIdentifier: indentifierCell, for: indexPath) as! HomeTableViewCell
        
        // style cells context
//        cell.contentView.layer.cornerRadius = 10
//        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = UIColor.clear
        
        //style cells
        cell.backgroundColor = UIColor.clear
        
        cell.title.text = (posts.object(at: (indexPath as NSIndexPath).row) as AnyObject).value(forKey: "tit") as? String
        var desPro = (posts.object(at: (indexPath as NSIndexPath).row) as AnyObject).value(forKey: "des") as? String
        desPro = desPro?.stringEncodingHtml()
        desPro = desPro?.stringRemoveHtml()
        cell.des.text = desPro
        var url = (posts.object(at: (indexPath as NSIndexPath).row) as AnyObject).value(forKey: "guid") as? String
        url = url?.replacingOccurrences(of: " ", with: "")
        url = url?.replacingOccurrences(of: "\n", with: "")
        cell.icon.downloadedFrom(link: url!)

        return cell
        
    }
    
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        blurImage()
        
    }
    
    func blurImage(){
        let backgroundImage = UIImage(named: "meowth_xl")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .scaleAspectFill
        // blur table
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        imageView.addSubview(blurView)
        // set background tableview
        tableViewHome.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.tableViewHome.backgroundView = imageView

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
extension HomeViewController{
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
