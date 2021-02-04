Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5238C43381
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 03:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 848E864F60
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 03:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhBDDzP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 22:55:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhBDDzN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Feb 2021 22:55:13 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7957C061793
        for <linux-doc@vger.kernel.org>; Wed,  3 Feb 2021 19:54:17 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id s24so926232pjp.5
        for <linux-doc@vger.kernel.org>; Wed, 03 Feb 2021 19:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbaYTNYcnNCF5suT1Rnzl4fKBboUgz5smm7iB2s2QLo=;
        b=BZ9xMp3YtuJbJlv/cWJQps/Tpdxkv3meqtQufoGBj7IPb11hqwXzbvaTSBp0UqKg6T
         k8PmO7u00wNYkFfNARE+khYCQBrgi9HeU4C40Vbd+k32LaDwwZzikdIIG/JMfQzN62Nr
         zbCTYPTS8JL3WQZq711tY1VUMY+jriby99Ae6nDbubzItBcSfHUNHogoAY6b+VlW7qBe
         thr/geWt1x6v7paRRP8bU2CvSpyC4Bg4FrOjTlJ7aGZBZvWv3Tjfbn5BNyHVlW9qCxdI
         nBKpLmddjx3rW4/khv0BFx8cTDiBZcikuDSB+O64S71OFfgJwCl8ISRrjWStLnYLlM6i
         tevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbaYTNYcnNCF5suT1Rnzl4fKBboUgz5smm7iB2s2QLo=;
        b=TuVYOLcptvsjUgvX0rJoFTzmElqRVlJ1e6EK9azjuz2Yr7ZBp8WunMofImVWo8t8fD
         G6nmPRbnn3RX/1l5Z5CE2wY5pIAub/Z5ZftzT8N3Jqn+OS7GA4C76TV1L68TAGIyD8ps
         sNLzqnjmasni99SyWWm5Y+9qjCKJ02zZx1Ka50s3SqpSmNhsIn0tscNNp3Yr2OEoJgzg
         hQhupcr2zq6E5K4hBy/eu1008ZYQaGsskIWWvxFhkm6PUO/5HMJDXo5chVZReEYlpKzC
         fuj4RKLVQn+g2+35foE9sYdtCSuIcnaIH4BsHBk8p4khwwRaVAQIq7aIk5x1UES5L522
         x/CQ==
X-Gm-Message-State: AOAM533f3H1r9ZYq/lqdlfWMe3RPt/MkJEyWTURCGAHbS+tYA7hl5CZM
        Ms2IGL0fVi5IT6Fv1mk83P+N0w==
X-Google-Smtp-Source: ABdhPJwYg71Pe1QhU5oYCWBRke57VHrFd8GAEfIocOsjtaS43HRiEMVdR+bZjyHFtv6psvkU3njfNA==
X-Received: by 2002:a17:90b:3886:: with SMTP id mu6mr6231566pjb.153.1612410857508;
        Wed, 03 Feb 2021 19:54:17 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id 9sm3747466pfy.110.2021.02.03.19.54.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 19:54:16 -0800 (PST)
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
        david@redhat.com, naoya.horiguchi@nec.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v14 2/8] mm: hugetlb: introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Thu,  4 Feb 2021 11:50:37 +0800
Message-Id: <20210204035043.36609-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210204035043.36609-1-songmuchun@bytedance.com>
References: <20210204035043.36609-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
some vmemmap pages associated with pre-allocated HugeTLB pages.
For example, on X86_64 6 vmemmap pages of size 4KB each can be
saved for each 2MB HugeTLB page. 4094 vmemmap pages of size 4KB
each can be saved for each 1GB HugeTLB page.

When a HugeTLB page is allocated or freed, the vmemmap array
representing the range associated with the page will need to be
remapped. When a page is allocated, vmemmap pages are freed
after remapping. When a page is freed, previously discarded
vmemmap pages must be allocated before remapping.

The config option is introduced early so that supporting code
can be written to depend on the option. The initial version of
the code only provides support for x86-64.

Like other code which frees vmemmap, this config option depends on
HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
used to register bootmem info. Therefore, make sure
register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
is defined.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/x86/mm/init_64.c | 2 +-
 fs/Kconfig            | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index 97e7b77c9309..de87f234f1e9 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -237,6 +237,12 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	def_bool HUGETLB_PAGE
+	depends on X86_64
+	depends on SPARSEMEM_VMEMMAP
+	depends on HAVE_BOOTMEM_INFO_NODE
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.11.0

