package mn.xenon.domain

public enum StatementType {

    News(1),
    Result(2),

    final Integer value

    StatementType(Integer value) {
        this.value = value
    }

    static list() {
        [News, Result]
    }

    public static StatementType numToEnum(Integer num) {
        if (num != null) {
            for (StatementType s : StatementType.values()) {
                if (s.getValue().equals(num)) {
                    return s;
                }
            }
        } else {
            return StatementType.Open
        }
    }
}
