Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4FE367D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 01:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754061AbeFTBMe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 21:12:34 -0400
Received: from mail-qt0-f202.google.com ([209.85.216.202]:35485 "EHLO
        mail-qt0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754055AbeFTBM2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 21:12:28 -0400
Received: by mail-qt0-f202.google.com with SMTP id a10-v6so1407130qtp.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 18:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=HlTc28E61d65R5d0sZkjpqMVdo5h7toibfzgBcFrCFM=;
        b=GVlpTrUY7EtkAykVRfkw8+KjsXLvPk6AqW7IfZIJ95v+rOgr8yRY0zVW3N3vfH27o4
         C65luU18doATp9aPqiLpJi7rCzTgRwx85/wXAtKcVfaxZOAFREbTW0BRWsTsy518e8KQ
         DLn0velDCNShOvWMtrA3IAqIGlP6lneUNFJlkVHV3aP3MbJT55XB3slb8oq5olejpD1J
         G4AdZbAlSNQldYjZcAyJhsBpLZW/jlSF3sPjt4YMKDNVwj7ejBAR+OWC4/rdTvP5pKWT
         w0hZQKmipf9in+MyggXzNt8HCDsJ5+9Po3yqptQ6eXABHelZSxYBVqbmkmDRUGS3xXir
         euXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=HlTc28E61d65R5d0sZkjpqMVdo5h7toibfzgBcFrCFM=;
        b=ZRH2kz6DfeiD85lMwPclEQAyJjzW1paLW5kbnoRItytNoezELafGLjgZB21t8/Z7Wm
         LB/xX+xtb01Mk+TcH764FGKJeDz/rSTsdq+r1XfRYvjo0UU82I2SJZYN6orzlGsep32P
         cAJIGUVtKE496jiyp0nH7R2OcMDVY81a0dYh+GSHm1XG+q7Vd8vFITvYeq1HKq1PfG4i
         EQjlkqNUGxEdpVlvkL8dSHUhqfm+LQCyk9Id72PxxDbqkAvt9xKX2l+WprhoFKpBm1Ti
         fM5EBTuKlGHyb7ectMGvEJqoxIgoKZXeMmAmY1g25kY3AknHfg8wOEvDZ9P8uInO40mw
         I7aA==
X-Gm-Message-State: APt69E2xRlq6wbFjtOilf1+nCduoFukdO4cZBjJrozJJ8NGs1bPQBl0c
        MLxE3VOg9mpw00Uy4jDN4vdUxJ5i6Idg
X-Google-Smtp-Source: ADUXVKJExyd0FLCeGrFTVI6nhdfUHX51gCgqVlGm7eFskB1aZ0pHMjB2ajCVF2OsZd29o1Hj6sPT5GmkF9Sw
MIME-Version: 1.0
X-Received: by 2002:a0c:8a9d:: with SMTP id 29-v6mr10672638qvv.29.1529457148082;
 Tue, 19 Jun 2018 18:12:28 -0700 (PDT)
Date:   Tue, 19 Jun 2018 18:12:09 -0700
In-Reply-To: <20180620011210.254601-1-rajatja@google.com>
Message-Id: <20180620011210.254601-4-rajatja@google.com>
References: <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com> <20180620011210.254601-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
Subject: [PATCH v3 4/5] PCI/AER: Add sysfs attributes for rootport cumulative stats
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
v3: Merge everything in aer.c, use "%llu" in place of "%llx"

 drivers/pci/pcie/aer.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 876f03799810..b6d0a0b56d65 100644
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
@@ -598,10 +601,10 @@ aer_stats_aggregate_attr(dev_total_nonfatal_errs);
 	u64 *stats = pdev->aer_stats->stats_array;			\
 	for (i = 0; i < ARRAY_SIZE(strings_array); i++) {		\
 		if (strings_array[i])					\
-			str += sprintf(str, "%s = 0x%llx\n",		\
+			str += sprintf(str, "%s = %llu\n",		\
 				       strings_array[i], stats[i]);	\
 		else if (stats[i])					\
-			str += sprintf(str, #stats_array "bit[%d] = 0x%llx\n",\
+			str += sprintf(str, #stats_array "bit[%d] = %llu\n",\
 				       i, stats[i]);			\
 	}								\
 	return str-buf;							\
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
