Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3448A7D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751443AbeEVLYU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:24:20 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37911 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbeEVLYS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:24:18 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0LpzzH-1fynhb2jOZ-00ff18; Tue, 22 May 2018 13:22:28 +0200
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
Subject: [PATCH RFC V2 5/6] ARM: multi_v7_defconfig: Enable RPi voltage sensor
Date:   Tue, 22 May 2018 13:21:51 +0200
Message-Id: <1526988112-4021-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:Z9u1fYyHnldNt+dyTNjpL+hFDI4D1F+xInyd1wh8pO/ON1iNI4+
 8/1F7SWb2d/WWW3SA2ejeM0OHxayfg+D/wjYcN5bb+R4pQ99zwkcvA9XqC3ws/JAoaBH0Xr
 dg0ZFJXQs+inRwdoP1YeylhmGxFT+Ltht8/RouEWGF/TAh3ITeU4B0wdc7ncBQSU6D9/5fn
 a9OWDfUfeKhXJA39Iy9Hg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:+rRppFX/izg=:bn68ZUBHzX8I1mws7q+X6k
 a6XGvxfmybOGpjcavwFrA3R52nriUcymiKO5FNXtqWplOwpFt+SHyuAfisChZUhgWX94lNxed
 /0B1BTVa3HNmTTUJo0IMQHzHUoUl3KY8wAiKzgdL4LrLixkudX+tPoWFU8nYoznTMe1mUJJ2P
 Suvk9iPgeAIFd7M56Lpz3/FfvDTfnzbZd3XNgJQkB7njmnKiaqhajFLB/g/l8r71m5359A4id
 dbjY5fYtPX3w3Y9X0wtRu+UqJZsqZ+KbKCjTlom5auFwzDV0e40+jJIIJMs61E7kGNfltW8QJ
 LWx3jCc9Jii80m2zt2XOtO3N7KMRILZdGkMP2DkMnPtaXceIO3fmr0xoVqILPeCtZTq04ZMCg
 2gF20V2d1Uhdx4UQHb2z6g9w5Prql78E9BtoooASkqOlFG6ryh/oxNuz6s/DsoO/zX/ew3R0m
 VV00tKZtMuRERxebLORYSojkw8ah2m4OnKZhzlzYSe90Bz6/wvb7y6NQGqe0yyGYanVurUlZ4
 QdT3oE026+Jxw46Nqx/ghvPoQ7dbWnV65Gf4k1ybOsnaCUpPWzB+/i28P3qsQf6BdSUVYaMks
 zuyjgPMpFaih0+jAHBa3rj54zAnAI/ETM3yq3PziBrYnOteSTuaci2I2funYEn1SmtpXZINtT
 ncmhYmJUWsA2hNjeb7lHQ6hcn8HPmTtYIsHT83vAx9/rLBfZ0LZE1iaxJxn9+VhFHClU=
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
index 720461b..5c9dc00 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -477,6 +477,7 @@ CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
 CONFIG_SENSORS_NTC_THERMISTOR=m
 CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_CPU_THERMAL=y
 CONFIG_BCM2835_THERMAL=m
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
