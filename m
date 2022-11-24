Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30646C43217
	for <linux-doc@archiver.kernel.org>; Thu, 24 Nov 2022 12:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiKXMj5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Nov 2022 07:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiKXMjl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Nov 2022 07:39:41 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E52D904B
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 04:39:34 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id vp12so2587689ejc.8
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi315TgqSNV1QPewkqYmgMjgkgNVWKPQf5Z22dCDnMQ=;
        b=QRKkncHKXcLmYnIHRb9MRb64RXwSMIQpr5WdrOiLvKI+FVqJqf8r85LY0snhzKzO6m
         D4LFVAITrZdVXShdbeiNaf4W/BW8ZMQewJpu0g/cmUnIVqn1dAs7aUaRzLim125WVXaU
         75dfyn8fOkmRHAs3F2PDQbGQ3xyVzvfvQBsJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi315TgqSNV1QPewkqYmgMjgkgNVWKPQf5Z22dCDnMQ=;
        b=N/t3yGHz4uR4Jg7I66yxzespWIDD91FQw9lwQiwklkW2JiJ0MpvDzDg61N+qw5+ZJp
         wRC3WLOSXYCdxsq55pKnS0oJcPz+nFL+w3ykjtusWzmsvUnVa4L3KjUSQ+lVqhQtvfKH
         AkQwWMc3dez6YLDeJU9HT2Tsy9cM756Th1tu+z1wVquAY7NO3JHuYaz/tFGi4zxF01Hj
         ZlA4FfSy0wMkFwSxjLiU6i2f1JbCOT9VQW6THuMvTPf61rnm8agSJCYgS0a1Qrjup2Fc
         SAP/dexCAlQW7VP0XETNezYnj0B7gV8WVrrklQgWUb2Y165OPLzkTCvzbI+4wSOTk59J
         qX6Q==
X-Gm-Message-State: ANoB5pktbjIQ/Dq51HMkiXK7BvcAZ8vfN8OV6+TExVnJdg7vf4r3W6DU
        a8AIsnodLF8SQoqrVeVy59WoDQ==
X-Google-Smtp-Source: AA0mqf5DDa0nU6JXWRgX3qyMgbccNGtDBX4YR/xG9vC4Ggrj6H7wjKoQQek17NW8KcMLb+bg839p6A==
X-Received: by 2002:a17:906:b804:b0:7ad:90dd:4af with SMTP id dv4-20020a170906b80400b007ad90dd04afmr27429228ejb.488.1669293572933;
        Thu, 24 Nov 2022 04:39:32 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:7b70:9ff8:7491:883a])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7c991000000b004619f024864sm462866edt.81.2022.11.24.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 04:39:32 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Nov 2022 13:39:07 +0100
Subject: [PATCH v3 1/2] earlycon: Let users set the clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-serial-clk-v3-1-49c516980ae0@chromium.org>
References: <20221123-serial-clk-v3-0-49c516980ae0@chromium.org>
In-Reply-To: <20221123-serial-clk-v3-0-49c516980ae0@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=97od82rQM7J+dlJlURxYgrd+b0BH3VtzulTBdDQhZB4=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjf2X+C3xqMspNynDb56lIq9kJexgGty5sRyd8oqK+
 9WuEyM2JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY39l/gAKCRDRN9E+zzrEiFzrD/
 0V0c1UZ0Pymknlj5ClLphxk8ixlPP8rDNM5smW6l/SgzMmxkhL+P1L7lX3C5beGyhV2pL+9JGlyrIX
 ayiV0uB07JyMd4WjIIrD95kRb1p2qvVQ9Zxh8oHaButCm/y3z2Ut+RsjFwuZWdN8bhDXik8JwDLfcQ
 vvMgCkix3lde8aIrmDWmy5fyvlmf7SZ0CJAhEe/B//pRmc0A+xoDHHKQgigqqTrR0j6azNn6Rrid7g
 qrIV7l+QrIY1reh8sNduQV8SM/bWMsVVs600EG2qPplbqXjDJc3jN95xAwblkyh5n+NajEjoRnX0mn
 1FlSVvlO6V6YILpJULfUjR9EPy4DzgzidLpsf90w+YV82FKYvR6z7HjusM16liTcs9r0g0nUdXdbRV
 FQdKBDsfjvdkirwV8ojRNFmDU0S+Wh/wKLl5kBXjJjpWX4bqtXTbC5NMXp6QbW/WqBti2MNMhwAhgo
 KqkFhHViHoOanXHJmbE1d5ZzOYeUmaS6cs2sdCHCdKaIAPtGbKFseiknOq7O0L/UDYXYp2kVqK0OT1
 8BZGeFzew53w/865wCipAWyCtxCCtPd0RnfbhOByxLEo8L88Uq2buZVwlmrZKTkL0jZyRjt6rR9PrW
 cMlnJWgEYAaJC4RFWX0ERjnS5YBF6r/aT59XN87LPLKKgk4LEQn6lG4IGVkQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some platforms, namely AMD Picasso, use non standard uart clocks (48M),
witch makes it impossible to use with earlycon.

Let the user select its own frequency.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a465d5242774..9efb6c3b0486 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1182,10 +1182,10 @@
 			specified, the serial port must already be setup and
 			configured.
 
-		uart[8250],io,<addr>[,options]
-		uart[8250],mmio,<addr>[,options]
-		uart[8250],mmio32,<addr>[,options]
-		uart[8250],mmio32be,<addr>[,options]
+		uart[8250],io,<addr>[,options[,uartclk]]
+		uart[8250],mmio,<addr>[,options[,uartclk]]
+		uart[8250],mmio32,<addr>[,options[,uartclk]]
+		uart[8250],mmio32be,<addr>[,options[,uartclk]]
 		uart[8250],0x<addr>[,options]
 			Start an early, polled-mode console on the 8250/16550
 			UART at the specified I/O port or MMIO address.
@@ -1194,7 +1194,9 @@
 			If none of [io|mmio|mmio32|mmio32be], <addr> is assumed
 			to be equivalent to 'mmio'. 'options' are specified
 			in the same format described for "console=ttyS<n>"; if
-			unspecified, the h/w is not initialized.
+			unspecified, the h/w is not initialized. 'uartclk' is
+			the uart clock frequency; if unspecified, it is set
+			to 'BASE_BAUD' * 16.
 
 		pl011,<addr>
 		pl011,mmio32,<addr>
diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index a5f380584cda..3a0c88419b6c 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -120,7 +120,13 @@ static int __init parse_options(struct earlycon_device *device, char *options)
 	}
 
 	if (options) {
+		char *uartclk;
+
 		device->baud = simple_strtoul(options, NULL, 0);
+		uartclk = strchr(options, ',');
+		if (uartclk && kstrtouint(uartclk + 1, 0, &port->uartclk) < 0)
+			pr_warn("[%s] unsupported earlycon uart clkrate option\n",
+				options);
 		length = min(strcspn(options, " ") + 1,
 			     (size_t)(sizeof(device->options)));
 		strscpy(device->options, options, length);
@@ -139,7 +145,8 @@ static int __init register_earlycon(char *buf, const struct earlycon_id *match)
 		buf = NULL;
 
 	spin_lock_init(&port->lock);
-	port->uartclk = BASE_BAUD * 16;
+	if (!port->uartclk)
+		port->uartclk = BASE_BAUD * 16;
 	if (port->mapbase)
 		port->membase = earlycon_map(port->mapbase, 64);
 

-- 
b4 0.11.0-dev-d93f8
