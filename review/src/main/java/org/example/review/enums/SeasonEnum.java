package org.example.review.enums;

import lombok.Getter;

import java.util.Arrays;

/**
 * @author haisky
 */
public enum SeasonEnum {
    SPRING("spring", "春季"),
    SUMMER("summer", "夏季"),
    AUTUMN("autumn", "秋季"),
    WINTER("winter", "冬季");

    @Getter
    private final String code;
    @Getter
    private final String message;

    SeasonEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public static SeasonEnum getSeasonEnum(String code) {
        SeasonEnum[] season = SeasonEnum.values();
        for (SeasonEnum ele : season) {
            if (ele.getCode().equalsIgnoreCase(code)) {
                return ele;
            }
        }
        return null;
    }

    public static SeasonEnum getSeasonEnum2(String code) {
        return Arrays.stream(SeasonEnum.values()).filter(item -> item.getCode().equalsIgnoreCase(code)).findFirst().orElse(null);
    }

    public static void main(String[] args) {
        SeasonEnum season = getSeasonEnum("spring");
        if (season != null) {
            System.out.println("season.getCode() = " + season.getCode());
            System.out.println("season.getMessage() = " + season.getMessage());
        } else {
            System.out.println("no season found");
        }

        SeasonEnum season2 = getSeasonEnum2("summer");
        if (season != null) {
            System.out.println("season2.getCode() = " + season2.getCode());
            System.out.println("season2.getMessage() = " + season2.getMessage());
        } else {
            System.out.println("no season found");
        }
    }
}
