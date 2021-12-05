Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6E0C433F5
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbhLENsw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbhLENsv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:48:51 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CA1C061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:24 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id q17so5324508plr.11
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mXiMahMwaAYskx2hce7m5NJyGFIrPvOS/GOkg3bjblo=;
        b=bx6cjGJb4golrPPDvQ3XADslX7x2TcpNdGyg9nUwysU7/8atXE1YCS0TDZK3yIMp2M
         kCCqYHOX0r6lo5G8e+wkosTvscVJf4ae8FBYR9jIZK9xI/UaQH9WdV45hIjSAwbHNz+G
         LNfUiUKixaU0n25ZvjxH4vzn0wOSH3ttdd9vWuaqZKY6i0mWkWl9xrFKH2fyjFQ/ksPs
         7Qc0d04hv5RPlDq2hhmmfCwknew/Z8B8ysqpV/DkLNe0qSGbkb3wUt45tBWFUPxnPRej
         85HqrOuZR7vPlf2XflAafnbAhwdv+IVF8Km7pnO6JRQSp3tnI2WkdFdwn5IOGIu6TGcw
         zRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mXiMahMwaAYskx2hce7m5NJyGFIrPvOS/GOkg3bjblo=;
        b=w1kO9gaQ+d+LfAJtklCHU28ovuzbGNMHM47gYyHavEvyJ/NW/UAjlejruv/wGn3L1w
         oUnPW5kEljaNpMqWusYg5Ae7j4TcOTA15AQBuu+3ZglY0KenFieSb1clrALevs7WaMa8
         /vVFsLpAH7dCv4KwMT3P5H9WbF61VPQHJGN/WgILSVX9LxEHpmSFOWTF3PZt0YUp+/dp
         WsCZXCAAJBOxI0O42uIAXxgwrNNrmTyQDFE2fSK0MlTc9D1ozWB2q61LiPCqObNogUdd
         jmYqTkR2p8kh8R5OE/auG9rLc1Yzl6Hf55Rh+DyvRu/B3q1UTKxPXAFR/w0LzYmJFslk
         Xx1A==
X-Gm-Message-State: AOAM531xegi9p3nIL7VFlivjcARV6LJq2nH8gTmSXKhejwQj/ILO3bKj
        jcUP6a4dNhGsgypqc7MTgP/ZgfU6qlSdyg==
X-Google-Smtp-Source: ABdhPJy2CTVpv1zpznipwDl17/raLXn4WwSqzHVm0VfLIYdmSnd0X1hm1AzxULWRtd/pte4UESJ6uA==
X-Received: by 2002:a17:902:7b8d:b0:143:95e3:7dc0 with SMTP id w13-20020a1709027b8d00b0014395e37dc0mr37303528pll.21.1638711924179;
        Sun, 05 Dec 2021 05:45:24 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:23 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 01/11] docs/driver-api: Reformatting serial ngsm
Date:   Sun,  5 Dec 2021 21:43:50 +0800
Message-Id: <6976a61ec50f837f482751c427af8598b30cc497.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added necessary indents and blank lines, optimized typography in html documents.eg:

 "1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl. 1.4 obtain base gsmtty number for the used serial port."

Here's what they should have looked like:

 1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.

 1.4 obtain base gsmtty number for the used serial port.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/driver-api/serial/n_gsm.rst | 246 +++++++++++-----------
 1 file changed, 126 insertions(+), 120 deletions(-)

diff --git a/Documentation/driver-api/serial/n_gsm.rst b/Documentation/driver-api/serial/n_gsm.rst
index 8fe723ab9c67..4fca5b16a0f3 100644
--- a/Documentation/driver-api/serial/n_gsm.rst
+++ b/Documentation/driver-api/serial/n_gsm.rst
@@ -15,130 +15,136 @@ How to use it
 1. config initiator
 ^^^^^^^^^^^^^^^^^^^^^
 
