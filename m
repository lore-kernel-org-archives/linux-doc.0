Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E10F7D085
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 11:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750733AbeEVLXT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 07:23:19 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59189 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751060AbeEVLXQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 07:23:16 -0400
Received: from localhost.localdomain ([37.4.249.136]) by
 mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 0LlJ1m-1fuh6b1Qfu-00b0Bn; Tue, 22 May 2018 13:22:27 +0200
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
Subject: [PATCH RFC V2 3/6] firmware: raspberrypi: Register hwmon driver
Date:   Tue, 22 May 2018 13:21:49 +0200
Message-Id: <1526988112-4021-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:fMSwKQEm0FqtE+V6H0dPaG/ijcd5SJCKzZWD62lq1y3ka+dUu6Y
 4P6DZkfDFRgdhKEVCc+arsgKRLCqle51jcZm4SI/QUNhXuQyf0FaXktJ9Zf/DkTcftHt+il
 akl5YV/qXp7mK2m3xTDAom5+M/6+bYF/RPKcp6ScPDwSY8GrzNKIrm/cbiWDpIDaMsPbw7u
 g3xpm0FYz8OXHrkNUst1g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Id4x2yj9Kh8=:+aFp3KFGQC+EMGvw73bO8k
 q8yJXwFqf4QcGt65m3aNZ57orjFvL9CkeziOtDY2m+5IrpHllxlTuiFVc88eW3c2pBtlqrCCV
 OSMxUZjUf3JFXxIlCll7cQZyks9Jziuytlp8x0BMYaPS93wSXV18IXXGaoJW1wSzNxf7YgEab
 aS14EmFnN5mcJoAn5ggdjzrVu2fZYINloZc4mQmU+uNYRoRquhSPWyldauMbuke4rKnhoDxII
 X/16BLMqD4ST++2Qwytwxaiipau58HLBJVxbQ12Wv0Z4Fwp7SM23YeH8bh4cYZKl0VFzSIpVt
 BeTIotGRKSKUoS8HjQIw/38kpqQUHQkjWhWHUjVw2MKUO87vSz91xWcInfzjn67cNXtV+Td1m
 AJtO/6oSbX2wXQb5Jis6J223ndNgHwPg9wCVcdMhwQn+4dxvLf1shJogOsEi1DTkC9HUR63EM
 q+9aFAXyCr4fylE2k1eCIuS7MIpD0q+an4G8JS2mrEbiz0DOZpNOMd0FydE76Qe6pYgyJwP11
 zzRLvi1QArDqmrhENkq2LkNJpn/OtcCG1Djg2URZo4pf975mdCmFPetl11ns/VEwtuS6UEYf6
 v7rNcwPQOa7Va7Y6kOMQk0fqVTxLAC2ogF/NeiDKxpP5IcY75FBiHn/VHPmP7KNXZFaf6Geod
 176LPGrkaotZgCfxD8kVJBZOSclHbmM+84mXQO7AR03Bh7uDwchcayvf0Jy903Rkbv30=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since the raspberrypi-hwmon driver is tied to the VC4 firmware instead of
particular hardware its registration should be in the firmware driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/firmware/raspberrypi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 6692888f..0602626 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -21,6 +21,8 @@
 #define MBOX_DATA28(msg)		((msg) & ~0xf)
 #define MBOX_CHAN_PROPERTY		8
 
+static struct platform_device *rpi_hwmon;
+
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
@@ -183,6 +185,20 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 	}
 }
 
+static void
+rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	u32 packet;
+	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
+					&packet, sizeof(packet));
+
+	if (ret)
+		return;
+
+	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
+						  -1, NULL, 0);
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -209,6 +225,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fw);
 
 	rpi_firmware_print_firmware_revision(fw);
+	rpi_register_hwmon_driver(dev, fw);
 
 	return 0;
 }
@@ -217,6 +234,8 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 {
 	struct rpi_firmware *fw = platform_get_drvdata(pdev);
 
+	platform_device_unregister(rpi_hwmon);
+	rpi_hwmon = NULL;
 	mbox_free_channel(fw->chan);
 
 	return 0;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
