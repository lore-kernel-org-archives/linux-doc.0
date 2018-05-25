Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D2777DF8A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968141AbeEYT0x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:26:53 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41023 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968080AbeEYT0w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:26:52 -0400
Received: from localhost.localdomain ([37.4.249.126]) by
 mrelayeu.kundenserver.de (mreue105 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 0LoIBN-1fy88J0kOH-00gGpJ; Fri, 25 May 2018 21:25:30 +0200
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
Subject: [PATCH V3 3/6] firmware: raspberrypi: Register hwmon driver
Date:   Fri, 25 May 2018 21:24:36 +0200
Message-Id: <1527276279-23876-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:5/glqBSRr+GCqLbBoDcvonObxWtmdCin/bXngeLT1FFF+c757lJ
 xREwJKsf07f9h6LeBJJptCZlbibGDDEiBEGUe2AIx8BPzzBofhi+jCe8QN1kIh390kW7aNT
 vheLqWW+gmjV8r5UpCA8rK8Al8XGfPaSfUgKpyJmzVOJiPP2vfoymssa8Isenp1Wjo6Z+vA
 6VgZXQwGDa+G2PvXUqrYQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:pER58D4QwO0=:FjlE46rHuibKXZrvEJ3RtC
 TBjiavcter+5WGwDpS/+8S/duemd6kj3lI801s4i9b7O74Qn8RKo2nOpqOWWT/NHHxUQqzqSs
 8PMvgraV/Rgk9r8IxE2kCex3i4JKhX1cryoITgkPcTnyaAxiz/TiUXOmECK0Df4NhxJfyvuc5
 JDIku4e3jXIlUxNczHtal6c5SQL8GAvcfZGiVKYm6mnc0QNxO/5o7W7OCMmUYgRkg+az+HafR
 V70PD6y2ER2QTxz0KT9Shf1HB4lYhY8237yPjDQLKBu2S83LjCldSm/EhfuqlGZcuOVd+D4Kw
 Vtw2AfcH6Z2suN36+AQgeLxsOmhNy2aGi9nSifsIG4ggFMZ5sQrGnlPI7ohQpkZJ9cizM8wle
 3UX2NVls5YIcKs2BxFMFZOXAZy0yCB/WEoDTMQv0kkX2LLwOmgetnBDJ5VUzDIeS79HobBfWg
 +cyPEslw0PAqY8WHCHR7kdnjYj1nIJl09O7T9RHChtIg1wmFC7McnQicpfhWuCEcvGvclNfb+
 pcRhE/gQUJ8iPCSPYOpay0PnjGbpZHlBF39n6ZIUp8lEJ5TR80SfrF5Ay+lwLOy15dTasXFXy
 AAJu68z2N70zxKEHMcEDWqDlh6W1OT2cd12/xm2df0kATXtcbIFqxNDU/YSr9uXR7l1Hf6Iyk
 SbLICUpbOWmctH1Xt8wt6YvM8iAVH2hv08T+telvGmRUmiMMuZW0oz8rSM419GLhQ5co=
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