-1.1 initialize the modem in 0710 mux mode (usually AT+CMUX= command) through
-    its serial port. Depending on the modem used, you can pass more or less
-    parameters to this command.
-1.2 switch the serial line to using the n_gsm line discipline by using
-    TIOCSETD ioctl.
-1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
-1.4 obtain base gsmtty number for the used serial port.
-
-Major parts of the initialization program :
-(a good starting point is util-linux-ng/sys-utils/ldattach.c)::
-
-  #include <stdio.h>
-  #include <stdint.h>
-  #include <linux/gsmmux.h>
-  #include <linux/tty.h>
-  #define DEFAULT_SPEED	B115200
-  #define SERIAL_PORT	/dev/ttyS0
-
-	int ldisc = N_GSM0710;
-	struct gsm_config c;
-	struct termios configuration;
-	uint32_t first;
-
-	/* open the serial port connected to the modem */
-	fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NDELAY);
-
-	/* configure the serial port : speed, flow control ... */
-
-	/* send the AT commands to switch the modem to CMUX mode
-	   and check that it's successful (should return OK) */
-	write(fd, "AT+CMUX=0\r", 10);
-
-	/* experience showed that some modems need some time before
-	   being able to answer to the first MUX packet so a delay
-	   may be needed here in some case */
-	sleep(3);
-
-	/* use n_gsm line discipline */
-	ioctl(fd, TIOCSETD, &ldisc);
-
-	/* get n_gsm configuration */
-	ioctl(fd, GSMIOC_GETCONF, &c);
-	/* we are initiator and need encoding 0 (basic) */
-	c.initiator = 1;
-	c.encapsulation = 0;
-	/* our modem defaults to a maximum size of 127 bytes */
-	c.mru = 127;
-	c.mtu = 127;
-	/* set the new configuration */
-	ioctl(fd, GSMIOC_SETCONF, &c);
-	/* get first gsmtty device node */
-	ioctl(fd, GSMIOC_GETFIRST, &first);
-	printf("first muxed line: /dev/gsmtty%i\n", first);
-
-	/* and wait for ever to keep the line discipline enabled */
-	daemon(0,0);
-	pause();
-
-1.5 use these devices as plain serial ports.
-
-   for example, it's possible:
-
-   - and to use gnokii to send / receive SMS on ttygsm1
-   - to use ppp to establish a datalink on ttygsm2
-
-1.6 first close all virtual ports before closing the physical port.
-
-   Note that after closing the physical port the modem is still in multiplexing
-   mode. This may prevent a successful re-opening of the port later. To avoid
-   this situation either reset the modem if your hardware allows that or send
-   a disconnect command frame manually before initializing the multiplexing mode
-   for the second time. The byte sequence for the disconnect command frame is::
-
-      0xf9, 0x03, 0xef, 0x03, 0xc3, 0x16, 0xf9.
+  1.1 initialize the modem in 0710 mux mode (usually AT+CMUX= command) through
+      its serial port. Depending on the modem used, you can pass more or less
+      parameters to this command.
+
+  1.2 switch the serial line to using the n_gsm line discipline by using
+      TIOCSETD ioctl.
+
+  1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
+
+  1.4 obtain base gsmtty number for the used serial port.
+
+  Major parts of the initialization program :
+  (a good starting point is util-linux-ng/sys-utils/ldattach.c)::
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <linux/gsmmux.h>
+    #include <linux/tty.h>
+    #define DEFAULT_SPEED	B115200
+    #define SERIAL_PORT	/dev/ttyS0
+
+    int ldisc = N_GSM0710;
+    struct gsm_config c;
+    struct termios configuration;
+    uint32_t first;
+
+    /* open the serial port connected to the modem */
+    fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NDELAY);
+
+    /* configure the serial port : speed, flow control ... */
+
+    /* send the AT commands to switch the modem to CMUX mode
+       and check that it's successful (should return OK) */
+    write(fd, "AT+CMUX=0\r", 10);
+
+    /* experience showed that some modems need some time before
+       being able to answer to the first MUX packet so a delay
+       may be needed here in some case */
+    sleep(3);
+
+    /* use n_gsm line discipline */
+    ioctl(fd, TIOCSETD, &ldisc);
+
+    /* get n_gsm configuration */
+    ioctl(fd, GSMIOC_GETCONF, &c);
+    /* we are initiator and need encoding 0 (basic) */
+    c.initiator = 1;
+    c.encapsulation = 0;
+    /* our modem defaults to a maximum size of 127 bytes */
+    c.mru = 127;
+    c.mtu = 127;
+    /* set the new configuration */
+    ioctl(fd, GSMIOC_SETCONF, &c);
+    /* get first gsmtty device node */
+    ioctl(fd, GSMIOC_GETFIRST, &first);
+    printf("first muxed line: /dev/gsmtty%i\n", first);
+
+    /* and wait for ever to keep the line discipline enabled */
+    daemon(0,0);
+    pause();
+
+  1.5 use these devices as plain serial ports.
+
+     for example, it's possible:
+
+     - and to use gnokii to send / receive SMS on ttygsm1
+     - to use ppp to establish a datalink on ttygsm2
+
+  1.6 first close all virtual ports before closing the physical port.
+
+     Note that after closing the physical port the modem is still in multiplexing
+     mode. This may prevent a successful re-opening of the port later. To avoid
+     this situation either reset the modem if your hardware allows that or send
+     a disconnect command frame manually before initializing the multiplexing mode
+     for the second time. The byte sequence for the disconnect command frame is::
+
+        0xf9, 0x03, 0xef, 0x03, 0xc3, 0x16, 0xf9.
 
 2. config requester
 ^^^^^^^^^^^^^^^^^^^^^
 
