Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9912DC2B9F2
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 04:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74AF06135A
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 04:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhEVEo2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 May 2021 00:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhEVEo1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 May 2021 00:44:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65242C061574
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 21:43:03 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id h67-20020a25d0460000b0290517e5f14ba4so10812965ybg.18
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 21:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=96Y9WwIc8kUkrmHkpaEi69xgiu/NxnCuPIF69L/93wQ=;
        b=k6ehWr8LMhU+5n2P7IT0s/1qchLDyjWLrbHUKCJ2mvUhEQQ92Pc792SZsQ82MFA8TF
         YRXHAheIyLyleKIrlXH4+LVOXLyBZkHAP879WZ4C3zCMsnVSGguCvMvIKuFZqQqFxaiW
         iLVm2LwBMmcjrHkq6L3iUhqKOMNwJOtY6dsc10uSCVWcaqCKqhCaHbdus2kZpHXNcu71
         6B4eWSZr8gcmROS4B95RIpjm3cTE2wAtR5a37ikta8OzWJyxw4Nn4djoAbJM95ZIlkz2
         ebs57FJvGFxiXem+qvaeQ6+QOZ9GvVs0cWfCYEeJcPAo3Rh1OnK3jmzWFt+DkbCEpAQv
         J+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=96Y9WwIc8kUkrmHkpaEi69xgiu/NxnCuPIF69L/93wQ=;
        b=EMaCFj3V15P7NNa0EhxR/Joh4yda+DehDT69awYmwkyA0GK3grgPSm08Xwv3pvYUeE
         lJKs6hdAgIiJsp0uDsAJSsWNe4h8Cf8l9935/HA+oYHMREr2K1/v4RhJjDCnv1eod0K+
         Dp2Ljk3ss5dvwAyKsYml4HrYc1wZMTjdWBBKD3IuTsVmq2w6jW3x4bxdSrOw00qZXBJj
         E5Garf9cfjqUDniucvz5IL0EBKRfe/SgIH/4EV7h3nuPbO6FXuKn1boJmMalfVDnQEYX
         T1NU4LXOViieeIwpvUS1v5k6LQqUiujfvNz5PLjstTp0dwgj5BAkGq1gKc2Bn5Vj2qLy
         suIQ==
X-Gm-Message-State: AOAM533hHOj9x5mf7m4PmO5Uet8ZZDVpZjKFrfh3xEaUmoCCZmGZp18A
        MdPOFWPKQ/oz0eUDvxGP2OCCF/Ze3NauWg==
X-Google-Smtp-Source: ABdhPJwkDp3aKJw6lJxI1K/PlTb7DpOkyHUwuvuxtIIWZX/jOgZ3zzKysWewTVhNbZtuE5F9CTitZ4nawGS9OA==
X-Received: from spirogrip.svl.corp.google.com ([2620:15c:2cb:201:74c:35f3:92d:b18a])
 (user=davidgow job=sendgmr) by 2002:a5b:5c3:: with SMTP id
 w3mr21416475ybp.498.1621658582642; Fri, 21 May 2021 21:43:02 -0700 (PDT)
Date:   Fri, 21 May 2021 21:42:40 -0700
In-Reply-To: <20210522044241.2763088-1-davidgow@google.com>
Message-Id: <20210522044241.2763088-2-davidgow@google.com>
Mime-Version: 1.0
References: <20210522044241.2763088-1-davidgow@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH v2 2/3] kunit: Move default config from arch/um -> tools/testing/kunit
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     David Gow <davidgow@google.com>, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Jonathan Corbet <corbet@lwn.net>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The default .kunitconfig file is currently kept in
arch/um/configs/kunit_defconfig, but -- with the impending QEMU patch
-- will no-longer be exclusively used for UML-based kernels.

Move it alongside the other KUnit configs in
tools/testing/kunit/configs, and give it a name which matches the
existing all_tests.config and broken_on_uml.config files.

Also update the Getting Started documentation to point to the new file.

Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/dev-tools/kunit/start.rst                         | 2 +-
 .../testing/kunit/configs/default.config                        | 0
 tools/testing/kunit/kunit_kernel.py                             | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/um/configs/kunit_defconfig => tools/testing/kunit/configs/default.config (100%)

diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index 0e65cabe08eb..5becb09b1751 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -36,7 +36,7 @@ A good starting point for a ``.kunitconfig`` is the KUnit defconfig:
 .. code-block:: bash
 
 	cd $PATH_TO_LINUX_REPO
-	cp arch/um/configs/kunit_defconfig .kunitconfig
+	cp tools/testing/kunit/configs/default.config .kunitconfig
 
 You can then add any other Kconfig options you wish, e.g.:
 
diff --git a/arch/um/configs/kunit_defconfig b/tools/testing/kunit/configs/default.config
similarity index 100%
rename from arch/um/configs/kunit_defconfig
rename to tools/testing/kunit/configs/default.config
diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 89a7d4024e87..5b57a43de33f 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -20,7 +20,7 @@ import kunit_parser
 
 KCONFIG_PATH = '.config'
 KUNITCONFIG_PATH = '.kunitconfig'
-DEFAULT_KUNITCONFIG_PATH = 'arch/um/configs/kunit_defconfig'
+DEFAULT_KUNITCONFIG_PATH = 'tools/testing/kunit/configs/default.config'
 BROKEN_ALLCONFIG_PATH = 'tools/testing/kunit/configs/broken_on_uml.config'
 OUTFILE_PATH = 'test.log'
 
-- 
2.31.1.818.g46aad6cb9e-goog

