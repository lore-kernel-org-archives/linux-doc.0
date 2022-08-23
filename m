Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A2DC48BEA
	for <linux-doc@archiver.kernel.org>; Tue, 23 Aug 2022 16:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245448AbiHWQrJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Aug 2022 12:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344149AbiHWQqv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Aug 2022 12:46:51 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3841C6FC2
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 07:25:08 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id a21-20020a62bd15000000b005360da6b25aso4766072pff.23
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=QWKuLGeQgOwRURxq7JoMTU3dLzHqHHHK1oS3f4BccKo=;
        b=GrRVd//5LW1PqHd4+nmw6iQxSDEv6SZl5rq7HvG1ZJxkWdbroNR0IQv8QL0Ed2zy2Z
         XS84YhajnhHij1m6VLGokiI4brAmotcy4aU9GAHbjNRHu9oBai/BGZOVsHo05UwBQG/t
         DT9BwpLi9hZP9gRnX6seb5nEuJSf+RB0AnnlqoHS/kQp50pVUaKGGK/H3pC1JeY0I5bd
         5GerYP1n64mD7BCQimQCl8T/9JMDBQT/r3nNdE8DpBOqR5445aSzh3U0nLHwsqlRWAvb
         y+Hkp3MQklnI9vQcisuFfVEd1nvAAqK7tWeo1RwG9Nh5gA9jiQu5y0hP87d1B8tXblgP
         3GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=QWKuLGeQgOwRURxq7JoMTU3dLzHqHHHK1oS3f4BccKo=;
        b=HTlEWvkxZ1TcYKvUHzMDAFeje4GR1B6aUUYB1q+rTTbGi0DsbhL7EhxsX0cynCffDu
         rCDCQ72TytH1mXk3UvxLdEWmzHHAJAqPqB7Bo/YGuYDdL27AlmpXm+aA42QgfgbruiqG
         UZC0XGdfvxQ3v2LZnclvec5Bz52Q5slvsKNRxkNqFXK0kown7ExkeRjzTXuGlDrKBsTM
         JDguZfdGruq2H65hdjKeuMg2KvxKYgTORN9bSuaEC449Y4ac71HuYevmMLi9W06FjfqW
         6SdkRjrIK040ZMN80YUvT8H30h1DA0R4ngwK6W4KNa33FG15XWeF5Z2hZOJaUNYNHuXZ
         EAVQ==
X-Gm-Message-State: ACgBeo1v8GIUM9Eo96yFtpbAMtPZ/ED5wwRbkRshP166fobkGtv1N7SQ
        58K5TUa8izLyT9eqvxVnET4Iqxu9vbhfulA=
X-Google-Smtp-Source: AA6agR7/i5co66jtp2HCxpHPVsfI+WFBs/BqAssIQ+wYlUCD1tfwcs4GkOkSfZf6nev2LPSvgvuPF9Dk/9obk25L
X-Received: from joefradley-custom-96.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:831])
 (user=joefradley job=sendgmr) by 2002:a17:902:7003:b0:172:cbb0:9af8 with SMTP
 id y3-20020a170902700300b00172cbb09af8mr17254972plk.57.1661264708208; Tue, 23
 Aug 2022 07:25:08 -0700 (PDT)
Date:   Tue, 23 Aug 2022 07:24:55 -0700
In-Reply-To: <20220823142456.3977086-1-joefradley@google.com>
Message-Id: <20220823142456.3977086-3-joefradley@google.com>
Mime-Version: 1.0
References: <20220823142456.3977086-1-joefradley@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v2 2/2] kunit: no longer call module_info(test, "Y") for kunit modules
From:   Joe Fradley <joefradley@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>
Cc:     Joe Fradley <joefradley@google.com>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because KUnit test execution is not a guarantee with the kunit.enable
parameter we want to be careful to only taint the kernel when actual
tests run. Calling module_info(test, "Y") for every KUnit module
automatically causes the kernel to be tainted upon module load. Therefore,
we're removing this call and relying on the KUnit framework to taint the
kernel or not.

Signed-off-by: Joe Fradley <joefradley@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
Changes since v1:
- Added David's and Brendan's Reviewed-by for tags.

 include/kunit/test.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index ee6bf4ecbd89..512089e5ce4e 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -253,7 +253,6 @@ static inline int kunit_run_all_tests(void)
 #endif /* IS_BUILTIN(CONFIG_KUNIT) */
 
 #define __kunit_test_suites(unique_array, ...)				       \
-	MODULE_INFO(test, "Y");						       \
 	static struct kunit_suite *unique_array[]			       \
 	__aligned(sizeof(struct kunit_suite *))				       \
 	__used __section(".kunit_test_suites") = { __VA_ARGS__ }
-- 
2.37.1.595.g718a3a8f04-goog

