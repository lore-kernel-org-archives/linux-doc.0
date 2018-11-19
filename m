Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77DA37E975
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 18:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404209AbeKTDxm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 22:53:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33177 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404677AbeKTDvh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 22:51:37 -0500
Received: by mail-wm1-f67.google.com with SMTP id 79so3211303wmo.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 09:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1YhKty0PhBPSl7VZmDwGA+CXyNSRUPKrtcyaCeImY3A=;
        b=DnG4e1wJQP7UD6p6zIz57/Rv8pyRn6SQ8HJI0SVPFeiAkkFExKONMAX5F3DnTwyOah
         jlxMnrHVidMA0iBppEJreCsRSZSmTCkl/vQmtwv0zX6Sis02dF/q6YhQ0tuCy9MevN62
         sQnySQ2k9tiaKs3VCMmHZXVu9sAg3dZd0ofuLPUfas+VFLIU3xWkBt67dN/j+gfvjNyn
         ADr69OpHpZ7rV9SYeeb6A5M6p0ilZbXkzmlesFgYR2iDng071A9Gvk8BwkHiV+uNzaQS
         iNToRyorfV5Ah8VewgqY0Tvh7DIQKHsYjgQbuZmxuHMlH5BYYFYK+ZXOLD1F3BODIn59
         cHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1YhKty0PhBPSl7VZmDwGA+CXyNSRUPKrtcyaCeImY3A=;
        b=uSyQNsUv7pGtQA1gdNWp8V86up7vmDaKilbFcgZDGfQ5iujivn4j3tr/v3HkpiggsG
         MSPKGEMVsYhbEARTy6duMA8h0PlaT2sOYCfDTAKxfHStJPXlz3+TgRXIWwSkFU7XFurY
         ReVXcO3nVJ0MPNOf0OX/cxtC+rP3179kYx9NHP5eZXism+tLoQcTK969tGX6v5fBchFS
         icZol0XLCD0ok8zeqm01dnaHZWh+UC8MP6eFsMbEilNGBn06Gz9bVuKfzibdksGus7i6
         Ra7kBhCjN23Qg8pF3OU27cR8GWS11AhEGkclnvTeyWy26ZBAxPXR9kA2NnfOBKKKPInB
         H4hA==
X-Gm-Message-State: AGRZ1gLE1M1zC3ApU9yDB4P9T6txxNBkdyqXz7w1ALXq0fkNhrMhwZC7
        xgRhqZ+LCPUksYU81IFRG8SaeA==
X-Google-Smtp-Source: AJdET5erzvm32b8ZF3d92FQfSjsREk6d9aLRHY/YmUcwUo+OxmSXKpVoDAiZpQ39XDdOFZWvSxgUJw==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr7741735wml.76.1542648432514;
        Mon, 19 Nov 2018 09:27:12 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:3180:41f8:3010:ff61])
        by smtp.gmail.com with ESMTPSA id l143-v6sm23685190wmb.23.2018.11.19.09.27.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 09:27:11 -0800 (PST)
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
Subject: [PATCH v11 11/24] kasan, arm64: untag address in _virt_addr_is_linear
Date:   Mon, 19 Nov 2018 18:26:27 +0100
Message-Id: <5cb565e6a6b17eceb6590a33d84208f725cf8dc2.1542648335.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.1215.g8438c0b245-goog
In-Reply-To: <cover.1542648335.git.andreyknvl@google.com>
References: <cover.1542648335.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

virt_addr_is_linear (which is used by virt_addr_valid) assumes that the
top byte of the address is 0xff, which isn't always the case with
tag-based KASAN.

This patch resets the tag in this macro.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/memory.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index ae741827039c..ddad7df77027 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -322,9 +322,10 @@ static inline void *phys_to_virt(phys_addr_t x)
 #endif
 #endif
 
-#define _virt_addr_is_linear(kaddr)	(((u64)(kaddr)) >= PAGE_OFFSET)
-#define virt_addr_valid(kaddr)		(_virt_addr_is_linear(kaddr) && \
-					 _virt_addr_valid(kaddr))
+#define _virt_addr_is_linear(kaddr)	\
+	(__tag_reset((u64)(kaddr)) >= PAGE_OFFSET)
+#define virt_addr_valid(kaddr)		\
+	(_virt_addr_is_linear(kaddr) && _virt_addr_valid(kaddr))
 
 #include <asm-generic/memory_model.h>
 
-- 
2.19.1.1215.g8438c0b245-goog

