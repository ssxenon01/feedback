package mn.xenon.domain

public enum ObjectStatus {

    Open(1),
    Pending(2), // 500 хүрвэл pending Таны санал 500 хүрлээ , admin саналууд 1000 хүрлээ
    Closed(3), // Шалгаад closed result
    Approved(4), 
    Expired(5), // 1 жилийн хугацаанд дэмжээгүй
    Deleted(6),
    Suspended(7), // Цуцалсан шалгаж үзээд
    Duplicated(8) // Саналийн давхардалт 

    final Integer value

    ObjectStatus(Integer value) {
        this.value = value
    }

    static list() {
        [Open,Pending,Closed,Approved,Expired,Deleted,Duplicated]
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
