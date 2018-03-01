Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C372A7E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 18:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1161010AbeCASnp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 13:43:45 -0500
Received: from mail-ot0-f193.google.com ([74.125.82.193]:37445 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034013AbeCASnk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 13:43:40 -0500
Received: by mail-ot0-f193.google.com with SMTP id t2so6521425otj.4
        for <linux-doc@vger.kernel.org>; Thu, 01 Mar 2018 10:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=zesxPuAQO0m1dVV/XoKbe06268DxOqpccjIBauwiHEA=;
        b=IK+2A0kzfa98Ghq4HJwQ1NB7sZl1qi2RLcwOmqRuxNH2IAXPke1eRE3QVp6R70rQ8w
         wo4IaMTsQX9tSyKIumePbqAzNQRfk3LzsFBJsyYZJ+KKaCkC2QMhOXVvttoYN/thtPHx
         Q6ubC7a/q1hbIQNiom+UbjKFHMA/MtcChhDks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zesxPuAQO0m1dVV/XoKbe06268DxOqpccjIBauwiHEA=;
        b=LYrQyuVS/iuOPOrCCNI3pHNpuRVg26a/Oz2hQqYbKjOgG5fWFQORSvI3cOi9ihi+/H
         Wco4bihQgxXnHdasEGnH32Vljl0C+vt1ddYzjNMHinbgN3+kzbSA/0uLBrxw4h2S6ewY
         szfzRMG6uDVwMW3fBukcepQYL7kbXes1pwH4uvA7v2nMA6+nJgzdcP59n/GwzAXTn8r/
         pD7NXwEf0CmRU5lIuh7scmZXTplD96NbAyFJ14wneg+OQFyNSL9+BXvNK0Dl8/Q+jfmo
         +tSU1fyUM8V//B70tgEx9E0EvXh2fIfRG2v8atPFctZzAE7n9f/CVCQdp5NKItS3HcD9
         T5GQ==
X-Gm-Message-State: AElRT7HWgAK3YLNpFH0UMtjjiDctSItOXM98KuDmCAuFYNP0V0R8lhIs
        W+/XamKNt445cp7vlFdNmaAtCA==
X-Google-Smtp-Source: AG47ELs9L6Dff6XlNjgf9gbK9+KgUlHHl/fIa4inrmbZYNzDGE3BNeyj5SssQLgduWlPst2F/pTmuA==
X-Received: by 10.157.50.182 with SMTP id u51mr2129515otb.307.1519929819960;
        Thu, 01 Mar 2018 10:43:39 -0800 (PST)
Received: from djkurtz2.bld.corp.google.com ([2620:15c:183:0:1cfd:61a5:7215:5f9c])
        by smtp.gmail.com with ESMTPSA id q12sm2326432oti.6.2018.03.01.10.43.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Mar 2018 10:43:39 -0800 (PST)
From:   Daniel Kurtz <djkurtz@chromium.org>
Cc:     adurbin@chromium.org, briannorris@chromium.org,
        Daniel Kurtz <djkurtz@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Tom Saeger <tom.saeger@oracle.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list),
        linux-serial@vger.kernel.org (open list:SERIAL DRIVERS)
Subject: [PATCH v2] earlycon: Allow specifying a uartclk in options
Date:   Thu,  1 Mar 2018 11:43:33 -0700
Message-Id: <20180301184335.248378-1-djkurtz@chromium.org>
X-Mailer: git-send-email 2.16.2.395.g2e18187dfd-goog
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently when an earlycon is registered, the uartclk is assumed to be
BASE_BAUD * 16 = 1843200.  If a baud rate is specified in the earlycon
options, then 8250_early's init_port will program the UART clock divider
registers based on this assumed uartclk.

However, not all uarts have a UART clock of 1843200.  For example, the
8250_dw uart in AMD's CZ/ST uses a fixed 48 MHz clock (as specified in
cz_uart_desc in acpi_apd.c).  Thus, specifying a baud when using earlycon
on such a device will result in incorrect divider values and a wrong UART
clock.

Fix this by extending the earlycon options parameter to allow specification
of a uartclk, like so:

 earlycon=uart,mmio32,0xfedc6000,115200,48000000

If none is specified, fall-back to prior behavior - 1843200.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 drivers/tty/serial/earlycon.c                   | 8 ++++++--
 include/linux/serial_core.h                     | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1d1d53f85ddd..20e72cada38e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -958,6 +958,9 @@
 			to be equivalent to 'mmio'. 'options' are specified
 			in the same format described for "console=ttyS<n>"; if
 			unspecified, the h/w is not initialized.
+			A UART clock rate can also be appended after the baud,
+			as in <options> = 115200n8,48000000; if unspecified,
+			the default 1843200 will be used.
 
 		pl011,<addr>
 		pl011,mmio32,<addr>
diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index 870e84fb6e39..e846f406a1c6 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -115,12 +115,17 @@ static int __init parse_options(struct earlycon_device *device, char *options)
 	}
 
 	if (options) {
-		device->baud = simple_strtoul(options, NULL, 0);
+		char *uartclk;
+		device->baud = simple_strtoul(options, &uartclk, 0);
+		if (*uartclk++ == ',')
+			port->uartclk = simple_strtoul(uartclk, NULL, 0);
 		length = min(strcspn(options, " ") + 1,
 			     (size_t)(sizeof(device->options)));
 		strlcpy(device->options, options, length);
 	}
 
+	port->uartclk = (port->uartclk) ?: BASE_BAUD * 16;
+
 	return 0;
 }
 
@@ -134,7 +139,6 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
 		buf = NULL;
 
 	spin_lock_init(&port->lock);
-	port->uartclk = BASE_BAUD * 16;
 	if (port->mapbase)
 		port->membase = earlycon_map(port->mapbase, 64);
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index b32df49a3bd5..b772f0d20b18 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -343,7 +343,7 @@ static inline int uart_poll_timeout(struct uart_port *port)
 struct earlycon_device {
 	struct console *con;
 	struct uart_port port;
-	char options[16];		/* e.g., 115200n8 */
+	char options[32];		/* e.g., 115200n8,48000000 */
 	unsigned int baud;
 };
 
-- 
2.16.2.395.g2e18187dfd-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
