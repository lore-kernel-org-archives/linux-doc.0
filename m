Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94328C18E5C
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EAE724658
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8RuT72W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbgCKMq7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:46:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45936 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729453AbgCKMq6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Mar 2020 08:46:58 -0400
Received: by mail-wr1-f67.google.com with SMTP id m9so2406950wro.12
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2020 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N4gyYG6pd1qHC2GjZUAc/a5emn2edBGVA7chcRhvAO8=;
        b=R8RuT72WL1I4haJ6qD2A19NADfHGGL4h8E65a5bB32JeKEnVO9JbfE6y04C41FHnLL
         AiH3yxrWmV4b4ouGsgZnYDvH6JyHDntuFb3/9DvYzPs3xRWl9CkmzwGARwuOAyD3ENG8
         ExLs4O2EfRkqOxjujXUUTbIjhiAylBxQ8ybvym8Qyo1jwtRGcka/n1mIYt++nCi7pTJf
         r7VZnDbXLgsvy6IWe8+Hwi6VVKzu0VjNNczUmct/KxpEmMqWQtjtAeb2DhsSv3KYbkPr
         VSYMt4h9O6gpK0lYTWS8aMFDJFwbWDK7v4kkJazCh6yUcurLTvS7ONepD43137VO3oBz
         gmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4gyYG6pd1qHC2GjZUAc/a5emn2edBGVA7chcRhvAO8=;
        b=P3wVkY5lQhea1fO9iG/+moTf18PIu8d3526/VsbihX/tPt6LKKHZXNgMHsEOIB8kp5
         uojNe27gl3GgQNTZZYxzGHJJinqL1NwhY0H51UPwfuKIRU/GReSS+dwxP4Po2jAWgfRF
         xxPost33DMwQUCg2FiZLTMKrDvfcOk/mwQ5Y3TBB9NIOEdVrnCf5Vb4g/3fTBx9Gyeun
         AJxlki0bsR23OMH0Nwmz56si3CwYX/iAVV80Ck8uolr+vh6nLUgehJZ3Z809zuiSgduC
         cJYcaqAzDlU5dtO3NwylJer2OO4mK4bko5U5e6pW5PpGJvkWv8JUTMAGhJoRi2v5yE8m
         xJzw==
X-Gm-Message-State: ANhLgQ0203vycNwVYl/yMht/w/8YMqy5I7PNXPNx1Lxfv4oHNsPYj6f8
        9LMP1bHH+akK+x55duAdWGq9Pw==
X-Google-Smtp-Source: ADFU+vtVplsLJKhJ5k96cjG7bQIJiqMwH6aOvBxLDVX3vK8y4Ou+veGu1hCYgxMQXp8PN1ugVbeDHg==
X-Received: by 2002:adf:a555:: with SMTP id j21mr4427467wrb.409.1583930817062;
        Wed, 11 Mar 2020 05:46:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:46:56 -0700 (PDT)
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
Subject: [PATCH v2 02/11] PCI: Add ats_supported host bridge flag
Date:   Wed, 11 Mar 2020 13:44:57 +0100
Message-Id: <20200311124506.208376-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Each vendor has their own way of describing whether a host bridge
supports ATS.  The Intel and AMD ACPI tables selectively enable or
disable ATS per device or sub-tree, while Arm has a single bit for each
host bridge.  For those that need it, add an ats_supported bit to the
host bridge structure.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: try to improve the comment
---
 drivers/pci/probe.c | 8 ++++++++
 include/linux/pci.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 512cb4312ddd..b5e36f06b40a 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -598,6 +598,14 @@ static void pci_init_host_bridge(struct pci_host_bridge *bridge)
 	bridge->native_shpc_hotplug = 1;
 	bridge->native_pme = 1;
 	bridge->native_ltr = 1;
+
+	/*
+	 * Some systems (ACPI IORT, device-tree) declare ATS support at the host
+	 * bridge, and clear this bit when ATS isn't supported. Others (ACPI
+	 * DMAR and IVRS) declare ATS support with a smaller granularity, and
+	 * need this bit set.
+	 */
+	bridge->ats_supported = 1;
 }
 
 struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3840a541a9de..9fe2e84d74d7 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -511,6 +511,7 @@ struct pci_host_bridge {
 	unsigned int	native_pme:1;		/* OS may use PCIe PME */
 	unsigned int	native_ltr:1;		/* OS may use PCIe LTR */
 	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
+	unsigned int	ats_supported:1;
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,
-- 
2.25.1

