Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5BAC56201
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C362076E
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Teew9Gvu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgKXJ5Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 04:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgKXJ5P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 04:57:15 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68181C0613D6
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:57:15 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id l11so10447648plt.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s5A1WGxjr1FnragMjsAXSXENwZtbX/VCL9QpT/2OWj4=;
        b=Teew9GvubUfF7KXPZ0vrHLrrdljg0Jw0SHTS0miGJ+H6HSyJHNWx1gygUfRYCkCrw+
         EFlGXQHbhIpnw8VIJKvVn4N3/oQ/DX9sOoWurp6agSO9mb8j7HwAT5HTBnBH1IQVvsna
         fDeuYUqOhNQomskdJzjwkVHcasMWrx3FEUjTx3ntf1w2c+IiqrHinlQ3zoo6pFATvJ1G
         K45S4R7n1zZbkYNmNDSvo2Lc5p4+HIJ5CL1tSne7ARclcUu/D609C3ImDl6jiPGuS9ZX
         gXvkFgnL1TrHD1X2zyk+ZphWPFsdUlyNF1qz7TBA6lPcHVBeCqRT5PHJO4KwXbDrDI+v
         9u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s5A1WGxjr1FnragMjsAXSXENwZtbX/VCL9QpT/2OWj4=;
        b=p+4/phdMKYIOpG5CBqEb2q2iA/Ugy+qLEuIRYdHh7hxRQNL16ddy86KvW2xqsVHubg
         6cEMgDkZVqMH70OUNS5dsr20DRQN53r2olK36gx9L8cxN6RqtLB1u17sHzmIFBNksiD+
         vyruEyNxoDWJSeqPTGAxuLEw81q3DRpLGb0XAZ49Fvp1Pzo39OOxO0V6IRLur8+xcXtb
         Ryp10FVP6njL6RwBfw594D9bALn6KfaYIlt3jiMwOVDEAU6LQt9xlUm118j1Fq+1yByc
         z2lDzEbr495NiTdMCGayQSaJBBgWqR/XrkUO/2iupNRqdYWuSDOe2DwpX0+/wiDqIGDB
         UO7w==
X-Gm-Message-State: AOAM533EpWSR4v7kt2jM9zVIjg61b3ccTe06d0/NLSmqoZARqzcA8RNB
        mAipOJCf3784bXa+w2pIVk0woQ==
X-Google-Smtp-Source: ABdhPJzwWHwqGMfwuSes+ofTOYpFZkuqkNbGuqv07A6D+lBpddBbGPWVNDBt6EKW68EcbG3uetJiWA==
X-Received: by 2002:a17:902:b192:b029:d7:ca4a:4ec1 with SMTP id s18-20020a170902b192b02900d7ca4a4ec1mr3406894plr.76.1606211834998;
        Tue, 24 Nov 2020 01:57:14 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.120])
        by smtp.gmail.com with ESMTPSA id t20sm2424562pjg.25.2020.11.24.01.57.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 01:57:14 -0800 (PST)
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
Subject: [PATCH v6 03/16] mm/hugetlb: Introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Tue, 24 Nov 2020 17:52:46 +0800
Message-Id: <20201124095259.58755-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201124095259.58755-1-songmuchun@bytedance.com>
References: <20201124095259.58755-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The purpose of introducing HUGETLB_PAGE_FREE_VMEMMAP is to configure
whether to enable the feature of freeing unused vmemmap associated
with HugeTLB pages. And this is just for dependency check. Now only
support x86.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c |  2 +-
 fs/Kconfig            | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 0a45f062826e..0435bee2e172 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
 
 static void __init register_page_bootmem_info(void)
 {
-#ifdef CONFIG_NUMA
+#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
 	int i;
 
 	for_each_online_node(i)
diff --git a/fs/Kconfig b/fs/Kconfig
index 976e8b9033c4..4961dd488444 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -245,6 +245,20 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	def_bool HUGETLB_PAGE
+	depends on X86
+	depends on SPARSEMEM_VMEMMAP
+	depends on HAVE_BOOTMEM_INFO_NODE
+	help
+	  When using HUGETLB_PAGE_FREE_VMEMMAP, the system can save up some
+	  memory from pre-allocated HugeTLB pages when they are not used.
+	  6 pages per 2MB HugeTLB page and 4094 per 1GB HugeTLB page.
+
+	  When the pages are going to be used or freed up, the vmemmap array
+	  representing that range needs to be remapped again and the pages
+	  we discarded earlier need to be rellocated again.
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.11.0

