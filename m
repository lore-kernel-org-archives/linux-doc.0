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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26FFC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 08:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9EBB61054
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 08:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbhIDIY7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 04:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233631AbhIDIY5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 04:24:57 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39A4C061575;
        Sat,  4 Sep 2021 01:23:56 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id q3so911327plx.4;
        Sat, 04 Sep 2021 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdPM9OkvNtaA6JmcGv7qKKN0+VaFm3GfDoaj2YCcIDg=;
        b=j5OTxawlS1akez9Dq295CULgeV4Bul2jYcQB7efxgLDT1BKJ2cS/7dclXPqGer3Odz
         Uwk85+fxEGbLwRT7dj5ZCwTKEt5dFxRcmvK6lpjqlV6t1GLe8zW2bnrlojqPtMSdYbmN
         NL8R7uAyHozMmYyOebHPED20mG2WALvQP52w9/CIaymApbf9lMWJoM1z+WiJu6lTOVlC
         vzv4SYsqVubyOoftJiNuZMcbYFbTJM1RloYdnu+7j26eu3smcQ/fd7uEwdhDOTViVFfT
         5A1bHDyKzcxdHMUIQgezxhbYqiKj89qFN+YFl5pR/knx+oD+sEOxNaV9mOinuv5OkFFE
         4n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdPM9OkvNtaA6JmcGv7qKKN0+VaFm3GfDoaj2YCcIDg=;
        b=mzG97JGaHeNvRvmcBA9wN7qluTZMM9k4uAb2RXsGCYB9KfOnACBMcqfE5Sm3o8JWaV
         RXqYcFyaAVbVKiHdRzz3rVDqiuwUw7IYRm7Fy0B/x9nHGzKvvEt196h2kB0LcRjiLJzC
         Ul7Hzx7TBd0EFeYpe+hBlBPx1y65SFRi+/VofFBjFPumcYcsbmIcFL704lFICsUUqxRd
         Di4Y1LjEmc43/0+tAEXxYH1xSGy+/B71ck80vvFAQt4G2a0zxv8DHVk682pdHMHEVmuh
         uCkyoFkju/MWD//DaBqoEsh6NO9BriPMtetN8mfpwyeYYbBW5XbLstnQsqXRt89q/6/9
         nSXg==
X-Gm-Message-State: AOAM533YqKL2RWLco7NQb9jQoyEEl6uruDybc5JHuBw4fu26OKzSkcRk
        IVmZj70IShvhm409UF34Lspo81hbPJ2/XeYS
X-Google-Smtp-Source: ABdhPJzdRa7yBABS9qwaDrM5X8LcyvwnYQziq/YPZ29RwLEmiQ0BW2m1KfTx15CTAOTSV+rUwOhc8Q==
X-Received: by 2002:a17:90b:188f:: with SMTP id mn15mr3143916pjb.154.1630743835956;
        Sat, 04 Sep 2021 01:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6006:a148:82a8:3271:93dc:763c])
        by smtp.googlemail.com with ESMTPSA id o1sm1522099pjk.1.2021.09.04.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 01:23:55 -0700 (PDT)
From:   Utkarsh Verma <utkarshverma294@gmail.com>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe Perches <joe@perches.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Utkarsh Verma <utkarshverma294@gmail.com>
Subject: [PATCH v2] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Date:   Sat,  4 Sep 2021 13:53:30 +0530
Message-Id: <20210904082330.14864-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAKXUXMyRKM9Ev_Yyyup-T=AZe2aYcN-ZneXsLmHtUC7as67zNQ@mail.gmail.com>
References: <CAKXUXMyRKM9Ev_Yyyup-T=AZe2aYcN-ZneXsLmHtUC7as67zNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new message type SYMBOLIC_PERMS under the 'Permissions'
subsection. Octal permission bits are easier to read and understand
instead of their symbolic macro names.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Acked-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea2d8..41037594ec24 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -957,6 +957,17 @@ Permissions
     Permission bits should use 4 digit octal permissions (like 0700 or 0444).
     Avoid using any other base like decimal.
 
+  **SYMBOLIC_PERMS**
+    Permission bits in the octal form are more readable and easier to
+    understand than their symbolic counterparts because many command-line
+    tools use this notation only. Experienced kernel developers have been using
+    this traditional Unix permission bits for decades and so they find it
+    easier to understand the octal notation than the symbolic macros.
+    For example, it is harder to read S_IWUSR|S_IRUGO than 0644, which
+    obscures the developer's intent rather than clarifying it.
+
+    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
+
 
 Spacing and Brackets
 --------------------
-- 
2.25.1

