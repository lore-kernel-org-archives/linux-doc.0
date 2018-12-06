Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 704757D8D4
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbeLFMZc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:25:32 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:36446 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729850AbeLFMZb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 07:25:31 -0500
Received: by mail-wr1-f49.google.com with SMTP id u3so311004wrs.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 04:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KjVNxOw/tL33or+YZX4CcI05bhFwdq3tUwMnDPh4OsI=;
        b=oo3+H9klV662Z7l/sV9qWe+97OgA+3/vqJSjP7ORklWt6jkvGUcbWvgXiU/UVWdXkO
         aRLkTeLwT+26S54LZ1tdSLxem3Ftzv1i5So9WjUy3XATaE+uANX/1fhMF+AgEwKXtAwg
         rAkGmLrzYXP+yKAUEjpYbfuBC8hP5315ZeLkPCdoqz8/K4iUjij89tOCi8V9z1ejLgXv
         9vlIuXu8j0RV2wo3dbpaQBpF6J/r83DeeQdLrHkg1Q9J7X1H5aZr7mfCp5owOkx7HZqS
         vD+vfMjs6CnFWnveWnmJkNm2itflfgBDPdvXFej2Z386iBwGTvlr0kwYTm1qDAB9kXGW
         pTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KjVNxOw/tL33or+YZX4CcI05bhFwdq3tUwMnDPh4OsI=;
        b=oGzdzrtT1uHtPi6fwtFPYJMtfSa/Zbr8cUwHvNRKFPvn7CuGa0MX7GKsHr8D22+2P0
         UDu3caMpolSMxMWjdA14Btc915sZZqcM9xmJI+HK+FOFZ2OgxKMPaIh0tQbDUWTWIoFv
         sOIoYFl4vhzLByDv2NiO9SzbRZPzPZ/3ApB2hVeSd/R7idd+ibi7Yr5ybty02Irlnmdf
         b5YugZ/MMBt1XujNUejVekhxhSakPQE4Rt+UWtCmZq8A/goDsvZyFppcf65LjAIYZVE0
         PtFIMqqkm10yrg4/t6zWtWNIiOE3CnJnPc5WDLcqQ2AmkV2cp3dv7npNF+qmK0xuCXoj
         TznQ==
X-Gm-Message-State: AA+aEWbNnBq5DHvOfUijId2+TFg0d9pUBieiAj3jjHpqOmGUDYI9GO/u
        6T3z8pLKELqpszXldqUVR7d9zA==
X-Google-Smtp-Source: AFSGD/WkeEV102m8rxQR2fqB5liDyQXRSpSsg3Lo5uFcLBPqUhzjh0TSww8+pClypG1j70/WQ25UYQ==
X-Received: by 2002:adf:e983:: with SMTP id h3mr24228215wrm.232.1544099129139;
        Thu, 06 Dec 2018 04:25:29 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id j8sm339988wrt.40.2018.12.06.04.25.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Dec 2018 04:25:28 -0800 (PST)
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
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v13 25/25] kasan: add SPDX-License-Identifier mark to source files
Date:   Thu,  6 Dec 2018 13:24:43 +0100
Message-Id: <bce2d1e618afa5142e81961ab8fa4b4165337380.1544099024.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc1.387.gf8505762e3-goog
In-Reply-To: <cover.1544099024.git.andreyknvl@google.com>
References: <cover.1544099024.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a "SPDX-License-Identifier: GPL-2.0" mark to all source
files under mm/kasan.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/kasan/common.c         | 1 +
 mm/kasan/generic.c        | 1 +
 mm/kasan/generic_report.c | 1 +
 mm/kasan/init.c           | 1 +
 mm/kasan/quarantine.c     | 1 +
 mm/kasan/report.c         | 1 +
 mm/kasan/tags.c           | 1 +
 mm/kasan/tags_report.c    | 1 +
 8 files changed, 8 insertions(+)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 1144e741feb6..03d5d1374ca7 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains common generic and tag-based KASAN code.
  *
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index b8de6d33c55c..ccb6207276e3 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains core generic KASAN code.
  *
diff --git a/mm/kasan/generic_report.c b/mm/kasan/generic_report.c
index a4604cceae59..5e12035888f2 100644
--- a/mm/kasan/generic_report.c
+++ b/mm/kasan/generic_report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains generic KASAN specific error reporting code.
  *
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 2b21d3717d62..34afad56497b 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains some kasan initialization code.
  *
diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index b209dbaefde8..57334ef2d7ef 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * KASAN quarantine.
  *
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 214d85035f99..ca9418fe9232 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains common generic and tag-based KASAN error reporting code.
  *
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index 1d1b79350e28..0777649e07c4 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains core tag-based KASAN code.
  *
diff --git a/mm/kasan/tags_report.c b/mm/kasan/tags_report.c
index 573c51d20d09..8eaf5f722271 100644
--- a/mm/kasan/tags_report.c
+++ b/mm/kasan/tags_report.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This file contains tag-based KASAN specific error reporting code.
  *
-- 
2.20.0.rc1.387.gf8505762e3-goog

