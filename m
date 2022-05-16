Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBC4C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 16 May 2022 10:23:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242566AbiEPKXb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 06:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242560AbiEPKXS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 06:23:18 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8804EE012
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:08 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id p8so13605472pfh.8
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E1HA7mTkokdfUBOTOx/UT/zRHvpwkRZMgaF2tqkC7Lc=;
        b=I0/JeIClQwBorAMPSgPnbRPgkEOQC7Mr3Pms0T10DCu0fw6VhfTLuxj7jOtLphdp95
         2qMARSAiX5pBAbL4qdkFvFE3g3Mx2OLrOD61gNNw6loxErIQzZWg3y9F4UGd6h2GccgH
         BmINNSNVBA9veX8ta2i94KfzCly2VD/huBZRwQEtAveOHwDk4R3SeBoO2NUUarW9PqKG
         EEf5fPmZDyWYHJBD4VCbMznNow+dRJL5kc9OAiFvqAIbycA0Tf2lPHNw0UPuCPu0GVmJ
         zX33ayCnncNEV7Zu+mW3ITLLR9kOnBrXxJNprV2Oqql25YtAlOAzqgZqziQwIrhRKC3s
         Ke7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E1HA7mTkokdfUBOTOx/UT/zRHvpwkRZMgaF2tqkC7Lc=;
        b=x5P2uSgXsLCsX6J9SaLUQOCQ4sDr8cN2mPCPCWcwlABudmBCF4iULHXBlqJL1JxbNZ
         EHDAdWSJvJNfQO7Q1M3tvJj3DIINiQrOMk6o2CuewjKpH47jkFJ1hzS9b+NiSCV66bVZ
         Qe0aP0ODZW1ngPBVhKlMbZ8vRnjbGIlC1ynK0kjFvhmhtk4zkSV8+1sTvHq2R4WZKPwm
         aULNQsI16ZTpmxyFt4VF++IxBKyfN9RKFQ0ISm9gzth+Px/iSpS/Uhw+Su1q/Fcq3mVJ
         eQD7Tw5BJ/BizOwp/uoL9oyBRw3qnqNkwsE9N+0Ipxqkd7YGaXMOmgUTHG7PsXguJKPN
         JaQA==
X-Gm-Message-State: AOAM530lPz8162AjyUkVRkCrLJSnYc/3vlOEXBpKGQ2uz8ak9J0lZ8ku
        gmpX8UecTEBUJh+jh3XaD04Okg==
X-Google-Smtp-Source: ABdhPJx+le9SIrFuAU5RA8TqPnUWh9duy4U2Dkz5aeGmIOp6I4BVYjVIVE/iqBYV3UcV8r9rt34QsA==
X-Received: by 2002:a05:6a00:1492:b0:50e:11ae:f62f with SMTP id v18-20020a056a00149200b0050e11aef62fmr17044341pfu.43.1652696588092;
        Mon, 16 May 2022 03:23:08 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0050dc76281e4sm6472731pfa.190.2022.05.16.03.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:23:07 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v12 1/7] mm: hugetlb_vmemmap: disable hugetlb_optimize_vmemmap when struct page crosses page boundaries
Date:   Mon, 16 May 2022 18:22:05 +0800
Message-Id: <20220516102211.41557-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220516102211.41557-1-songmuchun@bytedance.com>
References: <20220516102211.41557-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of "struct page" is not the power of two but with the feature
of minimizing overhead of struct page associated with each HugeTLB is
enabled, then the vmemmap pages of HugeTLB will be corrupted after
remapping (panic is about to happen in theory).  But this only exists when
!CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
configuration nowadays.  So it is not a real word issue, just the result
of a code review.

But we cannot prevent anyone from configuring that combined configure.
This hugetlb_optimize_vmemmap should be disable in this case to fix this
issue.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb_vmemmap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 29554c6ef2ae..6254bb2d4ae5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -28,12 +28,6 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
 static int __init hugetlb_vmemmap_early_param(char *buf)
 {
-	/* We cannot optimize if a "struct page" crosses page boundaries. */
-	if (!is_power_of_2(sizeof(struct page))) {
-		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
-		return 0;
-	}
-
 	if (!buf)
 		return -EINVAL;
 
@@ -119,6 +113,12 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	if (!hugetlb_optimize_vmemmap_enabled())
 		return;
 
+	if (!is_power_of_2(sizeof(struct page))) {
+		pr_warn_once("cannot optimize vmemmap pages because \"struct page\" crosses page boundaries\n");
+		static_branch_disable(&hugetlb_optimize_vmemmap_key);
+		return;
+	}
+
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page is not to be freed to buddy allocator, the other tail
-- 
2.11.0

