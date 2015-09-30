angular.module('sections')
.controller 'ShowSectionCtrl', (sectionsServ, $stateParams) ->
    vm = this
    do ->
        vm.id = $stateParams.id
        vm.section = sectionsServ

        vm.section.getTopics(vm.id).then (result) ->
            vm.topics = result

    return vm
