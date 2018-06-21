Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 639A27D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Jun 2018 23:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934001AbeFUXtK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Jun 2018 19:49:10 -0400
Received: from mail-qt0-f202.google.com ([209.85.216.202]:56002 "EHLO
        mail-qt0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933993AbeFUXtH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jun 2018 19:49:07 -0400
Received: by mail-qt0-f202.google.com with SMTP id f8-v6so3771072qtj.22
        for <linux-doc@vger.kernel.org>; Thu, 21 Jun 2018 16:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=FP6vlWD22ueiLKj5cfpoh1q4eTUNo7qrzg2b0HHX/Tk=;
        b=W3lndBPUvopXpwo8aytkZ6NySXbFosaW0jRdyDFDL6NiENMeCeYCNtep4Y9drK8OP/
         XbR1mzSL8rFyrHgkppRW0YidVoPnglks9N27vakRKySw3sMN5CCpNebLsCiiesfbDtqW
         Cv/M6oACFHYG0FXNyeau3lcZTWAud7L7xQ7bIlJH8/UT6l6QgF0ZSJTEBK+5L07UrFc7
         unOgv6fnsi88NO1vKE/3qOWOpB1fhD4c7aug+5gKPpM3hhE45VX1WMU36ZG+p9gsNjed
         YbGxpCGjxwkD6JTVwQNePS2FE5iCf1uiJPcLleFYxuKYBpIGGm7Wfnr7x3LVOTVVNyzJ
         H3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=FP6vlWD22ueiLKj5cfpoh1q4eTUNo7qrzg2b0HHX/Tk=;
        b=a0YtZeV0bD1ktUSOMGY7tbHYXq8KK0lsQtw5ceCC9NyoQU4di8MLmAm0BPdZCNS+xA
         9FcxzV2kE6i2uNVcpUkIdktjmKZ6q8u6XSOQcyoW80dhulFO5Npx1TO9qmY6Z/Dl1zvs
         DPSlnrjIdx1A4CrX9t4HIySA9fq/V23cP2U7qRlZqvYrb4/irRkGlyHmsfsHofrrD9iU
         tCY88rCiBWSrFMLMqEuJz6MXMPsrCWYgeskpJhmrUO0+nw6ni3fqhNmVq5wmpV8i+Ib9
         85ckIJQHq6mo8fe+3Wuh6VrlW7FMVGSCqTOGurZcBtM1/ZP9mISrniLUmpS0Dpg5Nut1
         xM9Q==
X-Gm-Message-State: APt69E0c9k+a8Ja5XPO7RP7dMyICiCZaZCWZ0wDPB33IwqeEOnecMK93
        6jsF/Mtbt3B1ZhzGEtzDZvCneHuU52qe
X-Google-Smtp-Source: ADUXVKKncRtOGsCMhol/zPJfyIwKiFca1Z9uULaqJ5UZKZWFKQ86AcHwsL1fI3mtJaRa0ogBgEYVCOsnkoVV
MIME-Version: 1.0
X-Received: by 2002:a0c:d2a2:: with SMTP id q31-v6mr14511751qvh.45.1529624946506;
 Thu, 21 Jun 2018 16:49:06 -0700 (PDT)
Date:   Thu, 21 Jun 2018 16:48:29 -0700
In-Reply-To: <20180621234829.224566-1-rajatja@google.com>
Message-Id: <20180621234829.224566-5-rajatja@google.com>
References: <20180621234829.224566-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
Subject: [PATCH 4/4] PCI/AER: Add sysfs attributes for rootport cumulative stats
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

Add sysfs attributes for rootport statistics (that are cumulative
of all the ERR_* messages seen on this PCI hierarchy).

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 .../testing/sysfs-bus-pci-devices-aer_stats   | 28 +++++++++++
 drivers/pci/pcie/aer.c                        | 47 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
index 7dd54bdf910b..3fec94c8e6e2 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
@@ -92,3 +92,31 @@ AtomicOp Egress Blocked 0
 TLP Prefix Blocked Error 0
 TOTAL_ERR_NONFATAL 0
 -------------------------------------------------------------------------
+
+============================
+PCIe Rootport AER statistics
+============================
+These attributes show up under only the rootports (or root complex event
+collectors) that are AER capable. These indicate the number of error messages as
+"reported to" the rootport. Please note that the rootports also transmit
+(internally) the ERR_* messages for errors seen by the internal rootport PCI
+device, so these counters includes them and are thus cumulative of all the error
+messages on the PCI hierarchy originating at that root port.
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/aer_rootport_total_err_cor
+Date:		July 2018
+Kernel Version: 4.19.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of ERR_COR messages reported to rootport.
+
+Where:	    /sys/bus/pci/devices/<dev>/aer_stats/aer_rootport_total_err_fatal
+Date:		July 2018
+Kernel Version: 4.19.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of ERR_FATAL messages reported to rootport.
+
+Where:	    /sys/bus/pci/devices/<dev>/aer_stats/aer_rootport_total_err_nonfatal
+Date:		July 2018
+Kernel Version: 4.19.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of ERR_NONFATAL messages reported to rootport.
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 15c6ae4b9754..6801cde534d5 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -597,10 +597,30 @@ aer_stats_dev_attr(aer_dev_nonfatal, dev_nonfatal_errs,
 		   aer_uncorrectable_error_string, "ERR_NONFATAL",
 		   dev_total_nonfatal_errs);
 
+#define aer_stats_rootport_attr(name, field)				\
+	static ssize_t							\
+	name##_show(struct device *dev, struct device_attribute *attr,	\
+		     char *buf)						\
+{									\
+	struct pci_dev *pdev = to_pci_dev(dev);				\
+	return sprintf(buf, "%llu\n", pdev->aer_stats->field);		\
+}									\
+static DEVICE_ATTR_RO(name)
+
+aer_stats_rootport_attr(aer_rootport_total_err_cor,
+			 rootport_total_cor_errs);
+aer_stats_rootport_attr(aer_rootport_total_err_fatal,
+			 rootport_total_fatal_errs);
+aer_stats_rootport_attr(aer_rootport_total_err_nonfatal,
+			 rootport_total_nonfatal_errs);
+
 static struct attribute *aer_stats_attrs[] __ro_after_init = {
 	&dev_attr_aer_dev_correctable.attr,
 	&dev_attr_aer_dev_fatal.attr,
 	&dev_attr_aer_dev_nonfatal.attr,
+	&dev_attr_aer_rootport_total_err_cor.attr,
+	&dev_attr_aer_rootport_total_err_fatal.attr,
+	&dev_attr_aer_rootport_total_err_nonfatal.attr,
 	NULL
 };
 
@@ -613,6 +633,12 @@ static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
 	if (!pdev->aer_stats)
 		return 0;
 
+	if ((a == &dev_attr_aer_rootport_total_err_cor.attr ||
+	     a == &dev_attr_aer_rootport_total_err_fatal.attr ||
+	     a == &dev_attr_aer_rootport_total_err_nonfatal.attr) &&
+	    pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+		return 0;
+
 	return a->mode;
 }
 
@@ -655,6 +681,25 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 			counter[i]++;
 }
 
+static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
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
 static void __print_tlp_header(struct pci_dev *dev,
 			       struct aer_header_log_regs *t)
 {
@@ -1105,6 +1150,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 	struct pci_dev *pdev = rpc->rpd;
 	struct aer_err_info *e_info = &rpc->e_info;
 
+	pci_rootport_aer_stats_incr(pdev, e_src);
+
 	/*
 	 * There is a possibility that both correctable error and
 	 * uncorrectable error being logged. Report correctable error first.
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
