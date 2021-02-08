Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEEDC433E0
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 08:59:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01E3064E7E
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 08:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhBHI7W (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 03:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbhBHIyR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 03:54:17 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C293C061786
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 00:53:34 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id 18so7131937pfz.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 00:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V1vqZme5dUkJLXAIFa1FOp/NT03yErdrlnVUsdRukuU=;
        b=bx5T3ZXOiy8/mkGPTZZ4aQ1Ov6xqOxnsHxA6UjYIT/8cnon18UmMPPugV3JAE5y22i
         7IjEechfqZhELNm+4KnooZUM/lYKrPFgCpNa2i7QYFBb9DuHg2z4zthizo06KK13S+J1
         C0i7YwqWW6mAtoE+rQk/SWvcVGK2t3K2nta7D77XxmJMNHaYjXJnwleRTjgV5k0wiafQ
         L9J14T5tnvR0Q1Vnl/9Ryv+UE8YhBjktbk1MSgZHelAP+fnjLZ1IiTkTkU0Ywr9YHSjX
         wwf7nog71P0Y0JpsoQLnT+434CnMB6Ab93s9nMPaLS44W/3Rtr1kU3A6t+b9k35thHZj
         2H4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V1vqZme5dUkJLXAIFa1FOp/NT03yErdrlnVUsdRukuU=;
        b=N+lTvHL2/9MJH20QOKlgqf8SofILkiQwIavepG/sDzLmri24HiKa+O3ZFa1iQfaDP7
         +dW784aSspRZ9UCt9UpBX//Ip8ZnKr/3NqZNBDP0pFWR6vRWMzBST/9/RA8OiIiu1+d9
         PcTFlp1v99FwG2E5dA4FWSeUcoD4euno1/ZOy7RDXA/bw7MhG2mvjG17yCZkx5rI2sy2
         sD7SkHyS59LWMTs02q7jfXzzQBZTDr49VVFVS68KKfm5N1OzdDe2+Q5o3n0xdu9m1mdo
         YZmtHzjccSvbrMu5NfotYy5x7oZNnRtyYQiHoGfQy+56RKdTCSbiUzLjWVIL1rOdQGFi
         KqXg==
X-Gm-Message-State: AOAM533yO6ArQWc8XOsDt1U+h/QbPgtRGOuKH5AqwbViJ9EFXQH/0mKC
        kaM2dWs6yvt7ORKqL7wX2v3VkA==
X-Google-Smtp-Source: ABdhPJz4JFIa9ciPD9g3DtSL6o+xw6dNMHhz3p4nYEJpmhwDnzOBGHNd3JN6X6Q9Ym/a63A95a8Hqw==
X-Received: by 2002:aa7:8ad5:0:b029:1df:5a5a:80e1 with SMTP id b21-20020aa78ad50000b02901df5a5a80e1mr651280pfd.52.1612774413913;
        Mon, 08 Feb 2021 00:53:33 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id g15sm17205179pfb.30.2021.02.08.00.53.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2021 00:53:33 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com,
        joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: [PATCH v15 8/8] mm: hugetlb: optimize the code with the help of the compiler
Date:   Mon,  8 Feb 2021 16:50:13 +0800
Message-Id: <20210208085013.89436-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210208085013.89436-1-songmuchun@bytedance.com>
References: <20210208085013.89436-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When the "struct page size" crosses page boundaries we cannot
make use of this feature. Let free_vmemmap_pages_per_hpage()
return zero if that is the case, most of the functions can be
optimized away.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 include/linux/hugetlb.h |  3 ++-
 mm/hugetlb_vmemmap.c    | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 822ab2f5542a..7bfb06e16298 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -878,7 +878,8 @@ extern bool hugetlb_free_vmemmap_enabled;
 
 static inline bool is_hugetlb_free_vmemmap_enabled(void)
 {
-	return hugetlb_free_vmemmap_enabled;
+	return hugetlb_free_vmemmap_enabled &&
+	       is_power_of_2(sizeof(struct page));
 }
 #else
 static inline bool is_hugetlb_free_vmemmap_enabled(void)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index a67301a9d19a..2e7e1d6ee458 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -211,6 +211,12 @@ early_param("hugetlb_free_vmemmap", early_hugetlb_free_vmemmap_param);
  */
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
+	/*
+	 * This check aims to let the compiler help us optimize the code as
+	 * much as possible.
+	 */
+	if (!is_power_of_2(sizeof(struct page)))
+		return 0;
 	return h->nr_free_vmemmap_pages;
 }
 
@@ -280,6 +286,13 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	BUILD_BUG_ON(NR_USED_SUBPAGE >=
 		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 
+	/*
+	 * The compiler can help us to optimize this function to null
+	 * when the size of the struct page is not power of 2.
+	 */
+	if (!is_power_of_2(sizeof(struct page)))
+		return;
+
 	if (!hugetlb_free_vmemmap_enabled)
 		return;
 
-- 
2.11.0

