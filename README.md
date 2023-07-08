# 매일 만드는 앱 프로젝트 (이미지 검색 앱 서비스)
실력 향상을 위해 [매일 하나의 앱을 만들고 기록](https://youtube.com/playlist?list=PLqalTSLVTm5tldlM57kHnRvG7feOenQMN)합니다.<br>
검색어를 입력하면 입력값에 따라 조회수가 높은 순으로 이미지 10개를 사용자에게 보여주는 서비스 입니다.

<img src="https://github.com/yeondooo/image_search_5day/assets/97602748/16e47bc2-a000-4433-8abd-abc2fed7189a" width="600">

## ⚙️ 구현 기능

**전일 대비 달라진점**

- 프로젝트 초기 세팅시 클린 아키텍처 패턴을 적용하여 데이터를 활용 용도에 따라 분리했습니다.
- Result 패턴을 활용하여 네트워크 에러처리를 구현했습니다. (freezed 라이브러리 사용)
  https://github.com/yeondooo/image_search_5day/blob/bb4727d0ad8e0987a92a1fda76d366f5ddc5a6b5/lib/core/result.dart#L1-L10

- stream과 sealed 클래스를 활용하여 ui event를 구현했습니다.
  https://github.com/yeondooo/image_search_5day/blob/bb4727d0ad8e0987a92a1fda76d366f5ddc5a6b5/lib/presentation/main/main_ui_event.dart#L1-L11


## ⚒️ 기술 스택
```
flutter
http
provider
json_annotation
go_router
freezed
freezed_annotation
json_serializable
build_runner
```
 

## 🖥️ 구현 화면
![image_search](https://github.com/yeondooo/image_search_5day/assets/97602748/5428bb02-c233-4ce6-a573-7168397e7552)


