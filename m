Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E456C43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D5B120809
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="EOQN2yWH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgIPAk6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgIOND1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:03:27 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DF8C061221
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:03:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so1906056pfd.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mOJhqJtv+UWYoFjqXwWvBe8sB0f2lCBZ6nqED2fuMHQ=;
        b=EOQN2yWHyRuPAk9Gq+vMMRCScrOmbSFwQ3n+S9wZYYojswi6k8MztS4cheCz/qacPa
         JQH4e+xWH0J27Q2IH3NK20OWrmxC6SH8QTl8gW2KyP1R6iauFKSbXnW6RCyse/SaZqzu
         H5/jC1r63VISpnzqCqjZbh1KoHJ8PUp5VnvAh87TKRUVm6FgYuM/2IBTVSCqs/moqLOl
         vDTfbMz93M8Af8EBdTZK3i8xzTOrHp7cqmo+zrubXB95j0mPnK2Jy/6skjemTyoOrdlc
         VOcBpmuITOubgjyoOWCxAvFXusRUf0Wsf7a9t97nrU1k/gEkmQpssTuulsmZPnh6+CTw
         /bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mOJhqJtv+UWYoFjqXwWvBe8sB0f2lCBZ6nqED2fuMHQ=;
        b=jP1xOCJc8sjNmXtsqh4aFDNbyoymFyvZf9cQ+Jn3d2i/THPsq87QZ8r2sZxerFcpiZ
         oCEXAQoAX16bZmAdmykoduz1c/OT2dO05NXRh2t4qKExUs7MgpevHfy2BIR+/39CBckl
         qvD91isf0UA5J/kfI2lxS9BxkKVpZN6DAxssQLP4qBV+JreGpAzvALR+xsR9CcFY00ot
         o8Wlaxj5J/3RIqB3uqGCrxHAcaQRc8ouHFBOK1Skc1RhdXwAXR9yScjIkEVcD6ZgN+NO
         vvwCCPRI9RXEjKBApxTPwXVrr4lluTbAbtdDrVjtsdpfnPCw3roDUPrSkRFjYV2LvTCR
         oZIQ==
X-Gm-Message-State: AOAM533oAdem8sE/s5eYCRWbaQR2SumO8Bnp5tvOufsj2llVcZjCQXka
        wlZOwi7GlNn+L59GvxqtBY2YCA==
X-Google-Smtp-Source: ABdhPJy+syIBhM8kx1V8ywime9iP9xvufd4f0gsLV6gbG6xM7YybTp78AmXxxeqXUOso9/bnBhpTyQ==
X-Received: by 2002:a62:3044:0:b029:142:2501:398b with SMTP id w65-20020a6230440000b02901422501398bmr1767708pfw.80.1600175006499;
        Tue, 15 Sep 2020 06:03:26 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.03.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:03:25 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [RFC PATCH 20/24] mm/hugetlb: Add a kernel parameter hugetlb_free_vmemmap
Date:   Tue, 15 Sep 2020 20:59:43 +0800
Message-Id: <20200915125947.26204-21-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a kernel parameter hugetlb_free_vmemmap to disable the feature of
freeing unused vmemmap pages associated with each hugetlb page on boot.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 .../admin-guide/kernel-parameters.txt         |  9 ++++++++
 Documentation/admin-guide/mm/hugetlbpage.rst  |  3 +++
 mm/hugetlb.c                                  | 23 +++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5debfe238027..69d18ef6f66b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1551,6 +1551,15 @@
 			Documentation/admin-guide/mm/hugetlbpage.rst.
 			Format: size[KMG]
 
+	hugetlb_free_vmemmap=
+			[KNL] When CONFIG_HUGETLB_PAGE_FREE_VMEMMAP is set,
+			this disables freeing unused vmemmap pages associated
+			each HugeTLB page.
+			Format: { on (default) | off }
+
+			on:  enable the feature
+			off: dosable the feature
+
 	hung_task_panic=
 			[KNL] Should the hung task detector generate panics.
 			Format: 0 | 1
diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index f7b1c7462991..7d6129ee97dd 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -145,6 +145,9 @@ default_hugepagesz
 
 	will all result in 256 2M huge pages being allocated.  Valid default
 	huge page size is architecture dependent.
+hugetlb_free_vmemmap
+	When CONFIG_HUGETLB_PAGE_FREE_VMEMMAP is set, this disables freeing
+	unused vmemmap pages associated each HugeTLB page.
 
 When multiple huge page sizes are supported, ``/proc/sys/vm/nr_hugepages``
 indicates the current number of pre-allocated huge pages of the default size.
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 56c0bf2370ed..28c154679838 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1310,6 +1310,8 @@ static void __free_hugepage(struct hstate *h, struct page *page);
 	(__boundary - 1 < (end) - 1) ? __boundary : (end);		\
 })
 
+static bool hugetlb_free_vmemmap_disabled __initdata;
+
 static inline unsigned int nr_free_vmemmap(struct hstate *h)
 {
 	return h->nr_free_vmemmap_pages;
@@ -1457,6 +1459,13 @@ static void __init hugetlb_vmemmap_init(struct hstate *h)
 	unsigned int order = huge_page_order(h);
 	unsigned int vmemmap_pages;
 
+	if (hugetlb_free_vmemmap_disabled) {
+		h->nr_free_vmemmap_pages = 0;
+		pr_info("HugeTLB: disable free vmemmap pages for %s\n",
+			h->name);
+		return;
+	}
+
 	vmemmap_pages = ((1 << order) * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page and the first tail page not free to buddy system,
@@ -1867,6 +1876,20 @@ static inline void clear_subpage_hwpoison(struct page *head)
 {
 	set_page_private(head + 4, 0);
 }
+
+static int __init early_hugetlb_free_vmemmap_param(char *buf)
+{
+	if (!buf)
+		return -EINVAL;
+
+	if (!strcmp(buf, "off"))
+		hugetlb_free_vmemmap_disabled = true;
+	else if (strcmp(buf, "on"))
+		return -EINVAL;
+
+	return 0;
+}
+early_param("hugetlb_free_vmemmap", early_hugetlb_free_vmemmap_param);
 #else
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
-- 
2.20.1

