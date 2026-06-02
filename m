Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C83803F5
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397779; cv=none; b=X6bNLMhMKazupJq/88MrGcpdffwD62LLJ3S+vMdS/NUW9b+pgYhU+VRa9Hd4/3r/z8S6lpR3lCdqBwnZHvGajfZUqCyr7y0t1PMLC+iJ670ZwwWKMQF+gymd6AVWe/lX64NECtsmN4leAAk/UwyINT5pyDL4lao9ONgtfC4kI6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397779; c=relaxed/simple;
	bh=5kgCPvMKVNlkmlG9q2DP0TEUkvLsW+2Hf7nUpTdyoiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dc/bwmuiJqj9fS/FtzCoC0cgOkip2d2blvD3qXiIZJ71vZEhwPrbARDLrgR0l1IBRAxMKZwFggPo9f+gehKUvzQIVdvNUiM+oYofiwAaXKJhehQ3bLtAPBFUWoKo1cu6NUi/2KVmQ++x+HLcqNmHAzNjP+Xh80+DL7W/ILe7tP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Z8VdALqm; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Z8VdALqm"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137f3cb3f46so131228c88.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1780397777; x=1781002577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vw7pTGbZv180hnfPtEbYCTGSUppqGH0HzAhdLQBYrc=;
        b=Z8VdALqmHDCN8HRb1ozO0r6HGMaUce/9c+y3zGgGikPUxDezFCmrpBPm1srpf2qmHa
         6pfsjWGf0W2Ku+uowumMKOlmoZHnA4PODVvGYIjzqXflyOLF8F+ZLgijOJVw7NNSdCRB
         G+0363fmwLNjegRE5BtGE3lLEVcLP/ouCiVGDl9H6MV0aWPV85FspTteCjtib77qtDdy
         6RLv/nIVXZEMvBtMAHwjh9G+w8EB/gSE/w8/pDh5BLFXrlU9DZ6yYQsLRA3fwDijuxEo
         jZ01eySoXQHXOYM2DXJ0xLvUbQlxq5HfoJ5yxlwqfLN1Sd7hPifg8BQhe83SGP2AnV8r
         gXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397777; x=1781002577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vw7pTGbZv180hnfPtEbYCTGSUppqGH0HzAhdLQBYrc=;
        b=J37llnOGHDwYutypm5qJhBQ1IGCEuUwt30aemSmZkAoCLsY0IiLhs2XvytRfznMHW+
         fCco40rQ+7Dasiehcoj/TjDD/eK82fGc5jBgJtNlYs0nm6mwipZsLC7wjN1pjqzIDkKx
         1GrVz0RL9z0k4YCV2F2PUyrx5W9HA54c0EQEPCUpQ2jJfRFquA9eBXzhAa2RcBvbwV1W
         9RjHrjpbw7gZffXmnP/T5rm+4kTqBOZa7cmyOfay4QjaOCyHqLidhLj8kkIKf2AcQlCp
         +U7tLDXtXiK+iv0BJgamQx6vWZprm3zYzbcTm7Nh2/8eOjpQ3V1f/KuXO2SsISfBJPLP
         bmfw==
X-Forwarded-Encrypted: i=1; AFNElJ/gKOdz9cLaFA/0ibIiwpMmw9FrUzShRL0tqHOz5LMiPMLKsiBID+Ktyv4/WDkcAkGrGxBbCsCeSoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzAWYvu8kAo4L7JOKTju4RIog6P37IQKV9VeXoENdGtbosnrqI
	6oj5GOW3N2K5p4RpH49UGLe9qFRxNJVJNn4oW9dMoZdT6tc+DNbpyR442F6fF/uU/g==
X-Gm-Gg: Acq92OE9d39AzNsPNZBjLXRAHGsvikC6MydOzIBcTrjfWZiMI1g1aaxFlSuw3aXYEN3
	657r1mKFuhYI9q2IFbVJzjZd9lz32QmeT/SaBy4X0trux1KLCiDFxZCBhY4z4aUelBdEu5UbL7/
	X3POnTN9UV7tLJCbDPFAgvSmP8WJi68eGLPzQNoDZtVNhIH1LaM6HFa0y/mc9DHe24J0a8kd9Hb
	SzjRPHO9Ii/EaZrbL1wzhpqRiXFweTkR/voKjTsSr+WwD9X50cBd4/Lvr8IPJ5ZI6KTspWAt5YW
	bwsHxTmLhruLB8AUK8y3PdwTuiBfsC4G7+3a/znu6nPvVG6MPS15AFB8ailkeQCHdLxAlSosRp4
	UWaGRUfImPF8IIHU4x7kIFX+SVVuarBpQfeUuAYePGn0UijtOAcqZnOLbKSgVtb1SwZsdejZJPg
	l+aycRwvVdxyDHGCFN5IGWPzjlgqzj3i+AjV3zBuW4VUURxQiIo9h4pK7aoNWdSXS51A==
