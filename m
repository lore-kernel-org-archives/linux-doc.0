Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742D8C433FE
	for <linux-doc@archiver.kernel.org>; Sat, 19 Nov 2022 08:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbiKSINR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Nov 2022 03:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbiKSINK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Nov 2022 03:13:10 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2EF7DECD
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:13:09 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id p1-20020a17090a2c4100b00212733d7aaaso4030535pjm.4
        for <linux-doc@vger.kernel.org>; Sat, 19 Nov 2022 00:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZT09dwWD5fIaFMw5MiqU60lisIB0ejJz2T/HMt9VF4=;
        b=SHtU6YYNKAEepXdm5HbRFnuAyJFQdgO+1wedLhMpRsszD6ADUFWgk+3Dk2eyg23L4C
         zABv2VQZoq1xk7m9WvhdFXtEOjqkkRv7G5nWIow9W96ux/+b98E53LvWytC2S4a6h04r
         zB4vTdApfRXZH7pB+ZryafnleYvVDTkZGvhF74jyYCJAm2CuHpmFMED7k0JsoYO/yiTs
         ad0L59iP04zGlyxAB7bv/LMHHuEgs7zBVIQDhZWBX89Lj4G42i/ICeB0VmRucNP1g2An
         1t2Tfm6nmhgKRrF4oWPqvjeR2y4x9QOOTpjql3bpcBMpiyRGomB6M2x+txB9lOy5kc1+
         MRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZT09dwWD5fIaFMw5MiqU60lisIB0ejJz2T/HMt9VF4=;
        b=cGGSBz8524PP2qTGVtQmCCQ6OGMZgpe5DzeFj1u4YyAwhXxPEMDXQCPV6vs+o9GQ+M
         T6s3xSYApcQPObevg8XzVggqzZwyQiITukUiwMAJrTQH3YcCBpZTvKDjeo0dU+IJu/SM
         j/Xvab7c1zincUrkSHtsTvG8OQQsb5UY4jeuE6wh5gX+mtB1lBx5o4v1uZjdq6hBvFKo
         tRtNDuI9TJepaNv87c80xDgHADii9Jb5vX452pmmSwl4lhMK+hD9k4IF493nVddWjbbG
         XQ3s9Demfl62TmTOMTSjXlsgDaYdkjIEFrkZJdgSHHof/PtORN766ZRmPCmlDG/sX0xN
         xZIg==
X-Gm-Message-State: ANoB5pk4gyj0OLnOjkfzfCLqLk7WOVWz0m6bmFk6hm4J9qCA1mVc85mZ
        kblq42tBPSS1Hp6NzbLHzOU2bPrBSF+xyg==
X-Google-Smtp-Source: AA0mqf6d0TFeFJe2lky/Uxlh+yxajwOJpZKYlUcAsY4hA8k+GJ+0dKXuSI5wzfJrQ5yVpEF7+GNMYaRxd/NUbA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:aa7:9f9c:0:b0:53e:81ab:9419 with SMTP id
 z28-20020aa79f9c000000b0053e81ab9419mr11494527pfr.15.1668845588834; Sat, 19
 Nov 2022 00:13:08 -0800 (PST)
Date:   Sat, 19 Nov 2022 16:12:52 +0800
In-Reply-To: <20221119081252.3864249-1-davidgow@google.com>
Mime-Version: 1.0
References: <20221119081252.3864249-1-davidgow@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221119081252.3864249-3-davidgow@google.com>
Subject: [PATCH v3 3/3] mm: slub: test: Use the kunit_get_current_test() function
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendan.higgins@linux.dev>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Oliver Glitta <glittao@gmail.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use the newly-added function kunit_get_current_test() instead of
accessing current->kunit_test directly. This function uses a static key
to return more quickly when KUnit is enabled, but no tests are actively
running. There should therefore be a negligible performance impact to
enabling the slub KUnit tests.

Other than the performance improvement, this should be a no-op.

Cc: Oliver Glitta <glittao@gmail.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Gow <davidgow@google.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
---

This is intended as an example use of the new function. Other users
(such as KASAN) will be updated separately, as there would otherwise be
conflicts.

We'll take this whole series via the kselftest/kunit tree.

Changes since v2:
https://lore.kernel.org/all/20221025071907.1251820-3-davidgow@google.com/
- Get rid of a redundant 'likely' (Thanks Vlastimil Babka)
- Use current->kunit_test directly when we already know a test is
  running. (Thanks Vlastimil Babka)
- Add Vlastimil's Acked-by.

There was no v1 of this patch. v1 of the series can be found here:
https://lore.kernel.org/linux-kselftest/20221021072854.333010-1-davidgow@google.com/T/#u

Cheers,
-- David

---
 lib/slub_kunit.c | 1 +
 mm/slub.c        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/slub_kunit.c b/lib/slub_kunit.c
index 7a0564d7cb7a..8fd19c8301ad 100644
--- a/lib/slub_kunit.c
+++ b/lib/slub_kunit.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <kunit/test.h>
+#include <kunit/test-bug.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/module.h>
diff --git a/mm/slub.c b/mm/slub.c
index 157527d7101b..1887996cb703 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -39,6 +39,7 @@
 #include <linux/memcontrol.h>
 #include <linux/random.h>
 #include <kunit/test.h>
+#include <kunit/test-bug.h>
 #include <linux/sort.h>
 
 #include <linux/debugfs.h>
@@ -603,7 +604,7 @@ static bool slab_add_kunit_errors(void)
 {
 	struct kunit_resource *resource;
 
-	if (likely(!current->kunit_test))
+	if (!kunit_get_current_test())
 		return false;
 
 	resource = kunit_find_named_resource(current->kunit_test, "slab_errors");
-- 
2.38.1.584.g0f3c55d4c2-goog

