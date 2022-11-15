Feature: 2.4.2.3 Toggle on - toggle off features

Background:
	Given user signed in as an Admin
	And user created experiment using "test.gb" file from "for scenarios/2.4.2/2.4.2.3" subdirectory

@Smoke
Scenario: 2.4.2.3_01 All features should be visible by default in "Sequence" view of maps
	Given user clicked on "Sequence" button
	When user opens Sidebar
	Then all items in the "Features" table should be turned on
	And following features should be visible:
		| feature  | name     |
		| source   | source   |
		| Feature1 | Feature1 |
		| Feature2 | Feature2 |
		| Feature3 | Feature3 |
		| Feature4 | Feature4 |

@Regression
Scenario Outline: 2.4.2.3_02 User can "toggle off" all annotation features by filter in right sidebar
	Given user clicked on <name of map> map button
	And following features are displayed on scene:
		| feature  | name     |
		| source   | source   |
		| Feature1 | Feature1 |
		| Feature2 | Feature2 |
		| Feature3 | Feature3 |
		| Feature4 | Feature4 |
	And user opened Sidebar
	When user selects "All features" in "Filter by type:" dropdown
	Then number of features displayed on <name of map> map should be 0
	And the "Features" table should be not visible
	And the "Feature type placeholder" label text should be "Please select feature type to display in the panel"

Examples:
	| name of map |
	| Linear      |
	| Sequence    |
	| Circular    |
#for the future implementation

@Smoke
Scenario Outline: 2.4.2.3_03 User can "toggle off" all annotation feature of a given type
	Given user clicked on <name of map> map button
	And user opened Sidebar
	When user selects "Promoter" in "Filter by type:" dropdown
	Then following features should be displayed on scene:
		| feature  | name     |
		| source   | source   |
		| Feature1 | Feature1 |
		| Feature4 | Feature4 |
	And number of features displayed on <name of map> map should be 3
	And "Features" table should have the following rows in exact order:
		| name     | location | length |
		| source   | 1 - 75   | 75     |
		| Feature1 | 2 - 18   | 17     |
		| Feature4 | 20 - 36  | 17     |

Examples:
	| name of map |
	| Linear      |
	| Sequence    |
	| Circular    |

@Regression
Scenario Outline: 2.4.2.3_04 User can "toggle off" particular annotation feature
	Given user clicked on <name of map> map button
	And inside "Scene" panel: user clicked on "Feature1"
	And user opened Sidebar
	And user clicked on "Three dots" button in the second row of "Features" table
	When inside "Feature row menu": user clicks on "Toggle visibility" button
	Then following features should not be displayed on scene:
		| feature  | fame        |
		| Feature1 | FeatureName |
	And inside "Scene" panel: the following controls should be not visible:
		| control name | control type |
		| Filter       | button       |
		| Point1       | checkbox     |
		| Point1       | checkbox     |

Examples:
	| name of map |
	| Linear      |
	| Sequence    |
	| Circular    |

@Sanity
Scenario Outline: 2.4.2.3_05 Users with different rights can use Feature13
	Given user signed out from the system
	And user signed in as a <user>
	And user clicked on "Three dots" button in fourth row of "Features" table
	When user clicks on "Feature13" option inside "Features" dropdown
	Then following elements should be enabled:
		| control name | control type |
		| Create       | button       |
		| Filter       | dropdown     |
		| File name    | input        |

Examples:
	| user         |
	| Admin        |
	| Regular user |
	| Manager      |

@Regression
Scenario Outline: 2.4.2.3_06 User can "toggle off" all features from the scene via Settings button
	Given user clicked on <name of map> map button
	And user opened Sidebar
	And user clicked on "Pin sidebar" button
	When user selects "Features" in "Settings" dropdown
	Then number of features displayed on <name of map> map should be 0
	And "Features" table should have the following rows:
		| name     | location | length |
		| source   | 1 - 75   | 75     |
		| Feature1 | 2 - 18   | 17     |
		| Feature4 | 20 - 36  | 17     |
		| Feature3 | 38 - 65  | 28     |
		| Feature2 | 67 - 75  | 9      |

Examples:
	| name of map |
	| Linear      |
	| Sequence    |
	| Circular    |

@Regression
Scenario: 2.4.2.3_07 Changes in Features should be saved after refreshing the page
	Given experiment had "{Experiment_ID}" Experiment ID
	And user clicked on "Circular" button
	And user opened Sidebar
	And user selected "Hide" option for "Feature3" row in "Features" table
	When user refreshes the page
	Then following features should be displayed on scene:
		| feature  | name     |
		| source   | source   |
		| Feature1 | Feature1 |
		| Feature2 | Feature2 |
		| Feature4 | Feature4 |
	And items in the "Features" table should be turned according the table:
		| name     | status |
		| source   | hide   |
		| Feature1 | hide   |
		| Feature4 | hide   |
		| Feature3 | show   |
		| Feature2 | hide   |opened user opened user opened inputuser opened user 