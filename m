Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA5E27DF8F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 22:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753415AbeEVW2c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 18:28:32 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:38579 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753357AbeEVW2a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 18:28:30 -0400
Received: by mail-pl0-f68.google.com with SMTP id c11-v6so11739740plr.5
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z7VkBQQlYBnvGN1Gtxd8V7KUxPUVslFvPtw1dHurOCM=;
        b=Im6X19goSnAIwczCEWkfWe6g8yWklA+xrSn4mIPx/5zWGgTVZnUhPDfHbOrT+Q9g0A
         tA13+JiEdXujiHl22unVZj8UgBrmP97cxm9xbrkHdxvXV02MzAnrpFGRQzHsftIZA53p
         n3V7uyh/8cKWau8KurcGuMmtipvgpA6sYLpPSVVlA8kxIaiXS0FQbxSfL/o43eYoHJo3
         quq+ruKCBE9Iabt/+1mL3wl/ag25aR/osN031hbhVDXN2PbHKUP7ZvbzOuvex3oXECKI
         2/r/I0lMlT5GHR/PSeHRtQrK6oDI/V7EYzGVKleOz/Arp3atGHio8B1OwF+lBZAn1ajh
         gF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z7VkBQQlYBnvGN1Gtxd8V7KUxPUVslFvPtw1dHurOCM=;
        b=OCqOUCRoW4lzhK8s3BPibpc0p8WNNi8jdoNytp6y38HYgyDNc86XcNr1EMkDraAtgS
         jqk8ce7fGk9D8oejXevI2GGBlviB64cUWqrqJ/A2kYNHmM2CfnumVAxKEIEFWxgzv+zj
         n7YzuDG44n0UmNNQPXn1tRJaEkAZ0RqPyO3zQoGmHqbJa32OUz9FvFBOEyEpHRtsNCG+
         MGvLFHDoKBHLR1P4Li0JIGKmaAlaSTc+Z8H0ftgvenzYb/jDmP6tD7wXTLh1AQBSdat3
         jzyO6ZeXnRsGegoLr14zNy44QbF14FPWIVlpH/XJYmyKPFDrkCRrMnCizbMuOZa5WWjG
         fcrA==
X-Gm-Message-State: ALKqPwc2m6KB+rYmSJDD3Igv5DuWlurODAFaqpsRDa2hSsDhQtLk+JfA
        vEo8HuiGLwtOAh4EJVmWEc8BJg==
X-Google-Smtp-Source: AB8JxZrRiuC9iS72kd4aGlNn5MMtdQyVn0H3/m5JAUn0kvnd2dsIr1Zj8+8Wi4tngIzM5X4VAL9eFg==
X-Received: by 2002:a17:902:3c5:: with SMTP id d63-v6mr291803pld.163.1527028109443;
        Tue, 22 May 2018 15:28:29 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id b72-v6sm34327852pfm.69.2018.05.22.15.28.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 15:28:28 -0700 (PDT)
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
Subject: [PATCH 5/5] Documentation/PCI: Add details of PCI AER statistics
Date:   Tue, 22 May 2018 15:28:05 -0700
Message-Id: <20180522222805.80314-6-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <20180522222805.80314-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the PCI AER statistics details to
Documentation/PCI/pcieaer-howto.txt

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 Documentation/PCI/pcieaer-howto.txt | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/PCI/pcieaer-howto.txt b/Documentation/PCI/pcieaer-howto.txt
index acd0dddd6bb8..86ee9f9ff5e1 100644
--- a/Documentation/PCI/pcieaer-howto.txt
+++ b/Documentation/PCI/pcieaer-howto.txt
@@ -73,6 +73,41 @@ In the example, 'Requester ID' means the ID of the device who sends
 the error message to root port. Pls. refer to pci express specs for
 other fields.
 
+2.4 AER statistics
+
+When AER messages are captured, the statistics are exposed via the following
+sysfs attributes under the "aer_stats" folder for the device:
+
+2.4.1 Device sysfs Attributes
+
+These attributes show up under all the devices that are AER capable. These
+indicate the errors "as seen by the device". Note that this may mean that if
+an end point is causing problems, the AER counters may increment at its link
+partner (e.g. root port) because the errors will be "seen" by the link partner
+and not the the problematic end point itself (which may report all counters
+as 0 as it never saw any problems).
+
+ * dev_total_cor_errs: number of correctable errors seen by the device.
+ * dev_total_fatal_errs: number of fatal uncorrectable errors seen by the device.
+ * dev_total_nonfatal_errs: number of nonfatal uncorr errors seen by the device.
+ * dev_breakdown_correctable: Provides a breakdown of different type of
+                              correctable errors seen.
+ * dev_breakdown_uncorrectable: Provides a breakdown of different type of
+                              uncorrectable errors seen.
+
+2.4.1 Rootport sysfs Attributes
+
+These attributes showup under only the rootports that are AER capable. These
+indicate the number of error messages as "reported to" the rootport. Please note
+that the rootports also transmit (internally) the ERR_* messages for errors seen
+by the internal rootport PCI device, so these counters includes them and are
+thus cumulative of all the error messages on the PCI hierarchy originating
+at that root port.
+
+ * rootport_total_cor_errs: number of ERR_COR messages reported to rootport.
+ * rootport_total_fatal_errs: number of ERR_FATAL messages reported to rootport.
+ * rootport_total_nonfatal_errs: number of ERR_NONFATAL messages reporeted to
+                                 rootport.
 
 3. Developer Guide
 
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
