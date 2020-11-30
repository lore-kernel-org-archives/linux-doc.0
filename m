Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069CFC83018
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC93E2074A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="DWAVMYC5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgK3PVG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3PVF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:21:05 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDA2C0617A6
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:32 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id b12so1565609pjl.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oSUrQajIlhHrZQJhWJQy1InopKyNlwdkkxQ0BvZwQN0=;
        b=DWAVMYC5XDS1bTlCs9TeZeHZIApj1emnmPoEgk8/IZ7ZYz+xHQd+CHQzN0jTMjHt6A
         6EurUOICoj8KbBR9td5kpGwKGoA+dztk5n9dyU8AA5xAeQE6xE9kgK3url+BCRIy6FCZ
         gPQiV+HawebRTWfWxeQReGSAtvnV9yX8qsB5PbrgDT+UGA+zxMyufbgmqRQ6IWVweNa1
         VLDKbavJwhlBbgHpEGU/kv17lR74Bs2BA+Pr8BIlPtOrhIlnlSZrBqka8633pluwaWlO
         7H821KvG/EESks3WYCqjMfZHt6YuOpCIVvFeEMsE+PCAMyC8COjHMGSEfB/Ng3ngDHJE
         W30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oSUrQajIlhHrZQJhWJQy1InopKyNlwdkkxQ0BvZwQN0=;
        b=GZjV2/g6Nqx0XFk7hVTJQTo7UXmgPCTQtZv5ms1tE1/5/OwUlrmiVYBEkDQdSabqAi
         MS/2i0aLTdUBuL5sa+/fQG8DMHyGFyrYI2bObRTVlIrHC0cyB6S4UYbyG6KXYn+CSk0g
         84egxF9y3Lksa0WGd8M/CWHK0zHwCOgT+muAFw8d8oKfCGY9JOm3LDLo/w9tKB36MTXI
         J3mwNOKYeAblRAfOY0QqkidM+4kkkEydm94+36H99YBNmUomV5SRDvGFh2hVpxRGlBmG
         8h+sAhuqMqfXT0/OHxY0mBTYqvurP07BKlBJlNRRf9h8i3Bk4q5YO3v8Vkvk2BsBiHF4
         oL7g==
X-Gm-Message-State: AOAM531iajGAoHBf/r21+oI4boxWhl5xFTyPJPjUI7jymZBfqDa7yiar
        Y4Ag8k61J/8attmqZAUkfzaUiw==
X-Google-Smtp-Source: ABdhPJzON+jkDByhCM5smb03d/1jVZTcqTeDK4J9d+BOESP/nye9u8yro9JQGq1BxF7HgN3KbYT6Dg==
X-Received: by 2002:a17:902:b58a:b029:d7:d45c:481c with SMTP id a10-20020a170902b58ab02900d7d45c481cmr19421067pls.55.1606749632363;
        Mon, 30 Nov 2020 07:20:32 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.20.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:20:31 -0800 (PST)
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
Subject: [PATCH v7 07/15] x86/mm/64: Disable PMD page mapping of vmemmap
Date:   Mon, 30 Nov 2020 23:18:30 +0800
Message-Id: <20201130151838.11208-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If we enable the CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, we can just
disbale PMD page mapping of vmemmap to simplify the code. In this
case, we do not need complex code doing vmemmap page table
manipulation. This is a way to simply the first version of this
patch series. In the future, we can add some code doing page table
manipulation.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 0435bee2e172..155cb06a6961 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1557,7 +1557,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 {
 	int err;
 
-	if (end - start < PAGES_PER_SECTION * sizeof(struct page))
+	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP))
+		err = vmemmap_populate_basepages(start, end, node, NULL);
+	else if (end - start < PAGES_PER_SECTION * sizeof(struct page))
 		err = vmemmap_populate_basepages(start, end, node, NULL);
 	else if (boot_cpu_has(X86_FEATURE_PSE))
 		err = vmemmap_populate_hugepages(start, end, node, altmap);
@@ -1610,7 +1612,8 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 		}
 		get_page_bootmem(section_nr, pud_page(*pud), MIX_SECTION_INFO);
 
-		if (!boot_cpu_has(X86_FEATURE_PSE)) {
+		if (!boot_cpu_has(X86_FEATURE_PSE) ||
+		    IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)) {
 			next = (addr + PAGE_SIZE) & PAGE_MASK;
 			pmd = pmd_offset(pud, addr);
 			if (pmd_none(*pmd))
-- 
2.11.0

