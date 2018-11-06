Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7DA287D8AB
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 17:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389694AbeKGC6P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 21:58:15 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45450 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389853AbeKGC5Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 21:57:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id k15-v6so11498211wre.12
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqZ4W4abhuiWrYBf7dbVlb6J0CRQ5VwTcMgO0APUlT4=;
        b=e9NIR9ozLa1hZiKs+YKqZ6JfopiH2CQLRj0DtzXk9rGh9eC5tEoHQMpt6odCi502Cb
         yJa7wWAhVx1XTUQNl2jST/MXE7EQSq9OggekRcJAaTxYKxCZI6Ql89+UTOOMBoWh9q47
         +3vL/lw05/Hnw80UmllX6OFiVE/hWaB4257zLGTAO7by+xk3wEze8BLJF+9ZUEH4ooRY
         u6Qd6mPCbR2mrFto/v9H8OLXtsga5a6tDNO9fO0ZXQYVV84jGfMELJmtNL35eIwsoIfK
         6scEgS18N4s195E1kRfIb+N5FpQnr1wRyXZujecm1KRELMwzNuIgG9YTdLBIxZp+Sh2T
         qQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqZ4W4abhuiWrYBf7dbVlb6J0CRQ5VwTcMgO0APUlT4=;
        b=CdCEetgk2v2Y/Mgd2G7EHTj1OkKzwbLfUngFhJu/ZLIuCYhGzWSLTSO/JM2t63uA+j
         yZ6QhcEf01Pq9+OUlYvvTGZM/PbYSP4Pur9pnMe52mHHUelZU7/WIrWlCPnpaVdffk0u
         YWCbwSNtfFEta3ineV2bScD6rpsm2C6ew1XLOl/6zqrWOgW/AKSmXEfZHK6nXiMvgEIO
         yVFsF/kpCBBHJ2m7wgpsAXPHH2w40qErG98drq/i6s+0olNQKu2E7pQwtTE/fZOzYXLG
         a4tYho4BNXH1aAh8CKRcQdEqka99Y1ENL3dokdXbTXf5BnT8Jr/iDu76+zSz9tiWoY4Z
         K3kw==
X-Gm-Message-State: AGRZ1gJdPHZA9BUZ0v1968FEqppaUuiaVpdb+2t3ExEdQiU9fY/vCdKT
        7dsjZumwfCsvSdEDcI/dr/WSgg==
X-Google-Smtp-Source: AJdET5fvwZJYEj2YXgKRWAOEHHdvBWsS4JO9Y0Zaa7TtohiWchaSF3ehPThS3UYqVY/8GH0sO1tDVQ==
X-Received: by 2002:adf:f542:: with SMTP id j2-v6mr15247056wrp.70.1541525468219;
        Tue, 06 Nov 2018 09:31:08 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z17-v6sm16328416wrm.65.2018.11.06.09.31.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 09:31:07 -0800 (PST)
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
Subject: [PATCH v10 16/22] kasan: add bug reporting routines for tag-based mode
Date:   Tue,  6 Nov 2018 18:30:31 +0100
Message-Id: <a24f90a4158d6957a27f3dbbab53ad2e94d56502.1541525354.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <cover.1541525354.git.andreyknvl@google.com>
References: <cover.1541525354.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit adds rountines, that print tag-based KASAN error reports.
Those are quite similar to generic KASAN, the difference is:

1. The way tag-based KASAN finds the first bad shadow cell (with a
   mismatching tag). Tag-based KASAN compares memory tags from the shadow
   memory to the pointer tag.

2. Tag-based KASAN reports all bugs with the "KASAN: invalid-access"
   header.

Also simplify generic KASAN find_first_bad_addr.

Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 mm/kasan/generic_report.c | 16 ++++-------
 mm/kasan/kasan.h          |  5 ++++
 mm/kasan/report.c         | 57 +++++++++++++++++++++------------------
 mm/kasan/tags_report.c    | 18 +++++++++++++
 4 files changed, 59 insertions(+), 37 deletions(-)

diff --git a/mm/kasan/generic_report.c b/mm/kasan/generic_report.c
index 5201d1770700..a4604cceae59 100644
--- a/mm/kasan/generic_report.c
+++ b/mm/kasan/generic_report.c
@@ -33,16 +33,13 @@
 #include "kasan.h"
 #include "../slab.h"
 
-static const void *find_first_bad_addr(const void *addr, size_t size)
+void *find_first_bad_addr(void *addr, size_t size)
 {
-	u8 shadow_val = *(u8 *)kasan_mem_to_shadow(addr);
-	const void *first_bad_addr = addr;
+	void *p = addr;
 
-	while (!shadow_val && first_bad_addr < addr + size) {
-		first_bad_addr += KASAN_SHADOW_SCALE_SIZE;
-		shadow_val = *(u8 *)kasan_mem_to_shadow(first_bad_addr);
-	}
-	return first_bad_addr;
+	while (p < addr + size && !(*(u8 *)kasan_mem_to_shadow(p)))
+		p += KASAN_SHADOW_SCALE_SIZE;
+	return p;
 }
 
 static const char *get_shadow_bug_type(struct kasan_access_info *info)
@@ -50,9 +47,6 @@ static const char *get_shadow_bug_type(struct kasan_access_info *info)
 	const char *bug_type = "unknown-crash";
 	u8 *shadow_addr;
 
