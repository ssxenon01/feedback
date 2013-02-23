package mn.xenon.domain

import org.apache.commons.lang.time.DateUtils

public enum TimePeriod implements Serializable {

    day(1),
    week(3),
    twoWeeks(4),
    month(5),
    quarter(6),
    year(7),
    cumulative(8)

    //cumulative is all data up to the present

    final Integer value

    TimePeriod(Integer value) {
        this.value = value
    }

    static list() {
        [day, week, twoWeeks, month, quarter, year, cumulative]
    }

    public static TimePeriod numToEnum(Integer num) {
        if (num != null) {
            for (TimePeriod s : TimePeriod.values()) {
                if (s.getValue().equals(num.intValue())) {
                    return s;
                }
            }
        } else {
            return null
        }
    }

    public Date to2DatePeriod(Date date, int multip = 1) {
        switch (this) {
            case TimePeriod.day:
                return DateUtils.addDays(date, 1 * multip)
            case TimePeriod.week:
                return DateUtils.addWeeks(date, 1 * multip)
            case TimePeriod.twoWeeks:
                return DateUtils.addWeeks(date, 2 * multip)
            case TimePeriod.month:
                return DateUtils.addMonths(date, 1 * multip)
            case TimePeriod.quarter:
                return DateUtils.addMonths(date, 3 * multip)
            case TimePeriod.year:
                return DateUtils.addYears(date, 1 * multip)
            default:
                return date
        }
    }

    public Date trunkateDate(Date startDate){
        switch (this) {
            case TimePeriod.cumulative:
                return DateUtils.truncate(startDate,Calendar.HOUR)
            default:
                return DateUtils.truncate(startDate, Calendar.DATE)
        }
    }

}
