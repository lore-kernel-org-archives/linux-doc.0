Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1751BC2BB9A
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 12:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D98CD239D1
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 12:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgLQMQO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 07:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgLQMQN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 07:16:13 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47538C061257
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 04:15:51 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id m5so4010148pjv.5
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uMWaylOLwrhQO+0qPcTQWOqk5IVfd5cW+XnB4Y3UJOM=;
        b=HP32Wirp0xJy8F8B53MO0WJ+iP1j1h5d5guVaV+dyEaqPHsJ0HtA78GwwPulzLqmhA
         9Hya+1z+TDZDAhQNXwHc8v1HtvdxEzRf+upBJuGl22ePI/8v4KnK2cUXhPD+6ugbG/tf
         eZYDpkTd5ExtlnHsc8Rw9Cgti3GFsz9Ou3rALkoibuRclS6EKsTvdJavl9dg8niz0Lho
         8h+mWxlzSO7fV+oLsL0x4M36s1/swIv1SlSlyQpGK6NkQ1a06FxW+BaQwGX5ssigwser
         M8dRxJCk4Oa2yQ1taaSKbXE/LzPGBZ+CtoxWjkk6mxuLCP6T1NrReAj16bhWSEPTdwl9
         CRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMWaylOLwrhQO+0qPcTQWOqk5IVfd5cW+XnB4Y3UJOM=;
        b=WFYvzDcf7w/W4WDxW7afAEWMA15IBJUJybGhk7OHk/1uP2n+dLtDfbkS24u2oyT/1I
         Qr07106CN2+c2c2sF+fiI0zhuSWLhMUhXftnMwJ5hKRP+qOWOM887xk0ghhkgKZKj3Kj
         U2+X0bRj5TLHo8Z7pCir43X87VPBFFVeKVVdSiCLB5toW7983eKygU4uBPBXg8vssCfb
         s7Uq/0QBVPD2wks1Sl7twoS4vFFF7VIbSBUascPCb8sDLgA8WpFzb53VCY23xG8AxBTl
         cUm19xwN3NYKNcAGyIFV+wspuIAFi74xFZHkXP/YPKCs07lFy2ufKskeK7sd8OfwxSXy
         zgaQ==
X-Gm-Message-State: AOAM533phlwjS5ZHdXWfP4++HaXqkvK/edO3reiHxp0O+fLepC2PZAHK
        6Z1rs8S6EAKpkwUltn8APrzCLA==
X-Google-Smtp-Source: ABdhPJxTZ/B0obsJFYqu5Nkao7Nm5q+V7wC3rvQeBm1ZiFOsx5R6gfzFUeZHk1BZE9qpSgsUJnYymw==
X-Received: by 2002:a17:90a:c70f:: with SMTP id o15mr7617385pjt.40.1608207350845;
        Thu, 17 Dec 2020 04:15:50 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id n15sm2775691pgl.31.2020.12.17.04.15.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 04:15:50 -0800 (PST)
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
Subject: [PATCH v10 02/11] mm/hugetlb: Introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Thu, 17 Dec 2020 20:12:54 +0800
Message-Id: <20201217121303.13386-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201217121303.13386-1-songmuchun@bytedance.com>
References: <20201217121303.13386-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The HUGETLB_PAGE_FREE_VMEMMAP option is used to enable the freeing
of unnecessary vmemmap associated with HugeTLB pages. The config
option is introduced early so that supporting code can be written
to depend on the option. The initial version of the code only
provides support for x86-64.

Like other code which frees vmemmap, this config option depends on
HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
used to register bootmem info. Therefore, make sure
register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
is defined.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c |  2 +-
 fs/Kconfig            | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

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
index 976e8b9033c4..e7c4c2a79311 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -245,6 +245,24 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	def_bool HUGETLB_PAGE
+	depends on X86_64
+	depends on SPARSEMEM_VMEMMAP
+	depends on HAVE_BOOTMEM_INFO_NODE
+	help
+	  The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
+	  some vmemmap pages associated with pre-allocated HugeTLB pages.
+	  For example, on X86_64 6 vmemmap pages of size 4KB each can be
+	  saved for each 2MB HugeTLB page.  4094 vmemmap pages of size 4KB
+	  each can be saved for each 1GB HugeTLB page.
+
+	  When a HugeTLB page is allocated or freed, the vmemmap array
+	  representing the range associated with the page will need to be
+	  remapped.  When a page is allocated, vmemmap pages are freed
+	  after remapping.  When a page is freed, previously discarded
+	  vmemmap pages must be allocated before remapping.
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.11.0

