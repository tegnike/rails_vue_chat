const setItem = (responseData) => {
  window.localStorage.setItem('access-token', responseData.userLogin.credentials.accessToken)
  window.localStorage.setItem('client', responseData.userLogin.credentials.client)
  window.localStorage.setItem('uid', responseData.userLogin.authenticatable.email)
  window.localStorage.setItem('name', responseData.userLogin.authenticatable.name)
}

export default setItem
