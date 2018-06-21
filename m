Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5BC907D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Jun 2018 23:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933787AbeFUXsp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Jun 2018 19:48:45 -0400
Received: from mail-qk0-f201.google.com ([209.85.220.201]:39858 "EHLO
        mail-qk0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933364AbeFUXsl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jun 2018 19:48:41 -0400
Received: by mail-qk0-f201.google.com with SMTP id c139-v6so4072658qkg.6
        for <linux-doc@vger.kernel.org>; Thu, 21 Jun 2018 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=UTo0MP31NcmRnoDiyi7jcuy8B7/IsyEAnIrtr4qanCM=;
        b=utL5JIwMhgltwmRwSCvuL0drNH1wtImMZ0JlT7W1Fx3KlJ/gZxwE7HAZ0g/TxR6vWa
         jvC+yBWnKES4RzUd0Zfdvd5j0fqwfiYr6ev5SoXkPYFqkr7zfVflR3IiwZ/JUZsxzhyH
         7i5+nc9+0nzyhZ7FbvUmnwmZx2/x4UqhUo2KsLk695KGAB5qgVT1sHx5Q72DGIdJFd8b
         QRTQpA+ebY3iH7ZGCCuyyKySEK2QGQNcthADT6DEo75zDTyPf+wkGebowT2hA4nJgsU/
         Smmo4B+wYknczc0wpT1kHeed9/Sym8SJsAG8XVT1B7I/icRvGp+JiyzTPa0Ln1I4H4bY
         1iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=UTo0MP31NcmRnoDiyi7jcuy8B7/IsyEAnIrtr4qanCM=;
        b=FYDDb0fV+VHCJH3W7q9MPsRmJYbrSOM0W0ZVmvRwDP+I8VJ/eMrE6WJ26eCPOJcO5/
         qxqtrufOuWVpg7HvPdKXgag9tTHoivx0cwNMjsKExmPkgo0i5feYLpARlFkqkqBKKOKV
         SbQfxDKf1bwjWC4uuUesYZIyyRCIevufzX7O8/mFzdWc1RXtS4ssaDWQ1/QJ2mI/jVLx
         mZtlJ7971rZDbvIKFw2Gxc46h4SwlYq8By24tVL75+lRzNlacVH9aRyredc+MXRR8m0O
         d9pfjMYxe1wuHfENWpW+9efGm9Blc+dTb4xO+vcJCIWpHfJyJCjFjqyqDQYKJ0SDWuI1
         aafA==
X-Gm-Message-State: APt69E1m2s78/XusCCgUlnLocAa1aQr4i9Rl4ZRqtyo7mE8Q7mbXggaV
        fHpa7N62LhV8I0/6XuhR2Avd9/mHiPNt
X-Google-Smtp-Source: ADUXVKKjFOxzR1X3TPeZTdE91ZXsh6xPQrrbqLJlFXDo7tCdA8VKnWb1ByOookZQnJ8FIBtFLijxtzsjAsV2
MIME-Version: 1.0
X-Received: by 2002:a0c:8839:: with SMTP id 54-v6mr14593094qvl.24.1529624920464;
 Thu, 21 Jun 2018 16:48:40 -0700 (PDT)
Date:   Thu, 21 Jun 2018 16:48:26 -0700
In-Reply-To: <20180621234829.224566-1-rajatja@google.com>
Message-Id: <20180621234829.224566-2-rajatja@google.com>
References: <20180621234829.224566-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
Subject: [PATCH 1/4] PCI: Move pci_aer_init() and pci_no_aer() declarations to drivers/pci/pci.h
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

Since these functions are unsed only internally, move them to the PCI
internal header file. Also, no one cares about return value of
pci_aer_init(), so make it void.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/pci/pci.h      | 8 ++++++++
 drivers/pci/pcie/aer.c | 4 ++--
 include/linux/pci.h    | 4 ----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index c358e7a07f3f..9a1af85aca77 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -452,4 +452,12 @@ static inline int devm_of_pci_get_host_bridge_resources(struct device *dev,
 }
 #endif
 
+#ifdef CONFIG_PCIEAER
+void pci_no_aer(void);
+void pci_aer_init(struct pci_dev *dev);
+#else
+static inline void pci_no_aer(void) { }
+static inline int pci_aer_init(struct pci_dev *d) { return -ENODEV; }
+#endif
+
 #endif /* DRIVERS_PCI_H */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index a2e88386af28..11482669b93b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -402,10 +402,10 @@ int pci_cleanup_aer_error_status_regs(struct pci_dev *dev)
 	return 0;
 }
 
-int pci_aer_init(struct pci_dev *dev)
+void pci_aer_init(struct pci_dev *dev)
 {
 	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
-	return pci_cleanup_aer_error_status_regs(dev);
+	pci_cleanup_aer_error_status_regs(dev);
 }
 
 #define AER_AGENT_RECEIVER		0
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 340029b2fb38..b4ffea05c999 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1468,13 +1468,9 @@ static inline bool pcie_aspm_support_enabled(void) { return false; }
 #endif
 
 #ifdef CONFIG_PCIEAER
-void pci_no_aer(void);
 bool pci_aer_available(void);
-int pci_aer_init(struct pci_dev *dev);
 #else
-static inline void pci_no_aer(void) { }
 static inline bool pci_aer_available(void) { return false; }
-static inline int pci_aer_init(struct pci_dev *d) { return -ENODEV; }
 #endif
 
 #ifdef CONFIG_PCIE_ECRC
-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
