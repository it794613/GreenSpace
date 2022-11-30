# GreenSpace

## 실행방법

프론트엔드 클라이언트는 iOS Application으로 제작되어 있어서 mac os 환경에서 테스트 할 수 있습니다.

1. xcode 설치

2. 아래 명령어 사용

```shell
cd GreenSpace
open GreenSpace.xcodeproj
```

3. `cmd + r` 눌러서 빌드 및 런치 실행

> 테스트할 mac os 환경이 필요하시면 팀장에게 연락주시면 감사하겠습니다. (010-7266-0458)

> xcode가 없으면 vscode를 활용해 코드를 확인할 수 있습니다. 아래 구조처럼 코드가 작성되어 있습니다.

## 디렉토리 구조

```shell
.
├── CoreData.xcdatamodeld
├── GreenSpace						# 실제 소스파일이 들어있는 디렉토리
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   ├── Domain						# e2e 데이터 스키마(model in mvc)
│   │   ├── Common
│   │   └── Models
│   ├── Info.plist
│   ├── Network						# e2e API
│   │   ├── APIs
│   │   └── Bases
│   ├── SceneDelegate.swift
│   ├── View						# view (in mvc)
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   ├── BetgeCollectionViewCell.xib
│   │   ├── FriendScreen.storyboard
│   │   ├── FriendTableCell.xib
│   │   ├── MyItemCollectionViewCell.xib
│   │   ├── Posting.storyboard
│   │   ├── PostingCustomCollectionViewCell.xib
│   │   ├── ProductScreen.storyboard
│   │   └── ProductTableCell.xib
│   └── ViewController				# controller (in mvc)
│       ├── AlarmTableViewCell.swift
│       ├── AlarmViewController.swift
│       ├── BetgeCollectionViewCell.swift
│       ├── BetgeCollectionViewController.swift
│       ├── CustomView.swift
│       ├── FriendTableCell.swift
│       ├── FriendViewController.swift
│       ├── HomeViewController.swift
│       ├── LoginViewController.swift
│       ├── MyItemCollectionViewCell.swift
│       ├── MyItemCollectionViewController.swift
│       ├── PostingCustomCollectionViewCell.swift
│       ├── PostingViewController.swift
│       ├── ProductTableCell.swift
│       ├── ProductViewController.swift
│       └── SettingViewController.swift
├── GreenSpace.xcodeproj			# 프로젝트 메타데이타
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   └── xcuserdata
│   └── xcuserdata
│       ├── choejin-yong.xcuserdatad
│       └── su.xcuserdatad
├── GreenSpaceTests
│   └── GreenSpaceTests.swift
├── GreenSpaceUITests
│   ├── GreenSpaceUITests.swift
│   └── GreenSpaceUITestsLaunchTests.swift
└── README.md

```

## 클래스 위치 및 설명

### Service Target Class

```
├── Network			# Service 관련 class
│   ├── APIs		# Service에서 API 관련 class
│   │   ├── FriendService
│   │   │   ├── FriendServiceAPI.swift
│   │   │   ├── FriendServiceTarget.swift
│   │   │   └── Models
│   │   ├── ItemService
│   │   │   ├── ItemServiceAPI.swift
│   │   │   ├── ItemServiceTarget.swift
│   │   │   └── Models
│   │   ├── PostService
│   │   │   ├── Models
│   │   │   ├── PostServiceAPI.swift
│   │   │   └── PostServieTarget.swift
│   │   ├── ProductService
│   │   │   ├── Models
│   │   │   ├── ProductServiceAPI.swift
│   │   │   └── ProductServiceTarget.swift
│   │   └── UserService
│   │       ├── Models
│   │       ├── UserServiceAPI.swift
│   │       └── UserServiceTarget.swift
│   └── Bases	# 공통적으로 동작하는 작업에 대한 추상 Class
│       ├── EmptyRequest.swift
│       ├── EmptyResponse.swift
│       ├── HttpHeaderField.swift
│       ├── MessageResponse.swift
│       ├── MyRequestInterceptor.swift
│       └── TargetType.swift
```

- `--ServiceAPI.swift` 각 Service에서 필요한 api 메소드들이 구현된 클래스

- `--ServiceTarget.swift` 각 Service에서 필요한 api 메소드들의 type과 target이 정의된 클래스

- `Models/` 각 Service의 Request와 Response에 필요한 타입이 정의된 디렉토리

- `MyRequestInterceptor.swift` api request를 intercept해서 header field에 access token을 넣어주는 클래스

- `TargetType.swift` ServiceTarget에 공통적으로 필요한 작업이 정의된 추상 클래스

- `HttpHeaderField.swift` api request에 필요한 공통 헤더 클래스

### ViewController Class

```
ViewController				# controller (in mvc)
├── AlarmTableViewCell.swift
├── AlarmViewController.swift
├── BetgeCollectionViewCell.swift
├── BetgeCollectionViewController.swift
├── CustomView.swift
├── FriendTableCell.swift
├── FriendViewController.swift
├── HomeViewController.swift
├── LoginViewController.swift
├── MyItemCollectionViewCell.swift
├── MyItemCollectionViewController.swift
├── PostingCustomCollectionViewCell.swift
├── PostingViewController.swift
├── ProductTableCell.swift
├── ProductViewController.swift
└── SettingViewController.swift
```

- `--ViewController` 각 View에서 필요한 기능을 구현한 클래스

- `--ViewCell` tableview, collectionview에서 필요한 cell view를 구현한 클래스

### View Class

```
View						# view (in mvc)
├── Base.lproj
│   ├── LaunchScreen.storyboard
│   └── Main.storyboard
├── BetgeCollectionViewCell.xib
├── FriendScreen.storyboard
├── FriendTableCell.xib
├── MyItemCollectionViewCell.xib
├── Posting.storyboard
├── PostingCustomCollectionViewCell.xib
├── ProductScreen.storyboard
└── ProductTableCell.xib
```

- `Main.storyboard` 메인 View
