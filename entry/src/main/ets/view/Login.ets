import { promptAction, router } from '@kit.ArkUI';
import { Res } from '../pop/pops';
import { HttpRequest } from '../utlis/http';

function Logins(userName: string, password: string) {
  return HttpRequest.post(`http://192.168.14.63:1337/api/v1/auth/login`, userName, password)
    .then(r => {
      console.log(JSON.stringify(r))
      return r
    })
}

@Entry
@Component
export struct Login {
  @State message: string = 'Hello World';
  @State userName: string = '';
  @State password: string = '';

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
        text: $$this.userName
      })
      TextInput({
        placeholder: '请输入密码',
        text: $$this.password
      })
        .type(InputType.Password)
      Button('登录')
        .onClick(() => {

          Logins(this.userName, this.password).then(r => {
            if (r['responseCode'] == 200) {
              promptAction.showToast({
                message: '成功'
              })
              router.pushUrl({
                url:'pages/Index'
              })
            }else{
              promptAction.showToast({
                message: '失败'
              })
            }
          })
        })
        .buttonStyle(ButtonStyleMode.NORMAL)
        .width('60%')
        .backgroundColor(Color.Pink)
      Text('没有账号，我要去注册')
        .fontSize(12)
        .fontColor(Color.Green)
        .textAlign(TextAlign.End)
        .width('100%')
        .onClick(() => {
          router.pushUrl({
            url: 'view/Newview'
          })
        })
    }

    .width('100%')
  }
}