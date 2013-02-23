package mn.xenon.domain

public enum Gender {

    Other(1),
    Male(2),
    Female(3)

    final Integer value

    Gender(Integer value) {
        this.value = value
    }

    static list() {
        [Other,Male,Female]
    }

    public static Gender numToEnum(Integer num) {
        if (num != null) {
            for (Gender s: Gender.values()) {
                if (s.getValue().equals(num)) {
                    return s;
                }
            }
        } else {
            return Gender.Other
        }
    }
}
