angular.module 'sections'
.service 'sectionsServ', ($meteor) ->
    all: $meteor.collection(Sections).subscribe('sections')

    getTopics: (section_id) ->
        $meteor.call 'getTopicsOfSection', section_id
