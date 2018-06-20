Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 543607D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 23:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932495AbeFTX2s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 19:28:48 -0400
Received: from mail-qt0-f201.google.com ([209.85.216.201]:40099 "EHLO
        mail-qt0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932259AbeFTX2r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 19:28:47 -0400
Received: by mail-qt0-f201.google.com with SMTP id o10-v6so1000852qtm.7
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=u8Eu1raoFYSi1mefLPdJVHwPXjJ7GUxfNj1jxRHm+9E=;
        b=CDs7/xQjNlHong6n3RvPWhfGvliWsFBA6EHjwqIxjBB/+cQPrhxn1QBU8LyD82EcEz
         wZ2nY7vo1UAVaH3StMPJcbK7f2DEj9EIFqDivecH5GDmF6IuKtVnJ2gDMg3TjGUqFl/L
         O1G+QjZQe3BEsKjyEQCmSdiiCtpHJA+jgumpJUbue2wJ77pKhR1rb3ds6LVHQZEE1Z2b
         RkHb14wNKsdOB9XlUBgAV7WoUG6GfWu/oV3Od741IwYbEBcRmD9KvckPI+8NtANTkPxk
         Jf9XJhVlYx6/WJKY1/xqsoPaMee0f8qaUR0yaOsXvSjjcpOD4q0G68YRoEIQTctq2r3b
         9fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=u8Eu1raoFYSi1mefLPdJVHwPXjJ7GUxfNj1jxRHm+9E=;
        b=nqj+YMYCy+0o1L0oELE0owGxP30OUDymRDdxZYgP/RWOG2IV1m2vQd/fisx7/Blrag
         fTGlNxT1d8t4t2VrqTT4t8Z78U+YGT9we+gcI1RTElvQsNAVxtlJ7alXpugpBhOjjyBY
         gKGsNSHNU341Cm+PgdonnwXhV352rWd39d9gEf4U8P7zwaUC7Fg0e4h+IfE6SKqE3BZO
         wV+zldJ1juYMZ7qZUDh7kYqh+rotUfqRO0FVFDFO+e0eG/JX/yqikefcpBn2F/bKs1+N
         YsqdpvSzLxtIWIEGrJaM1WZgFgI0DwOEwaPOH8u891djUZ8pqelqIfpjp3fkgLz6hVpX
         TQ3w==
X-Gm-Message-State: APt69E0s1TPpAu3TE7T8kHmswc9RMNihQ/a3C1TWV5NRlN4EY/8Ms3h6
        odVgzDz32ReHM5mRV5513xOJb6xhWTt8
X-Google-Smtp-Source: ADUXVKLvlILBxmQWOWoQgEvzdx/yHwXFDb3ZWbaP/xLusxEUCSshlf5l2dXRSf9Ge+Yta2IWJPBojqnfb2q/
MIME-Version: 1.0
X-Received: by 2002:a37:ac0e:: with SMTP id e14-v6mr12463274qkm.22.1529537326348;
 Wed, 20 Jun 2018 16:28:46 -0700 (PDT)
Date:   Wed, 20 Jun 2018 16:28:37 -0700
In-Reply-To: <20180522222805.80314-1-rajatja@google.com>
Message-Id: <20180620232841.43922-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
Subject: [PATCH v4 1/5] PCI/AER: Define and allocate aer_stats structure for
 AER capable devices
From:   Rajat Jain <rajatja@google.com>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>, rajatxjain@gmail.com,
        helgaas@kernel.org
Cc:     Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Define a structure to hold the AER statistics. There are 2 groups
of statistics: dev_* counters that are to be collected for all AER
capable devices and rootport_* counters that are collected for all
(AER capable) rootports only. Allocate and free this structure when
device is added or released (thus counters survive the lifetime of the
device).

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: Same as v3
v3: Merge everything in aer.c

 drivers/pci/pcie/aer.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/probe.c    |  1 +
 include/linux/pci.h    |  3 +++
 3 files changed, 64 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a2e88386af28..f9fa994b6c33 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -33,6 +33,9 @@
 #define AER_ERROR_SOURCES_MAX		100
 #define AER_MAX_MULTI_ERR_DEVICES	5	/* Not likely to have more */
 
+#define AER_MAX_TYPEOF_CORRECTABLE_ERRS 16	/* as per PCI_ERR_COR_STATUS */
+#define AER_MAX_TYPEOF_UNCORRECTABLE_ERRS 26	/* as per PCI_ERR_UNCOR_STATUS*/
+
 struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
@@ -76,6 +79,40 @@ struct aer_rpc {
 					 */
 };
 
+/* AER stats for the device */
+struct aer_stats {
+
+	/*
+	 * Fields for all AER capable devices. They indicate the errors
+	 * "as seen by this device". Note that this may mean that if an
+	 * end point is causing problems, the AER counters may increment
+	 * at its link partner (e.g. root port) because the errors will be
+	 * "seen" by the link partner and not the the problematic end point
+	 * itself (which may report all counters as 0 as it never saw any
+	 * problems).
+	 */
+	/* Individual counters for different type of correctable errors */
+	u64 dev_cor_errs[AER_MAX_TYPEOF_CORRECTABLE_ERRS];
+	/* Individual counters for different type of uncorrectable errors */
+	u64 dev_uncor_errs[AER_MAX_TYPEOF_UNCORRECTABLE_ERRS];
+	/* Total number of correctable errors seen by this device */
+	u64 dev_total_cor_errs;
+	/* Total number of fatal uncorrectable errors seen by this device */
+	u64 dev_total_fatal_errs;
+	/* Total number of fatal uncorrectable errors seen by this device */
+	u64 dev_total_nonfatal_errs;
+
+	/*
+	 * Fields for Root ports only, these indicate the total number of
+	 * ERR_COR, ERR_FATAL, and ERR_NONFATAL messages received by the
+	 * rootport, INCLUDING the ones that are generated internally (by
+	 * the rootport itself)
+	 */
+	u64 rootport_total_cor_errs;
+	u64 rootport_total_fatal_errs;
+	u64 rootport_total_nonfatal_errs;
+};
+
 #define AER_LOG_TLP_MASKS		(PCI_ERR_UNC_POISON_TLP|	\
 					PCI_ERR_UNC_ECRC|		\
 					PCI_ERR_UNC_UNSUP|		\
@@ -402,12 +439,35 @@ int pci_cleanup_aer_error_status_regs(struct pci_dev *dev)
 	return 0;
 }
 
