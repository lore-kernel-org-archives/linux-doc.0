Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E927E7D085
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 18:00:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932975AbeEWSAG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 14:00:06 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:42874 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933879AbeEWR6w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 13:58:52 -0400
Received: by mail-pl0-f68.google.com with SMTP id u6-v6so13478411pls.9
        for <linux-doc@vger.kernel.org>; Wed, 23 May 2018 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rRJmxrzXnUxJl5YE/ieiOxX3vdnvlw4/Cw16gBRP6I0=;
        b=f5WpiZnjE2Z0ZdMKxx/JMooxieg6CgiFpCXUpYMqRul2gSz+T0stNdzzGG9WV6qfi/
         Yg0NKY1ZY56TIV5yNKB2dMbr9BtATvhEA9e27ZFsqMvIhnaNkyW0kmSPiMR4PLrLpOgL
         dPdcobj0J73n02ClCCFGlsi+FoI18rzI0UK5un24y2NNKWZxQ6r+YsXZLHS2/exLbC81
         bxcExxZd6v7vbF73xcKyqleMAQItLshG/qkroF9ZnW+PK4X7DZpHotBqkrzI6yTA83ZM
         PdGizY2n2qS/PHIp5rl23CkUgobdqqsWHldhTPQ3PdHREwGT4sub6dTgJiFLV3JKoXaG
         ZOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rRJmxrzXnUxJl5YE/ieiOxX3vdnvlw4/Cw16gBRP6I0=;
        b=OXohDN0+z/UJPGOBn/qB/v/Dr9FJXxoPZzPStyEoLIFVkfb0ywZAol4sgvHyw6DRhg
         ijqvrJHZb0SDar3R6bdC5buTosqnCiBU2yZ/sGadIHDIHGqyqx7Jw9EaMIhL+YmDeFzD
         P9J25PxW10bSststDQ53SvQCKlZpo3HP3sRUn5o7S3YtfZv4mFt1Vq3ihC0f34IYUWKN
         RYdbbR/++J9JmCujyGDaen+dOBHLudEpXm5p8BLOHXJ0XGKcHElcmP0szhG35suRGCZk
         w/v541L5k4I3G3bYAqV+InizqYvKb03FbS/klzjSRzabEvc/A6NAzwy1CYQvxq65E7ti
         ya9g==
X-Gm-Message-State: ALKqPwfjz/9YnhR2ZTLAPvcCvjYwCeBjiFYRBr0OlRlVbX03TwLqzX/z
        6rJaH2rLJGZQizbf1vHDyJWL/w==
X-Google-Smtp-Source: AB8JxZoJ0vsBkwR20eATk59eL6A+UeO5JRaGh5s88NT4oUzdax+soTzsJ9gthppCwZ9EpSbOnQy1vw==
X-Received: by 2002:a17:902:28a7:: with SMTP id f36-v6mr3890374plb.155.1527098331982;
        Wed, 23 May 2018 10:58:51 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id k186-v6sm41433025pfc.142.2018.05.23.10.58.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 10:58:51 -0700 (PDT)
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
Subject: [PATCH v2 4/5] PCI/AER: Add sysfs attributes for rootport cumulative stats
Date:   Wed, 23 May 2018 10:58:07 -0700
Message-Id: <20180523175808.28030-5-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <20180523175808.28030-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180523175808.28030-1-rajatja@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add sysfs attributes for rootport statistics (that are cumulative
of all the ERR_* messages seen on this PCI hierarchy).

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v2: same as v1

 drivers/pci/pcie/aer/aerdrv.h       |  2 ++
 drivers/pci/pcie/aer/aerdrv_core.c  |  2 ++
 drivers/pci/pcie/aer/aerdrv_stats.c | 31 +++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/pci/pcie/aer/aerdrv.h b/drivers/pci/pcie/aer/aerdrv.h
