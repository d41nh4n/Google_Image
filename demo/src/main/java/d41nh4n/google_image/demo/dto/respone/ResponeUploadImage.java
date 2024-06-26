package d41nh4n.google_image.demo.dto.respone;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponeUploadImage {
    private int status;
    private String message;
    private String urlImg;
}