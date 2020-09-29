Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F26FC4741F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6DF020848
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 13:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RMoZt1N1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgI2NjP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 09:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbgI2NjP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 09:39:15 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BEBC0613D9
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:39:10 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id r22so2998566qtc.9
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=yRZiTM513RUM1qA05tKNAK84aK8AXWt5NeOVqEsZqzg=;
        b=RMoZt1N1VC1Fh6JSja/SIvuYleFuWA56QNN6c5hUQ6wpKxu0SOkwrrjGx4Q4n2TKKg
         m9EGWid5Q2kn1NJYcmV0+bpdLob7uTG1n7fRNpWZSSc/DRQngnd4xc/T2UDcH8JVxCcu
         71eUATNe/1D9zAUJstogDeWzE1Vmf0aXok7LLiqy+B+Dh48US3pYrx7emWpaUiNNNNJ0
         NeilFg14O0MZrTO2v/UaWcs4bqfozOhG0MyXzgAWeCGUByc3jBJnMRfrEkVLqAOlG4ZH
         lDD+tiLj5qqewMy1ZM/5m1f9qn2js4yTaxOGxWoYRlGw4qIwfkcjAUFwuphpbiTcXiId
         3isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yRZiTM513RUM1qA05tKNAK84aK8AXWt5NeOVqEsZqzg=;
        b=dW+FsDRVHHD/wm5GzsIz2MyBI3DNNJf3braEzD25cpRlH2StBdCYYNSqqmNeUnWyDx
         4n3cdcqm/CxQ3QYQC1TBdu/sCm8tyjoxoZS2NHUY8B7/Y7tD0Y6/mbAoEOI7S3hSQZrg
         b7woxoUdCWGvj8E50TwATXkM1pZyrDWl0YB+3pjkBULP0N6Ub+l2Jgsr7+bi4B79FY6U
         AHsFF4tTFQll11v3sACME1UqmZhR4L3yRktxDJ0ZOgUwvH/CDCNtFa+B/TkWYjbdkYxx
         nDNrnVF0cHaXiZjQHeB/Gg5MjIEOFCEwUB1dob01yWfMcWBj3SAEOZx0ljiCN7GoMoFe
         eSDg==
X-Gm-Message-State: AOAM530UVOEMjrDiIzqsLDk/Et9Vagt41YLB8e+R6o6jgmzCglFtfygb
        mW4RKLERS4Ryt4SNILloPGvh+v9JYw==
X-Google-Smtp-Source: ABdhPJwL4i5d6hhPFS+FihasdHV2GBR5yea8MVHJP+c6baeLmXZ6wOEr6I7fwSBwJYCHGcndEAHkUfTj9Q==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:ad4:58aa:: with SMTP id ea10mr4618135qvb.58.1601386749025;
 Tue, 29 Sep 2020 06:39:09 -0700 (PDT)
Date:   Tue, 29 Sep 2020 15:38:14 +0200
In-Reply-To: <20200929133814.2834621-1-elver@google.com>
Message-Id: <20200929133814.2834621-12-elver@google.com>
Mime-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 11/11] MAINTAINERS: Add entry for KFENCE
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        mark.rutland@arm.com, penberg@kernel.org, peterz@infradead.org,
        sjpark@amazon.com, tglx@linutronix.de, vbabka@suse.cz,
        will@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for KFENCE maintainers.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
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
index b5cfab015bd6..863899ed9a29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9673,6 +9673,17 @@ F:	include/linux/keyctl.h
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
2.28.0.709.gb0816b6eb0-goog

