Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D29C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 23:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0C88610F9
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 23:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbhHSXf5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Aug 2021 19:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhHSXf5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Aug 2021 19:35:57 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819AFC061575
        for <linux-doc@vger.kernel.org>; Thu, 19 Aug 2021 16:35:20 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id e15so6088459qtx.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Aug 2021 16:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dionne-riel-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=5sobGx0tRe8pKTPFn4/atmNEcQPe4rscXgE2WnioFBY=;
        b=qVDOYjkfgKtgNsmo9Rb5Z2QILHn5sguMj6F4zGaVUsoyJw4gnzkXBYXf0Z4FTw/coa
         MRhrMLx7sJzUC+UKe4vzBcqYvay+MYz55dQVS5tXxUZuSkdCqawVv16+SxmUSfVOB5X+
         Dre1a6gSDAL4GuRM4AKZmalfzZN/jadHxSVz1PYgpfKZSK19laCB2gf5aXj5XblYY5Ag
         uO5OYUyd7Yo2xYpQ/weoKKvNqqXdEL3KP2WJN9RJWtXHa7jZYnqscOUkend/0yc8/RlC
         q8lv9KboBgzz3AZDzKdslRQAe11b7iH5FGByvrkZw1XwX37mIQFaSkfXdRmgXuwrnNFf
         nW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=5sobGx0tRe8pKTPFn4/atmNEcQPe4rscXgE2WnioFBY=;
        b=LoSKozhh8mAKKpf9OOmTp//jknwu6AHdTxusGPY93gT/OKuGVmWZH+tz42cPy7Y5Ve
         vmPNjoS+x4Ubo3Z/P6hpmm/X1TkBFFiiHGOxJFuQoido+7q+/QatPgPY0wQLfV4b2Btn
         n0UVQ0TIv6Ykg4PjFtD9WbmqenhXSvUgzoo1UrDpSNhg4XkNlaaYLews1YTnWiLJwHPZ
         Ot/ili64O5LxqGH7moRiKW6w4+c/GZIk+kD173EBS0lqLu4NzYgU/P9W7qYM5hVrEJqF
         g885eYwmdH3dlembGwmk2KcWm5CCNq/GXQ//NbBFY/oz2EI5bu4lrgqV/F2YPWqAeFE0
         V7Cg==
X-Gm-Message-State: AOAM531vhHSp+6cRzFBp3VusPQyPLWk0X5TjkZKZA+B15y/6CAEFDIsS
        eBoec917fyWSzxnhKgDmfzP4YcQiTiYnig==
X-Google-Smtp-Source: ABdhPJxzL5pPLMzYA8yvxuz7b8nwFCQuWDBeRiuR+b3AdT9FB1yyc7qKZFuPTyNhL+Cb4I0QLsI47w==
X-Received: by 2002:a05:622a:106:: with SMTP id u6mr15021759qtw.288.1629416119410;
        Thu, 19 Aug 2021 16:35:19 -0700 (PDT)
Received: from DUFFMAN (135-23-195-85.cpe.pppoe.ca. [135.23.195.85])
        by smtp.gmail.com with ESMTPSA id bl40sm2301414qkb.64.2021.08.19.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 16:35:19 -0700 (PDT)
Date:   Thu, 19 Aug 2021 19:35:17 -0400
From:   Samuel Dionne-Riel <samuel@dionne-riel.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net
Subject: [PATCH] docs: admin-guide: fix serial default / maximum
Message-ID: <20210819193517.20787edf.samuel@dionne-riel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The defaults and maximum described here are not right. E.g. the default
for amba-pl* is 38400, and meson_uart is 115200.

Finding out likely defaults can be done with the following grep

 $ grep -R 'int\s*baud\s*=\s*[0-9]\+' drivers/tty/serial/

While not all results will be in the .setup function for the console,
many are.

As for maximums, I couldn't trivially find out if 8250 does have a
maximum defined in the kernel driver, but some platforms do go higher,
e.g. the common baud rate for Rockchip hardware is 1500000.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/admin-guide/serial-console.rst    | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb89dbdedc463..6e0f8a8229bca 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -649,7 +649,7 @@
 			the form "bbbbpnf", where "bbbb" is the baud rate,
 			"p" is parity ("n", "o", or "e"), "n" is number of
 			bits, and "f" is flow control ("r" for RTS or
-			omit it).  Default is "9600n8".
+			omit it).  Default depends on the driver.
 
 			See Documentation/admin-guide/serial-console.rst for more
 			information.  See
diff --git a/Documentation/admin-guide/serial-console.rst b/Documentation/admin-guide/serial-console.rst
index 58b32832e50aa..41977dd13ab7e 100644
--- a/Documentation/admin-guide/serial-console.rst
+++ b/Documentation/admin-guide/serial-console.rst
@@ -29,8 +29,9 @@ The format of this option is::
 			defines the baudrate/parity/bits/flow control of
 			the port, in the format BBBBPNF, where BBBB is the
 			speed, P is parity (n/o/e), N is number of bits,
-			and F is flow control ('r' for RTS). Default is
-			9600n8. The maximum baudrate is 115200.
+			and F is flow control ('r' for RTS). Default depends
+			on the driver. The maximum baudrate depends on the
+			device.
 
 You can specify multiple console= options on the kernel command line.
 Output will appear on all of them. The last device will be used when
-- 
2.32.0
