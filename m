Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6EE9A7DF86
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968114AbeEYT0r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:26:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:36399 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968080AbeEYT0q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:26:46 -0400
Received: from localhost.localdomain ([37.4.249.126]) by
 mrelayeu.kundenserver.de (mreue105 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 0MDxhX-1fZDAS1SaV-00HMD5; Fri, 25 May 2018 21:25:31 +0200
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
Subject: [PATCH V3 5/6] ARM: multi_v7_defconfig: Enable RPi voltage sensor
Date:   Fri, 25 May 2018 21:24:38 +0200
Message-Id: <1527276279-23876-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:6m2HBlQGGsTVrXi+aQYJ57OYEuald5/cjYiszZg1er6LRyyr8wp
 bFuTN4FgMjsa47XruEq5jtmWusteCaUelubh0nyDSQXglUyroqOXA1Ic6Vxte5VxVPBbghN
 8jhHn3/TQeppFLNTKh5D4PvBlaJJgqKDI/u+pjGATI6TsJ9vm5kYGxeMsmbIfxh8/sRZnrR
 YqlKT7c3jLOQFBxlXge3w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:MVd2C+7deaA=:89fsSlNRscqJDkb41LdLkj
 gQjZb4BexHerK1qmzkiaO/1SM7rpHvK8ywIKG4tBADMn7zkTQVeDD+KVb8WUr+n9DkNGAL0Rn
 OTCfpzmslnyUVwGhclW+tyoS1SOWNKLiXRIMtNNwyBZb5KjNgAQWzHvS0GSLCBZC9jhtsh2Mu
 2sCUC5r5g0TVYJXrq2NaQnup2sWi9pnpMecfjILEk0w8aJQJby+k6Hi+FgPRJ1DzIDCzzRfXx
 vXYIHORdhV16l6++Kim7RZlniM4KQDahLJGPkaLcG5AwtQ9wuYWwN87Ke0yTGG1hWjrZtg3XG
 ow6yYW5eDi0ohLx2cFK0RUxTXm61MpTeqHPDSiKI+f9Ltu6B5dLruyGCMkub7PB+Rr/EZ5iIR
 THE23yA9bzjkHvhS+epvm56c8LsZS+mf0cOLd8PWHWCo6E6P7/1YRKjuZwXvoikK5m2jS3FeK
 b0BDY4++QVfCBkenkUBNwrk0EmtxbECOHrt9Au/Dx3bVGnbXonZu5SjLoOdsqE23x9Y0ftCSr
 Ld//mSzSVSsRBUqQcXxUMcbEV1WiLeGKSckgVYj6Vk31/XBc9jkj6u9JdC/sxQ5A5mcCU6gDp
 tjH7L8Tg26AhIKNuN45SqfCnIsZ9SZho2wIY/quiCYOKYhtUE5QnOjSfip8pBzwLG+wTrgEvu
 cATkeq2+m/AJx2lJUyLSRFYPzU9IXF3CE608+dcBfiiqG8zz39vporTmAbRdgex1cywI=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The patch enables the hwmon driver for the Raspberry Pi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7b2283a..2af46fd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -449,6 +449,7 @@ CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
 CONFIG_SENSORS_NTC_THERMISTOR=m
 CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_CPU_THERMAL=y
 CONFIG_IMX_THERMAL=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
