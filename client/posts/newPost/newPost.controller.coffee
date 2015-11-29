newPostController = (postsServ, $stateParams) ->
    vm = this
    vm.action = postsServ
    vm.image =
        name: ''

    do vm.clearPost = () ->
        vm.post =
            text: ''
            topic_id: $stateParams.topic_id

    vm.addPost = (post, image) ->
        unless image.name == '' && post.text == ''
            vm.action.add(post, image).then ->
                vm.clearPost()
        else
            alert 'Empty posts are not allowed on this forum!'

    return vm

newPostController.$inject = ['postsServ', '$stateParams']

angular.module('posts')
.controller 'newPostController', newPostController
