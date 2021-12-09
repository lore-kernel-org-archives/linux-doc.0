Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7807AC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhLIJQd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234259AbhLIJQd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:16:33 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4509CC061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:13:00 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so6427283pja.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RsINyvlX37cUu8cjrzqko0ekV2yQw0MItyhYOdF0940=;
        b=iSygSZ4TvxGKockKw3zu+Jyli7tCK4gO/Q3vkuhDanVtJiJ7P1jECRACGSkYdI9ApZ
         Wn76C6htoRGQaJORuNc2PI2+K3imPagV4lPb6ZQ4tQV561qkdvgUvFiHz4xRekOzyY6k
         AkVnMF4Y8JpUMXcxVPwWGf+VF3ByR6SsH0pI6gTylpfFvJu+fM0I+pSD2cXUnFlICJLj
         09k+P+FBFHG1RnRUUZJnPy5psKCKSe0H5Pxz7bfQcQN2rgjaMzzYiA45aTpOUmrzzaI/
         tYqsaytFJD2paDA3KTx5sR9dI2U2ZdyAJ8hUlosFUxAbgQe2s+O9/ZG7uNwfXWETLAP5
         9DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RsINyvlX37cUu8cjrzqko0ekV2yQw0MItyhYOdF0940=;
        b=e5T7ZPhDF+g1Lg77cjpdjte4EUgTReeewVpewHFhUpKRN4PL6xqpWSQjEtAHpdX2o6
         4qUO5RfMZqONxnRxs9UnJ3IILyHNpKk7DLr5xb8S0Q+9LygmYdBjB97Hfrt7/AH3EPYt
         x35igYD3mdzNDxoSPYu7B7p+4rWPj3f33ZF6k5bRjJOeu54wLWhZGum8q36wQrZRL4RD
         Jxw1trx8mwM+xXb2k9YkoKV93nMG8HCEsQmSarX5EvG/YOJ2n/g0L15DLZkMbKPoFmFL
         xMbqFQ0OtHr9e1YASAc3HnnDlap9Lv64g7Q/gy+EwI7OTlHIC9LYmXb6+z3s2535ZunD
         Adqw==
X-Gm-Message-State: AOAM530H4THXYglQgUNJF4+Xe8MHb7lORD3pIx5Z2/KpOoUxzWjMCFVp
        FwPFlfk2p4jVAHWzIYd/rC8=
X-Google-Smtp-Source: ABdhPJyDmFmYzBbIj7Ac11rtdXLqxhKHeajALdObSpfNcuGJSRUEYB39mq+bWUbX/DpNBtWhQ4t71g==
X-Received: by 2002:a17:90a:49c2:: with SMTP id l2mr14207946pjm.23.1639041179735;
        Thu, 09 Dec 2021 01:12:59 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id nm13sm5210296pjb.56.2021.12.09.01.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:12:59 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     mhiramat@kernel.org
Cc:     rostedt@goodmis.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/trace: fix a label of boottime-trace
Date:   Thu,  9 Dec 2021 17:11:33 +0800
Message-Id: <20211209091133.558744-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
introduced a warning:

linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)

Replace with:
              :xxx: path

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/trace/boottime-trace.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 6dcfbc64014d..efb75ec5bf48 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -133,7 +133,7 @@ action option, there are tree-style options under per-event 'hist' subkey
 for the histogram actions. For the detail of the each parameter,
 please read the event histogram document [3]_.
 
-.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
+.. [3] See :histogram: Documentation/trace/histogram.rst
 
 ftrace.[instance.INSTANCE.]event.GROUP.EVENT.hist.[N.]keys = KEY1[, KEY2[...]]
   Set histogram key parameters. (Mandatory)
-- 
2.27.0

