package mn.xenon.domain

public enum ObjectStatus {

    Open(1),
    Pending(2), // 500 хүрвэл pending Таны санал 500 хүрлээ , admin саналууд 1000 хүрлээ
    Closed(3), // Шалгаад closed result
    Responded(4), 
    Expired(5), // 1 жилийн хугацаанд дэмжээгүй
    Duplicated(6), // Саналийн давхардалт 
    Suspended(7), // Цуцалсан шалгаж үзээд
    Deleted(8)

    final Integer value

    ObjectStatus(Integer value) {
        this.value = value
    }

    static list() {
        [Open,Pending,Closed,Responded,Expired,Deleted,Duplicated]
    }

    public static ObjectStatus numToEnum(Integer num) {
        if (num != null) {
            for (ObjectStatus s: ObjectStatus.values()) {
                if (s.getValue().equals(num)) {
                    return s;
                }
            }
        } else {
            return ObjectStatus.Open
        }
    }
}
