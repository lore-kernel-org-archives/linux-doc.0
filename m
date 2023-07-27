Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFC6C001DC
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjG0Pas (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbjG0Paq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:46 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBA61BE8
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 08:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=H/bsnJ3nxuaPYk8WVBKA64ofddky6JIAr3Z9JZdkWE0=; b=rwwK7hWh69mXMulm6Lyj8ENCmS
        3V8Hhm048cnQAyM0EYGXpM+vH+/EImP5q3DHuua+f2mXftSTXq6rrKQckRqYwCqI2BpZwCFFLyLJK
        Z8g4q2xFCA5NP+szKiWfr6ixU7KoWdys+BY7vK38sRYhHPTTi/++OGXTO3JVJsVKbO7hG2Yqz/KFa
        hJZXBBYvGrWbNk8VUQQtP58jGtX9P9fRPfiLFdqszNd0mDXcNOHM39UbgNVVgage7OtVbpt7wQmi6
        ayRnL9pGOAKOlzZU5wl+IKoBqAD7vpEi6KBNzbqhbkyzox+npuD8dJlsH0L1YbFXYM5jgX6o421+w
        m+RVuO1g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43366 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1qP2wr-000642-1O;
        Thu, 27 Jul 2023 16:30:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1qP2wr-001CXk-JZ; Thu, 27 Jul 2023 16:30:41 +0100
In-Reply-To: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
References: <ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 09/16] arm64: text replication: add swapper page directory
 helpers
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qP2wr-001CXk-JZ@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Thu, 27 Jul 2023 16:30:41 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a series of helpers for the swapper page directories - a set which
return those for the calling CPU, and those which take the NUMA node
number.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/pgtable.h | 19 +++++++++++++++++++
 arch/arm64/kernel/hibernate.c    |  2 +-
 arch/arm64/mm/ktext.c            | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1e72067d1e9e..5cfff64e4944 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -627,6 +627,25 @@ extern struct pgtables pgtable_node0;
 
 #ifdef CONFIG_REPLICATE_KTEXT
 extern struct pgtables *pgtables[MAX_NUMNODES];
+
+pgd_t *swapper_pg_dir_node(void);
+phys_addr_t __swapper_pg_dir_node_phys(int nid);
+phys_addr_t swapper_pg_dir_node_phys(void);
+#else
+static inline pgd_t *swapper_pg_dir_node(void)
+{
+	return swapper_pg_dir;
+}
+
+static inline phys_addr_t __swapper_pg_dir_node_phys(int nid)
+{
+	return __pa_symbol(swapper_pg_dir);
+}
+
+static inline phys_addr_t swapper_pg_dir_node_phys(void)
+{
+	return __pa_symbol(swapper_pg_dir);
+}
 #endif
 
 extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 02870beb271e..be69515da802 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -113,7 +113,7 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 		return -EOVERFLOW;
 
 	arch_hdr_invariants(&hdr->invariants);
-	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
+	hdr->ttbr1_el1		= swapper_pg_dir_node_phys();
 	hdr->reenter_kernel	= _cpu_resume;
 
 	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 48d7943d6907..7b9a1f1b12a1 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -21,6 +21,26 @@ struct pgtables *pgtables[MAX_NUMNODES] = {
 
 static void *kernel_texts[MAX_NUMNODES];
 
+static pgd_t *__swapper_pg_dir_node(int nid)
+{
+	return pgtables[nid]->swapper_pg_dir;
+}
+
+pgd_t *swapper_pg_dir_node(void)
+{
+	return __swapper_pg_dir_node(numa_node_id());
+}
+
+phys_addr_t __swapper_pg_dir_node_phys(int nid)
+{
+	return __pa(__swapper_pg_dir_node(nid));
+}
+
+phys_addr_t swapper_pg_dir_node_phys(void)
+{
+	return __swapper_pg_dir_node_phys(numa_node_id());
+}
+
 void __kprobes ktext_replication_patch(u32 *tp, __le32 insn)
 {
 	unsigned long offset;
-- 
2.30.2

