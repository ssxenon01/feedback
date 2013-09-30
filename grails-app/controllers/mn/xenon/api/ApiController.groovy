package mn.xenon.api

import grails.converters.JSON

class ApiController {

    def ticketService

    def ticket() {
        def result = [success:true]


        params.sort = params.sort?:"dateCreated"
        params.order = params.order?:"desc"
        params.max = params.max?:5

        result.data = ticketService.closedList(params).collect{
            [
                    id:it.id,
                    dateCreated:it.dateCreated ,
                    title: it.title ,
                    description: it.content ,
                    voteCount:it.vote,
                    url: g.createLink(controller: 'ticket',action: 'show',id:it.id,absolute: true),
                    statements:it.fetchStatements().collect{
                        [id:it.id,dateCreated:it.dateCreated,title: it.title,description: it.content]
                    }
            ]
        }
        result.total = ticketService.closedCount()

        render result as JSON
    }
}
