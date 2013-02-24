<g:each in="${ticketList}" status = "i" var="ticketInstance">
    <g:render template="single" model="['ticketInstance':ticketInstance]" />
</g:each>
