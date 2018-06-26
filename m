Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 779A97D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 13:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965265AbeFZNTm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 09:19:42 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52986 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935493AbeFZNPw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 09:15:52 -0400
Received: by mail-wm0-f65.google.com with SMTP id p126-v6so1906894wmb.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VCj9H90+ovXjReBaVfSQH5CvcvzciBxLHdjd+ndYlao=;
        b=algw/UwANNBO1mP8NOPjPQ7LzR9BXgfrF6JZbe2j23CRiaeC4quc9v2Pm9S+28nZQW
         Uf1RnrtevSQnDWdy3oME8nUVpfliRZHbflCk1KaJOPBh+s59TQ2rXTVjSXQKYX4xc3rz
         YZzGV2bP1kDQhyhl4DJjYrVYQ1FAGxZDG+k4fMLnl24PHJYajW8B2l5xnkDzRQ4LmvXb
         SxsYH1O+NiL3nOvOh1DGsY63j5ex5TO/l1Kr8InZzfDWLgr+XcjnYAvWwyI3RsWLJnyQ
         E6VXTSe7AJsh27qa/Mziek9jIq97/MtUKUwmCtGqACW66dqg0VgJNVLs6UEfJ3/a0j6H
         tepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VCj9H90+ovXjReBaVfSQH5CvcvzciBxLHdjd+ndYlao=;
        b=mB+oS7AE/5KJScGwbp7mwWcPW6Kykoz8zpx45l5UtIBNFqM71yzqdGu59xxk9JHeaT
         /oNoVngflMaoZVRzTytIzn5Ke6tcW+EQnaw9J0qj/Ppyi1M9RxbGw6D4NzpjEkbnHxdW
         cX7Apbq/thT5YG+t1RYtBvab7eu2MiBfVcEXxGE58bgNZYOafdVUBhK9ukNlGk+xWsxv
         wbyQ8UzVAq/JYjHGz+6e+m3/n66DXEDQgc6ttYJ+wUKEJeBmo7DD1xMiu5cWyFX3bK5m
         8FqnTpPoHxEGnIzX68rDmAE+YOdu6TGRThSME9k8VLjH8NvQR3ln0SdcN99BqFRYi0Aw
         gyjQ==
X-Gm-Message-State: APt69E2j1jHiuXaRtGNnsYCd8f71MASRCkNRdQd9p85ReoQ1RvwtFpr7
        6YDrpb8F1Pfex4woFFqW+3tIlw==
X-Google-Smtp-Source: AAOMgpf2aPNc18qI7NpSf6WnKXLP4rIHGIUXeOMxVhHuHs/y7iMs+6rYMoW3PHAwctKy6CsBoOJ11Q==
X-Received: by 2002:a1c:5c93:: with SMTP id q141-v6mr1611058wmb.77.1530018950315;
        Tue, 26 Jun 2018 06:15:50 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id w15-v6sm2162639wrn.25.2018.06.26.06.15.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 06:15:48 -0700 (PDT)
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
Subject: [PATCH v4 09/17] khwasan, arm64: enable top byte ignore for the kernel
Date:   Tue, 26 Jun 2018 15:15:19 +0200
Message-Id: <82571a6721547446b789f759f93bf7f3930541be.1530018818.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
In-Reply-To: <cover.1530018818.git.andreyknvl@google.com>
References: <cover.1530018818.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KHWASAN uses the Top Byte Ignore feature of arm64 CPUs to store a pointer
tag in the top byte of each pointer. This commit enables the TCR_TBI1 bit,
which enables Top Byte Ignore for the kernel, when KHWASAN is used.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 1 +
 arch/arm64/mm/proc.S                   | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index fd208eac9f2a..483aceedad76 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -289,6 +289,7 @@
 #define TCR_A1			(UL(1) << 22)
 #define TCR_ASID16		(UL(1) << 36)
 #define TCR_TBI0		(UL(1) << 37)
+#define TCR_TBI1		(UL(1) << 38)
 #define TCR_HA			(UL(1) << 39)
 #define TCR_HD			(UL(1) << 40)
 #define TCR_NFD1		(UL(1) << 54)
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 03646e6a2ef4..c5175e098d02 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -47,6 +47,12 @@
 /* PTWs cacheable, inner/outer WBWA */
 #define TCR_CACHE_FLAGS	TCR_IRGN_WBWA | TCR_ORGN_WBWA
 
+#ifdef CONFIG_KASAN_HW
+#define TCR_KASAN_FLAGS TCR_TBI1
+#else
+#define TCR_KASAN_FLAGS 0
+#endif
+
 #define MAIR(attr, mt)	((attr) << ((mt) * 8))
 
 /*
@@ -440,7 +446,7 @@ ENTRY(__cpu_setup)
 	 */
 	ldr	x10, =TCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
 			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
-			TCR_TBI0 | TCR_A1
+			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
 	tcr_set_idmap_t0sz	x10, x9
 
 	/*
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