-2.1 receive string "AT+CMUX= command" through its serial port,initialize
-    mux mode config
-2.2 switch the serial line to using the n_gsm line discipline by using
-    TIOCSETD ioctl.
-2.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
-2.4 obtain base gsmtty number for the used serial port,
-
-  #include <stdio.h>
-  #include <stdint.h>
-  #include <linux/gsmmux.h>
-  #include <linux/tty.h>
-  #define DEFAULT_SPEED	B115200
-  #define SERIAL_PORT	/dev/ttyS0
-
-	int ldisc = N_GSM0710;
-	struct gsm_config c;
-	struct termios configuration;
-	uint32_t first;
-
-	/* open the serial port */
-	fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NDELAY);
-
-	/* configure the serial port : speed, flow control ... */
-
-	/* get serial data and check "AT+CMUX=command" parameter ... */
-
-	/* use n_gsm line discipline */
-	ioctl(fd, TIOCSETD, &ldisc);
-
-	/* get n_gsm configuration */
-	ioctl(fd, GSMIOC_GETCONF, &c);
-	/* we are requester and need encoding 0 (basic) */
-	c.initiator = 0;
-	c.encapsulation = 0;
-	/* our modem defaults to a maximum size of 127 bytes */
-	c.mru = 127;
-	c.mtu = 127;
-	/* set the new configuration */
-	ioctl(fd, GSMIOC_SETCONF, &c);
-	/* get first gsmtty device node */
-	ioctl(fd, GSMIOC_GETFIRST, &first);
-	printf("first muxed line: /dev/gsmtty%i\n", first);
-
-	/* and wait for ever to keep the line discipline enabled */
-	daemon(0,0);
-	pause();
+  2.1 receive string "AT+CMUX= command" through its serial port,initialize
+      mux mode config.
+
+  2.2 switch the serial line to using the n_gsm line discipline by using
+      TIOCSETD ioctl.
+
+  2.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
+
+  2.4 obtain base gsmtty number for the used serial port,
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <linux/gsmmux.h>
+    #include <linux/tty.h>
+    #define DEFAULT_SPEED	B115200
+    #define SERIAL_PORT	/dev/ttyS0
+
+    int ldisc = N_GSM0710;
+    struct gsm_config c;
+    struct termios configuration;
+    uint32_t first;
+
+    /* open the serial port */
+    fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NDELAY);
+
+    /* configure the serial port : speed, flow control ... */
+
+    /* get serial data and check "AT+CMUX=command" parameter ... */
+
+    /* use n_gsm line discipline */
+    ioctl(fd, TIOCSETD, &ldisc);
+
+    /* get n_gsm configuration */
+    ioctl(fd, GSMIOC_GETCONF, &c);
+    /* we are requester and need encoding 0 (basic) */
+    c.initiator = 0;
+    c.encapsulation = 0;
+    /* our modem defaults to a maximum size of 127 bytes */
+    c.mru = 127;
+    c.mtu = 127;
+    /* set the new configuration */
+    ioctl(fd, GSMIOC_SETCONF, &c);
+    /* get first gsmtty device node */
+    ioctl(fd, GSMIOC_GETFIRST, &first);
+    printf("first muxed line: /dev/gsmtty%i\n", first);
+
+    /* and wait for ever to keep the line discipline enabled */
+    daemon(0,0);
+    pause();
 
 Additional Documentation
 ------------------------
-- 
2.27.0

