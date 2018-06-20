Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D1547DF86
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 17:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754295AbeFTRkx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 13:40:53 -0400
Received: from mail-wm0-f52.google.com ([74.125.82.52]:40040 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932554AbeFTRkg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 13:40:36 -0400
Received: by mail-wm0-f52.google.com with SMTP id n5-v6so957825wmc.5
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 10:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TFLEoviKOW4uu5PejBltcht9oaCixKv75RzZq4xsziY=;
        b=qzg/zrPsEGQvz1VsMtE8mQ8MUu26exAnJzZAUpyEVuJwd2sKafS88wVDYOfOSioQu+
         HyAfriQxoBJVX26CpK2taAaOsgVAoYJjqNPiZs4Ph9iw2uVlo9efzJk78AajFGWfqpZU
         TIexFP/kKyN/LkwGUHIOpjPz+B8Bx1R4ynS5ZEvdIMq4PQXySY9Ivii7H5juf7d6X1cy
         rO8K1Nb2RDxx84oa6pxRe4fdMnBMFB8vfrRO3p53Pmvw4B8o/fBWoxWNFuzitGN7J7Ok
         ylfKDPtkpR/SoSmvk44jBUN5HBtYDoXLMUnX+NBHv+WavHn4+0IWtEM2btWZMG0KHGNK
         uxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TFLEoviKOW4uu5PejBltcht9oaCixKv75RzZq4xsziY=;
        b=Gc1i+gGcRPGHP1R/oxKAmbSxbdVLi1tsf7t0giYMcHRGWB2a15Brt4TdEwmkd+2Egf
         NmS+uwtX/anHsQfIsxQIhmgQmyrh5J6ATXGBReKG9Yf39SDysb5rdVNclEZY+Ax1cDnt
         VN9e33Y1qgtZ/RtFHPGFouuS1oMul1mgjJcXGFOcddobJcnhsNHtVZIZL/GCtjLldUh5
         WgkZc+RCA9Uh23X0adncAV6R1WAGyIXkAHXXdd59EijNcsW1UkEwvyZC+XpKlcT06TTg
         6ugQyZUgXwfgtPeEerLJaW+10USKcg0TX4Y+F0kfL6Jc1k3fokL/+qA/tbmOJxInjgh1
         KTyA==
X-Gm-Message-State: APt69E239+LHGKRbfX++8ztQobROuyVnIoidDCWz6j89gUluUHt6DYxY
        8G9MOKPpT+DN/fdXhydWehdr+Q==
X-Google-Smtp-Source: ADUXVKIJ9uyp+tvpXMUh/JUvXbTy5WnWWTLA7Y1CQFFS8s+Rok4cxNrxv9KanAFzty6IvXk9u8kgEA==
X-Received: by 2002:a1c:8692:: with SMTP id i140-v6mr2528727wmd.11.1529516434785;
        Wed, 20 Jun 2018 10:40:34 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id f18-v6sm4388598wro.1.2018.06.20.10.40.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 10:40:34 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v3 17/17] kasan: add SPDX-License-Identifier mark to source files
Date:   Wed, 20 Jun 2018 19:40:03 +0200
Message-Id: <f76d3070776e0038eda3cd76d471d1bfeae18480.1529515183.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
In-Reply-To: <cover.1529515183.git.andreyknvl@google.com>
References: <cover.1529515183.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a "SPDX-License-Identifier: GPL-2.0" mark to all source
files under mm/kasan.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/kasan/common.c         | 1 +
 mm/kasan/kasan.c          | 1 +
 mm/kasan/kasan.h          | 2 +-
 mm/kasan/kasan_init.c     | 1 +
 mm/kasan/kasan_report.c   | 1 +
 mm/kasan/khwasan.c        | 1 +
 mm/kasan/khwasan_report.c | 1 +
 mm/kasan/quarantine.c     | 1 +
 mm/kasan/report.c         | 1 +
 9 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 6cf7dec0b765..955e0ebdc644 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains common KASAN and KHWASAN code.
  *
diff --git a/mm/kasan/kasan.c b/mm/kasan/kasan.c
index 44ec228de0a2..128a865c9e05 100644
--- a/mm/kasan/kasan.c
+++ b/mm/kasan/kasan.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains core KASAN code.
  *
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 6f4f2ebf5f57..3feacd889e24 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 #ifndef __MM_KASAN_KASAN_H
 #define __MM_KASAN_KASAN_H
 
diff --git a/mm/kasan/kasan_init.c b/mm/kasan/kasan_init.c
index f436246ccc79..2dfa730a9d43 100644
--- a/mm/kasan/kasan_init.c
+++ b/mm/kasan/kasan_init.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains some kasan initialization code.
  *
diff --git a/mm/kasan/kasan_report.c b/mm/kasan/kasan_report.c
index fdf2d77e3125..48da73f4ef7c 100644
--- a/mm/kasan/kasan_report.c
+++ b/mm/kasan/kasan_report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains KASAN specific error reporting code.
  *
diff --git a/mm/kasan/khwasan.c b/mm/kasan/khwasan.c
index fd1725022794..f0d528a8c3f3 100644
--- a/mm/kasan/khwasan.c
+++ b/mm/kasan/khwasan.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains core KHWASAN code.
  *
diff --git a/mm/kasan/khwasan_report.c b/mm/kasan/khwasan_report.c
index 51238b404b08..4e193546d94e 100644
--- a/mm/kasan/khwasan_report.c
+++ b/mm/kasan/khwasan_report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains KHWASAN specific error reporting code.
  *
diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index 3a8ddf8baf7d..0e4dc1a22615 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * KASAN quarantine.
  *
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e031c78f2e52..633b4b245798 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains common KASAN and KHWASAN error reporting code.
  *
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
