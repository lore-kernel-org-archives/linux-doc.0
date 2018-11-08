Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 93BA07D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 14:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbeKIAMQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 19:12:16 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34549 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbeKIAMP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 19:12:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id f1-v6so1690320wmg.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pCI3XzgNVAltAQe0ygEc6WjcTSNZu+vDSueRg2rkboA=;
        b=UP+XhJbt7rG/bdEpw8fc31VRF5aLTB6BTp86/sKBPDdvzf+3rKxrZx+R4xkXmuYNk4
         Z2kSoGRZtY2xgb0cZLZ8nqWLECPTlNaPdP21J5ZftO9/AJWV27UNRA3MqMVTh/5VBt86
         OR25TGd6GfMgbPUcVLtTp1LdrRAy+ildKK5CGWBA4J0gfpCpY2qo+ocTQb4EWphPlU6Q
         auFXwXntmIyQWzfLokABGdc0KwvDYW58Q+kRcY3/53A5RFB2TyvvkOfcZPB/L/44UZEC
         8kDE/Ckdr3nMddglr5ecwDqcjOXtIhIheYGjYA9pJ/KdMyecy+Hsgg9Tkw2BDFQ1m7aq
         kRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pCI3XzgNVAltAQe0ygEc6WjcTSNZu+vDSueRg2rkboA=;
        b=EBMguTuT5/52lL5ZALarEnQ85IpfQurJsd5Y1xmHD/QbeLjMtO7+5RURwDHqh9T+GL
         SkATSN/KgBGqVXh8ateJhA8Yj7taE9TBCVatreZiOFFcCenfJ8eZsRzQiNeV6jVIV/cS
         Euk0GahlWs1/D8UD9Nmo5tdnsGAJCS/5DP4lTWTX3lR4tv5a1Rt7UHNx92cbn3Ss5Z10
         3objRP4+IYCTBxXN2lewDK8VljQCw7SnOKBKTfeOG7IxdMH2nNQl6zcHOsvbcWo4OX8i
         uDGF/98s2yeMZMiflhB8MW9O70D6Fj2ckjz0v+LGhTTmvemEtTmKVugdDjNdzlDqC1Jt
         WMdA==
X-Gm-Message-State: AGRZ1gJL6YUdjzV+YvR9eGv/rwH0Ys2P8iS307ZXwjhXHrcNOoOXwTh8
        O02XOe1ZESDKeOZnPfL6b/fzMg==
X-Google-Smtp-Source: AJdET5c+OpdgjUiZO9kVFnzi+iLq8I4Ia27Tsi9lTwsCI5F43MyC9kiQR9b4hA1qM6mueQyUfoxirQ==
X-Received: by 2002:a1c:154a:: with SMTP id 71-v6mr1368940wmv.83.1541687787548;
        Thu, 08 Nov 2018 06:36:27 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id k5-v6sm5421068wre.82.2018.11.08.06.36.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 06:36:26 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v8 5/8] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Thu,  8 Nov 2018 15:36:12 +0100
Message-Id: <4969eac81732e555ca1ec102c12eb1e29c82ed29.1541687720.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to handle the case of tagged user addresses separately.

Untag user pointers passed to these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 2 ++
 lib/strnlen_user.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index b53e1b5d80f4..97467cd2bc59 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -106,6 +106,8 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	src = untagged_addr(src);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)src;
 	if (likely(src_addr < max_addr)) {
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 60d0bbda8f5e..8b5f56466e00 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -108,6 +108,8 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	str = untagged_addr(str);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)str;
 	if (likely(src_addr < max_addr)) {
-- 
2.19.1.930.g4563a0d9d0-goog

