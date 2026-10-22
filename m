Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688339;
	b=OJHlMf3zLBzwWL0UhTyKVihKjO+G0sXPMTYy0CPPOwb4TnXPEScaQuusp5MN2dS+Bifs
	 W5GOwfiuM1n8OcKtffxn6hAF/Uj5EaRNsRBAnz9HKijAp9kN1cfmGDClqAf9ZssASUWy3
	 8GPODRgDhiAVPZyKauyGSR4K6Dcis1M0lhVu7bBOTIvRZnNhVe5cxoeKdVw0gomk2J8cp
	 CeDTxyo2fkh/6Gj7ygorVkKDPoHECynr0PhgxMAqilvhNmNs7lq1HL7awXxKRDmnHhPo/
	 67wMqsuua1Ixii2E3ylSuKBXi+niphlAfedio7AD1f8mFVwzcIdlfgnB8v48goU/H9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wszrh6R2g8rAfmRyvD0Q1PJ/LXwFW3iH+CJpBKb1e0Y=;
	b=3XMj8ZNTiP7Ref8L1lBN50NgYtc+9vKqqjuuN32LD6p1X4ahrsZUH+5rMKFIpjeSAnxD
	 v1ld+nmqLqehMtKr7jVt0MGwsuGVbg+Iy3Ny77PFxf97l0rXUO9a5Z9GNX3WcVimU7kOR
	 kecbxQ+8qzsfv/dWdSOatQs9ldYoOHDLFsVLuIlzyUOu2JvZEsIro886YlQTzWFEUrM8o
	 QujKPtv91HM+HVVapsdp5lJ5LLLhHSHCR74+TbERadb0ODFZbv7tYiLzLHbLyvx4haFap
	 Pgl3pRrdKlzCYeW5OVp0RgMhBHAltxIJYuW7LHSm/HqhTT3iG6VdQnxP0ohmRyHbLPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=FL1ZaMku;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39750606A31F
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 16:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39750606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=FL1ZaMku
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1846bc43c28so1479756c88.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1792688336; x=1793293136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wszrh6R2g8rAfmRyvD0Q1PJ/LXwFW3iH+CJpBKb1e0Y=;
        b=FL1ZaMkuY3485iIc3ZQCn3sG+fTJWBdV09VwotBgZrc/rZo7Cho79baKAkZAUlJ2JY
         uu/5e9rj05pf3lj3sBw7UBZfpuBp8V08rw+qABCc+IFc7QxBq/C0X9x5iGEsZzPT4YiO
         zrSz/MpcrWnCNgS//YZKHTrYOOfNuhtDXhgdg/TaBAHletiw4lGLDbU0nTmcvzGDYMW7
         q4GnWSZmABXUt9yGZmbyTuUhddJQndmGdbu7IegHeKuwwHH18YRtaACBapikc2uLQlOh
         UjvxsWAClH91Qkx1lCxQCtYyCv+wCXzSGfdY/1596lds0RqodFwXVYChF6kpT9hTg4eG
         iOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688336; x=1793293136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wszrh6R2g8rAfmRyvD0Q1PJ/LXwFW3iH+CJpBKb1e0Y=;
        b=0Z9T7dYa4st3WAL2Od+INX6p/IwrM0dcILcOfzFsCE1pqR7/saZKsFpKNxwBz/80Eg
         kCHYfrJdUlhDlSyUiIGcqjjIdHCC6kfo/yNkQVBezsOa1imFvHMEX4DIAyHACU2vTdLn
         rn4oWIEeS8Gm5TVec5+8DVqEuD8VnaYg9ImPXOnA9u94VDi4ZDnVayEJZVtHztmq81Wr
         yWcnLNbFxuZA3GjGfVQojKn7pg/7eK76ZY+10+9bpukLZAMJJ6MGVYwC/3CyrSjfxNP/
         RbdjdwqjpXadyvsjH+iM6YqVNNijMj0swzelVIaPLU0NC7rig+dFR1EiRbCZKm5fdNfH
         LTug==
