//
//  CoreDataManager.swift
//  SportsApp
//
//  Created by Ashish Pisey on 29/12/21.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    
    private init() {}
    
    public func fetchTeams() -> ([TeamItem]?, Error?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<TeamItem>.init(entityName: Constants.teamEntity)
        
        do {
            let teams = try context.fetch(request)
            return (teams, nil)
        } catch {
            return (nil, error)
        }
    }
    
    public func updateTeam(editingTeamItem:TeamItem) -> Error? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<TeamItem>.init(entityName: Constants.teamEntity)
        
        // get the team item from database matching the id of editing team item
        let predicate = NSPredicate.init(format: "id=%@", editingTeamItem.id)
        request.predicate = predicate
        do {
            let selectedTeamItem = try context.fetch(request).first
            // update the team item matching the id of editingItem
            selectedTeamItem?.name = editingTeamItem.name
            selectedTeamItem?.icon = editingTeamItem.icon
            try context.save()
            return nil
        } catch {
            return error
        }
    }
    
    public func saveTeam(name:String, teamIcon:Data? = nil, player: [PlayerItem]? = nil) -> ([TeamItem]?, Error?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let team = TeamItem.init(context: context)
        team.id = UUID().uuidString
        team.name = name
        
        if let teamIcon = teamIcon {
            team.icon = teamIcon
        }
        
        if let player = player {
            team.player = NSSet.init(array: player)
        }
        
        do {
            try context.save()
            //Fetch teams after adding a team
            let (teamArr, error) = fetchTeams()
            return (teamArr, error)
        } catch {
            return (nil, error)
        }
    }
    
    public func deleteTeam(team:TeamItem) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(team)
    }
    
    public func addPlayerToTeam(playerName:String, age:Int16, height: Double, team:TeamItem) -> (TeamItem?, Error?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let player = PlayerItem.init(context: context)
        player.id = UUID().uuidString
        player.name = playerName
        player.age = age
        player.height = height
        
        team.addToPlayer(player)
        
        do {
            try context.save()
            return (team, nil)
        } catch {
            return (nil, error)
        }
    }
    
    public func saveContext() -> Error? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try context.save()
            return nil
        } catch {
            return error
        }
    }
    
    public func fetchPlayers(for team: TeamItem) -> (TeamItem?, Error?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<TeamItem>.init(entityName: Constants.teamEntity)
        let predicate = NSPredicate.init(format: "id==%@", team.id)
        request.predicate = predicate
        do {
            // id is unique, cant duplicate (because we used uuid string to generate it). hence we can get the first matching element
            let team = try context.fetch(request).first
            return (team, nil)
        } catch {
            return (nil, error)
        }
    }
    
    public func deletePlayer(player:PlayerItem) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(player)
    }
    
    public func deleteAllPlayers(for team:TeamItem) {
        deleteTeam(team: team)
    }
}
