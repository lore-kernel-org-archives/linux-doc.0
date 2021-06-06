Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176B0C4743E
	for <linux-doc@archiver.kernel.org>; Sun,  6 Jun 2021 00:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C38A46141E
	for <linux-doc@archiver.kernel.org>; Sun,  6 Jun 2021 00:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhFFA5h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 20:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhFFA5h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jun 2021 20:57:37 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B616C061767
        for <linux-doc@vger.kernel.org>; Sat,  5 Jun 2021 17:55:35 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 22-20020a250d160000b0290532b914c9f4so17378470ybn.9
        for <linux-doc@vger.kernel.org>; Sat, 05 Jun 2021 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=GHvR3Cn1ebKCJGAQ/YKMJtoF4rLgzfIVburfhTYFub0=;
        b=mB5L3xqaFi+nH1S2esE/5DEuLDnRmH39U8XLeJWuNSjHDNmU9jg49y8aJqxNMZoe/9
         v9G/dvo4pVfBCGocy5SY+KPDnpcUS88V7iz3SevYqqtpfdBtyY8j2cRpIqAb4m4S8aPf
         jPlKvLsCeJZd3F2oI4aR2INyxUBNijiIYLBFm5DIJvmrdDxb5ruifxoEKsl38YeGnQ5D
         29BoMm5Y0F69IdIF7SRpCuo4GsT7zEEOvBq4PzWCmB+aw/D2fGClAmR5w3KyeiAcJL7X
         JU+MmwGUVSZ7JazVU6I/VE98iR0OBN2rvZmKgXR/Wml9BdbR07pITffUy7L7Tln0wKe6
         mfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=GHvR3Cn1ebKCJGAQ/YKMJtoF4rLgzfIVburfhTYFub0=;
        b=e7KhBa40BT/YKwQt3z61okkdgcdsUle8Yg3CUpV5IhsL4L9A6HsrjZ8iEoWfs6CyYg
         Rq90oxcXvqyXm1h/DQaFsE2EyTh+Wl+lUAM4SF84nTPt4Y7Bsm/c229korG0LDX8gDfg
         s4j0pkjsW8GgM6hlLAVWAB9NuLzM5FCMLiJnVpoagN6QLE8lNAer9LIDnlwyPT9gAsl7
         LPXOTZ/e4NavIfdkDCFwRE/fPSJp9khExYetrzXiGjcj0M8L56Ga7mOhA9lo4htGN5fm
         TIq5tbqltT75TizbWzNmyYkVlef3sXFUkfIQ2ZGF34VKwPQxWU1mIYGAQv9/sCG3pSFM
         3UTw==
X-Gm-Message-State: AOAM532HgMICLANdEhWsG0nUg+ZKoGQzTpHmXiZ7yI+uwAFXhGAOLjS3
        jduKkk3uY47g9ao636dq6iRzRbf4lXdiKw==
X-Google-Smtp-Source: ABdhPJz0frOeV+p7ws7ArKvBWvQ7181HrSVewSMqL4CsdpPMY7oagmlm1RNRqjNk61nMRckzB9Zr0J8GQseyJw==
X-Received: from spirogrip.svl.corp.google.com ([2620:15c:2cb:201:836b:eeb9:54f:d89a])
 (user=davidgow job=sendgmr) by 2002:a25:f20f:: with SMTP id
 i15mr14539079ybe.119.1622940934754; Sat, 05 Jun 2021 17:55:34 -0700 (PDT)
Date:   Sat,  5 Jun 2021 17:55:30 -0700
Message-Id: <20210606005531.165954-1-davidgow@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v3] kasan: test: Improve failure message in KUNIT_EXPECT_KASAN_FAIL()
From:   David Gow <davidgow@google.com>
To:     Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Daniel Axtens <dja@axtens.net>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     David Gow <davidgow@google.com>, kasan-dev@googlegroups.com,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The KUNIT_EXPECT_KASAN_FAIL() macro currently uses KUNIT_EXPECT_EQ() to
compare fail_data.report_expected and fail_data.report_found. This
always gave a somewhat useless error message on failure, but the
addition of extra compile-time checking with READ_ONCE() has caused it
to get much longer, and be truncated before anything useful is displayed.

