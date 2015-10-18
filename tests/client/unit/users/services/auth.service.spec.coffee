describe 'Auth Service', ->
  authServ = {}
  mockedMeteor = {
    loginWithPassword: angular.noop
    createUser: angular.noop
    logout: angular.noop
  }
  mockedState = {
    goBack: angular.noop,
  }
  successCallBack = {}
  failCallBack = {}

  beforeEach module('users',
    $meteor: mockedMeteor,
    $state: mockedState
  )


  beforeEach inject(($injector) ->
    authServ = $injector.get('authServ')
  )

  it 'should initialize', ->
    expect(authServ).toBeDefined()



  describe 'logIn method', ->
    email = 'iron@man.pl'
    password = 'tonystark'

    beforeEach (done) ->
      spyOn(mockedMeteor, 'loginWithPassword').and.returnValue
        then: (success, fail) ->
          successCallBack = success
          failCallBack = fail
      spyOn(mockedState, 'goBack')

      authServ.email = email
      authServ.password = password

      done()

    describe 'success', ->
      beforeEach (done) ->
        authServ.logIn()
        successCallBack()
        done()

      it 'should call loginWithPassword method on meteor', () ->
        expect(mockedMeteor.loginWithPassword).toHaveBeenCalledWith email, password

      it 'should call goBack method on state', () ->
        expect(mockedState.goBack).toHaveBeenCalled()

    describe 'failed', ->
      error = 'some error'
      beforeEach (done) ->
        authServ.logIn()
        failCallBack(error)
        done()

      it 'should call loginWithPassword method on meteor', () ->
        expect(mockedMeteor.loginWithPassword).toHaveBeenCalledWith email, password

      it 'should not call goBack method on state', () ->
        expect(mockedState.goBack).not.toHaveBeenCalled()

      it 'should set error to this.error', () ->
        expect(authServ.error.login).toContain error




  describe 'logout method', ->
    beforeEach (done) ->
      spyOn(mockedMeteor, 'logout').and.returnValue
        then: (success) ->
          successCallBack = success

      authServ.logout()
      successCallBack()
      done()

    it 'should call logout method on meteor', () ->
      expect(mockedMeteor.logout).toHaveBeenCalled()



  describe 'register method', ->
    registerObject =
      email: 'spider@man.pl'
      password: 'peter'
      username: 'parker'

    beforeEach (done) ->
      spyOn(mockedMeteor, 'createUser').and.returnValue
        then: (success, fail) ->
          successCallBack = success
          failCallBack = fail
      spyOn(mockedState, 'goBack')

      authServ.email = registerObject.email
      authServ.password = registerObject.password
      authServ.userName = registerObject.username

      done()

    describe 'success', ->
      beforeEach (done) ->
        authServ.register()
        successCallBack()
        done()

      it 'should call createUser method on meteor', () ->
        expect(mockedMeteor.createUser).toHaveBeenCalledWith registerObject

      it 'should call goBack method on state', () ->
        expect(mockedState.goBack).toHaveBeenCalled()


    describe 'failed', ->
      error = 'some another error'
      beforeEach (done) ->
        authServ.register()
        failCallBack(error)
        done()

      it 'should call createUser method on meteor', () ->
        expect(mockedMeteor.createUser).toHaveBeenCalledWith registerObject

      it 'should not call goBack method on state', () ->
        expect(mockedState.goBack).not.toHaveBeenCalled()

      it 'should set error to this.error', () ->
        expect(authServ.error.register).toContain error
