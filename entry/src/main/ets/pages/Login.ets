@Entry
@Component
struct Login {
  @State message: string = 'Hello World';

  build() {
    Column({
      space: 14
    }) {
      Image($r('app.media.jjb'))
        .width('80%')
      Button('登录')
        .buttonStyle(ButtonStyleMode.NORMAL)
        .width('100%')
      Button('注册')
        .width('100%')
    }
    .width('100%')
  }
}