+static int pci_aer_stats_init(struct pci_dev *pdev)
+{
+	pdev->aer_stats = kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
+	if (!pdev->aer_stats) {
+		dev_err(&pdev->dev, "No memory for aer_stats\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+static void pci_aer_stats_exit(struct pci_dev *pdev)
+{
+	kfree(pdev->aer_stats);
+	pdev->aer_stats = NULL;
+}
+
 int pci_aer_init(struct pci_dev *dev)
 {
 	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
+	if (!dev->aer_cap || pci_aer_stats_init(dev))
+		return -EIO;
 	return pci_cleanup_aer_error_status_regs(dev);
 }
 
+void pci_aer_exit(struct pci_dev *dev)
+{
+	pci_aer_stats_exit(dev);
+}
+
 #define AER_AGENT_RECEIVER		0
 #define AER_AGENT_REQUESTER		1
 #define AER_AGENT_COMPLETER		2
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index ac876e32de4b..48edd0c9e4bc 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2064,6 +2064,7 @@ static void pci_configure_device(struct pci_dev *dev)
 
 static void pci_release_capabilities(struct pci_dev *dev)
 {
+	pci_aer_exit(dev);
 	pci_vpd_release(dev);
 	pci_iov_release(dev);
 	pci_free_cap_save_buffers(dev);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 340029b2fb38..8d59c6c19a19 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -299,6 +299,7 @@ struct pci_dev {
 	u8		hdr_type;	/* PCI header type (`multi' flag masked out) */
 #ifdef CONFIG_PCIEAER
 	u16		aer_cap;	/* AER capability offset */
+	struct aer_stats *aer_stats;	/* AER stats for this device */
 #endif
 	u8		pcie_cap;	/* PCIe capability offset */
 	u8		msi_cap;	/* MSI capability offset */
@@ -1471,10 +1472,12 @@ static inline bool pcie_aspm_support_enabled(void) { return false; }
 void pci_no_aer(void);
 bool pci_aer_available(void);
 int pci_aer_init(struct pci_dev *dev);
+void pci_aer_exit(struct pci_dev *dev);
 #else
 static inline void pci_no_aer(void) { }
 static inline bool pci_aer_available(void) { return false; }
 static inline int pci_aer_init(struct pci_dev *d) { return -ENODEV; }
+static inline void pci_aer_exit(struct pci_dev *d) { }
 #endif
 
 #ifdef CONFIG_PCIE_ECRC
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
