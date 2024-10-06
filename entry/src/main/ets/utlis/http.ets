import { http } from '@kit.NetworkKit'

interface https {
  userName: string,
  password: string
}

export class HttpRequest {
  static get(url: string) {
    return http.createHttp().request(url, {
      // method:http.RequestMethod.GET,
      expectDataType: http.HttpDataType.OBJECT
    })
  }

  static post(url: string, userName: string, password: string) {
    return http.createHttp().request(url, {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json'
      },
      expectDataType: http.HttpDataType.OBJECT,
      extraData: {
        userName: userName,
        password: password
      }
    })

  }
}