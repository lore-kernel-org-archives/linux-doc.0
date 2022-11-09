Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD85C43219
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 00:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKIAg3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 19:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiKIAg2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 19:36:28 -0500
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42ACB63153
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 16:36:28 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id m2-20020a17090a730200b0021020cce6adso270296pjk.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 16:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i16E6SEJ1XE3RexrHSv+UKrQKUgWn1ksElBhVAhWC74=;
        b=ozndvYKnYfbi79PbuCYdzeMtofBcdWRIc10S48fA0ZiNj/LbcnyA78EeEyHbGlu9n6
         7J9OUUeOSTjZdMHJ2Jj8jMxpE5/dNiSdsErzggvwEEW2nUjxnCa6+TDqTkoDJz9gOj99
         WXadIIjgvnxIVJ/DBFiBgHJkkWlKthceyqDaVjg9MiPmZqLDPR9LHxZsOGuMW6BjHu/c
         3eJf90rCsgm0AwbOvUrB59Y/Jmt+M8z3+xf8wujZCxWlDqOqjDioHBcPrSHS2jcF5xIG
         mcVvtHsOwHn5TgP74M+8eZTB81t5B4R9Xo69adh1fUPMDntg2alkPx9VTHycCQY1TfJc
         Zpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i16E6SEJ1XE3RexrHSv+UKrQKUgWn1ksElBhVAhWC74=;
        b=P5P1fdgpEVg/Us+avCglwJaWt1Uo6/r26jqgYMEW/sMt38KrEjQJRIq9JESVRUtNy6
         WMF+8usa+yi0Ya1k3rvOqNb0WzaRLJHd/j0XkEnpDeUqX7vHTBGB6JPEkIfQGudflxG1
         KzMfp3rhGmq56pEwHPb9LI3Bb4rGXZoZk8gyy4ot2tDETlvHjJnwedc9vshiBXoArmMI
         ZYUkX9juU1Ziflwq1Y4MWstTAzRswyR98761tzc/EiAvlouT0N8ImbfC0s84UjeAqxes
         TETa5Pr91MFj01ueYKpyTSG//M5Muxhm7yTyZGvWohM/aJBh34VxZAzljmU2aCKaLMya
         h9kg==
X-Gm-Message-State: ANoB5pn+PCWkboH14yEU1T/OGwVkmXnKTEY27iMOmjNeulONPLrk1kTx
        5UXeAPYMu7nd4jhbBO26tzCtSnPanY6Xww==
X-Google-Smtp-Source: AA0mqf5yfuylOiuYjTt1prubEe1a8GxqxTj996/7IMLwczKZeOoEfPOlOooJtBe4a0OmGrUTg498bwsh10ozXg==
X-Received: from dlatypov-spec.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3f35])
 (user=dlatypov job=sendgmr) by 2002:aa7:9ad7:0:b0:56e:d7f4:3c4a with SMTP id
 x23-20020aa79ad7000000b0056ed7f43c4amr657937pfp.76.1667954187657; Tue, 08 Nov
 2022 16:36:27 -0800 (PST)
Date:   Tue,  8 Nov 2022 16:36:17 -0800
In-Reply-To: <20221109003618.3784591-1-dlatypov@google.com>
Mime-Version: 1.0
References: <20221109003618.3784591-1-dlatypov@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221109003618.3784591-2-dlatypov@google.com>
Subject: [PATCH v2 2/3] Documentation: KUnit: reword description of assertions
From:   Daniel Latypov <dlatypov@google.com>
To:     brendanhiggins@google.com, davidgow@google.com
Cc:     rmoar@google.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        Daniel Latypov <dlatypov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The existing wording implies that kunit_kmalloc_array() is "the method
under test". We're actually testing the sort() function in that example.
This is because the example was changed in commit 953574390634
("Documentation: KUnit: Rework writing page to focus on writing tests"),
but the wording was not.

Also add a `note` telling people they can use the KUNIT_ASSERT_EQ()
macros from any function. Some users might be coming from a framework
like gUnit where that'll compile but silently do the wrong thing.

Signed-off-by: Daniel Latypov <dlatypov@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index b0a6c3bc0eeb..8060114e3aa6 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -112,11 +112,14 @@ terminates the test case if the condition is not satisfied. For example:
 			KUNIT_EXPECT_LE(test, a[i], a[i + 1]);
 	}
 
-In this example, the method under test should return pointer to a value. If the
-pointer returns null or an errno, we want to stop the test since the following
-expectation could crash the test case. `ASSERT_NOT_ERR_OR_NULL(...)` allows us
-to bail out of the test case if the appropriate conditions are not satisfied to
-complete the test.
+In this example, we need to be able to allocate an array to test the ``sort()``
+function. So we use ``KUNIT_ASSERT_NOT_ERR_OR_NULL()`` to abort the test if
+we there's an allocation error.
+
+.. note::
+   In other test frameworks, ``ASSERT`` macros are often implemented by calling
+   ``return`` so they only work from the test function. In KUnit, we stop the
+   current kthread on failure, so you can call them from anywhere.
 
 Customizing error messages
 --------------------------
-- 
2.38.1.431.g37b22c650d-goog

