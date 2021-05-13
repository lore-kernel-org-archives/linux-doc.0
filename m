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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85488C43460
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 19:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6736B61408
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 19:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhEMThS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 15:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhEMThS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 May 2021 15:37:18 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185FFC06174A
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 12:36:08 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id o5-20020ac872c50000b02901c32e7e3c21so18673661qtp.8
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=BiTwevY2BijktUFqvfOK9eJ6VmJRYnptZuS8mDsZYKo=;
        b=LasTf1nY4+b5yUEfOYSE5Kj0qvBWH1MILz6JaDyx+q45/xfqv50Ku6rV8lP2Cci/mt
         5xCaADseUt1Sv6TJOa1pyB0U4fZyJUjItpSzpEhJJY/pKRwPYHLQkPypJnUrOxBwkxjl
         oMHIWw/ZZRw2KyiOs8R/h/D7wgbtc3dM5zuMVg5hDI7XnHCj0dwLXzPoMNfiCswGfqJS
         7R4qEYcoDvgvAcL9yBNg76nYlyZ9k46xRtr0LrHyyqcBm78F4mgFRg0XX1j0PHnPoahV
         be6PMEuT48BtaRvQzuTFVtqRdjPP37Idayy4h/C5p+j/YR74fYwG5Yx4jOWDqbsQfaxL
         jRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BiTwevY2BijktUFqvfOK9eJ6VmJRYnptZuS8mDsZYKo=;
        b=SDWv5TZZIYfonyALG1y5G8WY7drhWnRZgDqoWcd9wcgsM4HRSHrxuap+CbTMxGjULZ
         ronBr3ebqfae9t+UZ1qkkvpO8bX3YtnpyQ7+jI6eNCcooR3NV59mshgATZN3Hg7iuGQE
         41+zSJoJyPlawsAeCA/f9xsMKdi5rRPjUeeI9Kmhcoagh/ojQKFBD5Nvt+VdRr/mgtDc
         CSdtMLh0aQ9M8kD5Knk8UO1hOMnOpau8TBo4NPkniHEbMVFCGKUU3IVjSSFaHQvfRrMQ
         fGoDkDAbqzR+266HRVAToJQ/miy4iUuSk0p+KT7mfeP7U69BxkWRI5e6X5XGMmZmja56
         rXoA==
X-Gm-Message-State: AOAM532sepE993WMnCabCfA5V++tx3ycPc+clhtYqedbENff1fMSdEg4
        MHTC3yofa7ARRaGODhbbDpKMBQWyAmCFaA==
X-Google-Smtp-Source: ABdhPJyR64VzZ5dzEuRrPPWp50TK6bKpzKa8OAJQymtp2HWAudczxHJpzY45ad+idq1r8zu7myy7Tbr1YTO3bw==
X-Received: from spirogrip.svl.corp.google.com ([2620:15c:2cb:201:5f61:8ca4:879b:809e])
 (user=davidgow job=sendgmr) by 2002:ad4:5ae6:: with SMTP id
 c6mr3662248qvh.42.1620934567050; Thu, 13 May 2021 12:36:07 -0700 (PDT)
Date:   Thu, 13 May 2021 12:31:57 -0700
In-Reply-To: <20210513193204.816681-1-davidgow@google.com>
Message-Id: <20210513193204.816681-3-davidgow@google.com>
Mime-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v2 03/10] Documentation: kunit: Clean up some string casts in examples
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As the type checking is no longer excessively strict, get rid of the
unsightly (char*) casts -- and comment discussing them -- from the KUnit
usage page.

Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 650f99590df5..756747417a19 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -465,10 +465,9 @@ fictitious example for ``sha1sum(1)``
 
 .. code-block:: c
 
-	/* Note: the cast is to satisfy overly strict type-checking. */
 	#define TEST_SHA1(in, want) \
 		sha1sum(in, out); \
-		KUNIT_EXPECT_STREQ_MSG(test, (char *)out, want, "sha1sum(%s)", in);
+		KUNIT_EXPECT_STREQ_MSG(test, out, want, "sha1sum(%s)", in);
 
 	char out[40];
 	TEST_SHA1("hello world",  "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed");
@@ -507,7 +506,7 @@ In some cases, it can be helpful to write a *table-driven test* instead, e.g.
 	};
 	for (i = 0; i < ARRAY_SIZE(cases); ++i) {
 		sha1sum(cases[i].str, out);
-		KUNIT_EXPECT_STREQ_MSG(test, (char *)out, cases[i].sha1,
+		KUNIT_EXPECT_STREQ_MSG(test, out, cases[i].sha1,
 		                      "sha1sum(%s)", cases[i].str);
 	}
 
@@ -568,7 +567,7 @@ Reusing the same ``cases`` array from above, we can write the test as a
 		struct sha1_test_case *test_param = (struct sha1_test_case *)(test->param_value);
 
 		sha1sum(test_param->str, out);
-		KUNIT_EXPECT_STREQ_MSG(test, (char *)out, test_param->sha1,
+		KUNIT_EXPECT_STREQ_MSG(test, out, test_param->sha1,
 				      "sha1sum(%s)", test_param->str);
 	}
 
-- 
2.31.1.751.gd2f1c929bd-goog

