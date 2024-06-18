/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package d41nh4n.google_image.demo.entity.user;

/**
 *
 * @author DAO
 */

import jakarta.persistence.*;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Profile")
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class Profile {
    @Id
    @Column(name = "user_id")
    private int profileId;

    @Column(name = "full_name", length = 100)
    private String fullName;

    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String bio;

    @Column(name = "avatar_url", length = 500)
    private String avatarUrl;

    @Column(name = "birthday")
    private Date birthday;

    @Column(name = "phonenumber", length = 15)
    private String phoneNumber;

    @Column(length = 50)
    private String address;

    @Column(length = 50)
    private String location;

    @Column(name = "priceAPost", nullable = false)
    private long priceAPost;

    @Column(name = "priceAVideo", nullable = false)
    private long priceAVideo;

    @Column(name = "priceAToHireADay", nullable = false)
    private long priceAToHireADay;

    @Column(name = "representativePrice", nullable = false)
    private long representativePrice;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId("userId")
    @JoinColumn(name = "user_id")
    private User user;
    // Getters and setters
}