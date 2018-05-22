Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ACCFD7DF8D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 22:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753365AbeEVW20 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 18:28:26 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:43100 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753359AbeEVW2Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 18:28:24 -0400
Received: by mail-pl0-f67.google.com with SMTP id c41-v6so11719959plj.10
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SRrivjhPDLWdNV30qpcVtjkn9lTsMaVb6ioXmX3jBo0=;
        b=YgGo/YTnjSddk02ucs49B1gWb4UU/NR5R9CA/Q1kyataQtxeOaYKvYDvfq28TD9uMr
         FUkqyaq+tNpnYjC9YUvrEiVG8DferPs+UiCQM1D7SKOomxLddMjHcakOdCClHXjuGQrS
         oIIq839YR+m/929tcKj5GA5H3e63EVFGR0gET3ToWgYOq1mNlCJDthLWVJxzPKibV1cx
         /Fc9spY5gNBIIg5JUMUv0I12Ivkrbrma2ijY3eCJk+72ne8H2pFbBKqvcKVQRjyDGduG
         PFMLnFJBKa7qkRmI0vCFzVMjOeVRTfwz2FXJrC2RzMnePLx5kdyQmoqN8jQxzwb167W6
         /qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SRrivjhPDLWdNV30qpcVtjkn9lTsMaVb6ioXmX3jBo0=;
        b=mE+kuOrye8AtMzcKs7GtLNcEyeIX+cEY0zXBnvrg91yq7oO+YSkeGDokdr+dwe8flO
         WTnRYqRzt1h/w73V0c2ivw0KnAeWAqcSG19MX7CN9+p89IIslASn9DkWfIGN3AbqoSCh
         1Ah1d8H0c7heqVYefaD69SxcHck2I65h6OWrZGFs7LS8AQcAIoHT4ZXYAroYeV4boXc5
         +JhuQWkKso/7iQKpf+BDDeOJVUdwiiW3+lTF6SGoIiyKC9Q3DwiACSJc7PonYZwb5DWI
         /LP8VR8U5iCx0y4BkDYoJxJC2E7d4ygGKgkq9KVv4XGoEcalJXw40Ih1DAaBNY1o8aNV
         7D4w==
X-Gm-Message-State: ALKqPwc3aMZrZqmDJ3kr6SVSTpJ8aQ69mkmSV5/jKr5EoVRLYj9lAHsk
        ixGvR+SJNFKRmDS0hy5ynbIoVw==
X-Google-Smtp-Source: AB8JxZpQ+sSHzqU5dhzLA6U9wKRe/3dc2WmZzYXrqAVDCEMj9tEBB/+oWxAVgnuQMvqrKRq4K+71eQ==
X-Received: by 2002:a17:902:868b:: with SMTP id g11-v6mr283866plo.305.1527028103688;
        Tue, 22 May 2018 15:28:23 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id b72-v6sm34327852pfm.69.2018.05.22.15.28.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 15:28:23 -0700 (PDT)
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
Cc:     rajatxjain@gmail.com, Rajat Jain <rajatj@google.com>
Subject: [PATCH 3/5] PCP/AER: Add sysfs attributes to provide breakdown of AERs
Date:   Tue, 22 May 2018 15:28:03 -0700
Message-Id: <20180522222805.80314-4-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <20180522222805.80314-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add sysfs attributes to provide breakdown of the AERs seen,
into different type of correctable or uncorrectable errors:

dev_breakdown_correctable
dev_breakdown_uncorrectable

Signed-off-by: Rajat Jain <rajatj@google.com>
---
 drivers/pci/pcie/aer/aerdrv.h          |  6 ++++++
 drivers/pci/pcie/aer/aerdrv_errprint.c |  6 ++++--
 drivers/pci/pcie/aer/aerdrv_stats.c    | 25 +++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer/aerdrv.h b/drivers/pci/pcie/aer/aerdrv.h
