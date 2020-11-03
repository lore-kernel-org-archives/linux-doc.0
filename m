Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E378C63699
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 17:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AA1A22370
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 17:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wLDWNHN6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgKCR7U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Nov 2020 12:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729142AbgKCR7T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Nov 2020 12:59:19 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B764C0613D1
        for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2020 09:59:19 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id y8so11220885qki.12
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2020 09:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=CyzBgJt6/thndXzzWyuMyy394G827nuVvC5tSjcPYlU=;
        b=wLDWNHN6Jlrx5jMfYRmF7AaIdsAsVqcFfM/UxWxeQGmjN6O/rAoCjUJ/dqnnkciRvD
         3v4f5lQsxSLMtlAbviIcPy/E5dKECr/R3ZhF6McjvR6/TAaagsoPJ+QGV3rRGIEwby0r
         80MfTcBtYAGCfDz7g8pyydNyJrAj6aqtMTajRF2JJhMHugtZrLWgQ4XIgytzxkUsaJg8
         30pCBpQSlLycABEICk80sgAUKgKtPzTWAPl9sJUUKcIxtQ/JRdFlmVQlzFxEQiREvU/5
         eYAsZg//thY9gtNPQqvXnaetldceMrwDUz6n8Kj614JLMlQYsldPBXsQC7cWfjkZI3aZ
         EMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CyzBgJt6/thndXzzWyuMyy394G827nuVvC5tSjcPYlU=;
        b=sQHzVGtZyc7FwdNO8pRPTeRX4Dl1vbazTLe+zPL3AsMMGpdzNfx4YWEabT4JaECNjQ
         XTo3UF4HlKZfY4+3sWfQothywWguW6jDp3taEkiQ2Lb6eCHwUbVz77cT+G1SLSeGiqMm
         CTNbBigevkJzq1G22re1wNzjJ69lc54odGW+5gV/DnnQCgRIP5L0cFQnHQV1ZugJEdxE
         6S3KneSQKYwf1laD4x6xdjtdR8IbqiWxbFyedN36+ClDJVcZWhkhwIB0krmpwQmt187w
         DDT0msP/YGx+otE+emZlP2dybrGJGkudQu0Yqb+0YQUpJzcP4LbPyNZxUCwCz0hGMMUW
         X3Yw==
X-Gm-Message-State: AOAM532QSIqFwviAXJFzuVsrYvbh4KZpo+YmQzDLUiq5rllCYWnNqtHY
        rMBanlnTudVZ8BdgUbxy6UQJPgD/Jw==
X-Google-Smtp-Source: ABdhPJwecuZrvUu6I0iZDqQHsi1TYpYfph3h5Dl2vPR+qlGtDJgSe/vALFlwZJfn8fay91wo5YTqghQaKA==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:ad4:43c6:: with SMTP id o6mr28340543qvs.53.1604426358730;
 Tue, 03 Nov 2020 09:59:18 -0800 (PST)
Date:   Tue,  3 Nov 2020 18:58:41 +0100
In-Reply-To: <20201103175841.3495947-1-elver@google.com>
Message-Id: <20201103175841.3495947-10-elver@google.com>
Mime-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v7 9/9] MAINTAINERS: add entry for KFENCE
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
v7:
* Add asm/kfence.h [reported by Jann Horn].

v4:
* Split out from first patch.
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b516bb34a8d5..09ad4771599d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9733,6 +9733,18 @@ F:	include/linux/keyctl.h
 F:	include/uapi/linux/keyctl.h
 F:	security/keys/
 
+KFENCE
+M:	Alexander Potapenko <glider@google.com>
+M:	Marco Elver <elver@google.com>
+R:	Dmitry Vyukov <dvyukov@google.com>
+L:	kasan-dev@googlegroups.com
+S:	Maintained
+F:	Documentation/dev-tools/kfence.rst
+F:	arch/*/include/asm/kfence.h
+F:	include/linux/kfence.h
+F:	lib/Kconfig.kfence
+F:	mm/kfence/
+
 KFIFO
 M:	Stefani Seibold <stefani@seibold.net>
 S:	Maintained
-- 
2.29.1.341.ge80a0c044ae-goog

