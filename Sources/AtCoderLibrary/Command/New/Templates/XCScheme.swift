struct XCScheme: CodeTemplate {
    let problem: Problem
    var fileName: String { "\(problem.context.alphabet).xcscheme" }
    let directory: String? = ".swiftpm/xcode/xcshareddata/xcschemes"
    var source: String {
        """
        <?xml version="1.0" encoding="UTF-8"?>
        <Scheme
           LastUpgradeVersion = "1250"
           version = "1.3">
           <BuildAction
              parallelizeBuildables = "YES"
              buildImplicitDependencies = "YES">
              <BuildActionEntries>
                 <BuildActionEntry
                    buildForTesting = "YES"
                    buildForRunning = "YES"
                    buildForProfiling = "YES"
                    buildForArchiving = "YES"
                    buildForAnalyzing = "YES">
                    <BuildableReference
                       BuildableIdentifier = "primary"
                       BlueprintIdentifier = "\(problem.context.alphabet)"
                       BuildableName = "\(problem.context.alphabet)"
                       BlueprintName = "\(problem.context.alphabet)"
                       ReferencedContainer = "container:">
                    </BuildableReference>
                 </BuildActionEntry>
                 <BuildActionEntry
                    buildForTesting = "YES"
                    buildForRunning = "YES"
                    buildForProfiling = "NO"
                    buildForArchiving = "NO"
                    buildForAnalyzing = "YES">
                    <BuildableReference
                       BuildableIdentifier = "primary"
                       BlueprintIdentifier = "\(problem.context.alphabet)Tests"
                       BuildableName = "\(problem.context.alphabet)Tests"
                       BlueprintName = "\(problem.context.alphabet)Tests"
                       ReferencedContainer = "container:">
                    </BuildableReference>
                 </BuildActionEntry>
              </BuildActionEntries>
           </BuildAction>
           <TestAction
              buildConfiguration = "Release"
              selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
              selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
              shouldUseLaunchSchemeArgsEnv = "YES">
              <Testables>
                 <TestableReference
                    skipped = "NO">
                    <BuildableReference
                       BuildableIdentifier = "primary"
                       BlueprintIdentifier = "\(problem.context.alphabet)Tests"
                       BuildableName = "\(problem.context.alphabet)Tests"
                       BlueprintName = "\(problem.context.alphabet)Tests"
                       ReferencedContainer = "container:">
                    </BuildableReference>
                 </TestableReference>
              </Testables>
           </TestAction>
           <LaunchAction
              buildConfiguration = "Debug"
              selectedDebuggerIdentifier = "Xcode.DebuggerFoundation.Debugger.LLDB"
              selectedLauncherIdentifier = "Xcode.DebuggerFoundation.Launcher.LLDB"
              launchStyle = "0"
              useCustomWorkingDirectory = "NO"
              ignoresPersistentStateOnLaunch = "NO"
              debugDocumentVersioning = "YES"
              debugServiceExtension = "internal"
              allowLocationSimulation = "YES">
              <BuildableProductRunnable
                 runnableDebuggingMode = "0">
                 <BuildableReference
                    BuildableIdentifier = "primary"
                    BlueprintIdentifier = "\(problem.context.alphabet)"
                    BuildableName = "\(problem.context.alphabet)"
                    BlueprintName = "\(problem.context.alphabet)"
                    ReferencedContainer = "container:">
                 </BuildableReference>
              </BuildableProductRunnable>
           </LaunchAction>
           <ProfileAction
              buildConfiguration = "Release"
              shouldUseLaunchSchemeArgsEnv = "YES"
              savedToolIdentifier = ""
              useCustomWorkingDirectory = "NO"
              debugDocumentVersioning = "YES">
              <BuildableProductRunnable
                 runnableDebuggingMode = "0">
                 <BuildableReference
                    BuildableIdentifier = "primary"
                    BlueprintIdentifier = "\(problem.context.alphabet)"
                    BuildableName = "\(problem.context.alphabet)"
                    BlueprintName = "\(problem.context.alphabet)"
                    ReferencedContainer = "container:">
                 </BuildableReference>
              </BuildableProductRunnable>
           </ProfileAction>
           <AnalyzeAction
              buildConfiguration = "Debug">
           </AnalyzeAction>
           <ArchiveAction
              buildConfiguration = "Release"
              revealArchiveInOrganizer = "YES">
           </ArchiveAction>
        </Scheme>
        """
    }
}
