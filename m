Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A179C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 30 Dec 2020 15:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 552D220795
	for <linux-doc@archiver.kernel.org>; Wed, 30 Dec 2020 15:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgL3P6u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Dec 2020 10:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgL3P6u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Dec 2020 10:58:50 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D192C061799
        for <linux-doc@vger.kernel.org>; Wed, 30 Dec 2020 07:58:10 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id y23so5072817wmi.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Dec 2020 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yfjl0xYNPtQx7QvF6KQCIMzo4+rXF1YUWQNooUhwZuA=;
        b=erB1RMnnqtKP12BjoDU4VlvXKidhl+N9EON2C4IjQGUK/639C/rCZzWPRk6afyg3NT
         A1PrWhfc+/XhCPBV5ik5czOTx6hiO3oHT8Z/oTC/bm5zu4wGyjbw7p477KE6DIqw+hxb
         Cb6A+wmUavRzgpbT96is0DmgNd/E5wFVH7EsiTxtCtnqaekINagZVfL52EODakuiOgXI
         rpMTG9jZ+nCKsD5p0gxjP3klochMj1rNho78c8qnnYpBrfrLHAhI8FgDfF6Ytek3PpjN
         dXFxTIvMx8MyjypjKfSi09e//OcFnofRjN0yCtiXXYrxzL7yA2QBGbU55JobPeYN+Xa0
         GhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yfjl0xYNPtQx7QvF6KQCIMzo4+rXF1YUWQNooUhwZuA=;
        b=IECmQYzl1j1R9scjLws6ObQWaMgakSqIq8TmP1RBUcy1ApHkzHjSIzxNZqTp30aFy9
         ZKPxJx/8Yp1O2C71B7zLc0VZNtgxB+LbGw7plmsy0m+l5jYYkJivvTlQ06Sn+dj91aEi
         EXdu+zgIPioWRAPLbVTykpTAFPFzXH2iWCQ0HW2p2NsQH+U+RwONzUiFBU5e4HFYDhNk
         ZHD9HBwBMQExBtoBAIC5RHfK5YJBE0s1bmydH9Q3Irolg0h3sskbwy7sTifQnxnNREi9
         3W4AoiJw9QnAKMTnI6DQeo1lV19PWImGoOTWTJJEiRF06+4Rja5E6Duo9wGB6N0BXy3w
         IehQ==
X-Gm-Message-State: AOAM5313OXmIXmHI8KTDH5UMNEm3kKjmLvzrukPMNFLMX5MHATI2bdLs
        tVsqkkc0YESceW7DNfTVk3ffooWny6J5/4ga
X-Google-Smtp-Source: ABdhPJxOKNn3OGHx8EuaMfMxs5CYwEFeYOFNus1wEckq+MgcXP7d+GS6bpdN4QHURn2P38ywGNb7zA==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr8366549wmj.40.1609343888896;
        Wed, 30 Dec 2020 07:58:08 -0800 (PST)
Received: from localhost.localdomain ([195.213.153.250])
        by smtp.gmail.com with ESMTPSA id n11sm51608560wra.9.2020.12.30.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 07:58:08 -0800 (PST)
From:   Joe Pater <02joepater06@gmail.com>
To:     corbet@lwn.net
Cc:     trivial@kernel.org, linux-doc@vger.kernel.org,
        Joe Pater <02joepater06@gmail.com>
Subject: [PATCH] Documentation: kernel-hacking: change 'current()' to 'current'
Date:   Wed, 30 Dec 2020 15:56:59 +0000
Message-Id: <20201230155658.26147-1-02joepater06@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change 'current()' heading to 'current' to reflect usage.

Signed-off-by: Joe Pater <02joepater06@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index eed2136d847f..451523424942 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -346,8 +346,8 @@ routine.
 Before inventing your own cache of often-used objects consider using a
 slab cache in ``include/linux/slab.h``
 
-:c:func:`current()`
--------------------
+:c:macro:`current`
+------------------
 
 Defined in ``include/asm/current.h``
 
-- 
2.29.2

