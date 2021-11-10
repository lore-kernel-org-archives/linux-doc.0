Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA9C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 10:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 358BE6112D
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 10:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhKJK6M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 05:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhKJK6M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 05:58:12 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2C3C061764
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 02:55:25 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id s136so1922452pgs.4
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 02:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ATw7hUTYZVQ0DwLa45RdRSrYNXHKuwCC3S5w4hY8zw=;
        b=VOdIGEoosH+Ug2YShcw7yL35/Vu9bbytERCcJq8J6YIYWZcb4Wzk0VqLvWpPNAP0Pw
         /Apjox+z/JMW87E0IkMHXYJDJh7yAnWsR81m/2b1hqYlGy2+kFwlbVIdu/LoypPEYnZ1
         /myJbmXy1PKLiG1qhBLKJe700SISvZbyHPo40ZNX7ITlvCjS5GAyV72xI1ifbj2zqgpF
         dMRRvHvUHBpTgtVm0K6F55r1zU4grKZy22pnRukYVH56+GyCn/qKF2pxWoPQdtRmqEjC
         y+w75tYDanH+yKEh9gDH8WY3av+3hyJHDpl+/CJ3aRvYD7LyhHOP0unWM1QIvqrCO+RW
         hHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ATw7hUTYZVQ0DwLa45RdRSrYNXHKuwCC3S5w4hY8zw=;
        b=y6wNatiTout74FcnL7L9YAjd76M5xisBsV68c5jZpr9/LaafJSkvV6+G4n9lMCpfZe
         0Y06xffJGKx+fOAGUzLG94MSQ/GwRG45x4H046+I50425521Kgs2yYD9z8ekbz5Juzp3
         KwENyJQZLbS6Q5jj1psUHhj57PY9hrsCD9qLUXS3GnhQbA+0QZjh3H7TwVOoyAC6dta/
         hSJUQ3vI37QmZjl37SptsIekN2lPdQmWB+RNarnrpcOYTPsJkfdVQn5nh10pmB4QdXhi
         Rg1YOrBw5zKaV9DcMS24hfAW4O3AjGCFOPpH2LboFuS3swpaDdYzljcsfNb2WpfDVrf6
         DajQ==
X-Gm-Message-State: AOAM533ndV3elR4QmjFYyn0YKDBeeW8Ey0dnO68kINOxOMJk9iGJmbRq
        D37EDuVruPNd18ILzi6Z2ky8hw==
X-Google-Smtp-Source: ABdhPJyasHvetrlbVDhZxlSWJdssheCa0+hBmO6hdgHKupbF8TeFo1liY0cCWMJdtFDghoSjaMgPhg==
X-Received: by 2002:a05:6a00:8cd:b0:47b:b9e8:7c2e with SMTP id s13-20020a056a0008cd00b0047bb9e87c2emr96445421pfu.61.1636541724659;
        Wed, 10 Nov 2021 02:55:24 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id v38sm5865829pgl.38.2021.11.10.02.55.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 02:55:24 -0800 (PST)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 08/15] mm/pte_ref: initialize the refcount of the withdrawn PTE page table page
Date:   Wed, 10 Nov 2021 18:54:21 +0800
Message-Id: <20211110105428.32458-9-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
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

