package mn.xenon.main

import mn.xenon.domain.Page

class AboutController {

    def index() {
        def pageList = Page.list()


        def current
        if(params.id)
            current = Page.get(params.id)
        else if(pageList.size()>0)
            current = pageList.first()

        [pageList: pageList,current:current]
    }
    
}
