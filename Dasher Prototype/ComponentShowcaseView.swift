//
//  ComponentShowcaseView.swift
//  Dasher Prototype
//
//  Created by Thiago Duarte on 7/17/25.
//

import SwiftUI

// Main view showcasing various native iOS components
struct ComponentShowcaseView: View {
    // State variables for interactive components
    @State private var toggleValue = false
    @State private var sliderValue: Double = 50
    @State private var textFieldText = ""
    @State private var selectedSegment = 0
    @State private var showingAlert = false
    @State private var showingActionSheet = false
    @State private var stepperValue = 5
    @State private var searchText = ""
    @State private var selectedDate = Date()
    @State private var isExpanded = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Welcome section
                    WelcomeSection()
                    
                    // Basic controls section
                    BasicControlsSection(
                        toggleValue: $toggleValue,
                        sliderValue: $sliderValue,
                        stepperValue: $stepperValue
                    )
                    
                    // Input controls section
                    InputControlsSection(
                        textFieldText: $textFieldText,
                        searchText: $searchText,
                        selectedDate: $selectedDate
                    )
                    
                    // Selection controls section
                    SelectionControlsSection(selectedSegment: $selectedSegment)
                    
                    // Action buttons section
                    ActionButtonsSection(
                        showingAlert: $showingAlert,
                        showingActionSheet: $showingActionSheet
                    )
                    
                    // Visual elements section
                    VisualElementsSection(isExpanded: $isExpanded)
                    
                    // Status and progress section
                    StatusProgressSection()
                    
                    Spacer(minLength: 100)
                }
                .padding()
            }
            .navigationTitle("iOS Components")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// Welcome section with typography examples
struct WelcomeSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Typography Examples")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Large Title")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Title")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Headline")
                .font(.headline)
            
            Text("Body text with multiple lines to show how it wraps and displays in the interface.")
                .font(.body)
            
            Text("Caption text")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Basic interactive controls
struct BasicControlsSection: View {
    @Binding var toggleValue: Bool
    @Binding var sliderValue: Double
    @Binding var stepperValue: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Basic Controls")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // Toggle switch
            HStack {
                Text("Toggle Switch")
                Spacer()
                Toggle("", isOn: $toggleValue)
            }
            
            // Slider
            VStack(alignment: .leading, spacing: 8) {
                Text("Slider: \(Int(sliderValue))")
                Slider(value: $sliderValue, in: 0...100, step: 1)
            }
            
            // Stepper
            HStack {
                Text("Stepper: \(stepperValue)")
                Spacer()
                Stepper("", value: $stepperValue, in: 0...10)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Input controls section
struct InputControlsSection: View {
    @Binding var textFieldText: String
    @Binding var searchText: String
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Input Controls")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // Text field
            TextField("Enter text here", text: $textFieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Search field
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Search", text: $searchText)
            }
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(8)
            
            // Date picker
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Selection controls section
struct SelectionControlsSection: View {
    @Binding var selectedSegment: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Selection Controls")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // Segmented control
            Picker("Options", selection: $selectedSegment) {
                Text("First").tag(0)
                Text("Second").tag(1)
                Text("Third").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            // Menu picker
            Menu("Choose Option") {
                Button("Option 1", action: {})
                Button("Option 2", action: {})
                Button("Option 3", action: {})
            }
            .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Action buttons section
struct ActionButtonsSection: View {
    @Binding var showingAlert: Bool
    @Binding var showingActionSheet: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Action Buttons")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // Primary button
            Button("Primary Button") {}
                .buttonStyle(.glassProminent)
                .frame(maxWidth: .infinity)
            
            // Secondary button
            Button("Secondary Button") {}
                .buttonStyle(.glass)
                .frame(maxWidth: .infinity)
            
            // Alert button
            Button("Show Alert") {
                showingAlert = true
            }
            .buttonStyle(.borderless)
            .foregroundColor(.blue)
            .alert("Alert Title", isPresented: $showingAlert) {
                Button("OK") {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("This is an alert message.")
            }
            
            // Action sheet button
            Button("Show Action Sheet") {
                showingActionSheet = true
            }
            .buttonStyle(.borderless)
            .foregroundColor(.blue)
            .confirmationDialog("Choose Action", isPresented: $showingActionSheet) {
                Button("Action 1") {}
                Button("Action 2") {}
                Button("Cancel", role: .cancel) {}
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Visual elements section
struct VisualElementsSection: View {
    @Binding var isExpanded: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Visual Elements")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // SF Symbols
            HStack(spacing: 20) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.title2)
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.title2)
                
                Image(systemName: "bell.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Image(systemName: "person.fill")
                    .foregroundColor(.green)
                    .font(.title2)
            }
            
            // Expandable section
            DisclosureGroup("Expandable Section", isExpanded: $isExpanded) {
                Text("This content is hidden until expanded.")
                    .padding(.top, 8)
            }
            
            // Divider
            Divider()
            
            // Badge-like element
            HStack {
                Text("Badge Example")
                Spacer()
                Text("New")
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// Status and progress section
struct StatusProgressSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Status & Progress")
                .font(.headline)
                .foregroundColor(.secondary)
            
            // Progress view
            VStack(alignment: .leading, spacing: 8) {
                Text("Progress Bar")
                ProgressView(value: 0.7)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
            }
            
            // Indeterminate progress
            HStack {
                Text("Loading")
                Spacer()
                ProgressView()
                    .scaleEffect(0.8)
            }
            
            // Status indicators
            HStack(spacing: 20) {
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                    Text("Online")
                        .font(.caption)
                }
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 8, height: 8)
                    Text("Away")
                        .font(.caption)
                }
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    Text("Offline")
                        .font(.caption)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ComponentShowcaseView()
}