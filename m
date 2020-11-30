Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99817C64E7B
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C7B0207FF
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="klomQ8KW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgK3PVE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3PVC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:21:02 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4564BC061A4F
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:23 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id iq13so1527395pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffovrVtJKksWNRWUIw8Bwgz8i6vc1Ozc0RtsISNKfww=;
        b=klomQ8KWXhQezM67EV9p26nQ6ZZ3IO/xktcuhuVa+SYPC0dawJizzg7cCdu7YrP5/o
         M+Q9c5zasxnmC31GNSkzQSpHFUrz1P4OxBr27kQx88bwVhC0fQDoFnsc5C0PutMGYpMv
         jurte5p68rqoWac+bUKDXiNIpkGecf1gbZq3p7j9d0haeR1yeXyxsasn5/vG7aS9buwH
         Ao74exP4vJfO6kojH2qbxGOOZiflmjpV9QfBla8pXp+7F+eselgyFHq39WTNVezJOi3g
         QyNgSjL9g4zFslQdajvFw6TnWodbX+De2zyFuROSQPPsYP03OpqIo3RwEQ1Z5rMq8Lha
         guIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffovrVtJKksWNRWUIw8Bwgz8i6vc1Ozc0RtsISNKfww=;
        b=rGZRn6rimgXtnFSsUe6azguCCe/yDhjtpVlAmRuaW6PeHVWwnrawQ7edFiOvPJbfMU
         rLy0Q4a48pCoXd/2wzStxNFlgQciYhB3LZzOYtZoZAO1MFtgz/IMk1znHq5Eij9NmZtV
         aMgqL5Noz42duUslEty32hNUJJdNVFwRjbDlolpdvHn91H9N/DseIKRpU9+NBkcstwZh
         /uwBTL8lHYPaX/B9bQ8W3ueImxkiC5XQZn03yegl/gsrBxHt4f9V9hEtpgEJLdetoLPs
         +Zjhbqm0XPens0S0KYM3wh7PnpLjo7eWrYhXjbSaVrQebv/5hlTQh+E8GwyC2AStaRuI
         2MVA==
X-Gm-Message-State: AOAM530UIx6QCsQbT3PhKvZLQkZzgKmrC/y+QOOvbV4r+NbJ/KlzVCfe
        iQUWvb/tCeRWZvdZbmWdcm40XA==
X-Google-Smtp-Source: ABdhPJyD0IEADf+EEGcLsEqeBHemhCygMIWK8oLWIpbFL5MK72KpW0o1uysekvtHK2pv+cW3Oa8vbw==
X-Received: by 2002:a17:902:d916:b029:da:3e9e:cd7c with SMTP id c22-20020a170902d916b02900da3e9ecd7cmr18670878plz.27.1606749622441;
        Mon, 30 Nov 2020 07:20:22 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.20.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:20:21 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 06/15] mm/hugetlb: Disable freeing vmemmap if struct page size is not power of two
Date:   Mon, 30 Nov 2020 23:18:29 +0800
Message-Id: <20201130151838.11208-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We only can free the tail vmemmap pages of HugeTLB to the buddy allocator
when the size of struct page is a power of two.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 51152e258f39..ad8fc61ea273 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -111,6 +111,11 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	unsigned int nr_pages = pages_per_huge_page(h);
 	unsigned int vmemmap_pages;
 
+	if (!is_power_of_2(sizeof(struct page))) {
+		pr_info("disable freeing vmemmap pages for %s\n", h->name);
+		return;
+	}
+
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page and the first tail page are not to be freed to buddy
-- 
2.11.0