X-Forwarded-Encrypted: i=1; AKwUvBxW0iteWUZgsSY0l5wMalUGgw+wZDwfUi6YACVZm7Yb8vaPJHEuCn6nn1Wwp4fNvhzlEigd6z0ESi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIvWaiR8TGuPkMp+G/p7GCOFETybR6cXrXbiOb4nubOCaKBRI8
	QhRqi5J17Ff4ODaZx2EfZSqbuABPcFWxEaUixkHGXvSGLd4Q3hLICR0OgMJY9BhEYQ==
X-Gm-Gg: AYBFou1RC4OT9g5Qr7uZ0CtXgqScOi/ANaJTjPbCo/A99Oip5TcRoFsu7rqba52LO3v
	qqeRcN94O9gZq2ZkfwNez/WuA944EQysTmAP0ztmxBs4HxpkU6THxjdBcVJu/4XG5TK3mxZgLzT
	UcJLAMbS6KbOIQ8d+eHYaXevo4iZ6mbRGVcWfOGcO9LlsaD9KDp1OnTxnH5frqQfxfBTDv0Uafl
	iadaj2pbrxE5H1a4DQIx/0wzjr34D8GDJf6dhJ/L0zCsIqa4pn7Uj21iMeU0HWdwFRi6OZQwhop
	8k6iFLTwmrSV+joz/QQ4BLvuPepYbK+FxVcjhS5xBI8QsFpthIdYHxAOqhEsaEE9FImnHfgXCNN
	lN4WOdKcOpBu87cQzIv8KcKCCJJI2mcq5FgTsan1cmahRDnIavGGu60vQ+b3DD50u+IudaPpy09
	yVfOxObUHBV3hDP9i93vh1QIdh63HrBZNcFhnUB6NqUVApaH1gBavsTE2hn9SbJB2OFAlHUcyFl
	mTRUeYgIvwMejbzlfedjaSK0dL+j32z1h75SIw8Bv3j70D+w8qTZ574/7+64QcKo+ZzLzz3syt0
	fs3JA+GEjBcFI3/RYSVlP1+GcPLCOwIR2/I=
X-Received: by 2002:a05:701b:204f:20b0:184:329d:eced with SMTP id a92af1059eb24-190a52de3edmr7715048c88.25.1792688336131;
        Thu, 22 Oct 2026 09:58:56 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm15951151c88.19.2026.10.22.09.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:58:55 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] PCI: Add pci=noaer_recovery kernel boot option
Date: Thu, 22 Oct 2026 16:58:41 +0000
Message-ID: <20261022165842.1463451-2-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261022165842.1463451-1-yurypm@arista.com>
References: <20261022165842.1463451-1-yurypm@arista.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On large modular systems with a complex PCIe topology, allow userspace to
inspect uncorrectable AER errors before Linux attempts recovery.

Add pci=noaer_recovery to retain AER logging while skipping recovery for
uncorrectable errors. Check the option before dispatching either CXL RCH
internal errors or ordinary PCIe errors so CXL driver error callbacks
cannot bypass it. Also skip recovery for errors reported through GHES,
while retaining error logging and releasing error buffers and device
references.

Correctable errors continue to be handled normally. Skipping recovery
avoids its clearing of uncorrectable error status, but does not suppress
Root Port interrupt acknowledgment or change firmware error handling.
The option is AER-specific and does not disable DPC recovery.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
Changes in v3:
- Check the option before both CXL RCH and ordinary PCIe error dispatch.
- Preserve logging, correctable handling, and current GHES cleanup.
- Clarify the AER-only scope and rebase onto PCI next.

