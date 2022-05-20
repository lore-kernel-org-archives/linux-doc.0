Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DECC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 20 May 2022 02:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344900AbiETC4d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 22:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344896AbiETC4d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 22:56:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFF45F8D9
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 19:56:32 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l14so6881102pjk.2
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 19:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rAmuTisphowcuj9ld9gT+BcL3EOBMFpYJxbuLtSAd1w=;
        b=CEt5JRB5vmqgGUZU2MBhaPysp4QN4a3utL0tYf7zL93t2poiHOqqS5GHaa0KnDolLn
         KdD24ffhv/YJfPvVSJYHOPxXR2eyly9g560Z/75Xwwgs+9d/FquaSJ38lCPXTtzRrzEO
         lVNm5zlKLyS4KCQqtNp8gBEcRlV1XIocXJsPQS5Gpwn807E1bjG8vRL+/qSvNFsTaNnK
         Bb9z0YjTvQsgTde14cEsuAJvR+o8mLsMp6ACjVBcXqiAWwhSDWQEIgrHmouY0h77UlCv
         DGBX/9970/G2p5aoAkfbEuXeKsJD7sf98hCxIALe7izpMHll4reoHWrIZJUph2BPdHVB
         dfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rAmuTisphowcuj9ld9gT+BcL3EOBMFpYJxbuLtSAd1w=;
        b=6E6E8MCHR0cueVXKhToACLuSZlN1k8Z+wxcbDn+6DnSXuuE1e3DbKQ9Vz9hr6lG3kd
         UEzhzwcz4OEb0piqtJi9vm1Q5c5zQzl19kKQ33y6q4CPiWa44isRH37HGzuIvteJ7gax
         FjGIYFS2s8PcUX0/HQTk1p4mJhppFhV8fyPeOQExU88F4MKolym9iFvCwsAFUTO4L+Kt
         it5NMX7pnQJdgQj1QnA5jEpCVDgokIvTbaW7JVDg9ZxNvC0TLQLW6NUBR32MRSkmAAYM
         YuMRorth/v7xPnd9wLMjz1zQUISwG+atlihqPBvgHBW1rjS7Gv/y3PBNzyU5BGYvGMuR
         /G2g==
X-Gm-Message-State: AOAM5314+l18YVkhgRM7QnZ5Fx2GbJJsqL0W//elBhWuEHDYn1yJZW9b
        aS1XEiX8UHnOT6KWvhHNP1KJow==
X-Google-Smtp-Source: ABdhPJxXIvZdh9S/2ddYknT6j9si0583qevqHt8SsvudGMLLdO1yeUPiZexnnyrtBVces02UJrUPpg==
X-Received: by 2002:a17:90b:4f47:b0:1df:ef58:d055 with SMTP id pj7-20020a17090b4f4700b001dfef58d055mr3316044pjb.82.1653015391539;
        Thu, 19 May 2022 19:56:31 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id o10-20020a62f90a000000b0050dc76281a5sm225675pfh.127.2022.05.19.19.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 19:56:31 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, akpm@linux-foundation.org, paulmck@kernel.org,
        mike.kravetz@oracle.com, osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 1/2] mm: memory_hotplug: enumerate all supported section flags
Date:   Fri, 20 May 2022 10:55:37 +0800
Message-Id: <20220520025538.21144-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220520025538.21144-1-songmuchun@bytedance.com>
References: <20220520025538.21144-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We are almost running out of section flags, only one bit is available in
the worst case (powerpc with 256k pages).  However, there are still some
free bits (in ->section_mem_map) on other architectures (e.g. x86_64 has
10 bits available, arm64 has 8 bits available with worst case of 64K
pages).  We have hard coded those numbers in code, it is inconvenient to
use those bits on other architectures except powerpc.  So transfer those
section flags to enumeration to make it easy to add new section flags in
the future.  Also, move SECTION_TAINT_ZONE_DEVICE into the scope of
CONFIG_ZONE_DEVICE to save a bit on non-zone-device case.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/kconfig.h |  1 +
 include/linux/mmzone.h  | 54 +++++++++++++++++++++++++++++++++++++++++--------
 mm/memory_hotplug.c     |  6 ++++++
 3 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index 20d1079e92b4..7044032b9f42 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -10,6 +10,7 @@
 #define __LITTLE_ENDIAN 1234
 #endif
 
+#define __ARG_PLACEHOLDER_ 0,
 #define __ARG_PLACEHOLDER_1 0,
 #define __take_second_arg(__ignored, val, ...) val
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 299259cfe462..2cf2a76535ab 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1422,16 +1422,47 @@ extern size_t mem_section_usage_size(void);
  *      (equal SECTION_SIZE_BITS - PAGE_SHIFT), and the
  *      worst combination is powerpc with 256k pages,
  *      which results in PFN_SECTION_SHIFT equal 6.
