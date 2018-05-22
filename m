Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 650D27D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751390AbeEVLXR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:23:17 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbeEVLXQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:23:16 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0Lu0Dy-1gKzNj1IyU-011VHn; Tue, 22 May 2018 13:22:29 +0200
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
Subject: [PATCH RFC V2 6/6] arm64: defconfig: Enable RPi voltage sensor
Date:   Tue, 22 May 2018 13:21:52 +0200
Message-Id: <1526988112-4021-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:2JDC3WbL+HzXFz/v+j0VyWY0m0N3dDSyY9l4kdSgyvxwR4wouwq
 em3gfRK2u/gPLqncz3lQlnnsrfeMbbvPa8blvxF7XUvsJkzy2BqmaWOP8c4QvEAcGZzKtp+
 KGZENeDblb3RQU3k+nYLsIoYR6cm7PuUcu4oARIKtLiYbRmOmta6M5KOUvlN6gF3Y0/rVgL
 rf7r+/+yoTAF021Xu5Jrw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:E3Z1GZlTK/0=:HzEOD3O328H6r7xjl6Bpqq
 uNKKmE2dEp3T9g/ITvMIeSh6h13XKDg1zvj+k3XPSaQtoQhnZAi0Z9tzfAdiI5e4jxkSyJzMm
 uY/g1SzYG9dvi+TEO/DltcCkmvID4OjW1UmlgFUBtwmj9429uZuEHz5E0gdhXChiY7tSLZQzS
 DUca96XonCjHDegfqGffKaXKXBcqeNgrHgSTqYvlkEIO3D/nrHlv5LMrnyf6EihW2yg3yhrEQ
 hdPsgpCAwARJSymV4+KwUH/rZNsRUE0hyODFBSA5vHRfrOWs+P1OxRsUfLi1lG4AaceAgAVeK
 8lxS13/ai9BRrz5VvfjnopqO0bJgzxq0aQYeJFLlTcHCs1K4Xb82pFMDiSlIHCjutkbTlfRvt
 Se5qdIgi6znOMFS/M+jKtQ+0e6D0vFgBIsEjblJVYCufSgAy6+vvSYBHfHYzSW3oyP9O1AAVb
 3+R17fyRzzBWS1JUhpNnwmIze4KmJs9gDyCx/eh3G80/sYKbOsA49jl6wMW9dufPpAisMNxDj
 31Z0rmduf7exZ5oyRMTiyhFAOcw1mFLiM/miemXJpByxhW3d+tsaXNeC9lSe/Lbhdtkb+VsPX
 xRNw94YmSUFSPqWJqi+oMYenHgAG0dCMhSghODT9umRxjfDBOGVu6wbfffChLjVBxI0NnthtA
 8c0IK7CttXxise/aH+JfjaIgICirIb9u8hobSoipL+ixdOOs0D7p/YCGmqaG4oSM+Rh0=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The patch enables the hwmon driver for the Raspberry Pi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d25121b..5cdecef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -352,6 +352,7 @@ CONFIG_BATTERY_BQ27XXX=y
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_INA2XX=m
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