v2: https://lore.kernel.org/linux-pci/20260709185429.627968-2-yurypm@arista.com/
Review: https://lore.kernel.org/linux-pci/20260709190616.DF0CF1F000E9@smtp.kernel.org/

 Documentation/admin-guide/kernel-parameters.txt |  5 +++++
 drivers/pci/pci.c                               |  2 ++
 drivers/pci/pci.h                               |  2 ++
 drivers/pci/pcie/aer.c                          | 13 +++++++++++--
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4b..6047efd3c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5118,6 +5118,11 @@ Kernel parameters
 		noaer		[PCIE] If the PCIEAER kernel config parameter is
 				enabled, this kernel boot option can be used to
 				disable the use of PCIE advanced error reporting.
+		noaer_recovery	[PCIE] Disable Linux AER recovery for
+				uncorrectable errors, including CXL RCH errors,
+				while retaining AER logging. Correctable errors
+				are handled normally. Requires CONFIG_PCIEAER.
+				Does not disable DPC or firmware error recovery.
 		nodomains	[PCI] Disable support for multiple PCI
 				root domains (aka PCI segments, in ACPI-speak).
 		nommconf	[X86] Disable use of MMCONFIG for PCI
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index a62af7320..9ca8d3fbb 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6840,6 +6840,8 @@ static int __init pci_setup(char *str)
 				pcie_ats_disabled = true;
 			} else if (!strcmp(str, "noaer")) {
 				pci_no_aer();
+			} else if (!strcmp(str, "noaer_recovery")) {
+				pci_no_aer_recovery();
 			} else if (!strcmp(str, "earlydump")) {
 				pci_early_dump = true;
 			} else if (!strncmp(str, "realloc=", 8)) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 77efa4c5c..ccc6a678c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1337,6 +1337,7 @@ static inline void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge
 
 #ifdef CONFIG_PCIEAER
 void pci_no_aer(void);
+void pci_no_aer_recovery(void);
 void pci_aer_init(struct pci_dev *dev);
 void pci_aer_exit(struct pci_dev *dev);
 extern const struct attribute_group aer_stats_attr_group;
@@ -1348,6 +1349,7 @@ void pci_save_aer_state(struct pci_dev *dev);
 void pci_restore_aer_state(struct pci_dev *dev);
 #else
 static inline void pci_no_aer(void) { }
+static inline void pci_no_aer_recovery(void) { }
 static inline void pci_aer_init(struct pci_dev *d) { }
 static inline void pci_aer_exit(struct pci_dev *d) { }
 static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c376c3adb..c41e5e13f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -142,6 +142,7 @@ struct aer_info {
 					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
 
 static bool pcie_aer_disable;
+static bool pcie_aer_recovery_disable;
 static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
 
 void pci_no_aer(void)
@@ -149,6 +150,11 @@ void pci_no_aer(void)
 	pcie_aer_disable = true;
 }
 
+void pci_no_aer_recovery(void)
+{
+	pcie_aer_recovery_disable = true;
+}
+
 bool pci_aer_available(void)
 {
 	return !pcie_aer_disable && pci_msi_enabled();
@@ -1338,6 +1344,9 @@ static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
 
 static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 {
+	if (pcie_aer_recovery_disable && info->severity != AER_CORRECTABLE)
+		return;
+
 	cxl_rch_handle_error(dev, info);
 	pci_aer_handle_error(dev, info);
 }
@@ -1383,15 +1392,15 @@ static void aer_recover_work_func(struct work_struct *work)
 		ghes_estatus_pool_region_free((unsigned long)entry.regs,
 					    sizeof(struct aer_capability_regs));
 
-		if (pdev) {
+		if (pdev && !pcie_aer_recovery_disable) {
 			if (entry.severity == AER_NONFATAL)
 				pcie_do_recovery(pdev, pci_channel_io_normal,
 						 aer_root_reset);
 			else if (entry.severity == AER_FATAL)
 				pcie_do_recovery(pdev, pci_channel_io_frozen,
 						 aer_root_reset);
-			pci_dev_put(pdev);
 		}
+		pci_dev_put(pdev);
 	}
 }
 
-- 
2.51.0

