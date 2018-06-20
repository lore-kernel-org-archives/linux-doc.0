Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 983357D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 01:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753741AbeFTBNH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 21:13:07 -0400
Received: from mail-ua0-f202.google.com ([209.85.217.202]:45932 "EHLO
        mail-ua0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753925AbeFTBMZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 21:12:25 -0400
Received: by mail-ua0-f202.google.com with SMTP id n7-v6so505324uak.12
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 18:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=3Y+QluKJwrqjzjy8KY30yUXxcpwjF/AHZBdPidFilXs=;
        b=Xz5SW4joaesf7pBEyzVH/YP4nCqavwPvyLywEK/aCntTgxLyVyPjT+xCWxIoxhsLA+
         HPzVndo30GImyXLbqBCmtLK8sO3NDO7lJOrI+UT+hMuuMuKKZVT66yOZPXvdkSOsolc2
         vpixwsEy1T0ipVpf+JJOYap6Ag+QZzAlf7OLMHT14HKbYIp76nOPau1d6xLY373EcqwB
         lOCs77Lr2JoFt/S9IQ/pnyPOf94YdJmhUVR0OdUZOJOBv1UYXURtiyzHBYodx7g9xJHJ
         xChd42wqzxaUszOx/16/6sjVeIP+KltMbxfdAcvl88ODaLKu84jKdaLCEzOH9rPHKG7r
         +r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=3Y+QluKJwrqjzjy8KY30yUXxcpwjF/AHZBdPidFilXs=;
        b=Q8uKgVsKIAWaVfmDlCTJbhNNPZahMbn8ZHqsPoPKyIpOB1+Ai4UOXGfbHXuFG/5H5f
         lIttAHFk4UiWi4nAub7Jla8bw97zLsdypHui/lbt4uAeT5U2tLfdQweHFXPc0gOKkhrg
         5+eBV+rOIug/EoC0sCdYuyxtZ+mREscIv4tFDyvYA8rJAXw9fGtQZ7gCpXz2idZC+wJk
         Jczeb6qWBG8suA3RA3Ddu4SKvKq86PmvF3GhhCMB+VwUBmSEAoogS6hnjq5gie3oUIXR
         d60uCbzEA6V1s0jta3fiwEEA3Q4SRZvL9L9pwV3abz7HmT87+kDoPw6AEk9SOpTLjeug
         SZQw==
X-Gm-Message-State: APt69E3rpMd27CIXLB4Bo+x5gqeSIFIiwMsK4SX+D3FC49wtg8LlFz54
        F5oghftig9xa6gPrT0FSAR+ugXb2gZvx
X-Google-Smtp-Source: ADUXVKJp5SzZsDSEnCjKx04NWG0HrK86s+Go7SZxaj4r1ed+jutdar4xXWwzk2T5p5udOip69b21A6Hofo0E
MIME-Version: 1.0
X-Received: by 2002:a9f:21b4:: with SMTP id 49-v6mr8325832uac.16.1529457144592;
 Tue, 19 Jun 2018 18:12:24 -0700 (PDT)
Date:   Tue, 19 Jun 2018 18:12:08 -0700
In-Reply-To: <20180620011210.254601-1-rajatja@google.com>
Message-Id: <20180620011210.254601-3-rajatja@google.com>
References: <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com> <20180620011210.254601-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
Subject: [PATCH v3 3/5] PCI/AER: Add sysfs attributes to provide breakdown of AERs
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
Cc:     Rajat Jain <rajatja@google.com>, Rajat Jain <rajatj@google.com>
Content-Type: text/plain; charset="UTF-8"
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
v3: Merge everything in aer.c, use "%llu" in place of "%llx"

 drivers/pci/pcie/aer.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ce0d675d7bd3..876f03799810 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -587,10 +587,38 @@ aer_stats_aggregate_attr(dev_total_cor_errs);
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
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
