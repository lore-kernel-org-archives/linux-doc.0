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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A21C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Sep 2021 14:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A934C6115C
	for <linux-doc@archiver.kernel.org>; Wed,  8 Sep 2021 14:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351894AbhIHOxe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Sep 2021 10:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351890AbhIHOxc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Sep 2021 10:53:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AA9C061575
        for <linux-doc@vger.kernel.org>; Wed,  8 Sep 2021 07:52:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j12so3972140ljg.10
        for <linux-doc@vger.kernel.org>; Wed, 08 Sep 2021 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFykh56fVhrB6oR9lO0QT54mhC5cY17423X2Shqa6c0=;
        b=EBdO9aHJfpaOHpK3R9gTmTek8dl4W4yl4Z9al8F36i7nOD7xdmUtpM6J+d+ZI/PJr+
         ZVZfMpDdnAWAT4KfQeYn6C+1+Hs0B6OH/UEnQjo8ZaKXZQFfoAX4/YN0tLnRClugReTD
         En7aZ488O31NDpyfWIoivdVhALYAR6j0gUQZtinJ2JWtJyQWhcYBUDWucq4aWS/omH4L
         WGk3KPTwUlG0IdY6tTVrdr56b9d8fn2jVJxz7ALnLXeyUtbv4AzAhltJUANgujR3ct3W
         iMajEQyBFuC9kRwm8v4Ym7wsRHUbXtoPvoR+m3wyfZoVzz8TbH3eYPTGppKrH+RlklA0
         futQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFykh56fVhrB6oR9lO0QT54mhC5cY17423X2Shqa6c0=;
        b=xeg1sj3VXEdmJB8dOgh/0rqWj1opvRlo7Anw5GOWx+wjhZHH6qY34mCYYwzfDuzFPW
         V3Gnbkb4aaO7HWemnkppxaRKJ4y4DaDtzUZvVaQUXJTLd6QlbMiGfOmihwIT6XC6JwOI
         GhMhqEB1KadeJRLKRiE4dn9+H5+9aILGAZseuUj9XGbuz29FLZxg8weXKVSAsdYX7HHG
         HEguBysCm/dCE/wCRuFzUOg9/tvpoXSkFGGFSckeD6j2b8T823Ygs9soIJR+ch4YNtWQ
         BOIVa6+2LB2WJVktR9t4rWLgVH0n3SFF73FMjlDkaDsBcewl4RRoapX9UbTbBZlejweP
         oAxg==
X-Gm-Message-State: AOAM530ZdivNXstaKVi6oqGzjo0gigHGG6gGfcxxfS4jU8AWUd4eei0u
        yeKyhk39vV3dkcMy5oUwwZ8tm/59bGY=
X-Google-Smtp-Source: ABdhPJyoyqPAYOKnQ2zD4/cI+bmgP9i3kANz7fSa8D05HbHOCFZWoCFi8JpaSgQ17CXYfrmp1Dtp+Q==
X-Received: by 2002:a2e:89c5:: with SMTP id c5mr3130929ljk.329.1631112742740;
        Wed, 08 Sep 2021 07:52:22 -0700 (PDT)
Received: from localhost.localdomain ([2a03:5342:f:6::2])
        by smtp.gmail.com with ESMTPSA id z1sm210564lfe.137.2021.09.08.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 07:52:22 -0700 (PDT)
From:   Li Xinhai <lixinhai.lxh@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net
Subject: [PATCH] Doc: page_migration: fix numbering for non-LRU movable flags
Date:   Wed,  8 Sep 2021 22:52:15 +0800
Message-Id: <20210908145215.592325-1-lixinhai.lxh@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The non-LRU movable flags part is not relevant to above 3 funcitons, so remove
the number 4.

Signed-off-by: Li Xinhai <lixinhai.lxh@gmail.com>

---
 Documentation/vm/page_migration.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/page_migration.rst b/Documentation/vm/page_migration.rst
index db9d7e5539cb..08810f549f70 100644
--- a/Documentation/vm/page_migration.rst
+++ b/Documentation/vm/page_migration.rst
@@ -205,7 +205,7 @@ which are function pointers of struct address_space_operations.
    In this function, the driver should put the isolated page back into its own data
    structure.
 
-4. non-LRU movable page flags
+Non-LRU movable page flags
 
    There are two page flags for supporting non-LRU movable page.
 
-- 
2.27.0

