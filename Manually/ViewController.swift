//
//  ViewController.swift
//  EmptyApp
//
//  Created by Rajashree Naik on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var customers : [Customer] = []
    var movies : [Movie] = []
    var bookings : [Booking] = []
    var myTableView: UITableView  =   UITableView()
    
    fileprivate lazy var webView: WKWebView = {
        let w = WKWebView()
        w.translatesAutoresizingMaskIntoConstraints = false
        return w
    }()
    
    fileprivate lazy var infoLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Movie Rental Application"
        l.font = UIFont.systemFont(ofSize: 28)
        l.textAlignment = .center
        
        return l
    }()
    
    fileprivate lazy var AvailLabel: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "No Customers or Movies available! Try adding one now!"
        l.font = UIFont.systemFont(ofSize: 15)
        l.textAlignment = .center
        
        return l
    }()
    
    fileprivate lazy var Avail2Label: UILabel = {
        let l = UILabel()
        
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Quantity of Movie insufficient Right Now! Try booking another movie!"
        l.font = UIFont.systemFont(ofSize: 15)
        l.textAlignment = .center
        
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
    }
    
     func customizeView(){
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let button = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion:CGFloat = 50
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        
        button.backgroundColor = UIColor.lightGray
        button.setTitle("  Customer ", for: UIControlState.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        let button1 = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion1:CGFloat = 50
        let yPostion1:CGFloat = 200
        let buttonWidth1:CGFloat = 150
        let buttonHeight1:CGFloat = 45
        
        button1.frame = CGRect(x:xPostion1, y:yPostion1, width:buttonWidth1, height:buttonHeight1)
        
        button1.backgroundColor = UIColor.lightGray
        button1.setTitle("  Movie rental store  ", for: UIControlState.normal)
        button1.tintColor = UIColor.black
        button1.addTarget(self, action: #selector(ViewController.buttonActionStore(_:)), for: .touchUpInside)
        
        self.view.addSubview(button1)
        
        let button2 = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion2:CGFloat = 50
        let yPostion2:CGFloat = 300
        let buttonWidth2:CGFloat = 150
        let buttonHeight2:CGFloat = 45
        
        button2.frame = CGRect(x:xPostion2, y:yPostion2, width:buttonWidth2, height:buttonHeight2)
        
        button2.backgroundColor = UIColor.lightGray
        button2.setTitle("  Bookings  ", for: UIControlState.normal)
        button2.tintColor = UIColor.black
        button2.addTarget(self, action: #selector(ViewController.buttonActionAllBookings(_:)), for: .touchUpInside)
        
        self.view.addSubview(button2)
    }
    //****************************CUSTOMER?*******************************************
    func buttonAction(_ sender:UIButton!)
    {
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let button = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion:CGFloat = 50
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        
        button.backgroundColor = UIColor.lightGray
        button.setTitle("  New Customer ? ", for: UIControlState.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(ViewController.buttonActionNewCust(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        let button1 = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion1:CGFloat = 50
        let yPostion1:CGFloat = 200
        let buttonWidth1:CGFloat = 150
        let buttonHeight1:CGFloat = 45
        
        button1.frame = CGRect(x:xPostion1, y:yPostion1, width:buttonWidth1, height:buttonHeight1)
        
        button1.backgroundColor = UIColor.lightGray
        button1.setTitle("  View Users  ", for: UIControlState.normal)
        button1.tintColor = UIColor.black
        button1.addTarget(self, action: #selector(ViewController.buttonActionAllCust(_:)), for: .touchUpInside)
        
        self.view.addSubview(button1)
        
        
        let button13 = UIButton(type: UIButtonType.system) as UIButton

        let xPostion13:CGFloat = 50
        let yPostion13:CGFloat = 300
        let buttonWidth13:CGFloat = 150
        let buttonHeight13:CGFloat = 45
        
        button13.frame = CGRect(x:xPostion13, y:yPostion13, width:buttonWidth13, height:buttonHeight13)
        
        button13.backgroundColor = UIColor.lightGray
        button13.setTitle("  Rent a movie ?  ", for: UIControlState.normal)
        button13.tintColor = UIColor.black
        button13.addTarget(self, action: #selector(ViewController.buttonActionRentMov(_:)), for: .touchUpInside)
        
        self.view.addSubview(button13)
        
        let button14 = UIButton(type: UIButtonType.system) as UIButton

        let xPostion14:CGFloat = 50
        let yPostion14:CGFloat = 400
        let buttonWidth14:CGFloat = 150
        let buttonHeight14:CGFloat = 45
        
        button14.frame = CGRect(x:xPostion14, y:yPostion14, width:buttonWidth14, height:buttonHeight14)
        
        button14.backgroundColor = UIColor.lightGray
        button14.setTitle("  Update Booking  ", for: UIControlState.normal)
        button14.tintColor = UIColor.black
        button14.addTarget(self, action: #selector(ViewController.buttonAction3(_:)), for: .touchUpInside)
        
        self.view.addSubview(button14)
        
        let button15 = UIButton(type: UIButtonType.system) as UIButton

        let xPostion15:CGFloat = 50
        let yPostion15:CGFloat = 500
        let buttonWidth15:CGFloat = 150
        let buttonHeight15:CGFloat = 45
        
        button15.frame = CGRect(x:xPostion15, y:yPostion15, width:buttonWidth15, height:buttonHeight15)
        
        button15.backgroundColor = UIColor.lightGray
        button15.setTitle("  Delete Booking ? ", for: UIControlState.normal)
        button15.tintColor = UIColor.black
        button15.addTarget(self, action: #selector(ViewController.buttonAction3(_:)), for: .touchUpInside)
        
        self.view.addSubview(button15)
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.customizeView), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    //***************************MOVIE RENTAL STORE****************************************
    func buttonActionStore(_ sender:UIButton!)
    {
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let button = UIButton(type: UIButtonType.system) as UIButton
        
        let xPostion:CGFloat = 50
        let yPostion:CGFloat = 100
        let buttonWidth:CGFloat = 150
        let buttonHeight:CGFloat = 45
        button.frame = CGRect(x:xPostion, y:yPostion, width:buttonWidth, height:buttonHeight)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("  Add New Movie ? ", for: UIControlState.normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(ViewController.buttonActionNewMovie(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        let button1 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion1:CGFloat = 50
        let yPostion1:CGFloat = 200
        let buttonWidth1:CGFloat = 150
        let buttonHeight1:CGFloat = 45
        button1.frame = CGRect(x:xPostion1, y:yPostion1, width:buttonWidth1, height:buttonHeight1)
        button1.backgroundColor = UIColor.lightGray
        button1.setTitle("  Update Movie Details  ", for: UIControlState.normal)
        button1.tintColor = UIColor.black
        button1.addTarget(self, action: #selector(ViewController.buttonAction2(_:)), for: .touchUpInside)
        self.view.addSubview(button1)
        
        let button12 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion12:CGFloat = 50
        let yPostion12:CGFloat = 300
        let buttonWidth12:CGFloat = 150
        let buttonHeight12:CGFloat = 45
        button12.frame = CGRect(x:xPostion12, y:yPostion12, width:buttonWidth12, height:buttonHeight12)
        button12.backgroundColor = UIColor.lightGray
        button12.setTitle("  View All Movies  ", for: UIControlState.normal)
        button12.tintColor = UIColor.black
        button12.addTarget(self, action: #selector(ViewController.buttonActionAllMov(_:)), for: .touchUpInside)
        self.view.addSubview(button12)
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    //***********************ADDING NEW CUSTOMER***************************************
    func buttonActionNewCust(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Add User",
            message: "Insert the Name, Age, Email & Address of the new User:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sender.isEnabled = true
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let CustName = alert.textFields?[0].text! {
                if let Age = alert.textFields?[1].text! {
                    if let Email = alert.textFields?[2].text! {
                        if  let Address = alert.textFields?[3].text!
                        {
                            if(self.isValidEmail(Email: Email)) {
                                self.buttonActionAddCust(CustName: CustName, Age:Age, Email:Email, Address:Address )
                            }
                            else {
                                self.buttonActionErr(sender!)

                            }
                        }
                    }
                }
            }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    //***********************UPDATING NEW CUSTOMER***************************************
    func buttonActionUpdateCust(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Update User",
            message: "Insert the Number, Name, Age, Email & Address of the new User:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sender.isEnabled = true
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let i = alert.textFields?[0].text! {
                if let CustName = alert.textFields?[1].text! {
                if let Age = alert.textFields?[2].text! {
                    if let Email = alert.textFields?[3].text! {
                        if  let Address = alert.textFields?[4].text!
                        {
                            self.buttonActionUpCust(i:i, CustName: CustName, Age:Age, Email:Email, Address:Address )
                            self.buttonActionSucUp(sender!)
                        }
                    }
                }
              }
            }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //************************ADDING NEW MOVIE******************************************
    func buttonActionNewMovie(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Add Movie",
            message: "Insert the Name, yearOfRelease, Genre & Quant of the new User:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         sender.isEnabled = true
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let CustName = alert.textFields?[0].text! {
                if let Age = alert.textFields?[1].text! {
                    if let Email = alert.textFields?[2].text! {
                        if  let Address = alert.textFields?[3].text!
                        {
                            self.buttonActionAddMov(CustName: CustName, Age:Age, Email:Email, Address:Address )
                            self.buttonActionSucUpMov(sender!)

                        }
                    }
                }
            }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    //************************UPDATE NEW MOVIE******************************************
    func buttonActionRenMovie(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Make Booking!",
            message: "Insert the CustNum, MovieNum, DOB & DOR, Quantity of the Movie to be Rented:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)

        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sender.isEnabled = true
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                if let cus = alert.textFields?[0].text! {
                    if let mov = alert.textFields?[1].text! {
                        if  let d1 = alert.textFields?[2].text!
                        {
                            if  let d2 = alert.textFields?[3].text!
                            {
                                if  let quant = alert.textFields?[4].text!
                                {
                                    
                                        self.buttonActionRMov(cus: cus, mov: mov, quant: quant, DateOfBooking: d1, DateOfReturn: d2)
                                        self.buttonActionSucUpMov(sender!)
                     }
                  }
                }
              }
            }
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    //************************UPDATE NEW MOVIE******************************************
    func buttonActionUpdateMovie(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Add Movie",
            message: "Insert the Name, yearOfRelease, Genre & Quant of the new User:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sender.isEnabled = true
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let CustName = alert.textFields?[0].text! {
                if let Age = alert.textFields?[1].text! {
                    if let Email = alert.textFields?[2].text! {
                        if  let Address = alert.textFields?[3].text!
                        {
                            self.buttonActionAddMov(CustName: CustName, Age:Age, Email:Email, Address:Address )
                            self.buttonActionSucUp(sender!)
                        }
                    }
                }
            }
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    //****************************DELETE CUSTOMER************************************
    func buttonActionDelCust(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Delete User",
            message: "Insert the Name, Age, Email & Address of the new User:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
    
            self.buttonActionAllCust(sender!)
            
        }))

        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
                        if  let c_select = alert.textFields?[0].text!
                        {
                            self.buttonActionRemCust(c_select: c_select )
                        }
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    //***********************REMOVE CUSTOMER FROM BACKEND***********************************
    @objc func buttonActionRemCust(c_select:String)
    {
        let num = Int(c_select)!
        customers.remove(at: num)
        }
    
    
    //****************************DELETE MOVIE************************************
    func buttonActionDelMov(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Delete User",
            message: "Insert the Movie id:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllCust(sender!)
            
        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            if  let c_select = alert.textFields?[0].text!
            {
                self.buttonActionRemMov(c_select: c_select )
            }
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    //***********************REMOVE MOVIE FROM BACKEND***********************************
    @objc func buttonActionRemMov(c_select:String)
    {
        let num = Int(c_select)!
        movies.remove(at: num)
    }
    
    
    //****************************DELETE BOOKING************************************
    func buttonActionDelBok(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Delete User",
            message: "Insert Booking idr:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllCust(sender!)
            
        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            if  let c_select = alert.textFields?[0].text!
            {
                self.buttonActionRemBok(c_select: c_select )
            }
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    //***********************REMOVE BOOKING FROM BACKEND***********************************
    @objc func buttonActionRemBok(c_select:String)
    {
        let num = Int(c_select)!
        bookings.remove(at: num)
    }
    
    
    //************************ADDING CUSTOMER TO BACKEND************************************
      @objc func buttonActionAddCust(CustName: String, Age: String, Email: String, Address: String)
    {
        var i = 10
        let c1 = Customer(cid:UUID(), name: CustName, age: Age, email: Email, address: Address)
        customers.append(c1)
        for customer in customers{
            print("\(i) : \(customer.name!)")
            print("test")
            i+=10
        }
        
    }
    
    //************************UPDATING CUSTOMER TO BACKEND************************************
    @objc func buttonActionUpCust(i: String, CustName: String, Age: String, Email: String, Address: String)
    {
        let i = Int(i)!
        customers[i].update(name: CustName, age: Age, email: Email, address: Address)
        var j = 10
        for customer in customers{
            print("\(i) : \(customer.name!)")
            print("test")
            j+=10
        }
        
    }
    
    //***************************ADDING MOVIE TO BACKEND**************************************
    @objc func buttonActionAddMov(CustName: String, Age: String, Email: String, Address: String)
    {
        var i = 10
        let c1 = Movie(mid:UUID(), name: CustName, year: Age, genre: Email, quant: Address)
        movies.append(c1)
        for movie in movies{
            print("\(i) : \(movie.name!)")
            print("test")
            i+=10
        }
        
    }
    
    //***************************RENT MOVIE TO BACKEND**************************************
    @objc func buttonActionRMov(cus:String, mov:String, quant: String, DateOfBooking: String, DateOfReturn: String)
    {
        print("Again Enter Quantity to be purchased:")
        let q = Int(quant)!
        let i = Int(cus)!
        let j = Int(mov)!
        if(q < self.movies[j].quant) {
            self.movies[j].quant -= q
        }
        else {
            view.backgroundColor = .white
            
            view.addSubview(infoLabel)
            view.addSubview(webView)
            view.addSubview(Avail2Label)
            
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
            
            AvailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            AvailLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
            
            webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
            webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy"
        let DateOfBooking = formatter.string(from: date)
        let DateOfReturn = formatter.date(from: DateOfReturn)!
        
        let c1 = Booking(bid:UUID(), movie: movies[j], customer:customers[i], quant:q, DateOfBooking:DateOfBooking, DateOfReturn:DateOfReturn)
        bookings.append(c1)
    }
    
    //***************************UPDATING MOVIE TO BACKEND**************************************
    @objc func buttonActionUpMov(CustName: String, Age: String, Email: String, Address: String)
    {
        var i = 10
        let c1 = Movie(mid:UUID(), name: CustName, year: Age, genre: Email, quant: Address)
        movies.append(c1)
        for movie in movies{
            print("\(i) : \(movie.name!)")
            print("test")
            i+=10
        }
        
    }
    
    
    func buttonAction2(_ sender:UIButton!)
    {
        print("Button for store")
    }
    
    func buttonAction3(_ sender:UIButton!)
    {
        print("DONE!")
    }
    
    //***********************************RENT A MOVIE**********************************************
    func buttonActionRentMov(_ sender:UIButton!)
    {
        if movies.count != 0 && customers.count != 0 {
            
            view.backgroundColor = .white
            
            view.addSubview(infoLabel)
            view.addSubview(webView)
            
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
            
            webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
            webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            var i = 40
            var j = 0
            for customer in customers{
                print("\(i) : \(customer.shownames())")
                
                let rect:CGRect = CGRect(x:150,y:100+i,width:100,height:50)
                let label:UILabel = UILabel(frame: rect)
                label.text = customer.show(id: j, name: customer.name!, age: customer.age!, email: customer.email!, address: customer.address!)
                view.addSubview(label)
                
                j+=1
                i+=40
            }
            
            var k = 0
            var l = 50
            for movie in movies{
                
                let rect:CGRect = CGRect(x:10,y:200+l,width:700,height:150)
                let label1:UILabel = UILabel(frame: rect)
                label1.text = movie.show(id: k, mid: movie.mid, name: movie.name!, year : movie.yearOfRelease!, genre:movie.genre!, quant: movie.quant)
                view.addSubview(label1)
                
                k+=1
                l+=50
            }
            
            let button13 = UIButton(type: UIButtonType.system) as UIButton
            let xPostion13:CGFloat = 250
            let yPostion13:CGFloat = 300
            let buttonWidth13:CGFloat = 150
            let buttonHeight13:CGFloat = 45
            button13.frame = CGRect(x:xPostion13, y:yPostion13, width:buttonWidth13, height:buttonHeight13)
            button13.backgroundColor = UIColor.lightGray
            button13.setTitle(" Rent a Movie ", for: UIControlState.normal)
            button13.tintColor = UIColor.black
            button13.addTarget(self, action: #selector(ViewController.buttonActionRenMovie(_:)), for: .touchUpInside)
            self.view.addSubview(button13)
            
        }
        else {
            view.backgroundColor = .white
            
            view.addSubview(infoLabel)
            view.addSubview(webView)
            view.addSubview(AvailLabel)
            
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
            
            AvailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            AvailLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
            
            webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
            webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
        }
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    //***********************************DISPALY ALL CUSTOMERS*************************************
    func buttonActionAllCust(_ sender:UIButton!)
    {
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        var i = 10
        var j = 0
        for customer in customers{
            print("\(i) : \(customer.shownames())")
            
            let rect:CGRect = CGRect(x:150,y:100+i,width:100,height:50)
            let label:UILabel = UILabel(frame: rect)
            label.text = customer.show(id: j, name: customer.name!, age: customer.age!, email: customer.email!, address: customer.address!)
            view.addSubview(label)
            
            j+=1
            i+=10
        }
        
        let button12 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion12:CGFloat = 50
        let yPostion12:CGFloat = 300
        let buttonWidth12:CGFloat = 150
        let buttonHeight12:CGFloat = 45
        button12.frame = CGRect(x:xPostion12, y:yPostion12, width:buttonWidth12, height:buttonHeight12)
        button12.backgroundColor = UIColor.lightGray
        button12.setTitle("  Delete Customer  ", for: UIControlState.normal)
        button12.tintColor = UIColor.black
        button12.addTarget(self, action: #selector(ViewController.buttonActionDelCust(_:)), for: .touchUpInside)
        self.view.addSubview(button12)
        
        let button13 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion13:CGFloat = 250
        let yPostion13:CGFloat = 300
        let buttonWidth13:CGFloat = 150
        let buttonHeight13:CGFloat = 45
        button13.frame = CGRect(x:xPostion13, y:yPostion13, width:buttonWidth13, height:buttonHeight13)
        button13.backgroundColor = UIColor.lightGray
        button13.setTitle(" Update Customer ", for: UIControlState.normal)
        button13.tintColor = UIColor.black
        button13.addTarget(self, action: #selector(ViewController.buttonActionUpdateCust(_:)), for: .touchUpInside)
        self.view.addSubview(button13)
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    //***********************************DISPALY ALL BOOKINGS*************************************
    func buttonActionAllBookings(_ sender:UIButton!)
    {
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        var i = 10
        var j = 0
        for booking in bookings{
            
            let rect:CGRect = CGRect(x:10,y:10*i,width:700,height:150)
            let label:UILabel = UILabel(frame: rect)
            label.text = booking.show(id: j, movie: booking.movie, customer: booking.customer, quant: booking.quant, DateOfBooking: booking.DateOfBooking, DateOfReturn: booking.DateOfReturn)
            view.addSubview(label)
            print(label)
            
            j+=1
            i+=10
        }
        
        let button12 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion12:CGFloat = 50
        let yPostion12:CGFloat = 300
        let buttonWidth12:CGFloat = 150
        let buttonHeight12:CGFloat = 45
        button12.frame = CGRect(x:xPostion12, y:yPostion12, width:buttonWidth12, height:buttonHeight12)
        button12.backgroundColor = UIColor.lightGray
        button12.setTitle("  Delete Booking  ", for: UIControlState.normal)
        button12.tintColor = UIColor.black
        button12.addTarget(self, action: #selector(ViewController.buttonActionDelBok(_:)), for: .touchUpInside)
        self.view.addSubview(button12)
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    //****************************DELETE MOVIE************************************
    func buttonActionSearch(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Search Booking",
            message: "Insert the Booking Name:",
            preferredStyle: .alert)
        
        // Add a text field to the alert for the new item's title
        alert.addTextField(configurationHandler: nil)
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllCust(sender!)
            
        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            if  let c_select = alert.textFields?[0].text!
            {
                self.Search(c_select: c_select )
            }
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //***********************************DISPALY ALL BOOKINGS*************************************
    func Search( c_select:String)
    {
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//            let num = Int(c_select)!
//            let rect:CGRect = CGRect(x:10,y:100,width:700,height:150)
//            let label:UILabel = UILabel(frame: rect)
//            Booking b1 = bookings[num]
//            let b1 = b1.show(id:num)
//            var str = b1.show(bookings[num])
//            label.text = str
//            view.addSubview(label)
//            print(label)

        
        let button12 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion12:CGFloat = 50
        let yPostion12:CGFloat = 300
        let buttonWidth12:CGFloat = 150
        let buttonHeight12:CGFloat = 45
        button12.frame = CGRect(x:xPostion12, y:yPostion12, width:buttonWidth12, height:buttonHeight12)
        button12.backgroundColor = UIColor.lightGray
        button12.setTitle("  Delete Booking  ", for: UIControlState.normal)
        button12.tintColor = UIColor.black
        button12.addTarget(self, action: #selector(ViewController.buttonActionDelBok(_:)), for: .touchUpInside)
        self.view.addSubview(button12)
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    
    //************************************DISPLAY ALL MOVIES********************************************
    func buttonActionAllMov(_ sender:UIButton!)
    {
        view.backgroundColor = .white
        
        view.addSubview(infoLabel)
        view.addSubview(webView)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        
        webView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let m = Movie(mid:UUID(), name:"DDLJ-1", year : "200", genre: "DRAMA", quant: "5")
        movies.append(m)
        let m1 = Movie(mid:UUID(), name:"DDLJ-1", year : "200", genre: "DRAMA", quant: "5")
        movies.append(m1)
        let m2 = Movie(mid:UUID(), name:"DDLJ-1", year : "200", genre: "DRAMA", quant: "5")
        movies.append(m2)
        
        
        var i = 10
        var j = 0
        for movie in movies{
            print("\(i) : \(movie.show(id: j, mid: movie.mid, name: movie.name!, year : movie.yearOfRelease!, genre:movie.genre!, quant: movie.quant))")
            
            let rect:CGRect = CGRect(x:10,y:10*i,width:700,height:150)
            let label:UILabel = UILabel(frame: rect)
            label.text = movie.show(id: j, mid: movie.mid, name: movie.name!, year : movie.yearOfRelease!, genre:movie.genre!, quant: movie.quant)
            view.addSubview(label)

            j+=1
            i+=10
        }
        
        let button12 = UIButton(type: UIButtonType.system) as UIButton
        let xPostion12:CGFloat = 50
        let yPostion12:CGFloat = 300
        let buttonWidth12:CGFloat = 150
        let buttonHeight12:CGFloat = 45
        button12.frame = CGRect(x:xPostion12, y:yPostion12, width:buttonWidth12, height:buttonHeight12)
        button12.backgroundColor = UIColor.lightGray
        button12.setTitle("  Delete Movie  ", for: UIControlState.normal)
        button12.tintColor = UIColor.black
        button12.addTarget(self, action: #selector(ViewController.buttonActionDelMov(_:)), for: .touchUpInside)
        self.view.addSubview(button12)
        
        let del = UIButton(type: UIButtonType.system) as UIButton
        let xPostionDEL:CGFloat = 380
        let yPostionDEL:CGFloat = 55
        let buttonWidthDEL:CGFloat = 20
        let buttonHeightDEL:CGFloat = 25
        del.frame = CGRect(x:xPostionDEL, y:yPostionDEL, width:buttonWidthDEL, height:buttonHeightDEL)
        del.backgroundColor = UIColor.lightGray
        del.setTitle(" X ", for: UIControlState.normal)
        del.tintColor = UIColor.black
        del.addTarget(self, action: #selector(ViewController.buttonActionStore(_:)), for: .touchUpInside)
        self.view.addSubview(del)
    }
    
    //*****************************************EMAIL VALIDATION****************************************
    func isValidEmail(Email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: Email)
    }
    
    func buttonActionErr(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Invalid Email",
            message: "Reenter Email",
            preferredStyle: .alert)
        
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllCust(sender!)
            
        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
           
                self.buttonActionNewCust(sender!)
           
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    func buttonActionSucUp(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Successfully Updated Data",
            message: " Thank you!! ",
            preferredStyle: .alert)
        
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllCust(sender!)
            
        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            
            self.buttonActionAllCust(sender!)
            
            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    func buttonActionSucUpMov(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Successfully Updated Data",
            message: " Thank you!! ",
            preferredStyle: .alert)
        
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllMov(sender!)

        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            
            self.buttonActionAllMov(sender!)

            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    func buttonActionSucUpBok(_ sender:UIButton!)
    {
        let alert = UIAlertController(
            title: "Successfully Updated Data",
            message: " Thank you!! ",
            preferredStyle: .alert)
        
        
        
        // Add a "cancel" button to the alert. This one doesn't need a handler
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
            self.buttonActionAllBookings(sender!)

        }))
        
        // Add a "OK" button to the alert. The handler calls addNewToDoItem()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            
            self.buttonActionAllBookings(sender!)

            
        }))
        
        // Present the alert to the user
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

