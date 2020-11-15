//
//  ViewController.swift
//  TinkerTunes
//
//  Created by Fara Yan on 11/14/20.
//  Copyright © 2020 Fara Yan. All rights reserved.
//

import UIKit
import AVFoundation

class DrawingViewController: UIViewController, AVAudioPlayerDelegate {
    var myMusicNote: AVAudioPlayer!
    
    let canvas = Canvas()
    var image = UIImage()
    var colorArray: [UIColor] = []
    var musicType = "Piano"
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        myMusicNote = AVAudioPlayer()
        addControl()
//        for counter in 1...6{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                self.playCNote()
//            }
//        }
        
    }
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
             musicType = "Piano"
             redLabel.text = "C"
             orangeLabel.text = "D"
             yellowLabel.text = "E"
             greenLabel.text = "F"
             blueLabel.text = "G"
             purpleLabel.text = "A"
             blackLabel.text = "B"
          break
          case 1:
             musicType = "Guitar"
             redLabel.text = "D"
             orangeLabel.text = "E"
             yellowLabel.text = "B"
             greenLabel.text = "A"
             blueLabel.text = "G"
             purpleLabel.text = "High E"
             blackLabel.text = "G"
          break
            case 2:
               musicType = "Drums"
               redLabel.text = "Tom 1"
               orangeLabel.text = "Tom 2"
               yellowLabel.text = "Left Snare"
               greenLabel.text = "Right Snare"
               blueLabel.text = "Hi Foot"
               purpleLabel.text = "Bell"
               blackLabel.text = "Open Right"
            break
          default:
            musicType = "Piano"
            redLabel.text = "C"
            orangeLabel.text = "D"
            yellowLabel.text = "E"
            greenLabel.text = "F"
            blueLabel.text = "G"
            purpleLabel.text = "A"
            blackLabel.text = "B"
          break
       }
    }
    func addControl() {
       let segmentItems = ["Piano", "Guitar", "Drums"]
       let control = UISegmentedControl(items: segmentItems)
       control.frame = CGRect(x: 10, y: 100, width: (self.view.frame.width - 20), height: 50)
       control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
       control.selectedSegmentIndex = 0
       view.addSubview(control)
    }
    func imageFromContext(_ context: CGContext) -> UIImage? {
        guard let cgImage = context.makeImage() else { return nil }
        return UIImage.init(cgImage: cgImage)
    }

    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo() {
        print("Undo lines drawn")
        
        canvas.undo()
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    let uploadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUpload), for: .touchUpInside)
        return button
    }()
    
    @objc func handleClear() {
        canvas.clear()
    }
    func playNote(color: String, loops: Int){
        if (musicType.caseInsensitiveCompare("Piano") == .orderedSame){
            if(color.caseInsensitiveCompare("R") == .orderedSame){
                let path = Bundle.main.path(forResource: "cnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }else if (color.caseInsensitiveCompare("O") == .orderedSame){
                let path = Bundle.main.path(forResource: "dnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }else if (color.caseInsensitiveCompare("Y") == .orderedSame){
                let path = Bundle.main.path(forResource: "enote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }else if (color.caseInsensitiveCompare("G") == .orderedSame){
                let path = Bundle.main.path(forResource: "fnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }else if (color.caseInsensitiveCompare("B") == .orderedSame){
                let path = Bundle.main.path(forResource: "gnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }else if (color.caseInsensitiveCompare("P") == .orderedSame){
                let path = Bundle.main.path(forResource: "anote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }else if (color.caseInsensitiveCompare("X") == .orderedSame){
                //x means black
                let path = Bundle.main.path(forResource: "bnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            }
        }else if(musicType.caseInsensitiveCompare("Guitar") == .orderedSame){
        if(color.caseInsensitiveCompare("R") == .orderedSame){
            let path = Bundle.main.path(forResource: "dguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("O") == .orderedSame){
            let path = Bundle.main.path(forResource: "eguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("Y") == .orderedSame){
            let path = Bundle.main.path(forResource: "bguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("G") == .orderedSame){
            let path = Bundle.main.path(forResource: "aguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("B") == .orderedSame){
            let path = Bundle.main.path(forResource: "gguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("P") == .orderedSame){
            let path = Bundle.main.path(forResource: "higheguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("X") == .orderedSame){
            //x means black
            let path = Bundle.main.path(forResource: "gguitar", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }
        }else if(musicType.caseInsensitiveCompare("Drums") == .orderedSame){
        if(color.caseInsensitiveCompare("R") == .orderedSame){
            let path = Bundle.main.path(forResource: "tom1drum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("O") == .orderedSame){
            let path = Bundle.main.path(forResource: "tom2drum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("Y") == .orderedSame){
            let path = Bundle.main.path(forResource: "leftsnaredrum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("G") == .orderedSame){
            let path = Bundle.main.path(forResource: "rightsnaredrum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("B") == .orderedSame){
            let path = Bundle.main.path(forResource: "hifootdrum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("P") == .orderedSame){
            let path = Bundle.main.path(forResource: "belldrum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }else if (color.caseInsensitiveCompare("X") == .orderedSame){
            //x means black
            let path = Bundle.main.path(forResource: "openrightdrum", ofType: "mp3")!
            do {
                myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                myMusicNote.numberOfLoops = 1
                myMusicNote.delegate = self
                myMusicNote.prepareToPlay()
                myMusicNote.play()
            } catch {
                print("caught: \(error)")
            }
        }
            }
    }
    // MARK: - HERE
    @objc func handleUpload(){
        print("Color array count")
        print(self.colorArray.count)
        image = canvas.asImage()
        let xDim = image.pixelWidth
        let yDim = image.pixelHeight
        print("xDim: \(xDim)")
        print("yDim: \(yDim)")
        for x in 1...xDim-1 {
            if (x % 5 == 0) {
                for y in 700...yDim-700 {
                    if (y % 5 == 1) {
                    colorArray.append(image.pixelColor(x: x, y: y))
                    //print(x)
                    //print(y)
                    }
                }
            }
        }
        var count = 0
        var colorStringArray: [String] = []
        for color in colorArray {
            //print(color)
            let colorComponents = color.components
            var red = colorComponents.red
            var green = colorComponents.green
            var blue = colorComponents.blue
            //print(red)
            //print(green)
            //print(blue)
            if (red == 255.0 && green <= 140.0 && green >= 120.0 && blue < 50.0) {
                colorStringArray.append("Orange")
                print("Orange")
            }
            else if (red == 255.0 && green < 25.0 && blue < 25.0) {
                colorStringArray.append("Red")
                print("Red")
            }
            else if (red == 255.0 && green == 255.0 && blue < 255.0) {
                colorStringArray.append("Yellow")
                print("Yellow")
            }else if (red == 255.0 && green<255 && blue == 255.0) {
                colorStringArray.append("Purple")
                print("Purple")
            }else if (red < 255.0 && green == 255 && blue < 255.0) {
                colorStringArray.append("Green")
                print("Green")
            }
            else if (red < 255.0 && green < 255.0 && blue == 255.0) {
                colorStringArray.append("Blue")
                print("Blue")
            }
            else if (red == 0 && green == 0 && blue == 0) {                colorStringArray.append("X")
                print("Black")
            }
            else {
                //print(color)
            }
            count += 1
        }
        print(colorStringArray.count)
        
        var outputColor: [String] = []
        var outputRepeat: [Int] = []
        var previousColor = colorStringArray[0]
        var repetition = 0
        outputColor.append(String(previousColor.prefix(1)))
        for color in colorStringArray {
            if(color.caseInsensitiveCompare(previousColor) == .orderedSame){
                repetition += 1
            }else {
                outputRepeat.append(repetition)
                outputColor.append(String(color.prefix(1)))
                previousColor = color
                repetition = 0
            }
        }
        outputRepeat.append(repetition)

        
        print("HELLO")
        print(outputColor.count)
        print(outputRepeat.count)
        for strawberry in 0 ... outputColor.count-1{
            print(outputColor[strawberry])
            print(outputRepeat[strawberry])
        }
        
        let group = DispatchGroup()
        group.enter()
        group.leave() //// When your task completes
         group.notify(queue: DispatchQueue.main) {
            if (outputColor.count>30){
                loop: for count in 0 ... 30{
    
                        self.playNote(color: outputColor[count], loops: outputRepeat[count])
                        usleep(300000)
                        if(count%8 == 0){
                            self.myMusicNote.stop()
                            usleep(400000)
                        } else if(count%4 == 0){
                            self.myMusicNote.stop()
                            usleep(200000)
                        }
                }
            }else{
                loop: for count in 0 ... outputColor.count-1{
                        self.playNote(color: outputColor[count], loops: outputRepeat[count])
                        usleep(300000)
                        if(count%8 == 0){
                            self.myMusicNote.stop()
                            usleep(400000)
                        } else if(count%4 == 0){
                            self.myMusicNote.stop()
                            usleep(200000)
                        }
                }
            }
        }
    }
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let orangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let blackButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redLabel: UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let orangeLabel: UILabel = {
        let label = UILabel()
        label.text = "D"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let yellowLabel: UILabel = {
        let label = UILabel()
        label.text = "E"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let greenLabel: UILabel = {
        let label = UILabel()
        label.text = "F"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let blueLabel: UILabel = {
        let label = UILabel()
        label.text = "G"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let purpleLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    let blackLabel: UILabel = {
        let label = UILabel()
        label.text = "B"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    @objc fileprivate func handleColorChange(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
        if (button == redButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "cnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "dguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "tom1drum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        } else if (button == orangeButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "dnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "eguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "tom2drum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        }else if (button == yellowButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "enote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "bguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "leftsnaredrum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        }else if (button == greenButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "fnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "aguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "rightsnaredrum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        }else if (button == blueButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "gnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                } 
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "gguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "hifootdrum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        } else if (button == purpleButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "anote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "higheguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "belldrum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        }else if (button == blackButton) {
            if (musicType == "Piano"){
                let path = Bundle.main.path(forResource: "bnote", ofType: "mp3")!
                do {
                    myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    myMusicNote.numberOfLoops = 1
                    myMusicNote.delegate = self
                    myMusicNote.prepareToPlay()
                    myMusicNote.play()
                } catch {
                    print("caught: \(error)")
                }
            } else if(musicType == "Guitar"){
               let path = Bundle.main.path(forResource: "gguitar", ofType: "mp3")!
               do {
                   myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                   myMusicNote.numberOfLoops = 1
                   myMusicNote.delegate = self
                   myMusicNote.prepareToPlay()
                   myMusicNote.play()
               } catch {
                   print("caught: \(error)")
               }
           } else if(musicType == "Drums"){
              let path = Bundle.main.path(forResource: "openrightdrum", ofType: "mp3")!
              do {
                  myMusicNote = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                  myMusicNote.numberOfLoops = 1
                  myMusicNote.delegate = self
                  myMusicNote.prepareToPlay()
                  myMusicNote.play()
              } catch {
                  print("caught: \(error)")
              }
          }
        }
    }
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 20
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc fileprivate func handleSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    override func loadView() {
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.setStrokeWidth(width: 20)
        canvas.backgroundColor = .white
        let message = UILabel()
        message.font = UIFont(name: "HelveticaNeue-Bold",size: 28.0)
        message.text = "Tinker Tunes"
        message.translatesAutoresizingMaskIntoConstraints = false
        message.lineBreakMode = .byWordWrapping
        message.numberOfLines = 0
        message.textAlignment = .center

        self.view.addSubview(message)
        message.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        message.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        message.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        setupLayout()
    }
    func setupMusicLabels(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "C"
        self.view.addSubview(label)
        
    }
    fileprivate func setupLayout() {
        
        let colorsStackView = UIStackView(arrangedSubviews: [redButton, orangeButton,yellowButton, greenButton, blueButton, purpleButton, blackButton])
        colorsStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton,
            uploadButton,
            slider,
            ])
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        let notesStackView = UIStackView(arrangedSubviews: [redLabel, orangeLabel,yellowLabel, greenLabel, blueLabel, purpleLabel, blackLabel])
        notesStackView.distribution = .fillEqually
        notesStackView.alignment = .center
        
        view.addSubview(notesStackView)
        notesStackView.translatesAutoresizingMaskIntoConstraints = false
        notesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        notesStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -102).isActive = true
        notesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(colorsStackView)
        colorsStackView.translatesAutoresizingMaskIntoConstraints = false
        colorsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        colorsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        colorsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        colorsStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    
    }

}

public extension UIImage {

    var pixelWidth: Int {
        return cgImage?.width ?? 0
    }

    var pixelHeight: Int {
        return cgImage?.height ?? 0
    }

    func pixelColor(x: Int, y: Int) -> UIColor {
        assert(
            0..<pixelWidth ~= x && 0..<pixelHeight ~= y,
            "Pixel coordinates are out of bounds")

        guard
            let cgImage = cgImage,
            let data = cgImage.dataProvider?.data,
            let dataPtr = CFDataGetBytePtr(data),
            let colorSpaceModel = cgImage.colorSpace?.model,
            let componentLayout = cgImage.bitmapInfo.componentLayout
        else {
            assertionFailure("Could not get a pixel of an image")
            return .clear
        }

        assert(
            colorSpaceModel == .rgb,
            "The only supported color space model is RGB")
        assert(
            cgImage.bitsPerPixel == 32 || cgImage.bitsPerPixel == 24,
            "A pixel is expected to be either 4 or 3 bytes in size")

        let bytesPerRow = cgImage.bytesPerRow
        let bytesPerPixel = cgImage.bitsPerPixel/8
        let pixelOffset = y*bytesPerRow + x*bytesPerPixel

        if componentLayout.count == 4 {
            let components = (
                dataPtr[pixelOffset + 0],
                dataPtr[pixelOffset + 1],
                dataPtr[pixelOffset + 2],
                dataPtr[pixelOffset + 3]
            )

            var alpha: UInt8 = 0
            var red: UInt8 = 0
            var green: UInt8 = 0
            var blue: UInt8 = 0

            switch componentLayout {
            case .bgra:
                alpha = components.3
                red = components.2
                green = components.1
                blue = components.0
            case .abgr:
                alpha = components.0
                red = components.3
                green = components.2
                blue = components.1
            case .argb:
                alpha = components.0
                red = components.1
                green = components.2
                blue = components.3
            case .rgba:
                alpha = components.3
                red = components.0
                green = components.1
                blue = components.2
            default:
                return .clear
            }

            // If chroma components are premultiplied by alpha and the alpha is `0`,
            // keep the chroma components to their current values.
            if cgImage.bitmapInfo.chromaIsPremultipliedByAlpha && alpha != 0 {
                let invUnitAlpha = 255/CGFloat(alpha)
                red = UInt8((CGFloat(red)*invUnitAlpha).rounded())
                green = UInt8((CGFloat(green)*invUnitAlpha).rounded())
                blue = UInt8((CGFloat(blue)*invUnitAlpha).rounded())
            }

            return .init(red: red, green: green, blue: blue, alpha: alpha)

        } else if componentLayout.count == 3 {
            let components = (
                dataPtr[pixelOffset + 0],
                dataPtr[pixelOffset + 1],
                dataPtr[pixelOffset + 2]
            )

            var red: UInt8 = 0
            var green: UInt8 = 0
            var blue: UInt8 = 0

            switch componentLayout {
            case .bgr:
                red = components.2
                green = components.1
                blue = components.0
            case .rgb:
                red = components.0
                green = components.1
                blue = components.2
            default:
                return .clear
            }

            return .init(red: red, green: green, blue: blue, alpha: UInt8(255))

        } else {
            assertionFailure("Unsupported number of pixel components")
            return .clear
        }
    }

}

public extension UIColor {

    convenience init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.init(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(alpha))
    }
}

public extension CGBitmapInfo {

    enum ComponentLayout {

        case bgra
        case abgr
        case argb
        case rgba
        case bgr
        case rgb

        var count: Int {
            switch self {
            case .bgr, .rgb: return 3
            default: return 4
            }
        }

    }

    var componentLayout: ComponentLayout? {
        guard let alphaInfo = CGImageAlphaInfo(rawValue: rawValue & Self.alphaInfoMask.rawValue) else { return nil }
        let isLittleEndian = contains(.byteOrder32Little)

        if alphaInfo == .none {
            return isLittleEndian ? .bgr : .rgb
        }
        let alphaIsFirst = alphaInfo == .premultipliedFirst || alphaInfo == .first || alphaInfo == .noneSkipFirst

        if isLittleEndian {
            return alphaIsFirst ? .bgra : .abgr
        } else {
            return alphaIsFirst ? .argb : .rgba
        }
    }

    var chromaIsPremultipliedByAlpha: Bool {
        let alphaInfo = CGImageAlphaInfo(rawValue: rawValue & Self.alphaInfoMask.rawValue)
        return alphaInfo == .premultipliedFirst || alphaInfo == .premultipliedLast
    }

}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
