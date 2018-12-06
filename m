Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 741FB7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbeLFMY4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:24:56 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36737 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbeLFMYz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 07:24:55 -0500
Received: by mail-wr1-f68.google.com with SMTP id u3so309392wrs.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 04:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kn5CDDyDqdktmueSgYXSsO0zwDwfFFrMoSLJG2Ivw50=;
        b=Pf39mxwRcpa7KrX6UwoJEQfz3CfXq5RBMJ6m5aM5/gDD8ItWtZq5G1xjMawUGn+z+T
         dS+/sMDdEwBB6CM7bHAttpoCEIgFl/kBeGPn3lwT1LywZDgoWZOOLzWJ2RZ2yetGz9o9
         lMtnP1mE+kwTeKyEArzQjzOtctZLFx7BLRHSE0CEcCJLYjXIGKOCJ6xwLrKMHD6bes7C
         7uOYfXDimhdwWkbB2RWHOR+L5Z59vziD3aEiJFEdoJazqAi7fgF+yBbpulYxf79uEPLu
         6Lu2htdc0fEE4NHxlu9JEzcIxCl/CyyVSkHgAm7pbWxdsZHVrmTWKfD28vT5Pk9MVFVa
         +D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kn5CDDyDqdktmueSgYXSsO0zwDwfFFrMoSLJG2Ivw50=;
        b=Ogyj9n95ozseaiG1JFTsiSkaXh6CLxrDOSkzXg7NzYovFITBYRTJsQ8c1jpJQ2vbTQ
         Jf8Jf5Y0WmLqI3UOt/xw/cGvXlFew+cCLFoNUZ/PMjjXSE8MBoaHrvZiq09+EcIc2S98
         TjK5SELbso4d5SNHDLE+uQKHgZr4E/6NhQDZ3hkCOadhff7WIGzHoGbBFDUtIeicdFrq
         xpofjTx5B2BftpE7AIPKOcIhlvsPAhHrDrgcMMF0M9l6kNj8OLDxi8//s7tlvpLKaU/q
         5vm/RZ7Z4Bn8lI/z0efVWfmog6hUnrQVrZyLyVwNjR9Z0uLFGkAXKg33A0t3Cy+429sg
         vJNw==
X-Gm-Message-State: AA+aEWaKkxkTjEfn2oncT6adhZfOglOMCebWddKgAwCGf7zKolVZWXgd
        jvi7AJGtr49qRdOuzPHEb0iUMw==
X-Google-Smtp-Source: AFSGD/XqP2P/Wb4WdG1rKPMTei3wp8lKRgpVfvbDuVz/Yb1l+zYY35vzWOnd/pnfJMaPCW4EAswf3w==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr24026901wrt.209.1544099094073;
        Thu, 06 Dec 2018 04:24:54 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id j8sm339988wrt.40.2018.12.06.04.24.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Dec 2018 04:24:53 -0800 (PST)
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
Subject: [PATCH v13 04/25] kasan: rename source files to reflect the new naming scheme
Date:   Thu,  6 Dec 2018 13:24:22 +0100
Message-Id: <88c6fd2a883e459e6242030497230e5fb0d44d44.1544099024.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.20.0.rc1.387.gf8505762e3-goog
In-Reply-To: <cover.1544099024.git.andreyknvl@google.com>
References: <cover.1544099024.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We now have two KASAN modes: generic KASAN and tag-based KASAN. Rename
kasan.c to generic.c to reflect that. Also rename kasan_init.c to init.c
as it contains initialization code for both KASAN modes.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
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
2.20.0.rc1.387.gf8505762e3-goog