X-Received: by 2002:a05:7022:41a4:b0:136:e639:9c17 with SMTP id a92af1059eb24-137d42615b3mr6583398c88.23.1780397776746;
        Tue, 02 Jun 2026 03:56:16 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b36c6700sm8875678c88.6.2026.06.02.03.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:56:15 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yury Murashka <yurypm@arista.com>
Subject: [PATCH 2/2] PCI: Add pci=nodpc kernel boot option
Date: Tue,  2 Jun 2026 10:55:58 +0000
Message-ID: <20260602105558.1799563-3-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260602105558.1799563-1-yurypm@arista.com>
References: <20260602105558.1799563-1-yurypm@arista.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI DPC (Downstream Port Containment) support can be advertised by PCIe
devices, but it might not be fully supported in the firmware. On large
modular systems with a complex PCIe tree, enabling DPC could cause
unexpected behavior and side effects. Sometimes it would be nice to have
the option to keep the system in an unmodified state and be able to
handle PCIe errors from userspace.

Add pci=nodpc kernel boot option to disable PCI DPC. When this option
is set, DPC initialization, state save/restore, and recovery are all
skipped.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 drivers/pci/pci.c                               |  2 ++
 drivers/pci/pci.h                               |  2 ++
 drivers/pci/pcie/dpc.c                          | 16 +++++++++++++---
 4 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cfec12d37677..46a993c26dc0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5065,6 +5065,9 @@ Kernel parameters
 				through ports 0xC000-0xCFFF).
 				See http://wiki.osdev.org/PCI for more info
 				on the configuration access mechanisms.
+		nodpc		[PCIE] If the PCIE_DPC kernel config parameter is
+				enabled, this kernel boot option can be used to
+				disable the use of PCIE DPC.
 		noaer		[PCIE] If the PCIEAER kernel config parameter is
 				enabled, this kernel boot option can be used to
 				disable the use of PCIE advanced error reporting.
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 1f71f9c773c4..2882c7bbb358 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6723,6 +6723,8 @@ static int __init pci_setup(char *str)
 			} else if (!strncmp(str, "noats", 5)) {
 				pr_info("PCIe: ATS is disabled\n");
 				pcie_ats_disabled = true;
+			} else if (!strcmp(str, "nodpc")) {
+				pci_no_dpc();
 			} else if (!strcmp(str, "noaer")) {
 				pci_no_aer();
 			} else if (!strcmp(str, "noaer_recovery")) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 7a79df0ae712..1b6f17dddf21 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -887,6 +887,7 @@ struct rcec_ea {
 #endif
 
 #ifdef CONFIG_PCIE_DPC
+void pci_no_dpc(void);
 void pci_save_dpc_state(struct pci_dev *dev);
 void pci_restore_dpc_state(struct pci_dev *dev);
 void pci_dpc_init(struct pci_dev *pdev);
@@ -895,6 +896,7 @@ pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
 unsigned int dpc_tlp_log_len(struct pci_dev *dev);
 #else
+static inline void pci_no_dpc(void) { }
 static inline void pci_save_dpc_state(struct pci_dev *dev) { }
 static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
 static inline void pci_dpc_init(struct pci_dev *pdev) { }
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b779bd1d861..10d1a0e026d7 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -43,12 +43,19 @@ static const char * const rp_pio_error_string[] = {
 	"Memory Request Completion Timeout",		 /* Bit Position 18 */
 };
 
+static int pcie_dpc_disable;
+
+void pci_no_dpc(void)
+{
+	pcie_dpc_disable = 1;
+}
+
 void pci_save_dpc_state(struct pci_dev *dev)
 {
 	struct pci_cap_saved_state *save_state;
 	u16 *cap;
 
-	if (!pci_is_pcie(dev))
+	if (pcie_dpc_disable || !pci_is_pcie(dev))
 		return;
 
 	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_DPC);
@@ -64,7 +71,7 @@ void pci_restore_dpc_state(struct pci_dev *dev)
 	struct pci_cap_saved_state *save_state;
 	u16 *cap;
 
-	if (!pci_is_pcie(dev))
+	if (pcie_dpc_disable || !pci_is_pcie(dev))
 		return;
 
 	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_DPC);
@@ -104,7 +111,7 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 {
 	struct pci_host_bridge *host;
 
-	if (!pdev->dpc_cap)
+	if (pcie_dpc_disable || !pdev->dpc_cap)
 		return false;
 
 	/*
@@ -404,6 +411,9 @@ void pci_dpc_init(struct pci_dev *pdev)
 {
 	u16 cap;
 
+	if (pcie_dpc_disable)
+		return;
+
 	pdev->dpc_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_DPC);
 	if (!pdev->dpc_cap)
 		return;
-- 
2.51.0

