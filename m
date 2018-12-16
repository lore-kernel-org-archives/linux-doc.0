Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D13F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 16 Dec 2018 13:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbeLPNQn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 16 Dec 2018 08:16:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54118 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730382AbeLPNQn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 16 Dec 2018 08:16:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B2AD183F44;
        Sun, 16 Dec 2018 13:16:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-64.pek2.redhat.com [10.72.12.64])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E4A7D608F3;
        Sun, 16 Dec 2018 13:16:37 +0000 (UTC)
From:   Lianbo Jiang <lijiang@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     kexec@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
        x86@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
        dyoung@redhat.com, linux-doc@vger.kernel.org
Subject: [PATCH 2/2 v3] kdump,vmcoreinfo: Export the value of sme mask to vmcoreinfo
Date:   Sun, 16 Dec 2018 21:16:17 +0800
Message-Id: <20181216131617.2612-3-lijiang@redhat.com>
In-Reply-To: <20181216131617.2612-1-lijiang@redhat.com>
References: <20181216131617.2612-1-lijiang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sun, 16 Dec 2018 13:16:42 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For AMD machine with SME feature, makedumpfile tools need to know
whether the crash kernel was encrypted or not. If SME is enabled
in the first kernel, the crash kernel's page table(pgd/pud/pmd/pte)
contains the memory encryption mask, so need to remove the sme mask
to obtain the true physical address.

Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
---
 arch/x86/kernel/machine_kexec_64.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index 4c8acdfdc5a7..1860fe24117d 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -352,10 +352,24 @@ void machine_kexec(struct kimage *image)
 
 void arch_crash_save_vmcoreinfo(void)
 {
+	u64 sme_mask = sme_me_mask;
+
 	VMCOREINFO_NUMBER(phys_base);
 	VMCOREINFO_SYMBOL(init_top_pgt);
 	vmcoreinfo_append_str("NUMBER(pgtable_l5_enabled)=%d\n",
 			pgtable_l5_enabled());
+	/*
+	 * Currently, the local variable 'sme_mask' stores the value of
+	 * sme_me_mask(bit 47), and also write the value of sme_mask to
+	 * the vmcoreinfo.
+	 * If need, the bit(sme_mask) might be redefined in the future,
+	 * but the 'bit63' will be reserved.
+	 * For example:
+	 * [ misc	   ][ enc bit  ][ other misc SME info       ]
+	 * 0000_0000_0000_0000_1000_0000_0000_0000_0000_0000_..._0000
+	 * 63   59   55   51   47   43   39   35   31   27   ... 3
+	 */
+	VMCOREINFO_NUMBER(sme_mask);
 
 #ifdef CONFIG_NUMA
 	VMCOREINFO_SYMBOL(node_data);
-- 
2.17.1

