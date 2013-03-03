package mn.xenon.domain

import org.springframework.security.access.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN'])
class TagController {

    def tagService

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [tagInstanceList: tagService.list(params), tagInstanceTotal: tagService.count(params)]
    }

    def create() {
        [tagInstance: new Tag(params)]
    }

    def save() {
        def tagInstance = new Tag(params)
        if (!tagInstance.save(flush: true)) {
            render(view: "create", model: [tagInstance: tagInstance])
            return
        }

        flash.success = "{${tagInstance.label}} нэртэй чиглэл амжилттай үүсгэгдлээ"
        redirect(action: "list")
    }

    def edit(Long id) {
        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        [tagInstance: tagInstance]
    }

    def update(Long id, Long version) {
        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tagInstance.version > version) {
                tagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'tag.label', default: 'Tag')] as Object[],
                        "Another user has updated this Tag while you were editing")
                render(view: "edit", model: [tagInstance: tagInstance])
                return
            }
        }

        tagInstance.properties = params

        if (!tagInstance.save(flush: true)) {
            render(view: "edit", model: [tagInstance: tagInstance])
            return
        }

        flash.success = "{${tagInstance.label}} чиглэл амжилттай шинэчлэгдлээ"
        redirect(action: "list")
    }

    def delete(Long id) {
        def tagInstance = Tag.get(id)
        if (!tagInstance) {
            flash.error = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
            return
        }

        try {
            tagInstance.delete(flush: true)
            flash.success = "{${tagInstance.label}} нэртэй чиглэл устгагдлаа"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'tag.label', default: 'Tag'), id])
            redirect(action: "list")
        }
    }
}