index 048fbd7c9633..77d8355551d9 100644
--- a/drivers/pci/pcie/aer/aerdrv.h
+++ b/drivers/pci/pcie/aer/aerdrv.h
@@ -88,6 +88,8 @@ irqreturn_t aer_irq(int irq, void *context);
 int pci_aer_stats_init(struct pci_dev *pdev);
 void pci_aer_stats_exit(struct pci_dev *pdev);
 void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info);
+void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
+				 struct aer_err_source *e_src);
 
 extern const char
 *aer_correctable_error_string[AER_MAX_TYPEOF_CORRECTABLE_ERRS];
diff --git a/drivers/pci/pcie/aer/aerdrv_core.c b/drivers/pci/pcie/aer/aerdrv_core.c
index 42a6f913069a..0f70e22563f3 100644
--- a/drivers/pci/pcie/aer/aerdrv_core.c
+++ b/drivers/pci/pcie/aer/aerdrv_core.c
@@ -424,6 +424,8 @@ static void aer_isr_one_error(struct pcie_device *p_device,
 	struct aer_rpc *rpc = get_service_data(p_device);
 	struct aer_err_info *e_info = &rpc->e_info;
 
+	pci_rootport_aer_stats_incr(p_device->port, e_src);
+
 	/*
 	 * There is a possibility that both correctable error and
 	 * uncorrectable error being logged. Report correctable error first.
diff --git a/drivers/pci/pcie/aer/aerdrv_stats.c b/drivers/pci/pcie/aer/aerdrv_stats.c
index e47321b267f6..898c9bc02ec2 100644
--- a/drivers/pci/pcie/aer/aerdrv_stats.c
+++ b/drivers/pci/pcie/aer/aerdrv_stats.c
@@ -57,6 +57,9 @@ static DEVICE_ATTR_RO(field)
 aer_stats_aggregate_attr(dev_total_cor_errs);
 aer_stats_aggregate_attr(dev_total_fatal_errs);
 aer_stats_aggregate_attr(dev_total_nonfatal_errs);
+aer_stats_aggregate_attr(rootport_total_cor_errs);
+aer_stats_aggregate_attr(rootport_total_fatal_errs);
+aer_stats_aggregate_attr(rootport_total_nonfatal_errs);
 
 #define aer_stats_breakdown_attr(field, stats_array, strings_array)	\
 	static ssize_t							\
@@ -90,6 +93,9 @@ static struct attribute *aer_stats_attrs[] __ro_after_init = {
 	&dev_attr_dev_total_nonfatal_errs.attr,
 	&dev_attr_dev_breakdown_correctable.attr,
 	&dev_attr_dev_breakdown_uncorrectable.attr,
+	&dev_attr_rootport_total_cor_errs.attr,
+	&dev_attr_rootport_total_fatal_errs.attr,
+	&dev_attr_rootport_total_nonfatal_errs.attr,
 	NULL
 };
 
@@ -102,6 +108,12 @@ static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
 	if (!pdev->aer_stats)
 		return 0;
 
+	if ((a == &dev_attr_rootport_total_cor_errs.attr ||
+	     a == &dev_attr_rootport_total_fatal_errs.attr ||
+	     a == &dev_attr_rootport_total_nonfatal_errs.attr) &&
+	    pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+		return 0;
+
 	return a->mode;
 }
 
@@ -144,6 +156,25 @@ void pci_dev_aer_stats_incr(struct pci_dev *pdev, struct aer_err_info *info)
 			counter[i]++;
 }
 
+void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
+				 struct aer_err_source *e_src)
+{
+	struct aer_stats *aer_stats = pdev->aer_stats;
+
+	if (!aer_stats)
+		return;
+
+	if (e_src->status & PCI_ERR_ROOT_COR_RCV)
+		aer_stats->rootport_total_cor_errs++;
+
+	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
+		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
+			aer_stats->rootport_total_fatal_errs++;
+		else
+			aer_stats->rootport_total_nonfatal_errs++;
+	}
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
