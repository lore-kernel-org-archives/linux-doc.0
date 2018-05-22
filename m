Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2EFF77DF8B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 22:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753373AbeEVW3f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 18:29:35 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:43095 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753302AbeEVW2V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 18:28:21 -0400
Received: by mail-pl0-f65.google.com with SMTP id c41-v6so11719896plj.10
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j+Rsawe7EvZIqu1XY2wxzv9FW18gg9BfkhvV81lOchs=;
        b=ci+A43JFRJY5ERdCO5HoT1pkItAoo1k4dDdY/V3QY82QP1uuisCNDGQ4AkatPw0TBR
         M1QrRiX9/XCyU1wjTyOu2kJaBNGEYWZgdjU0ExqLFxh0cE8vaqpYk0shXmhojJ2l7C7O
         1nVvJhbuD5oFG1oATFudXeZ6i4g+Y9Qf+dkzwjL2swQxgJhD5XiMGTEpa01lkXVqJ7Ek
         CkJJk45INu/O5guMI3R+MW9JP1kqF4UMYAuXq9m9Oqu1Gsreay5BONqG6lwfaK4StbGv
         QpdytJ09IcQetz0LBWDfRL7tPDBmsdcRtHZ6nqMci+wOBompMmXUeS89XDS+ghBJHvbS
         Xlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j+Rsawe7EvZIqu1XY2wxzv9FW18gg9BfkhvV81lOchs=;
        b=IVXvQXqt6mnC9Wo5Bl/eS5Zb9DwE8T+ko0h7SSWwPoSbXHH0MCmPRYLjbcSXVwVqvZ
         kV0JhH/YuQbFmDFGyl4T5oaiZvZ0FdYOUnPY/GiFyQcRlWIGsliVSY+xnTAStirDBmDl
         Vhr/IORzc5CL4dAvjR1rqrUmz4mMy4Duf0lUnepg30LAlbGlquwxX6ar7rRpF9K/VXaa
         t37maMA/6y4uYtPQWiNa1Y6Va6EGqpbwmk6Xj1IkrnQrvA/JWaIaissI9m+MIZN0G5we
         epTXY4Q5HE9HG8JLkBbctRb5Y3cN3almzBt/xGi55Lr3cm4R8pHzCQQN7tTAf5BYO64W
         5xTg==
X-Gm-Message-State: ALKqPwcgBa3DTYqWX2X++tY3pV4raZb5pitAA5yKQJHRxdTSLHd2znEn
        nZiyMf3XgdWoqHZpPMqYv1NP8g==
X-Google-Smtp-Source: AB8JxZopl3Ks3PvIfu31p+KTE3iYDm3ESrPMyeEkgYk4P5Wy4JiNOSD4w8lwuULdUGj16/rxk1Mj7w==
X-Received: by 2002:a17:902:42e4:: with SMTP id h91-v6mr302698pld.27.1527028100866;
        Tue, 22 May 2018 15:28:20 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id b72-v6sm34327852pfm.69.2018.05.22.15.28.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 15:28:20 -0700 (PDT)
From:   Rajat Jain <rajatja@google.com>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajat Jain <rajatja@google.com>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>
Cc:     rajatxjain@gmail.com
Subject: [PATCH 2/5] PCI/AER: Add sysfs stats for AER capable devices
Date:   Tue, 22 May 2018 15:28:02 -0700
Message-Id: <20180522222805.80314-3-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <20180522222805.80314-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
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
 drivers/pci/pci-sysfs.c                |  3 ++
 drivers/pci/pci.h                      |  4 +-
 drivers/pci/pcie/aer/aerdrv.h          |  1 +
 drivers/pci/pcie/aer/aerdrv_errprint.c |  1 +
 drivers/pci/pcie/aer/aerdrv_stats.c    | 72 ++++++++++++++++++++++++++
 5 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 366d93af051d..730f985a3dc9 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1743,6 +1743,9 @@ static const struct attribute_group *pci_dev_attr_groups[] = {
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
diff --git a/drivers/pci/pcie/aer/aerdrv.h b/drivers/pci/pcie/aer/aerdrv.h
index d8b9fba536ed..b5d5ad6f2c03 100644
--- a/drivers/pci/pcie/aer/aerdrv.h
+++ b/drivers/pci/pcie/aer/aerdrv.h
@@ -87,6 +87,7 @@ void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info);
 irqreturn_t aer_irq(int irq, void *context);
 int pci_aer_stats_init(struct pci_dev *pdev);
 void pci_aer_stats_exit(struct pci_dev *pdev);
+void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info);
 
 #ifdef CONFIG_ACPI_APEI
 int pcie_aer_get_firmware_first(struct pci_dev *pci_dev);
diff --git a/drivers/pci/pcie/aer/aerdrv_errprint.c b/drivers/pci/pcie/aer/aerdrv_errprint.c
index 21ca5e1b0ded..5e8b98deda08 100644
--- a/drivers/pci/pcie/aer/aerdrv_errprint.c
+++ b/drivers/pci/pcie/aer/aerdrv_errprint.c
@@ -155,6 +155,7 @@ static void __aer_print_error(struct pci_dev *dev,
 			pci_err(dev, "   [%2d] Unknown Error Bit%s\n",
 				i, info->first_error == i ? " (First)" : "");
 	}
+	pci_dev_aer_stats_incr(dev, info);
 }
 
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
diff --git a/drivers/pci/pcie/aer/aerdrv_stats.c b/drivers/pci/pcie/aer/aerdrv_stats.c
index b9f251992209..87b7119d0a86 100644
--- a/drivers/pci/pcie/aer/aerdrv_stats.c
+++ b/drivers/pci/pcie/aer/aerdrv_stats.c
@@ -47,6 +47,78 @@ struct aer_stats {
 	u64 rootport_total_nonfatal_errs;
 };
 
+#define aer_stats_aggregate_attr(field)                                        \
+	static ssize_t                                                         \
+	field##_show(struct device *dev, struct device_attribute *attr,        \
+		     char *buf)                                                \
+{                                                                              \
+	struct pci_dev *pdev = to_pci_dev(dev);                                \
+	return sprintf(buf, "0x%llx\n", pdev->aer_stats->field);               \
+}                                                                              \
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
+void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info)
+{
+	int status, i, max = -1;
+	u64 *counter = NULL;
+	struct aer_stats *aer_stats = pdev->aer_stats;
+
+	if (unlikely(!aer_stats))
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
 int pci_aer_stats_init(struct pci_dev *pdev)
 {
 	pdev->aer_stats = kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
