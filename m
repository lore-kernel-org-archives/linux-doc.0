Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F4707D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 May 2019 16:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfE1QdT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 May 2019 12:33:19 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:35413 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1QdT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 May 2019 12:33:19 -0400
Received: by mail-qk1-f202.google.com with SMTP id u128so28644668qka.2
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=LR69yw39cmBSKp2W9gsMXj4VuQrD7UTJhZMWtKCJnXo=;
        b=qze2NuI5E9bS04poXLsO6vCW7rptEb4DT6Pp2T7ITI1xctQwZGMpMJeRxySZRC1hzo
         mOMQaumjIUWRLsZ5JRN4YyLDbALV+3XLXhpGbmw4myLtVcKQpmtr2Uj/su8NoBOdvnJw
         JG6aFlEuAfTejzNlQ2taD/hdOx/DgQdJbcJvS+Ye8KTIITxkY2QoS52TioTTWRxm+ERB
         0BuQjOVLFR9GpTfYnWasGl2UTEAFxuvTbm3pmRPF1qXGgonthzIlnm1dFu49bh7JFJoJ
         spSzSFHJaN8nCClHtxU74257jrpwvCZe/oPhHVqCRkOcNs3ZKdNZ49d51JEtASyos0XR
         eUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=LR69yw39cmBSKp2W9gsMXj4VuQrD7UTJhZMWtKCJnXo=;
        b=Bp/jc+EpUqt4wHK96Yq2g7ihKJBs/7zMOu8YoPUAL4qyYi43E3ECnPW0MebOI7IHmO
         V9mLqsf11Hwwa8uz6PZ3I+752lIedH8EoNQL5PXZnvjOxAvIR5fTvzncmVddMDgjHoXB
         1rWQSBeu/6aqYXxMijsnEPjHwY5By6rf+gaAxp3xKc1sLHRKNIWqWS+Xt/FWLKr2G28f
         yROL12QAXYuKtiQ72Vg/qcUh8ImNNkfpBEY5SJx97fgb3Lpha4fJrms+bjYDguW79DdN
         XOJGkFRUcib+g1IRVhL4jV5Oe4XrwCfEbZBsqUSEC3XR0nM1tZaMJdsLTguL7wTb9Rje
         q/Fw==
X-Gm-Message-State: APjAAAVlTGQQm2KoJSIHKR6b74VGJ7IGKJz3hHXFcyW8QKb/MMAp8pe9
        bYAY2Cfmbi5y+PADLYiDidOzUe2LJQ==
X-Google-Smtp-Source: APXvYqyPj0jvDds1yN0kQJSjCrz+vBTZlgZzHMoyXOKdZbtkt4jgY70hq4KqMP1xFCC/VbNyKqbJf/efnQ==
X-Received: by 2002:ac8:21ba:: with SMTP id 55mr20465060qty.116.1559061198612;
 Tue, 28 May 2019 09:33:18 -0700 (PDT)
Date:   Tue, 28 May 2019 18:32:56 +0200
Message-Id: <20190528163258.260144-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH 1/3] lib/test_kasan: Add bitops tests
From:   Marco Elver <elver@google.com>
To:     peterz@infradead.org, aryabinin@virtuozzo.com, dvyukov@google.com,
        glider@google.com, andreyknvl@google.com
Cc:     corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        hpa@zytor.com, x86@kernel.org, arnd@arndb.de, jpoimboe@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds bitops tests to the test_kasan module. In a follow-up patch,
support for bitops instrumentation will be added.

Signed-off-by: Marco Elver <elver@google.com>
---
 lib/test_kasan.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index 7de2702621dc..f67f3b52251d 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -11,16 +11,17 @@
 
 #define pr_fmt(fmt) "kasan test: %s " fmt, __func__
 
+#include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/kasan.h>
 #include <linux/kernel.h>
-#include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/module.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>
-#include <linux/module.h>
-#include <linux/kasan.h>
 
 /*
  * Note: test functions are marked noinline so that their names appear in
@@ -623,6 +624,71 @@ static noinline void __init kasan_strings(void)
 	strnlen(ptr, 1);
 }
 
+static noinline void __init kasan_bitops(void)
+{
+	long bits = 0;
+	const long bit = sizeof(bits) * 8;
+
+	pr_info("within-bounds in set_bit");
+	set_bit(0, &bits);
+
+	pr_info("within-bounds in set_bit");
+	set_bit(bit - 1, &bits);
+
+	pr_info("out-of-bounds in set_bit\n");
+	set_bit(bit, &bits);
+
+	pr_info("out-of-bounds in __set_bit\n");
+	__set_bit(bit, &bits);
+
+	pr_info("out-of-bounds in clear_bit\n");
+	clear_bit(bit, &bits);
+
+	pr_info("out-of-bounds in __clear_bit\n");
+	__clear_bit(bit, &bits);
+
+	pr_info("out-of-bounds in clear_bit_unlock\n");
+	clear_bit_unlock(bit, &bits);
+
+	pr_info("out-of-bounds in __clear_bit_unlock\n");
+	__clear_bit_unlock(bit, &bits);
+
+	pr_info("out-of-bounds in change_bit\n");
+	change_bit(bit, &bits);
+
+	pr_info("out-of-bounds in __change_bit\n");
+	__change_bit(bit, &bits);
+
+	pr_info("out-of-bounds in test_and_set_bit\n");
+	test_and_set_bit(bit, &bits);
+
+	pr_info("out-of-bounds in __test_and_set_bit\n");
+	__test_and_set_bit(bit, &bits);
+
+	pr_info("out-of-bounds in test_and_set_bit_lock\n");
+	test_and_set_bit_lock(bit, &bits);
+
+	pr_info("out-of-bounds in test_and_clear_bit\n");
+	test_and_clear_bit(bit, &bits);
+
+	pr_info("out-of-bounds in __test_and_clear_bit\n");
+	__test_and_clear_bit(bit, &bits);
+
+	pr_info("out-of-bounds in test_and_change_bit\n");
+	test_and_change_bit(bit, &bits);
+
+	pr_info("out-of-bounds in __test_and_change_bit\n");
+	__test_and_change_bit(bit, &bits);
+
+	pr_info("out-of-bounds in test_bit\n");
+	(void)test_bit(bit, &bits);
+
+#if defined(clear_bit_unlock_is_negative_byte)
+	pr_info("out-of-bounds in clear_bit_unlock_is_negative_byte\n");
+	clear_bit_unlock_is_negative_byte(bit, &bits);
+#endif
+}
+
 static int __init kmalloc_tests_init(void)
 {
 	/*
@@ -664,6 +730,7 @@ static int __init kmalloc_tests_init(void)
 	kasan_memchr();
 	kasan_memcmp();
 	kasan_strings();
+	kasan_bitops();
 
 	kasan_restore_multi_shot(multishot);
 
-- 
2.22.0.rc1.257.g3120a18244-goog

