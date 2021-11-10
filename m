Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E89EC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 08:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1617A61076
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 08:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhKJIpG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhKJIpD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 03:45:03 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273D2C061767
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 00:42:16 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so1039827pjb.5
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ATw7hUTYZVQ0DwLa45RdRSrYNXHKuwCC3S5w4hY8zw=;
        b=cmfLwBU+Bm1CpzzA7YTIcjiVMZz4yqSlGwDAaFsgZGEl8L+xs0oT0q9kk5aEnq3nQw
         LOKt0Q4WxyBf7NuRLEdrDbMmyLLWjO5liJ8HjxmxNZzQwIs+Ij8/0ZAMiK40I2sKlFnY
         /5drhIPFmigd72gQT+hDVW9zUYeUpkWQU+sZ5y+K+yfDY46srQAHN3xRiPUQ+Cl6ZchI
         NIjc/Z5FOHtNxC1evaMqQoL8oH3GairafCktj7psqIoxN5lISzTj3TtM/YmXgSJhIlzL
         H4FeMwgGqf3zJJQk4i9KRerKfmx8NYf+NAzyw+kUN0eM1/op1FLq0hYk/Y9Hs2gQOYEU
         Lbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ATw7hUTYZVQ0DwLa45RdRSrYNXHKuwCC3S5w4hY8zw=;
        b=DC1RN69MYfBlYk5jHHG6a93PeUbLx9GC2hEfj/wp+3eGk4/ARIzZh0K4aMJP5zsln9
         jbLmY8pEaF3QE1EgQvg+A3k3kF1AlAholOAeqEVw3bGsDad6MTVR+RgR1L8tGDvST6pe
         kmGomhFiJKgK9YuHg0Si3W1oR17ZQperH2Ms+KclExxXpXflXzaGQd3Kw283MYHWgnmG
         fk0eJB/TZFlBqOos8Ln+R+/KvqJh1rQrkJtLM4JpIgum/ht6dznS/MDu+ulzEBBr4TaO
         axiccwrcviUsp4EI4tks1dbXmQSkwyHYn5kPqEr8fdA9JfIBhQA96cIkHBajja8hC+jM
         Z7nw==
X-Gm-Message-State: AOAM532uyF/C9mZfvo0e3qx9/iwl8kD1DfJwQx6UtEbRLw+LdZml2UZN
        wqVmBzWTLO4MlRPoxKEEFYOtiA==
X-Google-Smtp-Source: ABdhPJwUSwvt3YOuBif1YVBS93VA3jBoJ7dOJ/5jXBZrZeGVyM6Fxna7uL3ysN+eFkr3A5oGtXJTpQ==
X-Received: by 2002:a17:902:e9c6:b0:141:c588:99b2 with SMTP id 6-20020a170902e9c600b00141c58899b2mr14187337plk.63.1636533735736;
        Wed, 10 Nov 2021 00:42:15 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id v38sm5485368pgl.38.2021.11.10.00.42.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 00:42:15 -0800 (PST)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 08/15] mm/pte_ref: initialize the refcount of the withdrawn PTE page table page
Date:   Wed, 10 Nov 2021 16:40:50 +0800
Message-Id: <20211110084057.27676-9-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
References: <20211110084057.27676-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we split the PMD-mapped THP to the PTE-mapped THP, we should
initialize the refcount of the withdrawn PTE page table page to
HPAGE_PMD_NR, which ensures that we can release the PTE page table
page when it is free(the refcount is 0).

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/pgtable-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 4e640baf9794..523053e09dfa 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -186,6 +186,7 @@ pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
 							  struct page, lru);
 	if (pmd_huge_pte(mm, pmdp))
 		list_del(&pgtable->lru);
+	pte_ref_init(pgtable, pmdp, HPAGE_PMD_NR);
 	return pgtable;
 }
 #endif
-- 
2.11.0

