package mn.xenon.domain

public enum Type {

    Competition(1), // tsenher
    Interests(2)

    final Integer value

    Type(Integer value) {
        this.value = value
    }

    static list() {
        [Competition, Interests]
    }

    public static Type numToEnum(Integer num) {
        if (num != null) {
            for (Type s : Type.values()) {
                if (s.getValue().equals(num)) {
                    return s;
                }
            }
        } else {
            return Type.Open
        }
    }
}
