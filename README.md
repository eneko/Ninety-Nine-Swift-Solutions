# Ninety-Nine Swift Solutions

If you like programming challenges, we got 99 good ones for you. Maybe you are just trying to learn programming, or trying to learn Swift. These problems will challenge you to find creative solutions.

Ready for the challenge? Let's get started!

![](https://raw.githubusercontent.com/eneko/Ninety-Nine-Swift-Solutions/master/.github/Screenshot%202018-03-06%2021.43.03.png)

## Ninety-Nine Swift Problems

The full list of Ninety-Nine Swift Problems can be found at https://enekoalonso.com/projects/99-swift-problems

## Step 1: Fork this repository

Forking is not necessary to solve these challenges (you could do that by writting a small program in Xcode). Forking is also not neccessary if all you need is to use the test runner. However, if you would like to submit your solutions you will need to create a pull request, and for that, you will need to fork this repository.

So, let's do it! Tap on the `[Fork]` button above (top right of this page).

## Step 2: Clone your repository

To clone your forked repository, type:

```
$ git clone https://www.github.com/<your_username>/Ninety-Nine-Swift-Solutions
```

## Step 3: Set up your username

Run the following command to set up your GitHub username:

```
$ swift run setup <your_username>
```

_Note: You are free to use any username you want. However, pull requests will only be accepted when the username matches the GitHub account where the pull request is being submitted from._

To set up the Xcode project, run:

```
$ swift package generate-xcodeproj
$ open NinetyNineSwiftSolutions.xcodeproj
```

In Xcode, select the scheme corresponding to your user name and you should be good to go!

## Step 4: Solving a problem

To solve a problem, please create a new file with the problem ID and your user name as follows:

```
$ touch Solutions/<your_username>/p01_<your_username>.swift
```

This is the most important part of the process, go have fun! Be creative and enjoy!

Example solution:

```swift
import NinetyNineSwiftProblems

extension List {

    /// P01 (*) Find the last element of a linked list.
    /// - returns: T last element of the linked list
    /// - author: Eneko Alonso (eneko.alonso@gmail.com)
    /// - complexity: O(n)
    public var last: T {
        var current = self
        while let next = current.nextItem {
            current = next
        }
        return current.value
    }

}
```

## Step 5: Testing your solutions

Once you have developed a solution, you can easily test it by runnig the test runner:

```
$ swift run test <your_username>
```

Example output:

```
$ swift run test eneko
Running tests for: eneko
Compile Swift Module 'eneko' (55 sources)
Linking ./.build/x86_64-apple-macosx10.10/debug/eneko
[PASS] testP01() 'last of multiple elements' passed (0.000 seconds) ✔
[PASS] testP01() 'last of one element' passed (0.000 seconds) ✔
[PASS] testP02() 'long list' passed (0.000 seconds) ✔
[PASS] testP02() 'two element list' passed (0.000 seconds) ✔
[PASS] testP02() 'one element list' passed (0.000 seconds) ✔

  ✔ OK > executed 69 tests, with 0 failures in 0.027 seconds
```

## Step 6: Submitting your solutions

Congratulations! Once your tests are passing, you can go ahead and commit your changes. Then push these changes to your forked repository:

```
$ git commit -m "Solutions for P01, P02..."
$ git push origin master
```

## Step 6b: Create a pull request

Go to your repository fork on GitHub and tap on `[New Pull Request]`, or navigate to this URL:

https://github.com/<your_username>/Ninety-Nine-Swift-Solutions/compare/master...eneko:master?expand=1


# Thank you!

Thank you very much for participating, hope you found the problems challenging.
