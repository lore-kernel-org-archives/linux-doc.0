Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D7167D062
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 23:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932936AbeFTXmg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 19:42:36 -0400
Received: from mail-qk0-f202.google.com ([209.85.220.202]:47554 "EHLO
        mail-qk0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933194AbeFTXmI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 19:42:08 -0400
Received: by mail-qk0-f202.google.com with SMTP id d194-v6so332655qke.14
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 16:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=lEWYvciC7lFM4X9Jfw2+d0avwkh20dgbrMimgocn5WM=;
        b=SMrkxmP7KAcXX7m6LfojkaHmTduauhjrpwcV0lZ4RhRGLswG9pF57FOcxjZkqIaw3U
         1Jdt6sgJSvB+hSCMhdO787hTnJvyrBR0uiBw9GoqQUmU707PY0j/TwnjnYGeItmd+yHW
         6tVUO2yuJr2Bcql4jTujmELno1P4Vp/Lm7WyU2JGa/2B73iNUo9qFww1A4Mltl5erEqs
         vCJNOioQu+cXJ4jJ8kNuvBAtTfgqEDf7cuxiSqUOymhtCB4N8UoYwSzXjym3tHMiDXb+
         E78a10aDFDmq3iHoeVlzeA4V7D+Gc4ejekyAc7GHoclpFPe6fe392Iknz3s8WUlufjLG
         l3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=lEWYvciC7lFM4X9Jfw2+d0avwkh20dgbrMimgocn5WM=;
        b=FcDW0EcKty5/QG89CoSm6xiiURrrcZwgtOyFejgb8UWreSmX+BBgk1DgGIaPUeNvEa
         YEJsNrwFGKdk5Ek80lHn0nfOEA3JXYvHnLBtQ3cfbErscDe7KtwLJXHZMwZ5+xi1F1XS
         URM8tqil1cDVX6GKXqdM1+3G0xm3Gzqx+Vmqc/nXXpRjY2dSEUgTJ/in/39N/ptPu2hN
         U8++WBfTfXusIqRI6SbKXQFEbfF30PmtnhS9phcaidqJDm8o6xlXz+fDFpp7l71IMJt7
         LCNyuvCjkkITbW+MP5j6Z94KoEnFaQhvYfqxr+5OKVjVnW4wpI52NfIGI8j9wvvrYoUO
         daGQ==
X-Gm-Message-State: APt69E1xnrL9aDIIETC0Oy9UP5/ALI33UNIluXKpH1PqPu/7q+uz1gOU
        fzgdmS8BSYNAW8DrmrrzP4xs2gDTIuLn
X-Google-Smtp-Source: ADUXVKKFMdGkXwdRg5rj5TuZH5sRI0gSSAPZgc/dstu6nOVYjYHD9q3qtBo1C4ftgznu98/BNSXtEmR+YtwP
MIME-Version: 1.0
X-Received: by 2002:ac8:1a3b:: with SMTP id v56-v6mr12698804qtj.35.1529538127286;
 Wed, 20 Jun 2018 16:42:07 -0700 (PDT)
Date:   Wed, 20 Jun 2018 16:41:46 -0700
In-Reply-To: <20180620234147.48438-1-rajatja@google.com>
Message-Id: <20180620234147.48438-4-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com> <20180620234147.48438-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
Subject: [PATCH v5 4/5] PCI/AER: Add sysfs attributes for rootport cumulative stats
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
v5: Same as v4
v4: Make pci_rootport_aer_stats_incr() static, 1 hunk of previous patch was included by mistake, fix that.
v3: Merge everything in aer.c

 drivers/pci/pcie/aer.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index c989bb5bb6f1..d9def7fabd81 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -586,6 +586,9 @@ static DEVICE_ATTR_RO(field)
 aer_stats_aggregate_attr(dev_total_cor_errs);
 aer_stats_aggregate_attr(dev_total_fatal_errs);
 aer_stats_aggregate_attr(dev_total_nonfatal_errs);
+aer_stats_aggregate_attr(rootport_total_cor_errs);
+aer_stats_aggregate_attr(rootport_total_fatal_errs);
+aer_stats_aggregate_attr(rootport_total_nonfatal_errs);
 
 #define aer_stats_breakdown_attr(field, stats_array, strings_array)	\
 	static ssize_t							\
@@ -619,6 +622,9 @@ static struct attribute *aer_stats_attrs[] __ro_after_init = {
 	&dev_attr_dev_total_nonfatal_errs.attr,
 	&dev_attr_dev_breakdown_correctable.attr,
 	&dev_attr_dev_breakdown_uncorrectable.attr,
+	&dev_attr_rootport_total_cor_errs.attr,
+	&dev_attr_rootport_total_fatal_errs.attr,
+	&dev_attr_rootport_total_nonfatal_errs.attr,
 	NULL
 };
 
@@ -631,6 +637,12 @@ static umode_t aer_stats_attrs_are_visible(struct kobject *kobj,
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
 
@@ -674,6 +686,25 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
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
@@ -1124,6 +1155,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
 	struct pci_dev *pdev = rpc->rpd;
 	struct aer_err_info *e_info = &rpc->e_info;
 
+	pci_rootport_aer_stats_incr(pdev, e_src);
+
 	/*
 	 * There is a possibility that both correctable error and
 	 * uncorrectable error being logged. Report correctable error first.
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
