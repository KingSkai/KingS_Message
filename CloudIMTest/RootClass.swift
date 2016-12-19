//
//	RootClass.swift
//
//	Create by 王凯 on 19/12/2016
//	Copyright © 2016. All rights reserved.
//	JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct RootClass{

	var answer : String!
	var createdAt : String!
	var mail : String!
	var objectId : String!
	var pass : String!
	var question : String!
	var region : String!
	var updatedAt : String!
	var user : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		answer = dictionary["answer"] as? String
		createdAt = dictionary["createdAt"] as? String
		mail = dictionary["mail"] as? String
		objectId = dictionary["objectId"] as? String
		pass = dictionary["pass"] as? String
		question = dictionary["question"] as? String
		region = dictionary["region"] as? String
		updatedAt = dictionary["updatedAt"] as? String
		user = dictionary["user"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if answer != nil{
			dictionary["answer"] = answer
		}
		if createdAt != nil{
			dictionary["createdAt"] = createdAt
		}
		if mail != nil{
			dictionary["mail"] = mail
		}
		if objectId != nil{
			dictionary["objectId"] = objectId
		}
		if pass != nil{
			dictionary["pass"] = pass
		}
		if question != nil{
			dictionary["question"] = question
		}
		if region != nil{
			dictionary["region"] = region
		}
		if updatedAt != nil{
			dictionary["updatedAt"] = updatedAt
		}
		if user != nil{
			dictionary["user"] = user
		}
		return dictionary
	}

}
