//
//  ChartsViewController.swift
//  MyTimeVisualizer
//
//  Created by admin on 19/12/2021.
//

import UIKit
import Charts

class ChartsViewController: UIViewController, ChartViewDelegate,UITableViewDataSource, UITableViewDelegate {
    
    let weekHours = ["07:00 AM", "08:00 AM", "09:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM"]
    
    
    @IBOutlet weak var ChartView: UIView!
    @IBOutlet weak var WeekTable: UITableView!
    
    let dailyPieChart = PieChartView()
    var pieChart = PieChartView()
    var lineChart = LineChartView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   
    var chartView = UIView()
    var chartValues = [(String, Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeekTable.dataSource = self
        WeekTable.delegate = self
        // Do any additional setup after loading the view.
        dailyPieChart.delegate = self
        
        // swipe gester recognizer (left || right)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
           swipeRight.direction = .right
           self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
           swipeRight.direction = .left
           self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                if pieChart.isHidden{
//                    lineChart.isHidden = true
//                    pieChart.isHidden = false
//                    myPieChart()
                }else{
                dismiss(animated: true, completion: nil)
                }
            case .left:
                print("Swiped left")
                if !pieChart.isHidden{
//                    pieChart.isHidden = true
//                    lineChart.isHidden = false
//                    myLineChart()
//                    chartView.addSubview(lineChart)
                }
                
                
            default:
                break
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        chartView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        view.addSubview(chartView)
        
        myPieChart()
        chartView.addSubview(pieChart)
       

       
    }
    
    func myPieChart() {
        pieChart.frame = CGRect(x: 0, y: 0, width: self.chartView.frame.width, height: self.chartView.frame.width)
        var entries = [PieChartDataEntry]()
        entries.append(PieChartDataEntry(value: Double(Int.random(in: 1 ... 10)),label: "IOS"))
        entries.append(PieChartDataEntry(value: Double(Int.random(in: 1 ... 10)),label: "algoriths"))
        entries.append(PieChartDataEntry(value: Double(Int.random(in: 1 ... 10)),label: "uikit"))
        entries.append(PieChartDataEntry(value: Double(Int.random(in: 1 ... 10)),label: "swift"))
        entries.append(PieChartDataEntry(value: Double(Int.random(in: 1 ... 10)),label: "data structures"))
        entries.append(PieChartDataEntry(value: Double(Int.random(in: 1 ... 10)),label: "swift ui"))
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = [.systemCyan, .blue, .purple, .systemCyan, .blue, .purple]
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        //pieChart.chartDescription?.enabled = false
        //pieChart.drawHoleEnabled = false //To Add Hole in the Middle
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = false //For Rotating The Chart
        //pieChart.isUserInteractionEnabled = false //Used For Clicking on the chart
        //pieChart.legend.enabled = false //Used To Display Uder Data
        pieChart.drawSlicesUnderHoleEnabled = false
        //pieChart.drawEntryLabelsEnabled = false //Rwiting Entry Label in slices
        pieChart.usePercentValuesEnabled = true
    }
    
    func myLineChart() {
        lineChart.frame = CGRect(x: 0, y: 0, width: self.chartView.frame.width, height: self.chartView.frame.width)
        var entries = [ChartDataEntry]()
        entries.append(ChartDataEntry(x: Double(Int.random(in: 5 ... 10)), y: Double(Int.random(in: 5 ... 10))))
        entries.append(ChartDataEntry(x: Double(Int.random(in: 10 ... 15)), y: Double(Int.random(in: 10 ... 15))))
        entries.append(ChartDataEntry(x: Double(Int.random(in: 15 ... 20)), y: Double(Int.random(in: 15 ... 20))))
        entries.append(ChartDataEntry(x: Double(Int.random(in: 20 ... 25)), y: Double(Int.random(in: 20 ... 25))))
        entries.append(ChartDataEntry(x: Double(Int.random(in: 25 ... 30)), y: Double(Int.random(in: 25 ... 30))))
        entries.append(ChartDataEntry(x: Double(Int.random(in: 30 ... 35)), y: Double(Int.random(in: 30 ... 35))))
        let dataSet = LineChartDataSet(entries: entries, label: "")
        dataSet.colors = [.systemCyan, .blue, .purple, .systemCyan, .blue, .purple]
        let data = LineChartData(dataSet: dataSet)
        lineChart.data = data
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekHours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeekCell", for: indexPath) as! WeekTableViewCell
        cell.timeLabel.text =  weekHours[indexPath.row]
        cell.sunTask.text = myTask[Int.random(in: 0..<myTask.count)]
        cell.wedTask.text = myTask[Int.random(in: 0..<myTask.count)]
        cell.satTask.text = myTask[Int.random(in: 0..<myTask.count)]
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.layer.borderColor = UIColor.white.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            pieChart.isHidden = true
            lineChart.isHidden = false
            myLineChart()
            chartView.addSubview(lineChart)
        }
        else {
            lineChart.isHidden = true
            pieChart.isHidden = false
            myPieChart()
            chartView.addSubview(pieChart)
        }
    }
}
