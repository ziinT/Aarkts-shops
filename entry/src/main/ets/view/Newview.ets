import { promptAction, router } from '@kit.ArkUI';
import { HttpRequest } from '../utlis/http';
import { http } from '@kit.NetworkKit';

interface https {
  userName: string,
  password: string
}

function News(userName: string, password: string) {
  return HttpRequest.post(`http://192.168.14.63:1337/api/v1/auth/reg`, userName, password)
    .then(r => {
      console.log(JSON.stringify(r))
      return r
    })
}


@Entry
@Component
export struct Newview {
  @State message: string = 'Hello World';
  @State userName: string = '';
  @State password: string = '';
  @State data: https = {
    userName: '',
    password: ''
  }
  @State lists: [] = []

  build() {
    Column({
      space: 14
    }) {
      Image($r('app.media.jjb'))
        .width('80%')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Index'
          })
        })
      TextInput({
        placeholder: '请输入用户名',
        text: $$this.userName,
      })
      TextInput({
        placeholder: '请输入密码',
        text: $$this.password,
      })
        .type(InputType.Password)
      Button('注册')
        .onClick(() => {
          this.data.userName = this.userName
          this.data.password = this.password
          // http.createHttp().request('http://192.168.14.63:1337/api/v1/auth/reg', {
          //   method: http.RequestMethod.POST,
          //   expectDataType: http.HttpDataType.OBJECT,
          //   header: {
          //     'Content-Type': 'application/json'
          //   },
          //   extraData: {
          //     userName: this.userName,
          //     password: this.password
          //   }
          // }).then(r => {
          //   console.log(JSON.stringify(r))
          // })

          News(this.userName, this.password).then((r => {
            if (r['responseCode'] == 200) {
              promptAction.showToast({
                message: '注册成功',
              })
              router.pushUrl({
                url: 'view/Login'
              })
            } else {
              promptAction.showToast({
                message: '注册失败'
              })
            }
          }))
        })
        .buttonStyle(ButtonStyleMode.NORMAL)
        .width('60%')
        .backgroundColor(Color.Pink)
      Text('我已经有账号，我要去登录')
        .fontSize(12)
        .fontColor(Color.Green)
        .textAlign(TextAlign.End)
        .width('100%')
        .onClick(() => {
          router.pushUrl({
            url: 'view/Login'
          })
        })
    }
  }
}