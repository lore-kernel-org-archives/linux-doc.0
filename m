Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0682D7D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750733AbeEVLYG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:24:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbeEVLYA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:24:00 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0MVq96-1frxDm0ADg-00X7DJ; Tue, 22 May 2018 13:22:26 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 1/6] ARM: bcm2835: Add GET_THROTTLED firmware property
Date:   Tue, 22 May 2018 13:21:47 +0200
Message-Id: <1526988112-4021-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:lJuRb1m8S68CU4yIMOgECTRo1RGsBHZKgzMcxhtbCFFWhNRa32G
 gKUwZGrAUlZqoc84YsLSaCrLwA6EmpKBbRGHFpPFxXYfUqT2F95zaYGPHQvFl6NM9Tj9wBL
 Cojq7VOHPHp+P7Gt6t37Kt0jgUnW2UN6arKFWnwB1suP2qUyUdbYs7h3uxYLnXrnW9Zu6Vx
 wib7sNHlrcI8cUwZIDY9w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:eVpaUIc70kk=:pVnJ3jUN06k0OgTszgVO6f
 xEfqrsRokOSoWKhMdjE92e2xNcKJew6hNBQ10nigJ0N6H6F1IOHZOfK/3LlKuC9yQkITJhSxO
 Kd+tKpfdeeFOvpAfpFyxlBNE4PYTL5U37c6GPNFzjf5PCTTF4lTISyVFEXRVIZ3BTms9f3QHw
 h6l8o3CZaX4sxNs/rk6AIqT337BAd7Y8Ta96SSL2xectwU/BCQu5LblxdAd4QIYRW7zaMKjJR
 A22a4RX8Jl4Op4BsvxyfSTfmPN8sBcHsVVBk/raSWw7lNLVj1xXs22HqO5m97hKMZ7TT7s4W6
 7u3h/MfNimTsFsgFBt9rUPaDjZ7v5vBpYgRAlkzC58A1cgNYi/aoStytLNOO5PQ61ifWttRXL
 aWXBnUyCKf6+Q1H2hdHS9f4d9hyJJfPg4qHZfldTGXazDE+ZR6CC7xDVnddShx5eCixfoJ0Vb
 r3fJCg8X5aAy/VF1vZBsVEOcgFsVoX8UR9YyepL3gI4VRIQAxtPdNRsGzhm4NAJLuCsSZC56x
 QqiXf9d0V+5oUBh8iWgGg+61xNC2rnTgnCA2T+BMZ2mBFbJisMkqKLlfEY0HjREHrv3LzPHqC
 tjymieL2YYMeTCeeyshlnp7rzs7jApTjhFoaN2F0PkYCxk+y/czH4RH5ejLeTWpk8ypX+xnP4
 gBVwFDFdkpQZoovyyYvxn372y0V9JiCKsuD2MWC/FkAbAovP9yt4chONrFYFNkdck1K4=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recent Raspberry Pi firmware provides a mailbox property to detect
under-voltage conditions. Here is the current definition.

The u32 value returned by the firmware is divided into 2 parts:
  - lower 16-bits are the live value
  - upper 16-bits are the history or sticky value

  Bits:
  0: undervoltage
  1: arm frequency capped
  2: currently throttled
  16: undervoltage has occurred
  17: arm frequency capped has occurred
  18: throttling has occurred

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 8ee8991..c4a5c9e 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -75,6 +75,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_EDID_BLOCK =                         0x00030020,
 	RPI_FIRMWARE_GET_CUSTOMER_OTP =                       0x00030021,
 	RPI_FIRMWARE_GET_DOMAIN_STATE =                       0x00030030,
+	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
