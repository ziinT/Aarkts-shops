import { router } from '@kit.ArkUI';

@Styles
function hans() {
  .width('100%')
  .padding({
    top: 8,
    bottom: 8,
    left: 20,
    right: 20,
  })
}

@Entry
@Component
export struct Myshop {
  @State message: string = '哈默';

  // aboutToAppear(): void {
  //
  // }

  build() {
    Column() {
      Row() {
        Image($r('app.media.jjb2'))
          .width(200)
          .height(200)
          .borderRadius(100)
          .border({
            style: BorderStyle.Solid,
            width: 10,
            color: '#fff'
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height(400)
      .backgroundColor('#ff96b857')

      Text('猪猪侠的故事会')
        .fontSize(36)
        .fontWeight(FontWeight.Bolder)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .position({
          top: 320
        })
        .width('100%')

      ColumnSplit() {
        Row() {
          Text('购买记录')
          Blank()
          Text('>')
        }
        .hans()

        Divider()

        Row() {
          Text('我的信息')
          Blank()
          Text('>')
        }
        .width('100%')
        .padding({
          top: 8,
          bottom: 8,
          left: 20,
          right: 20,
        })

        Divider()


        Row() {
          Text('我的预约')
          Blank()
          Text('>')
        }
        .width('100%')
        .padding({
          top: 8,
          bottom: 8,
          left: 20,
          right: 20,
        })

        Divider()


        Row() {
          Text('修改密码')
          Blank()
          Text('>')
        }
        .width('100%')
        .padding({
          top: 8,
          bottom: 8,
          left: 20,
          right: 20,
        })

        Divider()


        Row() {
          Text('我的收藏')
          Blank()
          Text('>')
        }
        .width('100%')
        .padding({
          top: 8,
          bottom: 8,
          left: 20,
          right: 20,
        })

        Divider()


        Row() {
          Text('我的订单')
          Blank()
          Text('>')
        }
        .width('100%')
        .padding({
          top: 8,
          bottom: 8,
          left: 20,
          right: 20,
        })

        Divider()


      }

      Button('登录')
        .onClick(() => {
          router.pushUrl({
            url: 'view/Login',
          })
        })
        .width('80%')
        .type(ButtonType.Normal)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}