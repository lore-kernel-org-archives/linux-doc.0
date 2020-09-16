Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAADC43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 23:29:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B68922209
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 23:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tth1Nh/X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgIPX3u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 19:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgIPX3p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 19:29:45 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E71C06174A;
        Wed, 16 Sep 2020 16:29:45 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d6so11326pfn.9;
        Wed, 16 Sep 2020 16:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R9Gw6+PM5z71+mLBKqII8RPfqr0DXLe+0fkTbe6vh6w=;
        b=tth1Nh/XQ96Hj5oCinWcQ2Jk+3xdLMXzDw8xIBWeF5PcgupbqWguKg/c08xeECM8pG
         uYYvUUIhBbk/Arj8lzMcjWaPe8Zx3UK9NrXxBm2Q2ZmbXyoEjBQ50cnek9COerWEEc9p
         9aj2b1qlhKWiH8EW8fw7NrWmsh3Yu54OUY8FXXxq2RWy1CpCUA7TRqsJitPIMhlk/QJu
         RKfpiP1GQL3T6CsitBINMUyYd+cehiPrIBoNY0Lo0UwcVNm5S7UUKvTQwjbVmOJgFouH
         1fpGpIDp7+hOXdh5+lfdct02Cllk46hpoNmqTy9OaFLLzOCEZlJbl6kwPEkSWQl7Z5Rc
         vKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R9Gw6+PM5z71+mLBKqII8RPfqr0DXLe+0fkTbe6vh6w=;
        b=uiBbhyqVr49dNzAPA4LXbD/3CE9GKo/58bhv9DFY9jonR/elyqzRXXeC7Ebc1PwCnW
         VrLzunFfJNONfsyM/NMMLTJoLZYhbY5KwzkSx5QUnpiHqKeARe5GpOOxuVIIP1hiD5ZM
         jbjXzJm+TL/3LdPTtr9gIJxPJldXyZXSDvNX85uU7ga4iyGLZsfoGTapKmEdXP6Q15VO
         ruBK9jystE3O7TWxUYzhMvDPPs/YcXpAI1mBeqYyQCbl4DZVIv7lXFNnxnMfRupZLTy4
         dOclIKPFJldjdmWlQf74X8mqEmxZjBfqtNOZEHBAFZaSwIIcfGhtsbfXNmLInGKzWjif
         WXZA==
X-Gm-Message-State: AOAM531cl9G7/lEaTdUulnfRtMlVzy22pteVC1NNry4/MPAbeq9/u2rO
        SQcdL0a3LptBFNt4l/Y6PNA=
X-Google-Smtp-Source: ABdhPJyCnFrPabBdWCyLPPtMJja+gOhWvlL7wM89YS7TmpqjwDflag2Hdqv+S7qniKqbtV+wHVr3xg==
X-Received: by 2002:a63:384f:: with SMTP id h15mr1923748pgn.144.1600298984670;
        Wed, 16 Sep 2020 16:29:44 -0700 (PDT)
Received: from localhost.localdomain (sau-ff5be-or.servercontrol.com.au. [43.250.207.3])
        by smtp.gmail.com with ESMTPSA id m13sm4880196pgl.68.2020.09.16.16.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 16:29:43 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, rdunlap@infradead.org, gregkh@linuxfoundation.org,
        daniel@ffwll.ch, yuanmingbuaa@gmail.com, w@1wt.eu,
        nopitydays@gmail.com, zhangyunhai@nsfocus.com, luto@amacapital.net,
        torvalds@linux-foundation.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH v3] docs: fb: Remove sstfb scrollback boot option
Date:   Thu, 17 Sep 2020 04:51:41 +0530
Message-Id: <20200916232141.17311-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


This patch remove the reference of scrollback from this file. This is related to 
these below commits.

Commit 973c096f6a85(vgacon: remove software scrollback support)
Commit 50145474f6ef(fbcon: remove soft scrollback code)

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
This version correcting the previous versions errors. Proper changelog and subject 
text. Trying to incorporate Willy's and Greg's suggestions.

 Documentation/fb/sstfb.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/fb/sstfb.rst b/Documentation/fb/sstfb.rst
index 8e8c1b940359..42466ff49c58 100644
--- a/Documentation/fb/sstfb.rst
+++ b/Documentation/fb/sstfb.rst
@@ -185,9 +185,6 @@ Bugs
   contact me.
 - The 24/32 is not likely to work anytime soon, knowing that the
   hardware does ... unusual things in 24/32 bpp.
-- When used with another video board, current limitations of the linux
-  console subsystem can cause some troubles, specifically, you should
-  disable software scrollback, as it can oops badly ...
 
 Todo
 ====
-- 
2.28.0

