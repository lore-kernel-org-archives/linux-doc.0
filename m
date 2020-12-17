Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E82BC3526A
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 18:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4369E238EC
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 18:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbgLQSyh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 13:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731095AbgLQSyg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 13:54:36 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E7EC0619E0
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 10:53:05 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id h19so20812920qtq.13
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 10:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fRwryvuVhXYrAhLWdCvlg8zqrU0LccdvvXixZFgTlpI=;
        b=gDva44QEcG/VWunZgNqEGGjC6m5HKRd5jC3iu5YSaDSrrwASQW3uz9D7uUgtQbFZS9
         YN1YGfbBQ27Me0nqIB5dGg6H090zCpDkS2icZOHxNb/089r2kSUj+OVuhMTICDAYNLZT
         HtRlXXdMCv904IqORReSjOaIMQk32q7XdGOEXHUvYw15a7J2dm++e/DVF6j7O6nvR7DY
         rVzv4TB6dwm1dsjL4NUpH5/QlV9WBOeJOrkHBIuU/H4vVoDTO80obrJk96W54xN8KSgf
         g6/DPummsvSPaE4NAtii+AUigVRv2OtUpjv2GFzonPdM+AdN8bG3gZYeRFoX9WxZ3SM9
         stxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fRwryvuVhXYrAhLWdCvlg8zqrU0LccdvvXixZFgTlpI=;
        b=dpcGAPIG7DZFQjDw5i00ONienrITw/ooSyMu3j64CbIwJ+UhHmZtH25abJDcJpsQSJ
         e09TxMa3BMk9o1WjJy1GC8XzLuOVaYdW+D22tvXavGlIAEX6jxiUqXrDK6xoe8wqrwrX
         tS4pBNa0d/jnO5RsmieBRzRKNMwFwoGW3o7oOz+G8fNJ3cthHhW8YWT3r92bnloj0Gm3
         wAHpTP+CYLZM5ZLGtbV8PKobn6br5RB8SJJBBzDlmC+Dkb+UhtA04iaVM1mSN1hOO5RK
         ob9LwH3QMgoOVx/Vc0pISfeZ163ma65Z+2GUCKGFxatLUmoiRgdqBoG47dLlDr4qQy/J
         HEsw==
X-Gm-Message-State: AOAM531OcAUTM1N/yUipQUEXNWxPvp2oZYGGMMEs5RrCI6w4lXEz++EX
        w3pKwre4kMtOlq/C1D1jQ5eCCA==
X-Google-Smtp-Source: ABdhPJwU+kKYKSTYax2pFkwKEkMqmzxAc7GK//7UyTNHIEsyN/EH4UN0SEvfnPr8PHHMvDmMtUAQVg==
X-Received: by 2002:ac8:730d:: with SMTP id x13mr171787qto.162.1608231185009;
        Thu, 17 Dec 2020 10:53:05 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m8sm4127434qkn.41.2020.12.17.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:53:04 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v4 10/10] selftests/vm: test faulting in kernel, and verify pinnable pages
Date:   Thu, 17 Dec 2020 13:52:43 -0500
Message-Id: <20201217185243.3288048-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When pages are pinned they can be faulted in userland and migrated, and
they can be faulted right in kernel without migration.

In either case, the pinned pages must end-up being pinnable (not movable).

Add a new test without touching pages in userland, and use FOLL_TOUCH
instead. Also, verify that pinned pages are pinnable.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 mm/gup_test.c                         |  6 ++++++
 tools/testing/selftests/vm/gup_test.c | 17 +++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/mm/gup_test.c b/mm/gup_test.c
index 24c70c5814ba..24fd542091ee 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -52,6 +52,12 @@ static void verify_dma_pinned(unsigned int cmd, struct page **pages,
 
 				dump_page(page, "gup_test failure");
 				break;
+			} else if (cmd == PIN_LONGTERM_BENCHMARK &&
+				WARN(!is_pinnable_page(page),
+				     "pages[%lu] is NOT pinnable but pinned\n",
+				     i)) {
+				dump_page(page, "gup_test failure");
+				break;
 			}
 		}
 		break;
diff --git a/tools/testing/selftests/vm/gup_test.c b/tools/testing/selftests/vm/gup_test.c
index 42c71483729f..f08cc97d424d 100644
--- a/tools/testing/selftests/vm/gup_test.c
+++ b/tools/testing/selftests/vm/gup_test.c
@@ -13,6 +13,7 @@
 
 /* Just the flags we need, copied from mm.h: */
 #define FOLL_WRITE	0x01	/* check pte is writable */
+#define FOLL_TOUCH	0x02	/* mark page accessed */
 
 static char *cmd_to_str(unsigned long cmd)
 {
@@ -39,11 +40,11 @@ int main(int argc, char **argv)
 	unsigned long size = 128 * MB;
 	int i, fd, filed, opt, nr_pages = 1, thp = -1, repeats = 1, write = 1;
 	unsigned long cmd = GUP_FAST_BENCHMARK;
-	int flags = MAP_PRIVATE;
+	int flags = MAP_PRIVATE, touch = 0;
 	char *file = "/dev/zero";
 	char *p;
 
-	while ((opt = getopt(argc, argv, "m:r:n:F:f:abctTLUuwWSHp")) != -1) {
+	while ((opt = getopt(argc, argv, "m:r:n:F:f:abctTLUuwWSHpz")) != -1) {
 		switch (opt) {
 		case 'a':
 			cmd = PIN_FAST_BENCHMARK;
@@ -110,6 +111,10 @@ int main(int argc, char **argv)
 		case 'H':
 			flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
 			break;
+		case 'z':
+			/* fault pages in gup, do not fault in userland */
+			touch = 1;
+			break;
 		default:
 			return -1;
 		}
@@ -167,8 +172,12 @@ int main(int argc, char **argv)
 	else if (thp == 0)
 		madvise(p, size, MADV_NOHUGEPAGE);
 
-	for (; (unsigned long)p < gup.addr + size; p += PAGE_SIZE)
-		p[0] = 0;
+	if (touch) {
+		gup.flags |= FOLL_TOUCH;
+	} else {
+		for (; (unsigned long)p < gup.addr + size; p += PAGE_SIZE)
+			p[0] = 0;
+	}
 
 	/* Only report timing information on the *_BENCHMARK commands: */
 	if ((cmd == PIN_FAST_BENCHMARK) || (cmd == GUP_FAST_BENCHMARK) ||
-- 
2.25.1

