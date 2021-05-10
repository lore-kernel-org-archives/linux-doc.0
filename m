Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC5DC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 03:03:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E5DB613DB
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 03:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhEJDEr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 May 2021 23:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhEJDEq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 May 2021 23:04:46 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC6CC061573
        for <linux-doc@vger.kernel.org>; Sun,  9 May 2021 20:03:42 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id t2-20020a17090a0242b0290155433387beso7468102pje.1
        for <linux-doc@vger.kernel.org>; Sun, 09 May 2021 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SoZb++zfv4yAwjnBuF75FK8ZgZmHYksA4MNIPLiTWic=;
        b=se6vvw+ZxXlajwG5sizvmAQHljY9gpETC9t2m8A8d0Y9HfYbApkE78gIC+V1qB9Vot
         ywsG1i2raBCCIQsCtzqFwtFJdWe0MimiHP0FJjTuvvwzSnPucHPo7Nk+l9UrFa9FhFkk
         0JWkLo4Aw2V1BfyM+7d7D5kOXihO99OFcVtOtv/XRCY7TNe8E+xgR4A0eawa4YpCKX24
         Js9XK0bAyW72BRD19Y94mn6l2p+kx6rZnoEuSViOzvpl40ZPe9vJeUQBYCCKGu6rW3uv
         3VIj9a4PB0zRqpxWp2z0+cDaojmyIft9Jhvx1ATYQ6Lqi6xvxBsaJUalBSXkV6ee92+s
         tucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SoZb++zfv4yAwjnBuF75FK8ZgZmHYksA4MNIPLiTWic=;
        b=bPcBJVVrcnqZC5PUgfH1mbdW16YVV2WB/9Em6K1nz7YeCdeWzREtngHDE7WuAmXy24
         fsaPPUBU897XJuGNpLLoo39bXTgvW0Hi3MmeQzJuZQWkeJd9Och9cA9HvEUVhiVwpWR8
         /PpqsyVcKD6ccH8To8KFTJPIlD6TfNpP3yZLfjRqYB8bb3edmYAYoFmqgXBkpxPCogHb
         Yyy9ciEm0xx5NEuSW1P8oB36cobOl8AqX4vvhc6te55nGo/kh49AILIfvDp8OKqWAftx
         zckzRyxXwusmQLkAQimN1HtM6EndKl+r0uhJAsXuirhr8cXCqC3RsGiuU41Wz9iRcg3l
         T3cw==
X-Gm-Message-State: AOAM532T69fcjj2C8UqOHKLCoCy6MsyFSMxsqfkCUn73nbfL4tyKcZDz
        F62BF5wsjZWCYSS39EWxzo+W7w==
X-Google-Smtp-Source: ABdhPJyypjzDhVvwpYM+JNuM2Xff9zlPlQPYTmNz590Ba8hKgYV7zewXPMixkOG6QOz0mL9vsjxj1w==
X-Received: by 2002:a17:902:bcc7:b029:ed:6f73:ffc4 with SMTP id o7-20020a170902bcc7b02900ed6f73ffc4mr21980606pls.1.1620615822268;
        Sun, 09 May 2021 20:03:42 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id a128sm9777003pfd.115.2021.05.09.20.03.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 May 2021 20:03:41 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
        rdunlap@infradead.org, oneukum@suse.com, anshuman.khandual@arm.com,
        jroedel@suse.de, almasrymina@google.com, rientjes@google.com,
        willy@infradead.org, osalvador@suse.de, mhocko@suse.com,
        song.bao.hua@hisilicon.com, david@redhat.com,
        naoya.horiguchi@nec.com, joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>,
        Balbir Singh <bsingharora@gmail.com>
Subject: [PATCH v23 2/9] mm: hugetlb: introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Mon, 10 May 2021 11:00:20 +0800
Message-Id: <20210510030027.56044-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210510030027.56044-1-songmuchun@bytedance.com>
References: <20210510030027.56044-1-songmuchun@bytedance.com>
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

If config HAVE_BOOTMEM_INFO_NODE is enabled, the freeing vmemmap
page code denpend on it to free vmemmap pages. Otherwise, just
use free_reserved_page() to free vmemmmap pages. The routine
register_page_bootmem_info() is used to register bootmem info.
Therefore, make sure register_page_bootmem_info is enabled if
HUGETLB_PAGE_FREE_VMEMMAP is defined.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Tested-by: Chen Huang <chenhuang5@huawei.com>
Tested-by: Bodeddula Balasubramaniam <bodeddub@amazon.com>
Reviewed-by: Balbir Singh <bsingharora@gmail.com>
---
 arch/x86/mm/init_64.c | 2 +-
 fs/Kconfig            | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 3aaf1d30c777..65ea58527176 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1270,7 +1270,7 @@ static struct kcore_list kcore_vsyscall;
 
 static void __init register_page_bootmem_info(void)
 {
-#ifdef CONFIG_NUMA
+#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
 	int i;
 
 	for_each_online_node(i)
diff --git a/fs/Kconfig b/fs/Kconfig
index dcd9161fbeba..6ce6fdac00a3 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -240,6 +240,11 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	def_bool HUGETLB_PAGE
+	depends on X86_64
+	depends on SPARSEMEM_VMEMMAP
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.11.0

