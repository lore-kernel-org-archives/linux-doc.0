Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C79157D581
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 15:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390605AbeIUVDP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 17:03:15 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35145 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390710AbeIUVDM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 17:03:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id j26-v6so13225769wre.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=48KpBhbpX8k4MlE9FZxCCo+SK7CByQ3FGnXwZR2f4hg=;
        b=pA4Vvh1KYKqK32X35dwOc2sZ+du68FLEqTwEuOeJRddrsO6UzG1REZ07mAcgXwK8l9
         RA6b/c5ywJT6p8sdhE+KqmIBpxJnagcnbJD82VLes1nzNkyHvfeyc4rYL/3VzyValRfc
         RtMZY9mirFw4rUCwXlBijzT/9NM3u4rP63XyYtXJrwVUvIkDPRNpnyUy7vePoRgIGtNB
         h8W0TvXJ2W8YgcZ8is6VJncGk9D9qYZP9r/wrYd4sob5Sus3WRTf1HWjZ4dCEUaP29O2
         hQCXakhPH46K7WYNUOxQNZgMpHIZcI+1VJsRY3A4SF30xp03gVn1HNQTyMMZoEoPCmsI
         WKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=48KpBhbpX8k4MlE9FZxCCo+SK7CByQ3FGnXwZR2f4hg=;
        b=MnIUqeYgBc8DVt3B0eb3EHUyvOTOgtwCcd2OjqUs9qw4WcNp0XuHKneA09cGtOYmUa
         2UMsHLVS9NoRMYEXyf546o7SdXGD6aWMrSEhYe0sHbZf38lAsubSy3ZIbsgPU6Zz8TAm
         sArSUWmxP8e9Fh0VpTPJO/+qOFbsdKCSojqh8c1ziya1M9GJdT0LYoRoxtcd9fFhc8KO
         lPDeSbZCBFZL7W6tLvahS6I0NcFMqMe0xEa99ypeeIfJadUY/p9H+lLWoX3iuhkNHRW6
         5x6t2bO5ToUdOQ5dG+Xis9ndCTLA3VA7pBltTycXyTHfoO7aW+Dg4xgiafVqYF+cRMzK
         rDPw==
X-Gm-Message-State: APzg51BDz9FXQO2mII/dA5gUsdhmds2jZCd9utGb6uCdSLvwi3K0EA5C
        4rKd30BZL/gy4y0ruJtt3MINiw==
X-Google-Smtp-Source: ANB0VdbEgHdvFHJ+7h14oVGlUr0lXP+PzKSw2/vBxtVnJXJIS8RdhJRpb+XY/BcEVSW6nRPB6JqPEw==
X-Received: by 2002:adf:dcc1:: with SMTP id x1-v6mr39273115wrm.21.1537542831696;
        Fri, 21 Sep 2018 08:13:51 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id e7-v6sm27990271wru.46.2018.09.21.08.13.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 08:13:50 -0700 (PDT)
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
Subject: [PATCH v9 03/20] kasan: rename source files to reflect the new naming scheme
Date:   Fri, 21 Sep 2018 17:13:25 +0200
Message-Id: <875284629f1727911c2388ebe724fdd0b609eefa.1537542735.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.444.g18242da7ef-goog
In-Reply-To: <cover.1537542735.git.andreyknvl@google.com>
References: <cover.1537542735.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We now have two KASAN modes: generic KASAN and tag-based KASAN. Rename
kasan.c to generic.c to reflect that. Also rename kasan_init.c to init.c
as it contains initialization code for both KASAN modes.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/kasan/Makefile                 | 8 ++++----
 mm/kasan/{kasan.c => generic.c}   | 0
 mm/kasan/{kasan_init.c => init.c} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename mm/kasan/{kasan.c => generic.c} (100%)
 rename mm/kasan/{kasan_init.c => init.c} (100%)

diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
index a6df14bffb6b..d643530b24aa 100644
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 KASAN_SANITIZE := n
 UBSAN_SANITIZE_common.o := n
-UBSAN_SANITIZE_kasan.o := n
+UBSAN_SANITIZE_generic.o := n
 KCOV_INSTRUMENT := n
 
-CFLAGS_REMOVE_kasan.o = -pg
+CFLAGS_REMOVE_generic.o = -pg
 # Function splitter causes unnecessary splits in __asan_load1/__asan_store1
 # see: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63533
 
 CFLAGS_common.o := $(call cc-option, -fno-conserve-stack -fno-stack-protector)
-CFLAGS_kasan.o := $(call cc-option, -fno-conserve-stack -fno-stack-protector)
+CFLAGS_generic.o := $(call cc-option, -fno-conserve-stack -fno-stack-protector)
 
-obj-y := common.o kasan.o report.o kasan_init.o quarantine.o
+obj-y := common.o generic.o report.o init.o quarantine.o
diff --git a/mm/kasan/kasan.c b/mm/kasan/generic.c
similarity index 100%
rename from mm/kasan/kasan.c
rename to mm/kasan/generic.c
diff --git a/mm/kasan/kasan_init.c b/mm/kasan/init.c
similarity index 100%
rename from mm/kasan/kasan_init.c
rename to mm/kasan/init.c
-- 
2.19.0.444.g18242da7ef-goog