- * To sum it up, at least 6 bits are available.
+ * To sum it up, at least 6 bits are available on all architectures.
+ * However, we can exceed 6 bits on some other architectures except
+ * powerpc (e.g. 15 bits are available on x86_64, 13 bits are available
+ * with the worst case of 64K pages on arm64) if we make sure the
+ * exceeded bit is not applicable to powerpc.
  */
-#define SECTION_MARKED_PRESENT		(1UL<<0)
-#define SECTION_HAS_MEM_MAP		(1UL<<1)
-#define SECTION_IS_ONLINE		(1UL<<2)
-#define SECTION_IS_EARLY		(1UL<<3)
-#define SECTION_TAINT_ZONE_DEVICE	(1UL<<4)
-#define SECTION_MAP_LAST_BIT		(1UL<<5)
+#define ENUM_SECTION_FLAG(MAPPER)						\
+	MAPPER(MARKED_PRESENT)							\
+	MAPPER(HAS_MEM_MAP)							\
+	MAPPER(IS_ONLINE)							\
+	MAPPER(IS_EARLY)							\
+	MAPPER(TAINT_ZONE_DEVICE, CONFIG_ZONE_DEVICE)				\
+	MAPPER(MAP_LAST_BIT)
+
+#define __SECTION_SHIFT_FLAG_MAPPER_0(x)
+#define __SECTION_SHIFT_FLAG_MAPPER_1(x)	SECTION_##x##_SHIFT,
+#define __SECTION_SHIFT_FLAG_MAPPER(x, ...)	\
+	__PASTE(__SECTION_SHIFT_FLAG_MAPPER_, IS_ENABLED(__VA_ARGS__))(x)
+
+#define __SECTION_FLAG_MAPPER_0(x)
+#define __SECTION_FLAG_MAPPER_1(x)		SECTION_##x = BIT(SECTION_##x##_SHIFT),
+#define __SECTION_FLAG_MAPPER(x, ...)		\
+	__PASTE(__SECTION_FLAG_MAPPER_, IS_ENABLED(__VA_ARGS__))(x)
+
+enum {
+	/*
+	 * Generate a series of enumeration flags like SECTION_$name_SHIFT.
+	 * Each entry in ENUM_SECTION_FLAG() macro will be generated to one
+	 * enumeration iff the 2nd parameter of MAPPER() is defined or absent.
+	 * The $name comes from the 1st parameter of MAPPER() macro.
+	 */
+	ENUM_SECTION_FLAG(__SECTION_SHIFT_FLAG_MAPPER)
+	/*
+	 * Generate a series of enumeration flags like:
+	 *   SECTION_$name = BIT(SECTION_$name_SHIFT)
+	 */
+	ENUM_SECTION_FLAG(__SECTION_FLAG_MAPPER)
+};
+
 #define SECTION_MAP_MASK		(~(SECTION_MAP_LAST_BIT-1))
-#define SECTION_NID_SHIFT		6
+#define SECTION_NID_SHIFT		SECTION_MAP_LAST_BIT_SHIFT
 
 static inline struct page *__section_mem_map_addr(struct mem_section *section)
 {
@@ -1470,12 +1501,19 @@ static inline int online_section(struct mem_section *section)
 	return (section && (section->section_mem_map & SECTION_IS_ONLINE));
 }
 
+#ifdef CONFIG_ZONE_DEVICE
 static inline int online_device_section(struct mem_section *section)
 {
 	unsigned long flags = SECTION_IS_ONLINE | SECTION_TAINT_ZONE_DEVICE;
 
 	return section && ((section->section_mem_map & flags) == flags);
 }
+#else
+static inline int online_device_section(struct mem_section *section)
+{
+	return 0;
+}
+#endif
 
 static inline int online_section_nr(unsigned long nr)
 {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 1213d0c67a53..3b360eda933f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -672,12 +672,18 @@ static void __meminit resize_pgdat_range(struct pglist_data *pgdat, unsigned lon
 
 }
 
+#ifdef CONFIG_ZONE_DEVICE
 static void section_taint_zone_device(unsigned long pfn)
 {
 	struct mem_section *ms = __pfn_to_section(pfn);
 
 	ms->section_mem_map |= SECTION_TAINT_ZONE_DEVICE;
 }
+#else
+static inline void section_taint_zone_device(unsigned long pfn)
+{
+}
+#endif
 
 /*
  * Associate the pfn range with the given zone, initializing the memmaps
-- 
2.11.0

