📱 Store App

Store App is a simple e-commerce application that allows users to browse products by category, view product details, and add or remove items from the cart.

User Flow
	•	Category-based product listing
	•	Navigation to the product detail screen
	•	Adding and removing products from the cart


🧩 UI & Layout Approach
	•	The product detail screen presents a split layout, dividing the page into two sections.
	•	This layout is implemented using UICollectionViewCompositionalLayout.
	•	Thanks to this approach:
	  •	A flexible and modern UI structure is achieved
	  •	Performance and long-term maintainability are prioritized

🏗 Architecture
	•	The project follows the MVVM (Model–View–ViewModel) architectural pattern.
	•	Each screen is organized into modular folders based on its responsibilities.
	•	This structure improves:
	  •	Code readability
	  •	Testability
	  •	Ease of maintenance


🌐 Network & Concurrency
	•	Fake Store API is used to simulate backend services.
	•	The network layer is implemented using Apple’s URLSession API.
	•	In line with modern Swift practices:
	  •	async / await is utilized
	  •	A clean and concurrency-friendly asynchronous structure is established


  💾 Data Persistence
	•	Products added to the cart are cached using UserDefaults.
	•	This ensures that cart data is preserved when the application is terminated and relaunched, providing a consistent user experience.


🧪 Test Stratejisi
	•	XCTest is used as the testing framework.
	•	For mapper layers in particular, the following test approaches are applied:
	  •	Unit Tests
	  •	End-to-End (E2E) Tests
	•	These tests help ensure:
	  •	Correct real-world data flow
	  •	Reliability of critical behavioral scenarios
	•	Due to the high execution cost of E2E tests:
	  •	Unit and E2E tests are not executed together for every scenario
	  •	Test coverage is planned based on a cost–benefit balance
  

⚙️ CI (Continuous Integration)
	•	Test processes are automated using GitHub CI.
	•	During every merge operation:
	  •	Relevant tests are executed automatically
	  •	Code quality is preserved
	  •	Potential regressions are detected at an early stage
	•	This approach enables a:
	  •	Sustainable
	  •	Reliable
	  •	Fully automated testing pipeline without manual intervention




  
