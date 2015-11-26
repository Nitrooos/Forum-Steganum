'use strict'

describe 'Directive: newPost', ->
    mockedPostsServ =
        add: angular.noop
    mockedStateParams =
        topic_id: 123
    successCallback = {}

    beforeEach module 'posts',
        postsServ: mockedPostsServ
        $stateParams: mockedStateParams
    beforeEach module 'templates'

    element = {}

    beforeEach (done) ->
        spyOn(mockedPostsServ, 'add').and.returnValue
            then: (success) ->
                successCallback = success
        done()

    beforeEach ->
        element = new TestElement 'newPost'
        element.create '<new-post></new-post>'

    it 'should compile', ->
        expect(element.dom).toBeDefined()

    it 'should set to vm.action', ->
        expect(element.ctrl.action).toBe(mockedPostsServ)

    describe 'clearPost method', ->
        beforeEach (done) ->
            element.ctrl.clearPost()
            done()

        it 'should clear text', () ->
            expect(element.ctrl.post.text).toBe ''

        it 'should set $stateParams.topic_id to post.topic_id', () ->
            expect(element.ctrl.post.topic_id).toBe mockedStateParams.topic_id

    describe 'addPost method', ->
        post =
            text: 'Im Batman'
        imagesFilesList = ['Gotham_Night_Panorama.jpg']

        beforeEach (done) ->
            spyOn(element.ctrl, 'clearPost')
            element.ctrl.addPost(post, imagesFilesList)
            successCallback()
            done()

        it 'should call add method on postsServ with post', () ->
            expect(mockedPostsServ.add).toHaveBeenCalledWith(post, imagesFilesList)

        it 'should call clearPost method on controller', () ->
            expect(element.ctrl.clearPost).toHaveBeenCalled()
