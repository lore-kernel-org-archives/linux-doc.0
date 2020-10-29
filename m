Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49839C5517A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 13:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E11BE20732
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 13:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rRA+MGMd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgJ2NRZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 09:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgJ2NRW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 09:17:22 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DA1C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 06:17:22 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id x34so1759857qvx.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=hmbKrgrrAV+ZwrZ7GWFGPrZaCp36du3w8RCEfMZ8hak=;
        b=rRA+MGMdUVhxdLn0fiVLTsKyw2gzfgaTTZNdAD8mv7qJa7bRjJvyyRZ8Zlnfig57uA
         3moKitlSUs2lFIZMRVO6D5rHkyNuu2BF7TdlEUiBAh+BISK0kWnxlDQS5AKRJfknorWZ
         ZS4kUR0Qn0LWnANIxO5RCa2DPSVaU8Ahn/juURFEQqXBVc8RTIiEOqOJWy6MRqS8JTs+
         I25VGhq+V7xPkxFFSnwv0nGVjdNTPCuB5osjwNRSXfv6E7lImhDJ56FTQieNXeMsBny0
         XuJ+c3jW1qI2TYoMJqvJ0v67uHoOGLTtuBvRFdAuu9m0JlRcY6z/0/G2avUn1ALzMFbF
         BNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hmbKrgrrAV+ZwrZ7GWFGPrZaCp36du3w8RCEfMZ8hak=;
        b=W8yzWvdwPVJyoQHNnfNWQW4rUPUKBMeTLFPMr4nrc96Hg7sLoediCKccuICOtz/uNj
         5fibeEL5Ojq1nHi5tln54Cqk6u4/ZU0InEhZO54lh/ZMe8JddTxOlJqFuRJzf0L7e/C9
         +fOz7xydn+OQyNlrbxr0OnZ7+fasVvDov7URVQZpz/hW6JJ0q4H8Q9FVwgGGt1OllC9Z
         0jQRsKGvBupWzwEEGKaF8xGt8BxEZUACOIZVnbxX0Gdz+5x0WUdZ9bE5u2/vfYgIsG58
         dFBWg6TriSD4HGbBMR80qaudS7y6YeMbLA9fcNuAnnXrnr1BQlqTS7WRmaDbDmiXpI7j
         7g6w==
X-Gm-Message-State: AOAM530G+nURakOubClZdUtFvwaLZxbYBZTKoXovDyONeJO1Eeh2lvjf
        6NdwA9H/D/xPZtZxUhbQP3KiuQBPeg==
X-Google-Smtp-Source: ABdhPJx6Df8kwq1WIJy7wveWRyDoLsov7nxJzypRJUlzUEaRsLhUHrDBGcSs6ssHj4PbKi/Vfn+qIpsyTQ==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a05:6214:943:: with SMTP id
 dn3mr4211962qvb.45.1603977441430; Thu, 29 Oct 2020 06:17:21 -0700 (PDT)
Date:   Thu, 29 Oct 2020 14:16:49 +0100
In-Reply-To: <20201029131649.182037-1-elver@google.com>
Message-Id: <20201029131649.182037-10-elver@google.com>
Mime-Version: 1.0
References: <20201029131649.182037-1-elver@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v6 9/9] MAINTAINERS: Add entry for KFENCE
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, joern@purestorage.com,
        keescook@chromium.org, mark.rutland@arm.com, penberg@kernel.org,
        peterz@infradead.org, sjpark@amazon.com, tglx@linutronix.de,
        vbabka@suse.cz, will@kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for KFENCE maintainers.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: SeongJae Park <sjpark@amazon.de>
Co-developed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Split out from first patch.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..2a257c865795 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9753,6 +9753,17 @@ F:	include/linux/keyctl.h
 F:	include/uapi/linux/keyctl.h
 F:	security/keys/
 
+KFENCE
+M:	Alexander Potapenko <glider@google.com>
+M:	Marco Elver <elver@google.com>
+R:	Dmitry Vyukov <dvyukov@google.com>
+L:	kasan-dev@googlegroups.com
+S:	Maintained
+F:	Documentation/dev-tools/kfence.rst
+F:	include/linux/kfence.h
+F:	lib/Kconfig.kfence
+F:	mm/kfence/
+
 KFIFO
 M:	Stefani Seibold <stefani@seibold.net>
 S:	Maintained
-- 
2.29.1.341.ge80a0c044ae-goog

