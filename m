Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A862C43461
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 07:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E42A061494
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 07:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhDYHNu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Apr 2021 03:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhDYHNu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Apr 2021 03:13:50 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2742C061574
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 00:13:09 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 10so1463751pfl.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SoZb++zfv4yAwjnBuF75FK8ZgZmHYksA4MNIPLiTWic=;
        b=1bTV5nlan8MWSy/nxj3eASEhGZQ0KgaptGQnSI4jeHIJoKISCdIAIfXYgMXuR8w6Qm
         whcjZTBlqfrQHnqAkLtAmFI/s/iVKboYu8prKLL2RESUL/0F8aqxYDsK6BwhCAfn9B7M
         6aMckk8KY7N5FtmWr4s+4SkZneSWlGLPAdmhPrIimCHVCX6xGtTb3PUr6wByNhQt0Fv0
         xo19FtUwBs++wyhnN5YNeUOU68UJe8qCYgEwFnr8reliOTEseI2qhXqSVe3we2fqlN+M
         NscD3hOSHmqVdWqSdtx855l7rBfO+o6QFlcRwZQJ8Jeahk39bpLL/rBchITeD9qP9o8/
         9i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SoZb++zfv4yAwjnBuF75FK8ZgZmHYksA4MNIPLiTWic=;
        b=tfvQdyaseXgXX0L7Pc1aUgVsVTWs5yh8TO+ehzZfN3t7/nwhGcUna5sELq6O6HZZUL
         J97QS6bGftwjYSxIK/UpZpJhaG8edNJH39nRsOcttkcO598Xkc0OvstP/Y/DAOHOan+v
         UqGwxOOtHXu+dTK2eyPFcSWInTyh69+TuVUhMh6EnE8bTCZsNZ7wglVSbg1EE7FRRCu+
         5/7MkiIFSvx/x+4BR6hFdl9sXIT9aY6nu2tFZjrEQcmgp4Zc3hL/LQ4GU0NvhVIvAsxR
         q0rnI++G5/KCUYKDBGELBUDYIYCG7CNWhR2V+h5wwnZf4tGIif9r4mYTx9lk3t3GWdu6
         MbNQ==
X-Gm-Message-State: AOAM532H3bUX1Mm1dwGZHnvP8Uoa6/ObC2rChqKjWgVvjKcdpCaBvq6/
        0CqsN1vZCgPt13Sf1ikpNCsmDQ==
X-Google-Smtp-Source: ABdhPJyXeVBx1my+A3dIYD92sTzDNr3ovIrz5cTjVTbBWqptlQztvOxxOJgEOP5gZ0JNR7axJrRZ/A==
X-Received: by 2002:a62:e315:0:b029:263:8436:e784 with SMTP id g21-20020a62e3150000b02902638436e784mr11318972pfh.69.1619334789431;
        Sun, 25 Apr 2021 00:13:09 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id h8sm8767125pjt.17.2021.04.25.00.12.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Apr 2021 00:13:09 -0700 (PDT)
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
Subject: [PATCH v21 2/9] mm: hugetlb: introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Sun, 25 Apr 2021 15:07:45 +0800
Message-Id: <20210425070752.17783-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210425070752.17783-1-songmuchun@bytedance.com>
References: <20210425070752.17783-1-songmuchun@bytedance.com>
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

