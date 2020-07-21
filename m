Return-Path: <SRS0=huOA=BA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B937C433E8
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 11:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04A482064C
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 11:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe+nBVZ8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgGULZo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jul 2020 07:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgGULZo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jul 2020 07:25:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F61C061794
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2020 04:25:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so1528940pjb.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2020 04:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TJiQZ2NZMIhzwFex/XfujNyaeP8HJiGfg94tGOn0VVU=;
        b=Fe+nBVZ8iwtGMiVpTRfp30YKPKHE1v8Oj74R+mJfGdgHWyJvunhqa5oFuuurde6hgt
         3GMEwdPZNtWgl0ii82lP1fYySwp+GAiQy4da40CFG05zqLlAd53wDLDD4P7L4O0HVczk
         uWpRTbC0WNfvkXjTV6pbxrpnEs6O45USi0TATUCp+Ac+ZvK7LD2LIs93ADfGnT7bJSOJ
         9z1DnO2kxYpTqAeX22AkLvAzM/jSGhaLBUM99O/fVbH3gElk1FPGNILOtAHq2L7BSueH
         +gbtB+JpCmKmNPLHBjEwWsN7tKw2ZwAftuaJxZrmvejt+2PO0u+lpc58rpowp10++mnx
         NOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TJiQZ2NZMIhzwFex/XfujNyaeP8HJiGfg94tGOn0VVU=;
        b=Q5RkgvEFMsqNycW32Bban3l76ftWXyc/HNqkJjg7r5O0c2/SXV5gRcZ771p8xbuRuG
         Os7qpQjG6BXNyofq2cvaESU+q8gbUw8dhU87Kh45j0Ot0DrvGCEL4eJFL5phGAl1bQS1
         8FwlF7dZrwp5mQK+dv5AIDyzxC82sj0h6BvvB0ZZxctx8gzeornlVzOjpje8Myl5C6RN
         6juo4gz8n4+vuMeF0ITuFc2qzbOnd+ryMBhNcd/QFAi10hp6h3HCqkjevqMUrPYMjyQ3
         3098N4ENfxkG6IDhn7Ac5Gzto0UpgD0BxuYMIGNxeSoR1y88EuDMWXwXfY9IY4Bau0/O
         rfNQ==
X-Gm-Message-State: AOAM532hX767KMP0uy+LbQE2VFXHpveSHJVNYtPLrLz3QxEffLgMPe7d
        MCL0DlW2dSggC7DwC86wjKUlifb9
X-Google-Smtp-Source: ABdhPJyD0RbaedTgaNIHGgI8xiBgJc+WBDe0iqr+6plwNuBDm0uV+6IQnek7o8pxPtj4iHk0p0qoUQ==
X-Received: by 2002:a17:902:aa91:: with SMTP id d17mr21647937plr.93.1595330743750;
        Tue, 21 Jul 2020 04:25:43 -0700 (PDT)
Received: from localhost.localdomain ([185.156.175.94])
        by smtp.gmail.com with ESMTPSA id p30sm20817153pfq.153.2020.07.21.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 04:25:42 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     rppt@linux.ibm.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] docs/mm: concepts.rst: remove unnecessary word
Date:   Tue, 21 Jul 2020 16:52:51 +0530
Message-Id: <20200721112251.6100-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
Mike,
 I have made the change to the subject line as you mentioned in previous
 mail.

 Documentation/admin-guide/mm/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
index c2531b14bf46..fa0974fbeae7 100644
--- a/Documentation/admin-guide/mm/concepts.rst
+++ b/Documentation/admin-guide/mm/concepts.rst
@@ -35,7 +35,7 @@ physical memory (demand paging) and provides a mechanism for the
 protection and controlled sharing of data between processes.
 
 With virtual memory, each and every memory access uses a virtual
-address. When the CPU decodes the an instruction that reads (or
+address. When the CPU decodes an instruction that reads (or
 writes) from (or to) the system memory, it translates the `virtual`
 address encoded in that instruction to a `physical` address that the
 memory controller can understand.
-- 
2.26.2

