package mn.xenon.main

class FileController {

    def index() {
        if (!params.id) {
            response.sendError(404)
            return;
        }
        def file = new File('/opt/grails/tmp/'+params.id)
        if (file.exists()) {
            response.setContentType("image/jpeg")
            response.setContentLength(file.size().toInteger())
            OutputStream out = response.getOutputStream();
            out.write(file.bytes)
            out.close();
        }
    }
}
