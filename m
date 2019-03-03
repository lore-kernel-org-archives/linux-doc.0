Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2412B7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  3 Mar 2019 12:38:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfCCMi0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 3 Mar 2019 07:38:26 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51256 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfCCMi0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Mar 2019 07:38:26 -0500
Received: by mail-wm1-f66.google.com with SMTP id n19so2079527wmi.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Mar 2019 04:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kragniz.eu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wmaRd8ftTs0lTwJsk22PI1aI1d7YGIyjW6+ZlePZZRA=;
        b=FxCPFdBUCe/SxF0aNwT2urt3QRwAYO+32y3KXD4NuawGGWWesM+V1s3j51RWhqWy/g
         dHSzL7u/vb39uewF5j5S0qOjap2XQRWo2rN4+peaLR6HJROoBv4+FzmXU9OurngAvvUq
         +mAdo2zvj2sU4HDrsbuMjVTIA6sUn2JI9Wzoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wmaRd8ftTs0lTwJsk22PI1aI1d7YGIyjW6+ZlePZZRA=;
        b=In0kI7gJxAio7RdaOy5uIkRTvI59vTSqCB3MscZAieFFppbUaoPg2NglyDiD9DqU3l
         lqnSPaRNIDEt1BEA/bLhSD/B5cUtYzB00j0DWEHP6ny8qXUJmfGcgB47JUEovRxoTKG7
         H9MRyKnjawJ4ifmt7EmCcKT72QBJVFitxXs4xN490qR9Y/hpvr6RcuPKKnrExhWtbYC5
         aUdDgStBZG9x1x+Nl+opr9IYkCgQxtsUWqGXRZ6PoFLfyXTZaxyMQphXaM/vkTr3sbXz
         JBsnqImLGuwqQCwe1Wfw0HW+0mgoGFh4S0Vdg/gsaddr7FVO9rYHA8KlHSS13QUKkNxz
         Xvcw==
X-Gm-Message-State: AHQUAuaM+040nsn++pr05k1LPUb2ONZWpK3t+SN8zVqUJfRlSpov9Bho
        VW7xy3ntYSMF5hKEOqzBuyrRFA==
X-Google-Smtp-Source: AHgI3IZkppvMGYiC8GNycYO8l2mL3PmpFcD4Znjme3vwD5cqO4IeHBz31wAvId4+qri99+h9IJxrBg==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr8701045wmi.92.1551616704496;
        Sun, 03 Mar 2019 04:38:24 -0800 (PST)
Received: from localhost.localdomain ([95.149.160.3])
        by smtp.gmail.com with ESMTPSA id t202sm9450783wmt.0.2019.03.03.04.38.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Mar 2019 04:38:23 -0800 (PST)
From:   Louis Taylor <louis@kragniz.eu>
To:     corbet@lwn.net
Cc:     pmladek@suse.com, geert+renesas@glider.be,
        andriy.shevchenko@linux.intel.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        ndesaulniers@google.com, jflat@chromium.org,
        Louis Taylor <louis@kragniz.eu>
Subject: [PATCH] docs: add extra integer types to printk-formats
Date:   Sun,  3 Mar 2019 12:36:47 +0000
Message-Id: <20190303123647.22020-1-louis@kragniz.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A few commonly used integer types were absent from this table, so add
them.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Louis Taylor <louis@kragniz.eu>
---
 Documentation/core-api/printk-formats.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index a7fae4538946..6f08b1b6240a 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -19,8 +19,16 @@ Integer types
 		unsigned long		%lu or %lx
 		long long		%lld or %llx
 		unsigned long long	%llu or %llx
+		short int		%hd or %hx
+		unsigned short int	%hu or %hx
+		char			%hhd or %hhx
+		unsigned char		%hhu or %hhx
 		size_t			%zu or %zx
 		ssize_t			%zd or %zx
+		s8			%hhd or %hhx
+		u8			%hhu or %hhx
+		s16			%hd or %hx
+		u16			%hu or %hx
 		s32			%d or %x
 		u32			%u or %x
 		s64			%lld or %llx
-- 
2.20.1

