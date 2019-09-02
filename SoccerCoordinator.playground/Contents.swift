//Created By Campbell Baron - September 2, 2019

import UIKit

//step 1: we are creating a dict for each player with all their personal information
let joeSmith : [String : String] = ["Name" : "Joe Smith", "Height" : "42", "Expirence" : "YES", "Guardian" : "Jim and Jan Smith"]
let jillTanner : [String : String] = ["Name" : "Jill Tanner", "Height" : "36", "Expirence" : "YES", "Guardian" : "Clara Tanner"]
let billBon : [String : String] = ["Name" : "Bill Bon", "Height" : "43", "Expirence" : "YES", "Guardian" : "Sara and Jenny Bon"]
let evaGordon : [String : String] = ["Name" : "Eva Gordon", "Height" : "45", "Expirence" : "NO", "Guardian" : "Wendy and Mike Gordon"]
let mattGill : [String : String] = ["Name" : "Matt Gill", "Height" : "40", "Expirence" : "NO", "Guardian" : "Charles and Sylvia Gill"]
let kimmyStein : [String : String] = ["Name" : "Kimmy Stein", "Height" : "41", "Expirence" : "NO", "Guardian" : "Bill and Hillary Stein"]
let sammyAdams : [String : String] = ["Name" : "Sammy Adams", "Height" : "45", "Expirence" : "NO", "Guardian" : "Jeff Adams"]
let karlSaygan : [String : String] = ["Name" : "Karl Saygan", "Height" : "42", "Expirence" : "YES", "Guardian" : "Heather Bledsoe"]
let suzaneGreenberg : [String : String] = ["Name" : "Suzane Greenberg", "Height" : "44", "Expirence" : "YES", "Guardian" : "Henrietta Dumas"]
let salDali : [String : String] = ["Name" : "Sal Dali", "Height" : "41", "Expirence" : "NO", "Guardian" : "Gala Dali"]
let joeKavalier : [String : String] = ["Name" : "Joe Kavalier", "Height" : "39", "Expirence" : "NO", "Guardian" : "Sam and Elaine Kavalier"]
let benFinkelstein : [String : String] = ["Name" : "Ben Finkelstein", "Height" : "44", "Expirence" : "NO", "Guardian" : "Aaron and Jill Finkelstein"]
let diegoSoto : [String : String] = ["Name" : "Diego Soto", "Height" : "41", "Expirence" : "YES", "Guardian" : "Robin and Sarika Soto"]
let chloeAlaska : [String : String] = ["Name" : "Chloe Alaska", "Height" : "47", "Expirence" : "NO", "Guardian" : "David and Jamie Alaska"]
let arnoldWillis : [String : String] = ["Name" : "Arnold Willis", "Height" : "43", "Expirence" : "NO", "Guardian" : "Claire Willis"]
let phillipHelm : [String : String] = ["Name" : "Phillip Helm", "Height" : "44", "Expirence" : "YES", "Guardian" : "Thomas Helm and Eva Jones"]
let lesClay : [String : String] = ["Name" : "Les Clay", "Height" : "42", "Expirence" : "YES", "Guardian" : "Wynonna Brown"]
let herschelKrustofski : [String : String] = ["Name" : "Herschel Krustofski", "Height" : "45", "Expirence" : "YES", "Guardian" : "Hyman and Rachel Krustofski"]

//step 2: creating empty arrays to hold various players in teams
var teamSharks : [[String : String]] = []
var teamDragons : [[String : String]] = []
var teamRaptors : [[String : String]] = []
var league : [[[String : String]]] = [teamRaptors, teamDragons, teamSharks]

//step 3: creating variables to hold the teams practices
var sharksPractice = "March 17, 3pm"
var dragonsPractice = "March 17, 1pm"
var raptorsPractice = "March 18 at 1pm"


//step 4: creating a master array with all the players in the league
var players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

//step 5: creating empty variables to hold players based on expirence
var expirencedPlayers : [[String : String]] = []
var nonExpirencedPlayers : [[String : String]] = []


//step 6: sorting the players based on expirence into the expirencedPlayers & nonExpirencedPlayers arrays
func sortPlayers() {
    
    for player in players {
        if player["Expirence"] == "YES" {
            expirencedPlayers.append(player)
        } else if player["Expirence"] == "NO" {
            nonExpirencedPlayers.append(player)
        }
    }
    
}

sortPlayers()



//step 7: creating teams with even an even number of expirenced and non expirenced players
func createTeams() {
    
    //expirenced players are added to teams
    
    //variable which will determine the number of players on each team
    var teamNum = players.count / league.count
    
    for exPlayer in 0...expirencedPlayers.count {
        
        if teamSharks.count != teamNum / 2 {
            teamSharks.append(expirencedPlayers[exPlayer])
            
        } else if teamDragons.count != teamNum / 2 && teamSharks.count == teamNum / 2 {
            teamDragons.append(expirencedPlayers[exPlayer])
            
        } else if teamRaptors.count != teamNum / 2 && teamSharks.count == teamNum / 2 && teamDragons.count == teamNum / 2 {
            teamRaptors.append(expirencedPlayers[exPlayer])
        }
        
    }
    
    for nonExpPlater in 0...nonExpirencedPlayers.count {
        
    //non-expirenced players are added to teams

        if teamSharks.count != teamNum {
            teamSharks.append(nonExpirencedPlayers[nonExpPlater])
            
        } else if teamDragons.count != teamNum && teamSharks.count == teamNum {
            teamDragons.append(nonExpirencedPlayers[nonExpPlater])
            
        } else if teamRaptors.count != teamNum && teamSharks.count == teamNum && teamDragons.count == teamNum {
            teamRaptors.append(nonExpirencedPlayers[nonExpPlater])
        }
        
    }
    
}

createTeams()

//step 8: creating a function that drafts --> sends letters to the parents of the players
func createLetters() {
    
    var letters = [""]
    
    for raptors in teamRaptors {
        
        letters.append("Greetings \(raptors["Guardian"] ?? ""), we would like to inform you that \(raptors["Name"] ?? "") has been placed on Team Raptors. Team Raptors has practices every \(raptorsPractice). We look forward to seeing you there!")
    }
    
    for sharks in teamSharks {
        
        letters.append("Greetings \(sharks["Guardian"] ?? ""), we would like to inform you that \(sharks["Name"] ?? "") has been placed on Team Sharks. Team Sharks has practices every \(sharksPractice). We look forward to seeing you there!")
    }
    
    for dragons in teamDragons {
        
        letters.append("Greetings \(dragons["Guardian"] ?? ""), we would like to inform you that \(dragons["Name"] ?? "") has been placed on Team Dragons. Team Dragons has practices every \(dragonsPractice). We look forward to seeing you there!")
    }
    
    //all the letters are stored into an empty array and then printed
    for letter in letters {
        print(letter)
        print("                                                                                                                      ")
    }
    
}

createLetters()

//letters are printed with a space below for easy readability


