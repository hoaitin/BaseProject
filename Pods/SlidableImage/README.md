# SlidableImage
[![Build Status](https://travis-ci.org/quver/SlidableImage.svg)](https://travis-ci.org/quver/SlidableImage)
[![codecov](https://codecov.io/gh/quver/SlidableImage/branch/master/graph/badge.svg)](https://codecov.io/gh/quver/SlidableImage)
[![codebeat badge](https://codebeat.co/badges/53a20383-39e8-42ee-9df3-56b3bb55cb1d)](https://codebeat.co/projects/github-com-quver-slidableimage)
[![GitHub license](https://img.shields.io/github/license/quver/SlidableImage.svg)]()
[![Platform](https://img.shields.io/cocoapods/p/SlidableImage.svg?style=flat)](http://cocoapods.org/pods/SlidableImage)
[![Version](https://img.shields.io/cocoapods/v/SlidableImage.svg?style=flat)](http://cocoapods.org/pods/SlidableImage)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/quver/slidableimage)](http://clayallsopp.github.io/readme-score?url=https://github.com/quver/slidableimage)

![](https://raw.githubusercontent.com/quver/SlidableImage/master/Assets/demo.gif)

Easy to use library for before & after images. One-line initialization and very customizable API.

## Requirements

- iOS 8
- Swift 3.0

## Instalation

This library support

- Cocoapods
- Swift Package Manager

```ruby
pod 'SlidableImage', '~>2.0'
```

## Using

### Constructor

Common init with image

```swift
init(frame: CGRect, views: Views)
```
Gemeric init with views

```swift
init(frame: CGRect, images Images)
```

### Move slider
```swift
updateMask(location maskLocation: CGFloat)
```

### Variables

Views tuple

```swift
var views: Views
```

Circle view with icon for sliding images. You can override it with your custom view.


```swift
var sliderCircle: UIView
```

Enum that describes which direction the slider will slide from.

```
var slideDirection: SlideDirection

// Possible values
.left, .right, .top, .bottom
```

Struct that tells the slider if there should be a border view added

```swift
var sliderBorder: SlidableImageBorder?

// Structure
struct SlidableImageBorder {
  var borderWidth: CGFloat
  var borderColor: UIColor
}
```

#### Example
```swift
let slider = SlidableImage(frame: rect, firstView: firstSubView, secondView: secondSubView)
view.addSubview(slider)

```

## TODO
- Test with storyboards

## Author

Paweł Bednorz, Quver

## License

SlidableImage Lib and Slider graphic are available under the MIT license. 
Check the LICENSE file for more information.

Images from [http://www.comicsbeat.com/awesome-infographic-on-the-avengers-then-and-now/](http://www.comicsbeat.com/awesome-infographic-on-the-avengers-then-and-now/)