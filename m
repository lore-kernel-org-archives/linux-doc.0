Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B3627D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751275AbeEVLXw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:23:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58067 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751060AbeEVLXv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:23:51 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0M4DUV-1gAquW443P-00rqmk; Tue, 22 May 2018 13:22:28 +0200
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
Subject: [PATCH RFC V2 4/6] ARM: bcm2835_defconfig: Enable RPi voltage sensor
Date:   Tue, 22 May 2018 13:21:50 +0200
Message-Id: <1526988112-4021-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:wgJbi1+Jm5A/IwMrl/SPry4xVL5KJbKVvNjmPg6sinTTSVMBen9
 kv8I2FrUypap3U3WvlLpGW29R33TT0oO9JrPzIuwyRpTzHEeUF5e2anZKGsYESyQ2SDj6pi
 3Lw+ee40VO+DO82piPGy0y+lJaYQVsNCew24fMruV7empw1EAlofLrXtcsXQnjmNQky21Bx
 gol6sL0YRmjsgqOkANFkg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:0aKehjju7Bk=:t4+EsWsMdMol/T9pZDDSr3
 E5X70uYtXp1Dc8wo4xHUiNW0lKW37RQmaRjQpiP0l+tFZ+UIlrNn0aCiNOd9ajdwSzoabiKCR
 NAn+5tUMZA+fh3dpFOkmfMrWpd+nOwFCpRzMIW3JsPI7ngqbUoF/YrGZim1RpAiN+yWQwGPOc
 oKutWnT9ylyLaIf6CGZBlnkpFGF8qCLUPYCdylmHMpvwkBXKuxyulw71GS60EUxeR4iwSZ8k/
 pyXyPuoPXMjt+uwBMldsqoHtbCHDU1RrRd2MFhuMnOLngDXr663+GeEMQNmXKk/TVQNRxD1Ck
 FTrNpCoghMocbdm14CZLLlWiZ+DjaKae7EcitGsU7dGdUs88n7xBO2JqvtMzuBWkZ0zyTRE/i
 smXytEJMP2wzG1Zrgd0oFgIXqhqQjctm+Sdj1ONaX4L8DcJicmG4eN1T7qQ9CedX6o6Jkzh/H
 eZKi1WuRjSeZLDb8OkXHp4HnnYZP1Q2DQ4vxw7x6WKJIsV2P3AowNZaxEj6OeMGBXZl7A2zJa
 yTzcZcg2N+l4hw4MEBXCFdqf3XT9VGJwQo9SBtRe8ILoR4lJ6jcF7PuWfsx1TVoNr0zyQ/ghm
 Ivf8/jqGt+z1TmjpZeR/45N1Rric6CFZqLdS4EUsLmqTXVmmkbyXyzRY+g3B+EF7ffrckB29C
 ZgMSnDPx0s76X4BZn48Jcx4Ao4BDHimxtBfPZ2GEQtisnJF7672/TIPuO7r/GsExyt3c=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The patch enables the hwmon driver for the Raspberry Pi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/configs/bcm2835_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index e4d188f..e9bc889 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -86,7 +86,7 @@ CONFIG_SPI=y
 CONFIG_SPI_BCM2835=y
 CONFIG_SPI_BCM2835AUX=y
 CONFIG_GPIO_SYSFS=y
-# CONFIG_HWMON is not set
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_THERMAL=y
 CONFIG_BCM2835_THERMAL=y
 CONFIG_WATCHDOG=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
