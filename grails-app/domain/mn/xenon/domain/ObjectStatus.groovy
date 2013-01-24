package mn.xenon.domain

public enum ObjectStatus {

    Created(1),
    Modified(2),
    Draft(4),
    Approved(8),
    Deleted(16),
    Active(32),
    Closed(64),
    Rejected(128),
    Archived(256),
    System(512)

    final Integer value

    ObjectStatus(Integer value) {
        this.value = value
    }

    static list() {
        [Created, Draft, Approved, Active, Closed, Rejected, Modified, Archived, Deleted]
    }

    public static ObjectStatus numToEnum(Integer num) {
        if (num != null) {
            for (ObjectStatus s: ObjectStatus.values()) {
                if (s.getValue().equals(num.intValue())) {
                    return s;
                }
            }
        } else {
            return null
        }
    }

}
