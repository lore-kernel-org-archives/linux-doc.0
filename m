Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5F2C2B9F2
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 12:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E32B761164
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 12:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhEVMmb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 May 2021 08:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbhEVMm3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 May 2021 08:42:29 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A433C061574;
        Sat, 22 May 2021 05:41:04 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id m190so16418778pga.2;
        Sat, 22 May 2021 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/oLh8QQEu9IbViO8GBt8jcTMTvvy9pU87rouSOET/to=;
        b=MjyfcplkUAvE2v0WCTF3dR+0HwunqK32tpesvAJdPbn149deALZ8TwGD7MSXugto8i
         eLeznkHFaYETGYRxb5VHIJTFJa9S9eBZV47KkrunJo5sGtac6jqenASIJsewToItWVfI
         fGPH4rXjdTuVdV4VD4onyg8ESrRSDJuuLLzRIg+HHK878G2xVJU3CMm9NnjlshfkiUjj
         5FI8Cd+KGCgoUCBHFsSacroxDINZ/yA5wAbRo/5lR0ObA+bFjpXDR9zqijEsk6bu+kLV
         KZdc9NAE0s5e9ZG+APPtBarqkWqPjT267gH3Y+fhJ5FIMtJKPAVj1aanorusd3At8hB/
         yQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/oLh8QQEu9IbViO8GBt8jcTMTvvy9pU87rouSOET/to=;
        b=jy/s3DLfB3LGnfWf3mGi4Fmu31w1wOSiS+dd9Co/szulNwrO66DoCW6gVsbWtRzlnq
         GGHoeonJd27LsiCOqD8KA3FnQ5Hxyz/qPqv6VXvGOO+RBfhDWKZhiUEGATDRWlvqYCjO
         Zk9Hnc8R2KrK6phL5H6Bxv4HPtRLi1ve9jzi5uIhPGWqQTsb5PnvrWazC6+k64GmFeug
         g0aelczqqGl3q779Okyj9m3Suag11h229iBFRK8yEBTKt8CyfpRILEzUbdqRB9NntvWj
         ckkM/AvlaU/osT7kUWY/MP7IM81HHVxQJkj3hL6K+pYqOO5VesDVbovw8m6YVm6fh54l
         KZbQ==
X-Gm-Message-State: AOAM532ne5G+J6cO/bERTdtJSqAPOef0I2G7EtWcXMzjS/7n1/G54AXH
        cKbhQ/86Nq914QmqErL0UPU=
X-Google-Smtp-Source: ABdhPJzZSFVrXPc2rEQh3CUG0Hq0TM+eGnAJZ8HxM1di5dh3cwuMGRWLxFtZK9IZCYZp5nxfcUY4Gg==
X-Received: by 2002:aa7:88c3:0:b029:2e3:d6dc:7c6f with SMTP id k3-20020aa788c30000b02902e3d6dc7c6fmr11234412pff.35.1621687263445;
        Sat, 22 May 2021 05:41:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:d9c2:4477:9177:8c76])
        by smtp.googlemail.com with ESMTPSA id f7sm6706109pfq.8.2021.05.22.05.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 05:41:03 -0700 (PDT)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     siglesias@igalia.com
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        jens.taprogge@taprogge.org, gregkh@linuxfoundation.org,
        industrypack-devel@lists.sourceforge.net
Subject: [PATCH] ipac: tpci200: fix kernel-doc syntax and remove filename from file header
Date:   Sat, 22 May 2021 18:10:51 +0530
Message-Id: <20210522124051.12540-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/ipack/carriers/tpci200 follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc.

For e.g., running scripts/kernel-doc -none on
drivers/ipack/carriers/tpci200.c emits:
warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * tpci200.c

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Also remove the redundant file name from the comment headers.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/ipack/carriers/tpci200.c | 4 +---
 drivers/ipack/carriers/tpci200.h | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/ipack/carriers/tpci200.c b/drivers/ipack/carriers/tpci200.c
index ec71063fff76..a867906777bd 100644
--- a/drivers/ipack/carriers/tpci200.c
+++ b/drivers/ipack/carriers/tpci200.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
- * tpci200.c
- *
+/*
  * driver for the TEWS TPCI-200 device
  *
  * Copyright (C) 2009-2012 CERN (www.cern.ch)
diff --git a/drivers/ipack/carriers/tpci200.h b/drivers/ipack/carriers/tpci200.h
index 2619f827e33f..e79ac64abcff 100644
--- a/drivers/ipack/carriers/tpci200.h
+++ b/drivers/ipack/carriers/tpci200.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/**
- * tpci200.h
- *
+/*
  * driver for the carrier TEWS TPCI-200
  *
  * Copyright (C) 2009-2012 CERN (www.cern.ch)
-- 
2.17.1

