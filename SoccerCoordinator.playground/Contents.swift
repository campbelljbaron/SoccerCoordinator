//Created By Campbell Baron - September 2, 2019

import UIKit

//step 1: we are creating a dict for each player with all their personal information -- I also changed the variables to camelcase style from the feedback I recieved prior
let joeSmith : [String : String] = ["name" : "Joe Smith", "height" : "42", "isExperienced" : "YES", "guardian" : "Jim and Jan Smith"]
let jillTanner : [String : String] = ["name" : "Jill Tanner", "height" : "36", "isExperienced" : "YES", "guardian" : "Clara Tanner"]
let billBon : [String : String] = ["name" : "Bill Bon", "height" : "43", "isExperienced" : "YES", "guardian" : "Sara and Jenny Bon"]
let evaGordon : [String : String] = ["name" : "Eva Gordon", "height" : "45", "isExperienced" : "NO", "guardian" : "Wendy and Mike Gordon"]
let mattGill : [String : String] = ["name" : "Matt Gill", "height" : "40", "isExperienced" : "NO", "guardian" : "Charles and Sylvia Gill"]
let kimmyStein : [String : String] = ["name" : "Kimmy Stein", "height" : "41", "isExperienced" : "NO", "guardian" : "Bill and Hillary Stein"]
let sammyAdams : [String : String] = ["name" : "Sammy Adams", "height" : "45", "isExperienced" : "NO", "guardian" : "Jeff Adams"]
let karlSaygan : [String : String] = ["name" : "Karl Saygan", "height" : "42", "isExperienced" : "YES", "guardian" : "Heather Bledsoe"]
let suzaneGreenberg : [String : String] = ["name" : "Suzane Greenberg", "height" : "44", "isExperienced" : "YES", "guardian" : "Henrietta Dumas"]
let salDali : [String : String] = ["name" : "Sal Dali", "height" : "41", "isExperienced" : "NO", "guardian" : "Gala Dali"]
let joeKavalier : [String : String] = ["name" : "Joe Kavalier", "height" : "39", "isExperienced" : "NO", "guardian" : "Sam and Elaine Kavalier"]
let benFinkelstein : [String : String] = ["name" : "Ben Finkelstein", "height" : "44", "isExperienced" : "NO", "guardian" : "Aaron and Jill Finkelstein"]
let diegoSoto : [String : String] = ["name" : "Diego Soto", "height" : "41", "isExperienced" : "YES", "guardian" : "Robin and Sarika Soto"]
let chloeAlaska : [String : String] = ["name" : "Chloe Alaska", "height" : "47", "isExperienced" : "NO", "guardian" : "David and Jamie Alaska"]
let arnoldWillis : [String : String] = ["name" : "Arnold Willis", "height" : "43", "isExperienced" : "NO", "guardian" : "Claire Willis"]
let phillipHelm : [String : String] = ["name" : "Phillip Helm", "height" : "44", "isExperienced" : "YES", "guardian" : "Thomas Helm and Eva Jones"]
let lesClay : [String : String] = ["name" : "Les Clay", "height" : "42", "isExperienced" : "YES", "guardian" : "Wynonna Brown"]
let herschelKrustofski : [String : String] = ["name" : "Herschel Krustofski", "height" : "45", "isExperienced" : "YES", "guardian" : "Hyman and Rachel Krustofski"]

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
        if player["isExperienced"] == "YES" {
            expirencedPlayers.append(player)
        } else if player["isExperienced"] == "NO" {
            nonExpirencedPlayers.append(player)
        }
    }
    
}

sortPlayers()



//step 7: creating teams with even an even number of expirenced and non expirenced players
func createTeams() {
    
    //expirenced players are added to teams
    
    //variable which will determine the number of players on each team
    var teamNumber = players.count / league.count
    
    //variable will determine how many expirenced players and non expirenced players on each team (created this variable to reduce static numbers in code based on feedback...)
    var halfOfTeam = players.count / league.count / 2
    
    for expirencedPlayer in 0...expirencedPlayers.count {
        
        if teamSharks.count != halfOfTeam {
            teamSharks.append(expirencedPlayers[expirencedPlayer])
            
        } else if teamDragons.count != halfOfTeam && teamSharks.count == halfOfTeam {
            teamDragons.append(expirencedPlayers[expirencedPlayer])
            
        } else if teamRaptors.count != halfOfTeam && teamSharks.count == halfOfTeam && teamDragons.count == halfOfTeam {
            teamRaptors.append(expirencedPlayers[expirencedPlayer])
        }
        
    }
    
    for nonExpirencedPlayer in 0...nonExpirencedPlayers.count {
        
    //non-expirenced players are added to teams

        if teamSharks.count != teamNumber {
            teamSharks.append(nonExpirencedPlayers[nonExpirencedPlayer])
            
        } else if teamDragons.count != teamNumber && teamSharks.count == teamNumber {
            teamDragons.append(nonExpirencedPlayers[nonExpirencedPlayer])
            
        } else if teamRaptors.count != teamNumber && teamSharks.count == teamNumber && teamDragons.count == teamNumber {
            teamRaptors.append(nonExpirencedPlayers[nonExpirencedPlayer])
        }
        
    }
    
}

createTeams()

//step 8: creating a function that drafts --> sends letters to the parents of the players
func createLetters() {
    
    var letters = [""]
    
    for raptors in teamRaptors {
        
        letters.append("Greetings \(raptors["guardian"] ?? ""), we would like to inform you that \(raptors["name"] ?? "") has been placed on Team Raptors. Team Raptors has practices every \(raptorsPractice). We look forward to seeing you there!")
    }
    
    for sharks in teamSharks {
        
        letters.append("Greetings \(sharks["guardian"] ?? ""), we would like to inform you that \(sharks["name"] ?? "") has been placed on Team Sharks. Team Sharks has practices every \(sharksPractice). We look forward to seeing you there!")
    }
    
    for dragons in teamDragons {
        
        letters.append("Greetings \(dragons["guardian"] ?? ""), we would like to inform you that \(dragons["name"] ?? "") has been placed on Team Dragons. Team Dragons has practices every \(dragonsPractice). We look forward to seeing you there!")
    }
    
    //all the letters are stored into an empty array and then printed
    for letter in letters {
        //this print line is a more efficient way to add a space (from feedback)
        print(letter, separator: "", terminator: "\n\n")
    }
    
}

createLetters()

//letters are printed with a space below for easy readability


