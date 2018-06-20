Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 934567D09E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 01:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754030AbeFTBM1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 21:12:27 -0400
Received: from mail-qt0-f201.google.com ([209.85.216.201]:40058 "EHLO
        mail-qt0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753765AbeFTBMU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 21:12:20 -0400
Received: by mail-qt0-f201.google.com with SMTP id o10-v6so1350840qtm.7
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 18:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=RK6ATGESWnFl890Gleu1SQUKuxXTcyn7OVQIB2xUMTY=;
        b=Qp+6iAi1SwAnew1/Hy4n1LU5kdqlJHskjpz+7bBJSBXb+y6Q+8udPAikuyLKnnGyBQ
         NVgGZ3/zeSUY0rixV2CxKeLKszkAPQGNnUUbc4kYj9WVyQSEWzYJTyUnkz5spcWOyWCX
         X7anACled8Ym9xlmqbzS4odPq61a0M9R3vH9IYgjwes1KQK/TVpXEOnDWltqpVjmphVq
         1aCdJGbjWekF0yOE9uI593Bri0YMnZiZlppfFBpsrJ2Pkh2MEaI80wBWNaCJRHS8kvWD
         VeA57Ajo3fPCtbCye56i4CksZY8MJZ01jjTUZg/+7kom6M28JBClUt2Kz7+Jny/oLcZs
         hH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=RK6ATGESWnFl890Gleu1SQUKuxXTcyn7OVQIB2xUMTY=;
        b=ewxrTSbSlpHYw0gVWhNdhK+3zzENwSdvJ8WL1foXDxmMYsqg9vJwlQBVk4PZw9wDX9
         ktYrg8hKtPm46eWujrfQFajn1fyjL1Y6M5cTyHQ9eAhpAg0vkHt26mgTk6TGIKxbBjfK
         heB682zUfN27JollcIDodnD+rorEd/PxPZhUstzkpthjbMpRyWvEduYuL0Xp86kJthlq
         TupVRdBksH8MWPTmhuADwuSUijVH9BJPYmS2mRVqTsQ29MSG7EjJPyZvp5L/pnzKYmWm
         O7vDLSnAV1/KVEya5/UdqrbFGX/VEQY9HctDGevY3lY7Otc5mq9Pnr/MlkJYIl0V4eFU
         A/AQ==
X-Gm-Message-State: APt69E1cgh1MVroyDB0IjrkmOpQcYDQYpPF95KsDDsFm3aGW34v81sVh
        4/+SxASFq4tT2L0qV3je+AArOkqZJd0Y
X-Google-Smtp-Source: ADUXVKKO/83391Kxv7pZWXpULr38eQHVsSQ5TsLY2pAve8Zuli4d6Yxhj9J1lC4wNrb97p3gFx0vod2nB5Y7
MIME-Version: 1.0
X-Received: by 2002:a0c:d4cf:: with SMTP id y15-v6mr10231381qvh.16.1529457139450;
 Tue, 19 Jun 2018 18:12:19 -0700 (PDT)
Date:   Tue, 19 Jun 2018 18:12:07 -0700
In-Reply-To: <20180620011210.254601-1-rajatja@google.com>
Message-Id: <20180620011210.254601-2-rajatja@google.com>
References: <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com> <20180620011210.254601-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
Subject: [PATCH v3 2/5] PCI/AER: Add sysfs stats for AER capable devices
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

Add the following AER sysfs stats to represent the counters for each
kind of error as seen by the device:

dev_total_cor_errs
dev_total_fatal_errs
dev_total_nonfatal_errs

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Merge everything in aer.c, use "%llu" in place of "%llx"

 drivers/pci/pci-sysfs.c |  3 ++
 drivers/pci/pci.h       |  4 ++-
 drivers/pci/pcie/aer.c  | 74 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 0c4653c1d2ce..9f1cb9051d7d 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1746,6 +1746,9 @@ static const struct attribute_group *pci_dev_attr_groups[] = {
 #endif
 	&pci_bridge_attr_group,
 	&pcie_dev_attr_group,
+#ifdef CONFIG_PCIEAER
+	&aer_stats_attr_group,
+#endif
 	NULL,
 };
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index c358e7a07f3f..9a28ec600225 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -181,7 +181,9 @@ extern const struct attribute_group *pci_dev_groups[];
 extern const struct attribute_group *pcibus_groups[];
 extern const struct device_type pci_dev_type;
 extern const struct attribute_group *pci_bus_groups[];
-
+#ifdef CONFIG_PCIEAER
+extern const struct attribute_group aer_stats_attr_group;
+#endif
 
 /**
  * pci_match_one_device - Tell if a PCI device structure has a matching
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f9fa994b6c33..ce0d675d7bd3 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -573,6 +573,79 @@ static const char *aer_agent_string[] = {
 	"Transmitter ID"
 };
 
+#define aer_stats_aggregate_attr(field)					\
+	static ssize_t							\
+	field##_show(struct device *dev, struct device_attribute *attr,	\
+		     char *buf)						\
+{									\
+	struct pci_dev *pdev = to_pci_dev(dev);				\
+	return sprintf(buf, "%llu\n", pdev->aer_stats->field);		\
+}									\
+static DEVICE_ATTR_RO(field)
+
+aer_stats_aggregate_attr(dev_total_cor_errs);
+aer_stats_aggregate_attr(dev_total_fatal_errs);
+aer_stats_aggregate_attr(dev_total_nonfatal_errs);
+
+static struct attribute *aer_stats_attrs[] __ro_after_init = {
+	&dev_attr_dev_total_cor_errs.attr,
+	&dev_attr_dev_total_fatal_errs.attr,
+	&dev_attr_dev_total_nonfatal_errs.attr,
+	NULL
+};
+
+static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
+					   struct attribute *a, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	if (!pdev->aer_stats)
+		return 0;
+
+	return a->mode;
+}
+
+const struct attribute_group aer_stats_attr_group = {
+	.name  = "aer_stats",
+	.attrs  = aer_stats_attrs,
+	.is_visible = aer_stats_attrs_are_visible,
+};
+
+static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
+				   struct aer_err_info *info)
+{
+	int status, i, max = -1;
+	u64 *counter = NULL;
+	struct aer_stats *aer_stats = pdev->aer_stats;
+
+	if (!aer_stats)
+		return;
+
+	switch (info->severity) {
+	case AER_CORRECTABLE:
+		aer_stats->dev_total_cor_errs++;
+		counter = &aer_stats->dev_cor_errs[0];
+		max = AER_MAX_TYPEOF_CORRECTABLE_ERRS;
+		break;
+	case AER_NONFATAL:
+		aer_stats->dev_total_nonfatal_errs++;
+		counter = &aer_stats->dev_uncor_errs[0];
+		max = AER_MAX_TYPEOF_UNCORRECTABLE_ERRS;
+		break;
+	case AER_FATAL:
+		aer_stats->dev_total_fatal_errs++;
+		counter = &aer_stats->dev_uncor_errs[0];
+		max = AER_MAX_TYPEOF_UNCORRECTABLE_ERRS;
+		break;
+	}
+
+	status = (info->status & ~info->mask);
+	for (i = 0; i < max; i++)
+		if (status & (1 << i))
+			counter[i]++;
+}
+
 static void __print_tlp_header(struct pci_dev *dev,
 			       struct aer_header_log_regs *t)
 {
@@ -605,6 +678,7 @@ static void __aer_print_error(struct pci_dev *dev,
 			pci_err(dev, "   [%2d] Unknown Error Bit%s\n",
 				i, info->first_error == i ? " (First)" : "");
 	}
+	pci_dev_aer_stats_incr(dev, info);
 }
 
 static void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