index b5d5ad6f2c03..048fbd7c9633 100644
--- a/drivers/pci/pcie/aer/aerdrv.h
+++ b/drivers/pci/pcie/aer/aerdrv.h
@@ -89,6 +89,12 @@ int pci_aer_stats_init(struct pci_dev *pdev);
 void pci_aer_stats_exit(struct pci_dev *pdev);
 void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info);
 
+extern const char
+*aer_correctable_error_string[AER_MAX_TYPEOF_CORRECTABLE_ERRS];
+
+extern const char
+*aer_uncorrectable_error_string[AER_MAX_TYPEOF_UNCORRECTABLE_ERRS];
+
 #ifdef CONFIG_ACPI_APEI
 int pcie_aer_get_firmware_first(struct pci_dev *pci_dev);
 #else
diff --git a/drivers/pci/pcie/aer/aerdrv_errprint.c b/drivers/pci/pcie/aer/aerdrv_errprint.c
index 5e8b98deda08..5585f309f1a8 100644
--- a/drivers/pci/pcie/aer/aerdrv_errprint.c
+++ b/drivers/pci/pcie/aer/aerdrv_errprint.c
@@ -68,7 +68,8 @@ static const char *aer_error_layer[] = {
 	"Transaction Layer"
 };
 
-static const char *aer_correctable_error_string[] = {
+const char
+*aer_correctable_error_string[AER_MAX_TYPEOF_CORRECTABLE_ERRS] = {
 	"Receiver Error",		/* Bit Position 0	*/
 	NULL,
 	NULL,
@@ -87,7 +88,8 @@ static const char *aer_correctable_error_string[] = {
 	"Header Log Overflow",		/* Bit Position 15	*/
 };
 
-static const char *aer_uncorrectable_error_string[] = {
+const char
+*aer_uncorrectable_error_string[AER_MAX_TYPEOF_UNCORRECTABLE_ERRS] = {
 	"Undefined",			/* Bit Position 0	*/
 	NULL,
 	NULL,
diff --git a/drivers/pci/pcie/aer/aerdrv_stats.c b/drivers/pci/pcie/aer/aerdrv_stats.c
index 87b7119d0a86..5f0a6e144f56 100644
--- a/drivers/pci/pcie/aer/aerdrv_stats.c
+++ b/drivers/pci/pcie/aer/aerdrv_stats.c
@@ -61,10 +61,35 @@ aer_stats_aggregate_attr(dev_total_cor_errs);
 aer_stats_aggregate_attr(dev_total_fatal_errs);
 aer_stats_aggregate_attr(dev_total_nonfatal_errs);
 
+#define aer_stats_breakdown_attr(field, stats_array, strings_array)            \
+	static ssize_t                                                         \
+	field##_show(struct device *dev, struct device_attribute *attr,        \
+		     char *buf)                                                \
+{                                                                              \
+	unsigned int i;                                                        \
+	char *str = buf;                                                       \
+	struct pci_dev *pdev = to_pci_dev(dev);                                \
+	u64 *stats = pdev->aer_stats->stats_array;                             \
+	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {                      \
+		if (strings_array[i])                                          \
+			str += sprintf(str, "%s = 0x%llx\n",                   \
+				       strings_array[i], stats[i]);            \
+	}                                                                      \
+	return str-buf;                                                        \
+}                                                                              \
+static DEVICE_ATTR_RO(field)
+
+aer_stats_breakdown_attr(dev_breakdown_correctable, dev_cor_errs,
+			 aer_correctable_error_string);
+aer_stats_breakdown_attr(dev_breakdown_uncorrectable, dev_uncor_errs,
+			 aer_uncorrectable_error_string);
+
 static struct attribute *aer_stats_attrs[] __ro_after_init = {
 	&dev_attr_dev_total_cor_errs.attr,
 	&dev_attr_dev_total_fatal_errs.attr,
 	&dev_attr_dev_total_nonfatal_errs.attr,
+	&dev_attr_dev_breakdown_correctable.attr,
+	&dev_attr_dev_breakdown_uncorrectable.attr,
 	NULL
 };
 
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
