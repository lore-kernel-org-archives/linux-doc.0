Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2DE637D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968065AbeEYT0Z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:26:25 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50127 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967859AbeEYT0Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:26:24 -0400
Received: from localhost.localdomain ([37.4.249.126]) by
 mrelayeu.kundenserver.de (mreue105 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 0M7Jw6-1gJEK62t4I-00x6qw; Fri, 25 May 2018 21:25:28 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 1/6] ARM: bcm2835: Add GET_THROTTLED firmware property
Date:   Fri, 25 May 2018 21:24:34 +0200
Message-Id: <1527276279-23876-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:JVrwRR+YyQetXwmn2tKAdJZ8C9pR9X40IGxDmPOdAZulmxCP7kf
 BnfYP5f0D9wefYDB6LVkxzaqVRISjFMM0Ib5iHw34OXc2DG6GzJ1vl1aOgJxyOMsMPcQmSY
 JBtfTZ+jlqv9sBMb38+Udb/Z5NqrqxtNGwGupNAAiDaL5qUDmvdhT6e/YbOv2J3+AupBctJ
 BD3gbU5MWhohdytJ6QehA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Z//C3WpaqZI=:gZqhMOyi6YvnnwwDepL7KV
 htoi7Mu6bcmma2uJEtSCenwp5egbtiDe4Fzy8dodQ2Vdb33yiEeUzwrlc0RPrEdp8AEC4aYTr
 ZmuezwwbuVh1XYtMrrHTo0dmpFbXcTakg0/EJ8BFLlgAFBvmnHKHfmoM+X88OAft7FVBal7YS
 shDSkM//qS2rncf4KihR0PZAPi/EVjtEkA82xy9hYVF9br6CwvrBNGLJ/Qylw7eR5TUDKwkYJ
 BMbMA34iUpZyF6mORCX/cnrLkhe9x7qXhKQlEn1dvPYXS25lJPHaOGWD6s/WsBbRgfRl2qSfc
 U3nEBuKI4UIhq+VW3bIh4DdD/qfTTUeWs2EUYls8Ko/8m30sfNa166QuQGEIqm3Ts3YshVYER
 Bn1aJLfQuBJLxpxjtuwcXCKDfhrhJiNDSxr4qe2Xnhkd8rRy0hrAvXd5To9tb3aZeopsPPOE2
 p4t7LPJtJzycTNUFv86QT+032uMgq72ka0clpXsW5HftuR1U8IrMDiIQTrb0iFkLjIzur4VnP
 EvE0DTagQzCi/BevL5ETesLtqnb1SxeJ2b0apobhm273SYawZVhZsG4h48e4zcgjNqQi3eK0b
 yx1uI1VeD0g9jsXrTLEk65XpYbrycU5PTrLv4k4cJDrxlIhyV/seqHX7uVmWTKp8rcipJYLnw
 HqZ6z8AWd2BG3iPypy5IzFjdxZbtqDW26fZY5/ZUIrrNkz8jWutLfcjLwSVUkAlA1gs0=
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
