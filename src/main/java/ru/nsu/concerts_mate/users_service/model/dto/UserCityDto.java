package ru.nsu.concerts_mate.users_service.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class UserCityDto {
    @JsonProperty(value = "user_id")
    private long userId;

    @JsonProperty(value = "city_name")
    private String cityName;
}