-	info->first_bad_addr = find_first_bad_addr(info->access_addr,
-						info->access_size);
-
 	shadow_addr = (u8 *)kasan_mem_to_shadow(info->first_bad_addr);
 
 	/*
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 50adcab463f2..9b567f742539 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -119,6 +119,7 @@ void kasan_poison_shadow(const void *address, size_t size, u8 value);
 void check_memory_region(unsigned long addr, size_t size, bool write,
 				unsigned long ret_ip);
 
+void *find_first_bad_addr(void *addr, size_t size);
 const char *get_bug_type(struct kasan_access_info *info);
 
 void kasan_report(unsigned long addr, size_t size,
@@ -139,6 +140,8 @@ static inline void quarantine_remove_cache(struct kmem_cache *cache) { }
 
 #ifdef CONFIG_KASAN_SW_TAGS
 
+void print_tags(u8 addr_tag, const void *addr);
+
 #define KASAN_PTR_TAG_SHIFT 56
 #define KASAN_PTR_TAG_MASK (0xFFUL << KASAN_PTR_TAG_SHIFT)
 
@@ -166,6 +169,8 @@ static inline void *reset_tag(const void *addr)
 
 #else /* CONFIG_KASAN_SW_TAGS */
 
+static inline void print_tags(u8 addr_tag, const void *addr) { }
+
 static inline u8 random_tag(void)
 {
 	return 0;
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 64a74f334c45..214d85035f99 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -64,11 +64,10 @@ static int __init kasan_set_multi_shot(char *str)
 }
 __setup("kasan_multi_shot", kasan_set_multi_shot);
 
-static void print_error_description(struct kasan_access_info *info,
-					const char *bug_type)
+static void print_error_description(struct kasan_access_info *info)
 {
 	pr_err("BUG: KASAN: %s in %pS\n",
-		bug_type, (void *)info->ip);
+		get_bug_type(info), (void *)info->ip);
 	pr_err("%s of size %zu at addr %px by task %s/%d\n",
 		info->is_write ? "Write" : "Read", info->access_size,
 		info->access_addr, current->comm, task_pid_nr(current));
@@ -272,6 +271,8 @@ void kasan_report_invalid_free(void *object, unsigned long ip)
 
 	start_report(&flags);
 	pr_err("BUG: KASAN: double-free or invalid-free in %pS\n", (void *)ip);
+	print_tags(get_tag(object), reset_tag(object));
+	object = reset_tag(object);
 	pr_err("\n");
 	print_address_description(object);
 	pr_err("\n");
@@ -279,41 +280,45 @@ void kasan_report_invalid_free(void *object, unsigned long ip)
 	end_report(&flags);
 }
 
-static void kasan_report_error(struct kasan_access_info *info)
-{
-	unsigned long flags;
-
-	start_report(&flags);
-
-	print_error_description(info, get_bug_type(info));
-	pr_err("\n");
-
-	if (!addr_has_shadow(info->access_addr)) {
-		dump_stack();
-	} else {
-		print_address_description((void *)info->access_addr);
-		pr_err("\n");
-		print_shadow_for_address(info->first_bad_addr);
-	}
-
-	end_report(&flags);
-}
-
 void kasan_report(unsigned long addr, size_t size,
 		bool is_write, unsigned long ip)
 {
 	struct kasan_access_info info;
+	void *tagged_addr;
+	void *untagged_addr;
+	unsigned long flags;
 
 	if (likely(!report_enabled()))
 		return;
 
 	disable_trace_on_warning();
 
-	info.access_addr = (void *)addr;
-	info.first_bad_addr = (void *)addr;
+	tagged_addr = (void *)addr;
+	untagged_addr = reset_tag(tagged_addr);
+
+	info.access_addr = tagged_addr;
+	if (addr_has_shadow(untagged_addr))
+		info.first_bad_addr = find_first_bad_addr(tagged_addr, size);
+	else
+		info.first_bad_addr = untagged_addr;
 	info.access_size = size;
 	info.is_write = is_write;
 	info.ip = ip;
 
-	kasan_report_error(&info);
+	start_report(&flags);
+
+	print_error_description(&info);
+	if (addr_has_shadow(untagged_addr))
+		print_tags(get_tag(tagged_addr), info.first_bad_addr);
+	pr_err("\n");
+
+	if (addr_has_shadow(untagged_addr)) {
+		print_address_description(untagged_addr);
+		pr_err("\n");
+		print_shadow_for_address(info.first_bad_addr);
+	} else {
+		dump_stack();
+	}
+
+	end_report(&flags);
 }
diff --git a/mm/kasan/tags_report.c b/mm/kasan/tags_report.c
index 8af15e87d3bc..573c51d20d09 100644
--- a/mm/kasan/tags_report.c
+++ b/mm/kasan/tags_report.c
@@ -37,3 +37,21 @@ const char *get_bug_type(struct kasan_access_info *info)
 {
 	return "invalid-access";
 }
+
+void *find_first_bad_addr(void *addr, size_t size)
+{
+	u8 tag = get_tag(addr);
+	void *p = reset_tag(addr);
+	void *end = p + size;
+
+	while (p < end && tag == *(u8 *)kasan_mem_to_shadow(p))
+		p += KASAN_SHADOW_SCALE_SIZE;
+	return p;
+}
+
+void print_tags(u8 addr_tag, const void *addr)
+{
+	u8 *shadow = (u8 *)kasan_mem_to_shadow(addr);
+
+	pr_err("Pointer tag: [%02x], memory tag: [%02x]\n", addr_tag, *shadow);
+}
-- 
2.19.1.930.g4563a0d9d0-goog

