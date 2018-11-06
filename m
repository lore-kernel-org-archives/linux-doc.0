Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA3627D982
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 17:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389676AbeKGC5F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 21:57:05 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44835 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389677AbeKGC5E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 21:57:04 -0500
Received: by mail-wr1-f67.google.com with SMTP id j17-v6so9329170wrq.11
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 09:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uFXbDXBBL0TkI32ZOkP12VFoaipD/tLiCoQgwqz5odA=;
        b=Ml3obd1uR8RA+9+kPyhYpuUlNKibYa2CRfEbIgyyBjJQQsxI6O4jyB2v5aISRpt4Fb
         rj4kSRubmtB2gfIcZerb9slf7GTBlw5Tbp5c6iugUfnuzQC3XsITzLENuD6X3Z/YVueS
         bl9A1RcdoBcA5tpBEPGGsPvphoq47rYDLEthUDE1Hiqg/OBDYoq+iQomOZZipqa6qEqA
         gh6W9WBQf63nRue+Lp+Lr0m7GGRxT+OuaVzn4d2W9CtavCwPeOK+zHxnbC181eLpQfwB
         irf9RttaDlwEot1Pj/F6sKVqzuewyv/+3sbuY8ZQkS5ntsRoTJp/p4MtvWOF16tdHpIJ
         9hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uFXbDXBBL0TkI32ZOkP12VFoaipD/tLiCoQgwqz5odA=;
        b=n9pHbiFHDkCIowtnKHy3GhqH/oHwpPIkd5ncFbMNWRphvDD5+J3XpCt/sTuNDQ1XJY
         5ratte7NDlgzBB43ceMgAi/EXZLljw5bb33Z0KOwUwiJP0qRAInaIkIHts29CQN98FOS
         nhEOcEKG3FMPsH0lC6rleUKdkL/5IC/0LNqtcXFNupfi16hw73hJQZVj9049i3+UGM94
         jSvbdBeAdKfSrJ5OYjvwXMF3OR5N0PvgARRMb+ySOUotn1mlnkI3JTF7djwcHQZsdZux
         onsgOrca/VLTKOoSDubgGE/BNjQfB3l27DN6KLEL7tCOgPcFLbVB0Pj8yrzFgWDU/Kid
         7Z0A==
X-Gm-Message-State: AGRZ1gIiOlz7qhW7I4P+AGfFsBFeWFr1Uh1xs9BjjvsOVrCcFirrTZGx
        /YM3591Af71thNhYmm9jrwc2Aw==
X-Google-Smtp-Source: AJdET5c+bHFl6qHCJUo73l2cQqmAl8DcYcsx+G0rN/ISh1Rrs2TxDP7+TGu2bV1DVX4z9B3j3X+3mQ==
X-Received: by 2002:adf:a31c:: with SMTP id c28-v6mr24695147wrb.195.1541525447608;
        Tue, 06 Nov 2018 09:30:47 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z17-v6sm16328416wrm.65.2018.11.06.09.30.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 09:30:46 -0800 (PST)
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
Subject: [PATCH v10 04/22] kasan: rename source files to reflect the new naming scheme
Date:   Tue,  6 Nov 2018 18:30:19 +0100
Message-Id: <05fbfe73d79159af71bfded4d3b46f8055329e1a.1541525354.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
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
2.19.1.930.g4563a0d9d0-goog

