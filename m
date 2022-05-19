Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54769C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 19 May 2022 12:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238029AbiESMrb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 08:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238037AbiESMr2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 08:47:28 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C1FBA9A8
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 05:47:23 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r71so5010900pgr.0
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dzDzJxcdt6Vr6LSZbq5aB5njkqRqCUNvSK/gLTZQNyU=;
        b=hjzu5oIbS2YDSt7SX0AIM0J77tBEvwKCffox16iIcJfyB2tnrkfrMZ5pw7ZxoN8egh
         A69hxRZhRqSG3JBtY/9hab+kKeAgcZEI9Q+I8ZSUVboKBjbg2H08dp1CQQ3kTyBQx/d6
         uxVwX+L975nfnPI3iEp9LOZ5H7sKL4grfLUuTBS+y1TbrrovFSbrqGp0zrr7vlnGXl/j
         db5ApdpOgDhyYcZqEOrTuFNzeZuHutpuBqqZb1bEOqC9/lgog32oX3oKkZj5OBRcdr7x
         TMmzTE/8PiNcutT8CiNTcvpDr7ywRo8YKk0XfTl9dkon4z+RE45FHETYGL1GzX1gz0H1
         ZlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzDzJxcdt6Vr6LSZbq5aB5njkqRqCUNvSK/gLTZQNyU=;
        b=xQ4YXSrvgaqGdcK9OyKXEp46cwTwqVKtD86dC6mXooTARtkNIBjisFdg2zM67xKnXN
         /VA7aIH8J4aCEhtuRHjMkKImrLgJw4eDKQeHBVO3HbhreW9+U2xFtPTZvfmw3U/iLuw0
         WhzdSEpzDADazTtF8A0R24OMNPL9QY275pYd5pk1dHGDmgEF8OFR/aNDKLY1cRIPNR5K
         UkSU2kSSXpJoHTWZkifU3QOp0ru42VkmDpXissN2ksoOlBcHapjsVNv1dY0rEYby6PZU
         AqWMejpALcpLZS7fYvZXopYChXM+1Avlayjme5tqYQMaxYT+99epagcTPYlYjUck8aI1
         oZ7g==
X-Gm-Message-State: AOAM532eDMlQn5ilDeBKyf7QovHF12d2XObdA2w7q3JmiYINekU57in3
        +vlO1fJKGx+s68kqDc//KQM2pA==
X-Google-Smtp-Source: ABdhPJw/4kVA05kz3JrbwCI7GmLGLx7x2D2bFJiCAOnoFxwEZbHb9LvLVp/Ei+zsYhZbtkf+RQ4LhA==
X-Received: by 2002:a63:ed0c:0:b0:3f6:57df:91e4 with SMTP id d12-20020a63ed0c000000b003f657df91e4mr743007pgi.382.1652964443311;
        Thu, 19 May 2022 05:47:23 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090ad14500b001d960eaed66sm3441296pjw.42.2022.05.19.05.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 05:47:23 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, akpm@linux-foundation.org, paulmck@kernel.org,
        mike.kravetz@oracle.com, osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/2] mm: memory_hotplug: enumerate all supported section flags
Date:   Thu, 19 May 2022 20:46:31 +0800
Message-Id: <20220519124632.92091-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220519124632.92091-1-songmuchun@bytedance.com>
References: <20220519124632.92091-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We are almost running out of free slots, only one bit is available in the
worst case (powerpc with 256k pages).  However, there are still some free
slots on other architectures (e.g. x86_64 has 10 bits available, arm64
has 8 bits available with worst case of 64K pages).  We have hard coded
those numbers in code, it is inconvenient to use those bits on other
architectures except powerpc.  So transfer those section flags to
enumeration to make it easy to add new section flags in the future. Also,
move SECTION_TAINT_ZONE_DEVICE into the scope of CONFIG_ZONE_DEVICE
to save a bit on non-zone-device case.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/kconfig.h |  1 +
 include/linux/mmzone.h  | 47 +++++++++++++++++++++++++++++++++++++++--------
 mm/memory_hotplug.c     |  6 ++++++
 3 files changed, 46 insertions(+), 8 deletions(-)

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
index 299259cfe462..e0b7618d7212 100644
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

