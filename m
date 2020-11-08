Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80156C4741F
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:14:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486E4208B6
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="NCpYibik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgKHOOQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:14:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbgKHOOP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:14:15 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5318C0613CF
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:14:15 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id x23so3255830plr.6
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ENR30W+EQorPFupcfRUDbx6GljgYrLpkJikIXFtJu0Q=;
        b=NCpYibike1Vkd5HinU4cnqcgpw4ag8hM9Go2X7LHKTN0/j5OF+4dQIpP+Jk+NmmmdF
         FUokkNm9x+sDHmRECk50iMlxna64qhC6Z21XChzMLZRRjJN5N43DZkJKbxP66AZJKiJ+
         CFVUU0M4DJfqWj1f6EjPKqVNmKJ1fKdyuWlMSRDk7re9cOS3G98R8ejo7mquqex20X8l
         c5pOhg4g4A7AxHCOjyNGbY4gdqrOxv0WKX2pm4otrYsmJspaejQjEWfJG0RMm9taKb4m
         AYO22TVlrmXu1jxTqVHbHC8rM3gSedj41YSiD5N6r9Z+wy0VaZKEvClkXL0ED7asFs7H
         md3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ENR30W+EQorPFupcfRUDbx6GljgYrLpkJikIXFtJu0Q=;
        b=gSjJExdl9PwfgXRt5AwL9ekvzGKaPEY1VO63EZRwlIOqA7TS1aNuvF4uiQzzFiTolv
         +whH1JMyYQEQ/b1Cnx9/BWQtKInAM2MlnFcmho0Tgjfg2PFv4kx87YOUavf1LZJ7e8O+
         ijwoSAuqRJnCCJC2D840Fpd/unTu8mJuJF/1LrVqHr5PfceOgUvV7Q37cJ+4xfKZLS2v
         UvO9pIwNFJyXsffi7SsZgx36s0MO3Wv34988OikFB/OLBcLNXuFFnUHmoLYIqXoYJ3b+
         vhgZ0oPWY0A/9wVgCKXwiQL8Z2IMeLzkO1SHYPf/Dd5e7KkFjpIMF1N9ZrWGD6Skw87c
         fMyw==
X-Gm-Message-State: AOAM533DB2KHmpesTxIAO4on7aRrbQ6ZvCqBrXhImkaMNBpzeBvgcD4Y
        9ot1iTyk5FHviaCUmeM6UbQ3pA==
X-Google-Smtp-Source: ABdhPJxjfNCxml6yFxCnotzbO6De4Cg/809K0G4G2C2mRKpmxr6iMJoZs0AWKO0UXf47Ab41LgC7eA==
X-Received: by 2002:a17:90a:c383:: with SMTP id h3mr8147517pjt.150.1604844855310;
        Sun, 08 Nov 2020 06:14:15 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.14.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:14:14 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 15/21] mm/hugetlb: Add a BUILD_BUG_ON to check if struct page size is a power of two
Date:   Sun,  8 Nov 2020 22:11:07 +0800
Message-Id: <20201108141113.65450-16-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We only can free the unused vmemmap to the buddy system when the
size of struct page is a power of two. So add a BUILD_BUG_ON to
check the illegal case.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ec0d33d2c426..5aaa274b0684 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3764,6 +3764,10 @@ static int __init hugetlb_init(void)
 {
 	int i;
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	BUILD_BUG_ON_NOT_POWER_OF_2(sizeof(struct page));
+#endif
+
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
 			pr_warn("HugeTLB: huge pages not supported, ignoring associated command-line parameters\n");
-- 
2.11.0

