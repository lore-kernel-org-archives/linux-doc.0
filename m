Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 579567DF8A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968132AbeEYT0a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:26:30 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:51077 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967936AbeEYT0a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:26:30 -0400
Received: from localhost.localdomain ([37.4.249.126]) by
 mrelayeu.kundenserver.de (mreue105 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 0MXXx0-1fsevk3Ccg-00WXXm; Fri, 25 May 2018 21:25:30 +0200
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
Subject: [PATCH V3 4/6] ARM: bcm2835_defconfig: Enable RPi voltage sensor
Date:   Fri, 25 May 2018 21:24:37 +0200
Message-Id: <1527276279-23876-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:lP6goZ+Ei9VuerlUyOGKKPYVWFH+gZX34o2WczJ2oMaq3ZI2Dv7
 D9AMaTJBX1YTbzC/+irAAP9DW12ZGnpz++zPS7XMIL6aSSfGolID6qJ0GOlGUoAFl/YhpN2
 xoaqKoLuu/6EMR8C3TxApvTHK0z3lgHS+nggMEEsVO0M3+5GfGnWywiv7B8eqkAvWcmSitR
 n4CI2tVJpq39m8Wo0eG+g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:mQXU8bLVqcM=:cgSCo5ZApGYosgTh8LEtdG
 YVK5y3/nxwKVXny4XG3CNeSArRS8LZ61VZDfs7bhgv4vqYrlSoC/arasB6CrsQyjbe5QTijVa
 A4k2XhclEvsNs+2x1lJ25z9LtYMiuEvilAVlmblwCdsHTBcU7xXnkV2V3MEa3ZACxkaTSonXa
 Ajaw3aStNv4rZZCdYdwD6eu5Vvxk9RR1Ektd9Zs86/e/MIFCkS4fQb2iH3wAdADndkPAI3Ohb
 uPE6yKDoFcl3sqT7JW+Wx3T6PhCfVpSw/aNAC1XbfCvJKSdmhEXJXvPadkpigKE12UvTHZPWZ
 JM+B3C/qqrepQJYoc566VqDTtCb1ynmNRh1h1JUK1PXCmkEirHXXllEI7F/40Kq3/Oil9Zxq/
 iy+ToGsQACCBfGakEGkC5F0FkC9W/KeV6ucwHEvPv0jYw2P65A8llkGIl5sRrT7n1NxWyecKo
 vYl3ITWEpIypybghEi7gxCUkErU9ANNHFOej+d5wwgtpZF5bZwf6+qMGAug2GOegQ2kzrikoz
 iOX6Tf/5GfEQkWq032HdYEnwOpvK8EFjnSAjtIKzo8I+g+/+cAmq+5M6UiYeR7fH2dIEOMp0G
 6UisqtrCaTlUc/7QksqqLJm4GvUHYxMpyjmFBeJoHLPx+fn4ZlJTYAF9tf3iMWH5IP+W5CVbJ
 hjT7rt96rjg51hOIl7lCv0aMn75zUviTtc3dqsuT+obGpFrzWeXv2xPceBhBWIIdtglM=
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
