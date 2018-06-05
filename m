Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73CC87D043
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 02:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751223AbeFECQz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 22:16:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56042 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751194AbeFECQy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jun 2018 22:16:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9252B6085C; Tue,  5 Jun 2018 02:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1528165013;
        bh=4LHmsWdfwqUYgThUa/oHwAxaQzwLSXu/BODwEYrfaW8=;
        h=From:To:Cc:Subject:Date:From;
        b=c3xlxP+ZM48Xb9oMZ/vF+v09OvgXQl51ui1GL4YYVnp0XYVNFTSEcQOOjlh5oUpQ6
         p3a7DjHG0GDitSpcBWJ/HBA/kvirCyq8qyXxbARB6e1/vL/qvGwUMdSYcBKCbZombX
         MAHRpxY7r84tA1unR+Iw58eagsFx3LeL8/6tmR0I=
Received: from drakthul.qualcomm.com (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okaya@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6928A60763;
        Tue,  5 Jun 2018 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1528165011;
        bh=4LHmsWdfwqUYgThUa/oHwAxaQzwLSXu/BODwEYrfaW8=;
        h=From:To:Cc:Subject:Date:From;
        b=jLHRVnqypevNOhMTUaGpzzifqvAFRd3qk9hqqLtoFPPnz3pKcZcyaJpJumxLwVEhL
         1EUsL1fAtfzKKUk158pLwPoO/v5h0MTVeEtdUaGu93nYBr72FSLB2HTkBgPRXwauky
         ZpOwcw21SfbmnEU8blln/Hp9Islaf98z8IYK94nQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6928A60763
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=okaya@codeaurora.org
From:   Sinan Kaya <okaya@codeaurora.org>
To:     linux-pci@vger.kernel.org, timur@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sinan Kaya <okaya@codeaurora.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
        Bjorn Helgaas <bhelgaas@google.com>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Rientjes <rientjes@google.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Borislav Petkov <bp@suse.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Petr Tesarik <ptesarik@suse.cz>,
        Andy Lutomirski <luto@kernel.org>,
        Dou Liyang <douly.fnst@cn.fujitsu.com>,
        Ram Pai <linuxram@us.ibm.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V4] PCI: move early dump functionality from x86 arch into the common code
Date:   Mon,  4 Jun 2018 22:16:09 -0400
Message-Id: <1528164985-14099-1-git-send-email-okaya@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move early dump functionality into common code so that it is available for
all archtiectures. No need to carry arch specific reads around as the read
hooks are already initialized by the time pci_setup_device() is getting
called during scan.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/x86/include/asm/pci-direct.h               |  4 ---
 arch/x86/kernel/setup.c                         |  5 ---
 arch/x86/pci/common.c                           |  4 ---
 arch/x86/pci/early.c                            | 44 -------------------------
 drivers/pci/pci.c                               |  5 +++
 drivers/pci/pci.h                               |  1 +
 drivers/pci/probe.c                             | 19 +++++++++++
 8 files changed, 26 insertions(+), 58 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e490902..e64f1d8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2995,7 +2995,7 @@
 			See also Documentation/blockdev/paride.txt.
 
 	pci=option[,option...]	[PCI] various PCI subsystem options:
-		earlydump	[X86] dump PCI config space before the kernel
+		earlydump	dump PCI config space before the kernel
 				changes anything
 		off		[X86] don't probe for the PCI bus
 		bios		[X86-32] force use of PCI BIOS, don't access
diff --git a/arch/x86/include/asm/pci-direct.h b/arch/x86/include/asm/pci-direct.h
index e1084f7..94597a3 100644
--- a/arch/x86/include/asm/pci-direct.h
+++ b/arch/x86/include/asm/pci-direct.h
@@ -15,8 +15,4 @@ extern void write_pci_config_byte(u8 bus, u8 slot, u8 func, u8 offset, u8 val);
 extern void write_pci_config_16(u8 bus, u8 slot, u8 func, u8 offset, u16 val);
 
 extern int early_pci_allowed(void);
-
-extern unsigned int pci_early_dump_regs;
-extern void early_dump_pci_device(u8 bus, u8 slot, u8 func);
-extern void early_dump_pci_devices(void);
 #endif /* _ASM_X86_PCI_DIRECT_H */
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 2f86d88..480f250 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -991,11 +991,6 @@ void __init setup_arch(char **cmdline_p)
 		setup_clear_cpu_cap(X86_FEATURE_APIC);
 	}
 
-#ifdef CONFIG_PCI
-	if (pci_early_dump_regs)
-		early_dump_pci_devices();
-#endif
-
 	e820__reserve_setup_data();
 	e820__finish_early_params();
 
diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index 563049c..d4ec117 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -22,7 +22,6 @@
 unsigned int pci_probe = PCI_PROBE_BIOS | PCI_PROBE_CONF1 | PCI_PROBE_CONF2 |
 				PCI_PROBE_MMCONF;
 
-unsigned int pci_early_dump_regs;
 static int pci_bf_sort;
 int pci_routeirq;
 int noioapicquirk;
@@ -599,9 +598,6 @@ char *__init pcibios_setup(char *str)
 		pci_probe |= PCI_BIG_ROOT_WINDOW;
 		return NULL;
 #endif
-	} else if (!strcmp(str, "earlydump")) {
-		pci_early_dump_regs = 1;
-		return NULL;
 	} else if (!strcmp(str, "routeirq")) {
 		pci_routeirq = 1;
 		return NULL;
diff --git a/arch/x86/pci/early.c b/arch/x86/pci/early.c
index e5f753c..f5fc953 100644
--- a/arch/x86/pci/early.c
+++ b/arch/x86/pci/early.c
@@ -57,47 +57,3 @@ int early_pci_allowed(void)
 			PCI_PROBE_CONF1;
 }
 
-void early_dump_pci_device(u8 bus, u8 slot, u8 func)
-{
-	u32 value[256 / 4];
-	int i;
-
-	pr_info("pci 0000:%02x:%02x.%d config space:\n", bus, slot, func);
-
-	for (i = 0; i < 256; i += 4)
-		value[i / 4] = read_pci_config(bus, slot, func, i);
-
-	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1, value, 256, false);
-}
-
-void early_dump_pci_devices(void)
-{
-	unsigned bus, slot, func;
-
-	if (!early_pci_allowed())
-		return;
-
-	for (bus = 0; bus < 256; bus++) {
-		for (slot = 0; slot < 32; slot++) {
-			for (func = 0; func < 8; func++) {
-				u32 class;
-				u8 type;
-
-				class = read_pci_config(bus, slot, func,
-							PCI_CLASS_REVISION);
-				if (class == 0xffffffff)
-					continue;
-
-				early_dump_pci_device(bus, slot, func);
-
-				if (func == 0) {
-					type = read_pci_config_byte(bus, slot,
-								    func,
-							       PCI_HEADER_TYPE);
-					if (!(type & 0x80))
-						break;
-				}
-			}
-		}
-	}
-}
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 97acba7..04052dc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -115,6 +115,9 @@ static bool pcie_ari_disabled;
 /* If set, the PCIe ATS capability will not be used. */
 static bool pcie_ats_disabled;
 
+/* If set, the PCI config space of each device is printed during boot. */
+bool pci_early_dump;
+
 bool pci_ats_disabled(void)
 {
 	return pcie_ats_disabled;
@@ -5805,6 +5808,8 @@ static int __init pci_setup(char *str)
 				pcie_ats_disabled = true;
 			} else if (!strcmp(str, "noaer")) {
 				pci_no_aer();
+			} else if (!strcmp(str, "earlydump")) {
+				pci_early_dump = true;
 			} else if (!strncmp(str, "realloc=", 8)) {
 				pci_realloc_get_opt(str + 8);
 			} else if (!strncmp(str, "realloc", 7)) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index c358e7a0..c33265e 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -7,6 +7,7 @@
 #define PCI_VSEC_ID_INTEL_TBT	0x1234	/* Thunderbolt */
 
 extern const unsigned char pcie_link_speed[];
+extern bool pci_early_dump;
 
 bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 56771f3..3678f0a 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1545,6 +1545,23 @@ static int pci_intx_mask_broken(struct pci_dev *dev)
 	return 0;
 }
 
+static void early_dump_pci_device(struct pci_dev *pdev)
+{
+	u32 value[256 / 4];
+	int i;
+
+	if (!pci_early_dump)
+		return;
+
+	pci_info(pdev, "config space:\n");
+
+	for (i = 0; i < 256; i += 4)
+		pci_read_config_dword(pdev, i, &value[i / 4]);
+
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1, value,
+		       256, false);
+}
+
 /**
  * pci_setup_device - Fill in class and map information of a device
  * @dev: the device structure to fill
@@ -1594,6 +1611,8 @@ int pci_setup_device(struct pci_dev *dev)
 	pci_printk(KERN_DEBUG, dev, "[%04x:%04x] type %02x class %#08x\n",
 		   dev->vendor, dev->device, dev->hdr_type, dev->class);
 
+	early_dump_pci_device(dev);
+
 	/* Need to have dev->class ready */
 	dev->cfg_size = pci_cfg_space_size(dev);
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
