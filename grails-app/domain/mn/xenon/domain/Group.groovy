package mn.xenon.domain

public enum Group {

    Company(1), // tsenher
    Citizen(2),
    State(3)

    final Integer value

    Group(Integer value) {
        this.value = value
    }

    static list() {
        [Company, Citizen, State]
    }

    public static Group numToEnum(Integer num) {
        if (num != null) {
            for (Group s : Group.values()) {
                if (s.getValue().equals(num)) {
                    return s;
                }
            }
        } else {
            return Group.Open
        }
    }
}
