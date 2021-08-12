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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EFCC4320A
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA43761102
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237976AbhHLP0S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 11:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbhHLP0S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Aug 2021 11:26:18 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8947C061756
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 08:25:52 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so8175370otl.9
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9hXvAGfNY118VdixW3MyB3N5r/DKb/+U9KqtyZYkawo=;
        b=SFmhYo/MU8urBuVsnsV5nyU34QCFb0/WEb/foFgeWy11nfy+Gw+VlEO72uaxxNeolc
         yXpezptn3k59gtCZCmPLiWiTZVTHH5Qnq4aCEQB5KYerPHDpUVUhAWOho12JVrFkkwSk
         6Y7MypztsVYupU3m5g9GhpC5iKYIIaDNQRf2ECsGmnuf1w17qTrDylv88ctCiarZv2Vw
         pzIV4Xjjxv/HBlZmaOrD1nuhkYIUxhoZmmxoHYG+aUba1zdDe00O8j4NUURFLooZdVvH
         hdu0/uERzeJUD86kESfC/wbAueNhHXij/uTlze5venc1/1VsMeMS3vFOXXrtaBrAdoX6
         C4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9hXvAGfNY118VdixW3MyB3N5r/DKb/+U9KqtyZYkawo=;
        b=VynN/iY0hWziIQtdfs/SzU70v/X1aOvZIQ6CEk5REcQLCB4DmVr0w+Ljmt50pHRAbb
         teenZiS4vvkJMRPb2amP0tBSrdu5+ETQxGECBf2s0jKnac9RdsVTxGPx0lU2Rl8dQJt3
         0oKt59sqzqmFzsVdJD5I1ry1h0GsEBDQhHsZ9WGK/3o3mrRwGSaqLHoZcnhq+RvHVZsx
         eVvJbill1oEjg24jSufveydYgNpJzA1kl2zTKI4uYsu0uNZzc0/Z3diVbWOgLruEKeOP
         0G7rhB3uwrdK3OpzfIn9aJ6R0/jxeFRqyXdXSl3AUL4CmDoow7yQD18/VNp1wtGwC0pw
         j3Ag==
X-Gm-Message-State: AOAM532YOEEsx185uVVSCd1Si1VUvB0K7vybCc+Vpzrpf0/kvJY58t+h
        8DzkI2oGP2c1VucaD2Tw18U=
X-Google-Smtp-Source: ABdhPJze8IqlNqV5ihvDilVzRpYSjANb/abzu6I/VYmDHyWsTyx6zAiND1voAtxafyJJ8TRl/7Cq0A==
X-Received: by 2002:a9d:2601:: with SMTP id a1mr4065701otb.122.1628781952140;
        Thu, 12 Aug 2021 08:25:52 -0700 (PDT)
Received: from jinay-x1l.attlocal.net ([2600:1700:3ec6:d50:4fab:2de4:2e2f:9546])
        by smtp.gmail.com with ESMTPSA id z23sm683733oib.36.2021.08.12.08.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 08:25:51 -0700 (PDT)
From:   Jinay Jain <jinaybjain@gmail.com>
To:     corbet@lwn.net
Cc:     trivial@kernel.org, linux-doc@vger.kernel.org,
        Jinay Jain <jinaybjain@gmail.com>
Subject: [PATCH] Documentation: block: blk-mq: Fix small typo in multi-queue docs
Date:   Thu, 12 Aug 2021 08:25:28 -0700
Message-Id: <20210812152528.300668-1-jinaybjain@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixed a small typo in the documentation for multi-queue block IO.

Signed-off-by: Jinay Jain <jinaybjain@gmail.com>
---
 Documentation/block/blk-mq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/block/blk-mq.rst b/Documentation/block/blk-mq.rst
index d96118c73954..31f52f326971 100644
--- a/Documentation/block/blk-mq.rst
+++ b/Documentation/block/blk-mq.rst
@@ -54,7 +54,7 @@ layer or if we want to try to merge requests. In both cases, requests will be
 sent to the software queue.
 
 Then, after the requests are processed by software queues, they will be placed
-at the hardware queue, a second stage queue were the hardware has direct access
+at the hardware queue, a second stage queue where the hardware has direct access
 to process those requests. However, if the hardware does not have enough
 resources to accept more requests, blk-mq will places requests on a temporary
 queue, to be sent in the future, when the hardware is able.
-- 
2.25.1

