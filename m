Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BC2C43462
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 21:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4339060241
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 21:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhEGVcl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 May 2021 17:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhEGVcj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 May 2021 17:32:39 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4048EC061342
        for <linux-doc@vger.kernel.org>; Fri,  7 May 2021 14:31:38 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id t9-20020a0cde090000b02901c4c7ae0cceso7598477qvk.7
        for <linux-doc@vger.kernel.org>; Fri, 07 May 2021 14:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OULdAB7SkAEJ6rQEHGBEyfNQUuilr1kpehp6Rww8NCA=;
        b=me5mS3gfsyZF7xaGkikl8wftRuuZ2OGeAKpzgUbMG/qsFra0W0N8S1KODa6Y6brGSh
         WNnA7TmrDbCabXXI8LZ5E41NAN5pNRNwDSUZcEdq9LoeDSlPWHxFqM8DDjmyngwqFJeb
         Qd/LsL1B+87lenOTJVGd3dIFeR0hJAb6m7yKHz6Ff7KNudGql7/B2VGuog25apXTCqnk
         701ebfMb4CuF1CVSuYBrBOpouUpboiIkW/Fa+1bvRVzIg/Yjla8YBFB+UgXkVowK+lcK
         uST+GIeh4l9btt3gkyCzCyIkikPepD0zoahHPGO1sj2aTXavSt3B/+TB7zhSWhIRlPsO
         +bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OULdAB7SkAEJ6rQEHGBEyfNQUuilr1kpehp6Rww8NCA=;
        b=b6m2I6x+70yU4qKu1ewJJak4qguXLwriNUVAp2fNiR7l8LqAHTNETiU4eMx2mRRm6o
         8WxbL9MbFxHPGm9en4C1YgaEAhVEkOHh53R4AtkHRngaHliBGqLqGORstLTn8zIyLw5V
         cEgrQVpy3Znb6KIzeVFQ/a6/mhIM+Ds6Uz1UIMIiDQrsJrUoOnMNLgtT3s/B+HyEV5pQ
         Etc8P60Wjdt0k1ORI+NsZctFLrw2iemo8NAqllQVGGusMXp5xI7oyvnu6fxmevHfbcRv
         sdHehmRKxU7XiVHi0KR8gCTX8zpgrfn20Kb4JdYGruYkO14HLRbiefji6NSolI1rKIM9
         z0wA==
X-Gm-Message-State: AOAM532Ws1bRK7yRgBY/mGfUnLIdDcLtNZT5BQcY+PpRFaO/WoJSfZKF
        vqDyyrH/i9L95Qf/FkvAT4bDzjKPnLEeVveNZyJsng==
X-Google-Smtp-Source: ABdhPJwd63PkgSe6ku7lXnqxyN58PmTRRyHarAj8aC3AIuHh7xaK+l2IwwFYYBvTOCikWgPsZmwm0YSUR1eyHN7JtT9K1Q==
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:8b7:10d:a11b:ba0c])
 (user=brendanhiggins job=sendgmr) by 2002:a0c:e54c:: with SMTP id
 n12mr11957692qvm.25.1620423097425; Fri, 07 May 2021 14:31:37 -0700 (PDT)
Date:   Fri,  7 May 2021 14:31:10 -0700
In-Reply-To: <20210507213110.155492-1-brendanhiggins@google.com>
Message-Id: <20210507213110.155492-5-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20210507213110.155492-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: [PATCH v1 4/4] Documentation: kunit: document support for QEMU in kunit_tool
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, sboyd@kernel.org, keescook@chromium.org,
        frowand.list@gmail.com, dlatypov@google.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document QEMU support, what it does, and how to use it in kunit_tool.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 37 +++++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 650f99590df57..b74bd7c87cc20 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -612,14 +612,39 @@ only things to be aware of when doing so.
 The biggest impediment will likely be that certain KUnit features and
 infrastructure may not support your target environment. For example, at this
 time the KUnit Wrapper (``tools/testing/kunit/kunit.py``) does not work outside
-of UML. Unfortunately, there is no way around this. Using UML (or even just a
-particular architecture) allows us to make a lot of assumptions that make it
-possible to do things which might otherwise be impossible.
+of UML and QEMU. Unfortunately, there is no way around this. Using UML and QEMU
+(or even just a particular architecture) allows us to make a lot of assumptions
+that make it possible to do things which might otherwise be impossible.
 
 Nevertheless, all core KUnit framework features are fully supported on all
-architectures, and using them is straightforward: all you need to do is to take
-your kunitconfig, your Kconfig options for the tests you would like to run, and
-merge them into whatever config your are using for your platform. That's it!
+architectures, and using them is straightforward: Most popular architectures
+are supported directly in the KUnit Wrapper via QEMU.  Currently, supported
+architectures on QEMU include:
+
+*   i386
+*   x86_64
+*   arm
+*   arm64
+*   alpha
+*   powerpc
+*   riscv
+*   s390
+*   sparc
+
+In order to run KUnit tests on one of these architectures via QEMU with the
+KUnit wrapper, all you need to do is specify the flags ``--arch`` and
+``--cross_compile`` when invoking the KUnit Wrapper. For example, we could run
+the default KUnit tests on ARM in the following manner (assuming we have an ARM
+toolchain installed):
+
+.. code-block:: bash
+
+	tools/testing/kunit/kunit.py run --timeout=60 --jobs=12 --arch=arm --cross_compile=arm-linux-gnueabihf-
+
+Alternatively, if you want to run your tests on real hardware or in some other
+emulation environment, all you need to do is to take your kunitconfig, your
+Kconfig options for the tests you would like to run, and merge them into
+whatever config your are using for your platform. That's it!
 
 For example, let's say you have the following kunitconfig:
 
-- 
2.31.1.607.g51e8a6a459-goog

