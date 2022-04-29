Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21340C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 13:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359830AbiD2NkU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 09:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359844AbiD2NkR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 09:40:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD474CB03F
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:36:58 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id t13so6957772pfg.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZTHv+EobGmd8CLqrN8ICsD/Gd2+vakaEN+AZqfml/As=;
        b=Pp9YaWXF+keaVk+3vcFs3ST1OD3cYkcjwDO13WpXirW65DJ5bV24lriyyZ3gSCtH1t
         ZrexZP4eqVpM+sJIbrDvAV6PHKPMjCYED8+24O1lxhFn2leYX3+FUdT0xJMzmNoM8vHu
         R6U2/6kf69dP6xXUieWIdERPGU8JMCKVGGHds1fcYgNFcNtGAn1c/kHvsWaE3iNCkYA5
         RqdeoXcJZMaW+VrHTPiE0q4Zx8NLKhMbg/05XMpQP+Fif3YIpIK9cdVZGsJrI8deD15+
         Yk+iY23SxB+rz3MFcApWicRPxvVoXsv2GXFFrxlXAOr0Z2k4Bv9kbswt9Pf2UaM2ubmN
         BZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZTHv+EobGmd8CLqrN8ICsD/Gd2+vakaEN+AZqfml/As=;
        b=3euAOOZI02UeqmmPnH9dPmc+NmGBA+KVzuKSG/G2umRYGky7A3UceffMRVaGssUouN
         BXCSjssthkpmUYReN1B27D1kSbf39D2fxjpjPCUOW3t/m/j1qNxc/ZE2FOONyNCfw/Xl
         OPOyjyE5LDpIHB0UyMp6iaGh9hNj90AASakwLSr7diTF3bxuy9iDeU3hwiVK3qbN6cC9
         9N/VyVGZGA35Nf0Gf9xEsqiQbgmNXMYoCmNPm/Cq2HQDziDRXnSRL3oon30m28lAp0jV
         aH/Rx2JmvW+YkTpgCygK68qDmtTIf/k5ibQr32LANHrCwZdHLE/T3rv9t9HbPMnsl2So
         qtrA==
X-Gm-Message-State: AOAM531e9HlrektUEzT5FwrKbgUzgzDqYkBcQKYKD/B5MstWj7akSpuq
        93W34FxnUa3BjzWbm2bgfQByNA==
X-Google-Smtp-Source: ABdhPJxQ/VkMVyn4Qp+z5Cb9ljljtE8dhgkTNUvvkMORdefL3XrTmyDghPgZGP75wajseTIiF7sh1Q==
X-Received: by 2002:a63:290:0:b0:3aa:8b8b:1a3d with SMTP id 138-20020a630290000000b003aa8b8b1a3dmr31635992pgc.208.1651239417928;
        Fri, 29 Apr 2022 06:36:57 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a414800b001d81a30c437sm10681977pjg.50.2022.04.29.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 06:36:57 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com, tj@kernel.org, dennis@kernel.org,
        ming.lei@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [RFC PATCH 07/18] mm: add pte_to_page() helper
Date:   Fri, 29 Apr 2022 21:35:41 +0800
Message-Id: <20220429133552.33768-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
References: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add pte_to_page() helper similar to pmd_to_page(), which
will be used to get the struct page of the PTE page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 0928acca6b48..d1218cb1013e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -85,6 +85,14 @@ static inline unsigned long pud_index(unsigned long address)
 #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 #endif
 
+#ifdef CONFIG_FREE_USER_PTE
+static inline struct page *pte_to_page(pte_t *pte)
+{
+	unsigned long mask = ~(PTRS_PER_PTE * sizeof(pte_t) - 1);
+	return virt_to_page((void *)((unsigned long) pte & mask));
+}
+#endif
+
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-- 
2.20.1

