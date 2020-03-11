Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AE4C2BB57
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 938FD2253D
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0OldcPY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgCKMrA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:47:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35162 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729384AbgCKMrA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Mar 2020 08:47:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id m3so1978132wmi.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2020 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d7fzzw/5lEfLgru+68iO/J8krazqjJjWjKm9fH3TH5I=;
        b=d0OldcPYPTwC6lUxav+jf6KB+UcGBjwxPVFVLOS8P+DRcf4Nq9+Cgk3ER62YCupyKO
         n63Plm+lXXP1tDCSs66zuHCHs/M9n6CcfUD83j6S1A3sgTchEZWf/GNdy1+Sg6PJsXx7
         v6vVCuz7+yMQ9U+jeSTzabfnBGdgbxAl7+8p5eiV0vMWAbcwpvxqhcw3kVlpD7RcuEis
         e5lM+BenuFHNorZQvoPD0B0I5/lix/gZ+JhB+tlQQjDMmJ4sZt8Pupm67tdBc4wFY0mf
         EgB/VSPg8NrV9V5qGawXDH19VqniDfIEy7gvlpILkFxSAN86lG2R7fZNu+SKWuDilrZc
         hdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7fzzw/5lEfLgru+68iO/J8krazqjJjWjKm9fH3TH5I=;
        b=q/e8lh+/yM8Q9qT7gaKHrC/34SJolD0sl34iao4mTGdWfFbRpFoYSssnO8T+KHqz30
         sG2vHeV7AVfHb9Nn3NhKXrcZUIVC0Rtg1zhMJnANIqnzK/8qbsErC1cNpOXPbM+JOKKI
         AUDuj0C08VGAcrpo5xVm0Y4M5kZPn1Cq1lRREDIZf2PXIpfjwhlWwR52/W/2KOXMlHRx
         fmUsjhs4kRSfQj0RGMQVGhphEDpiSCq0TOf55QQDfzoACmWg5LkndJ5jJGnIgUlkWFzC
         Cv/yfHPhXqJMISjY0C454KI9QMLlXldh+83PP8wbfITGQOigjqnT4i3+tBJ1k1VQsjAe
         XKkQ==
X-Gm-Message-State: ANhLgQ33bVRuDB7NKyyr7IK3/ZtWCf1cSBc3bKljOc3XDagqwGMlI3+q
        pNcvT6FfEjgTZViNLVbpaxpfXA==
X-Google-Smtp-Source: ADFU+vtrrbz3xW1uwROP0nlDBlOyziir6FkZYgi3Shk3F4IjgLnSc2vkzPiEnYQH9VQXQDGBOwBJWg==
X-Received: by 2002:a1c:7e08:: with SMTP id z8mr3550520wmc.166.1583930818310;
        Wed, 11 Mar 2020 05:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:46:57 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org,
        joro@8bytes.org, baolu.lu@linux.intel.com, sudeep.holla@arm.com,
        linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org
Cc:     lorenzo.pieralisi@arm.com, corbet@lwn.net, mark.rutland@arm.com,
        liviu.dudau@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
        lenb@kernel.org, robin.murphy@arm.com, dwmw2@infradead.org,
        amurray@thegoodpenguin.co.uk, frowand.list@gmail.com,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 03/11] PCI: OF: Check whether the host bridge supports ATS
Date:   Wed, 11 Mar 2020 13:44:58 +0100
Message-Id: <20200311124506.208376-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When setting up a generic host on a device-tree based system, copy the
ats-supported flag into the pci_host_bridge structure.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: keep the helper in pci-host-common.c
---
 drivers/pci/controller/pci-host-common.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index 250a3fc80ec6..2e800bc6ae7a 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -54,6 +54,16 @@ static struct pci_config_window *gen_pci_init(struct device *dev,
 	return ERR_PTR(err);
 }
 
+static void of_pci_host_check_ats(struct pci_host_bridge *bridge)
+{
+	struct device_node *np = bridge->bus->dev.of_node;
+
+	if (!np)
+		return;
+
+	bridge->ats_supported = of_property_read_bool(np, "ats-supported");
+}
+
 int pci_host_common_probe(struct platform_device *pdev,
 			  struct pci_ecam_ops *ops)
 {
@@ -92,6 +102,7 @@ int pci_host_common_probe(struct platform_device *pdev,
 		return ret;
 	}
 
+	of_pci_host_check_ats(bridge);
 	platform_set_drvdata(pdev, bridge->bus);
 	return 0;
 }
-- 
2.25.1

