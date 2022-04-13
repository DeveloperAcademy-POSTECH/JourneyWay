//
//  ProgramModel.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/13.
//

import SwiftUI

class ProgramModel: ObservableObject {
    
    @Published var selectedProgram: Program = Program.dummy[0]
}
