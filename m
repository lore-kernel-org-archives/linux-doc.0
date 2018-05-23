Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A4067D085
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 18:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933914AbeEWR6z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 13:58:55 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:39216 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933869AbeEWR6u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 13:58:50 -0400
Received: by mail-pl0-f66.google.com with SMTP id c19-v6so13481896pls.6
        for <linux-doc@vger.kernel.org>; Wed, 23 May 2018 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lGeDCO5KZ5HItt68m3W4CPfVPF88mA0i3ujcMAiFAH4=;
        b=S5vR2tXAlQ7wefnc3Mvnghw8BBzWzuZLDuTY4FSrhDcvR6PAb4tJipuBF9fcPQE+Nx
         oHDo35Gv4KQaqMvwsyuwG4z+qFVXEIOCbUu1TxIOGrDlUhX9VrB71+Vzf0im6ExIBr/Y
         loUuKBKsqCc0abQZyIHYszx+X0WczciTyHTmvwoKEAIYGRetRSnFLXHXe+5CQCO5Lc6E
         QhxpwgM/JgHcTW7X+abOOo6slGHZyhJqK6rRBzNU+rZn4Nmx7PiNJWUhf+JfZxG5gVk8
         o/wWnP3P6dWTmdYNFkz7Otv4ycnhGw9I349jMU5WmsvW1y43Af10kZtkaVOmoXLBeqJY
         Nvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lGeDCO5KZ5HItt68m3W4CPfVPF88mA0i3ujcMAiFAH4=;
        b=j1tsgNtY7co9/7LuMst5K5tlvFP4QGpYuEslaiu3jeRB/OEqzvURBQHj+w7AfA2pOf
         SzXIS4F3qGDXPwgXZ6Pq9wKi5kO/5FNb1btI5PpwFpq9pVaZoNvtwe82LO14vpCbL+SM
         iGgjljwr+mTmGsbZypFt1YmDXTmK/WGvdQiwJUjXWhvc9LiqEDSdEQA9irt8ZiiMeZGU
         VJyLhqHmpWmrTDSwWfGOj9Aummmx9mxaTA+qbxKWK7cACru9yWoEbAwbPOG7/MLs27MJ
         Jp/xn/yISKwG7zMMeuPx1jtOLRt6HJ8/yS3ix/ptgbTDtCx1HE8fcVU6KEIqONTPFiPV
         Fp+w==
X-Gm-Message-State: ALKqPweklH/Ep5bJZQksPiBYZkdfRCsGmnaeDFFDCYgf+X6ymWOm3F3Q
        vuqkWSXYpUYTMaqS7zXFf5Sogg==
X-Google-Smtp-Source: AB8JxZpANP7RRVLgE9Map1o+daOHFMLJQf8w7bGDmcbQM/YJK0CR6JK8FrlDveuA7A2vvFWsTO/u8g==
X-Received: by 2002:a17:902:6f16:: with SMTP id w22-v6mr3860123plk.216.1527098329768;
        Wed, 23 May 2018 10:58:49 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id k186-v6sm41433025pfc.142.2018.05.23.10.58.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 10:58:49 -0700 (PDT)
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
Subject: [PATCH v2 3/5] PCI/AER: Add sysfs attributes to provide breakdown of AERs
Date:   Wed, 23 May 2018 10:58:06 -0700
Message-Id: <20180523175808.28030-4-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <20180523175808.28030-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180523175808.28030-1-rajatja@google.com>
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
v2: Use tabs instead of spaces, fix the subject, and print
    all non zero counters.

 drivers/pci/pcie/aer/aerdrv.h          |  6 ++++++
 drivers/pci/pcie/aer/aerdrv_errprint.c |  6 ++++--
 drivers/pci/pcie/aer/aerdrv_stats.c    | 28 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

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
index 5555beffef2b..e47321b267f6 100644
--- a/drivers/pci/pcie/aer/aerdrv_stats.c
+++ b/drivers/pci/pcie/aer/aerdrv_stats.c
@@ -58,10 +58,38 @@ aer_stats_aggregate_attr(dev_total_cor_errs);
 aer_stats_aggregate_attr(dev_total_fatal_errs);
 aer_stats_aggregate_attr(dev_total_nonfatal_errs);
 
+#define aer_stats_breakdown_attr(field, stats_array, strings_array)	\
+	static ssize_t							\
+	field##_show(struct device *dev, struct device_attribute *attr,	\
+		     char *buf)						\
+{									\
+	unsigned int i;							\
+	char *str = buf;						\
+	struct pci_dev *pdev = to_pci_dev(dev);				\
+	u64 *stats = pdev->aer_stats->stats_array;			\
+	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
+		if (strings_array[i])					\
+			str += sprintf(str, "%s = 0x%llx\n",		\
+				       strings_array[i], stats[i]);	\
+		else if (stats[i])					\
+			str += sprintf(str, #stats_array "bit[%d] = 0x%llx\n",\
+				       i, stats[i]);			\
+	}								\
+	return str-buf;							\
+}									\
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