Instead, just check fail_data.report_found by hand (we've just set
report_expected to 'true'), and print a better failure message with
KUNIT_FAIL(). Because of this, report_expected is no longer used
anywhere, and can be removed.

Beforehand, a failure in:
KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)area)[3100]);
would have looked like:
[22:00:34] [FAILED] vmalloc_oob
[22:00:34]     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:991
[22:00:34]     Expected ({ do { extern void __compiletime_assert_705(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(fail_data.report_expected) == sizeof(char) || sizeof(fail_data.repp
[22:00:34]     not ok 45 - vmalloc_oob

With this change, it instead looks like:
[22:04:04] [FAILED] vmalloc_oob
[22:04:04]     # vmalloc_oob: EXPECTATION FAILED at lib/test_kasan.c:993
[22:04:04]     KASAN failure expected in "((volatile char *)area)[3100]", but none occurred
[22:04:04]     not ok 45 - vmalloc_oob

Also update the example failure in the documentation to reflect this.

Signed-off-by: David Gow <davidgow@google.com>
---

Changes since v2:
https://lkml.org/lkml/2021/6/4/1264
- Update the example error in the documentation

Changes since v1:
https://groups.google.com/g/kasan-dev/c/CbabdwoXGlE
- Remove fail_data.report_expected now that it's unused.
- Use '!' instead of '== false' in the comparison.
- Minor typo fixes in the commit message.

The test failure being used as an example is tracked in:
https://bugzilla.kernel.org/show_bug.cgi?id=213335



 Documentation/dev-tools/kasan.rst |  9 ++++-----
 include/linux/kasan.h             |  1 -
 lib/test_kasan.c                  | 11 +++++------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index d3f335ffc751..83ec4a556c19 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -447,11 +447,10 @@ When a test fails due to a failed ``kmalloc``::
 
 When a test fails due to a missing KASAN report::
 
-        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629
-        Expected kasan_data->report_expected == kasan_data->report_found, but
-        kasan_data->report_expected == 1
-        kasan_data->report_found == 0
-        not ok 28 - kmalloc_double_kzfree
+        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:974
+        KASAN failure expected in "kfree_sensitive(ptr)", but none occurred
+        not ok 44 - kmalloc_double_kzfree
+
 
 At the end the cumulative status of all KASAN tests is printed. On success::
 
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b1678a61e6a7..18cd5ec2f469 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -17,7 +17,6 @@ struct task_struct;
 
 /* kasan_data struct is used in KUnit tests for KASAN expected failures */
 struct kunit_kasan_expectation {
-	bool report_expected;
 	bool report_found;
 };
 
diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index cacbbbdef768..44e08f4d9c52 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -55,7 +55,6 @@ static int kasan_test_init(struct kunit *test)
 	multishot = kasan_save_enable_multi_shot();
 	kasan_set_tagging_report_once(false);
 	fail_data.report_found = false;
-	fail_data.report_expected = false;
 	kunit_add_named_resource(test, NULL, NULL, &resource,
 					"kasan_data", &fail_data);
 	return 0;
@@ -94,20 +93,20 @@ static void kasan_test_exit(struct kunit *test)
 	    !kasan_async_mode_enabled())				\
 		migrate_disable();					\
 	KUNIT_EXPECT_FALSE(test, READ_ONCE(fail_data.report_found));	\
-	WRITE_ONCE(fail_data.report_expected, true);			\
 	barrier();							\
 	expression;							\
 	barrier();							\
-	KUNIT_EXPECT_EQ(test,						\
-			READ_ONCE(fail_data.report_expected),		\
-			READ_ONCE(fail_data.report_found));		\
+	if (!READ_ONCE(fail_data.report_found)) {			\
+		KUNIT_FAIL(test, KUNIT_SUBTEST_INDENT "KASAN failure "	\
+				"expected in \"" #expression		\
+				 "\", but none occurred");		\
+	}								\
 	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS)) {				\
 		if (READ_ONCE(fail_data.report_found))			\
 			kasan_enable_tagging_sync();			\
 		migrate_enable();					\
 	}								\
 	WRITE_ONCE(fail_data.report_found, false);			\
-	WRITE_ONCE(fail_data.report_expected, false);			\
 } while (0)
 
 #define KASAN_TEST_NEEDS_CONFIG_ON(test, config) do {			\
-- 
2.32.0.rc1.229.g3e70b5a671-goog

