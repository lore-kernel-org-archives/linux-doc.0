Return-Path: <SRS0=JCeC=3R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4F7C47409
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jan 2020 07:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45EE72468A
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jan 2020 07:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fmsd/wxU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgA1HUW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 02:20:22 -0500
Received: from mail-pl1-f201.google.com ([209.85.214.201]:46861 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgA1HUV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 02:20:21 -0500
Received: by mail-pl1-f201.google.com with SMTP id t17so5179467plr.13
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2020 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GWHGFk+tfCHvu/qeG8h3yhiMIdqay1deL3woZTxVWJc=;
        b=Fmsd/wxUUyxkz1Z6qM0r0RkypL0fOEHozNsNaZpYgWUn5bll19sW638dyuJWud6WFE
         mkQXUTsINjW8p/0aIJ9Px3JJnE0tLlxui4Ay2uXa4EAnUjgJqyXJ127ebWMJgyugOwUe
         HKaz+i/1o7x2R3F/+KoD3rZft6qDJ7sJpzE73MrvYoPk/YEIDLLtHA2H1V46OZKf5JFE
         D8+CUicqNyWC1f7beM4bEicUD2XIYC0yfRKT/4fkVQc1NuINeHE+s+lbvUL3Fc5UiIny
         AxqghwkUQciLsKR60QKfaPCbCi3/uhAClhQMgjbMIMVgXtFJ/XcE4Ub26q4LhGU7qOcE
         fPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GWHGFk+tfCHvu/qeG8h3yhiMIdqay1deL3woZTxVWJc=;
        b=kqKVV6sbNEKFPzzBCS1iYE2rJ9znHSAuWVgv/cvP1FgVOhiN137s9hhSVCWR2M8Gzu
         m2wDmYuOqpHJqrgfuLI1Zo3DZQwoOC9Gg9uxjCmjTIdGAxgW0PxBA9N8gXdfUElHZ8TL
         KJrdQAEpHPJLBg5lGcnf4MhRBbPOG9M0w3e1BjFycnqsaAtlvx/VUkgi8TLJMWutpy5a
         2xxODA7FLol/EzQ3r+3BsNilarrQjjmBwXdKqHflEfpX4Eln6b6jwyaaFkBvLCJSID94
         e3Z4oq/7rny4UIKEJFkYtQ6EDkxcTDzV4MAklmKlvGzzVdUNjAa3rt5176ANwSzijxB5
         sMPA==
X-Gm-Message-State: APjAAAVcBRN1Yd5k58/3gFF4FIXRR5QZJbB29umzLbF2DVgsNvdgAO7/
        5P/yBqgpLqKy87FgZYANNCIfB3pSfykh9pNL+FWP8Q==
X-Google-Smtp-Source: APXvYqypywQG2gYZge4fgQ89ZnPWWXjpZ4aK4qljq8Qu2reaQNXfA+YsY3M5yDRXuo44nsf6Cp429z3ZpkmkTuhetTXF2A==
X-Received: by 2002:a63:2cd6:: with SMTP id s205mr18113288pgs.258.1580196020528;
 Mon, 27 Jan 2020 23:20:20 -0800 (PST)
Date:   Mon, 27 Jan 2020 23:19:57 -0800
In-Reply-To: <20200128072002.79250-1-brendanhiggins@google.com>
Message-Id: <20200128072002.79250-3-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20200128072002.79250-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v1 2/7] arch: um: add linker section for KUnit test suites
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org,
        alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com,
        akpm@linux-foundation.org, rppt@linux.ibm.com,
        frowand.list@gmail.com
Cc:     gregkh@linuxfoundation.org, sboyd@kernel.org, logang@deltatee.com,
        mcgrof@kernel.org, knut.omang@oracle.com,
        linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a linker section to UML where KUnit can put references to its test
suites. This patch is an early step in transitioning to dispatching all
KUnit tests from a centralized executor rather than having each as its
own separate late_initcall.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/um/include/asm/common.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/include/asm/common.lds.S b/arch/um/include/asm/common.lds.S
index 7145ce6999822..eab9ceb450efd 100644
--- a/arch/um/include/asm/common.lds.S
+++ b/arch/um/include/asm/common.lds.S
@@ -52,6 +52,10 @@
 	CON_INITCALL
   }
 
+  .kunit_test_suites : {
+	KUNIT_TEST_SUITES
+  }
+
   .exitcall : {
 	__exitcall_begin = .;
 	*(.exitcall.exit)
-- 
2.25.0.341.g760bfbb309-goog

