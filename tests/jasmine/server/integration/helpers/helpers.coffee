<<<<<<< HEAD
@Helpers =
    login: (roleName) ->
        if !Roles.find({}).count()
            Meteor.call 'seedRoles'
        Meteor.userId = ->
            user = Meteor.users.findOne({ role: roleName })
            return user._id
=======
Helpers =
    login: ->
        Meteor.userId = -> '1'
>>>>>>> ecafe35e608218320d985c25a799aa5d47ea62dc
        Meteor.user = ->
            user = Meteor.users.findOne({ role: roleName })

            return user
    logout: ->
        Meteor.userId = -> ''
        Meteor.user = -> undefined
    clear: ->
        Posts.remove {}
        Topics.remove {}
        Sections.remove {}
    seed:
        __inSession: (fun, params) ->
            if _.isFunction(fun) && _.isArray(params)
                Helpers.login('admin')
                fun.apply(undefined, params)
                Helpers.logout()

        post: (post) ->
            this.__inSession(Meteor.call, ['addPost', post])
        topic: (topic) ->
            this.__inSession(Meteor.call, ['addTopic', topic])
        section: (section) ->
            this.__inSession(Meteor.call, ['addSection', section])

module.exports('Helpers', Helpers)
