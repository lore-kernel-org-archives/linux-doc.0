Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780FFC3B1B6
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F37422527
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qpU0Jj2J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgCKMrM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:47:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39967 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbgCKMrK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Mar 2020 08:47:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id e26so1954923wme.5
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2020 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8zesK78yJZWicqhUwQPL3V6IqJnaQGS4nHnDD923Fhg=;
        b=qpU0Jj2JGN061vUq5cRmJ2MXokC1AW2fzaoV1IqvSV4EPD/dGYLmROiwAk6c96x6vW
         3c/QS7+d0Xs5Hg4r7OeK7NtbyPvNPP+RLWm3RAqJWlVgADXkRpSmM4wionq4sZjhwfZ6
         QnTdAlc42Rps5J6oHni3fFRJiGfPdNWPPBRs7orE3Sad+mMLGwaOhdJfGJcCqrGm0Pka
         snPcqW+J2mj9avU/qFATUqel4P0ix1B8p1qv6emtgkrGOO7Rgx7QYRY1KdpBr/OIuiDx
         vjQs8+BI98JR4mQqH2dqqlxDjanzHaFD/KL4Szy9PMzsMwMolUfmEEz9VwmReUMISzJz
         hL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8zesK78yJZWicqhUwQPL3V6IqJnaQGS4nHnDD923Fhg=;
        b=HTk0/fHxLB5zTHJ6baiyQdZZxbFHvLR+FbdeQK/Jnx69vw0ZXHmDj0L5v2pBznszSv
         LT2cYGyX0pDZJlMki4RtiFgI+Bdma1JZqCQbORXl8NOFsU4mAiS/hmxYU+q3I2LCFt51
         ZzV0rOT5UIrS0+bz+gXsjEnQ/toBnPlVa1IR2vSgXHIETsZYIze38lNCFqcJHhlDUeYj
         a3N5XGXvyenbQh80EZiH9cxsAb78XadLCNKrg/VjUSDxLUv7eskqxS7yQaHl44B14PpP
         YG9IWruigyjvK4d0KFA2LmO3XST9KytobDolSbJt2ZDYEHKN+xiAy/dQrbAWfK0k8s46
         chQQ==
X-Gm-Message-State: ANhLgQ3dndXy9SopANvEam3O1tPwf4/yGLxyIy74Bzig9QnBiN5f8PnS
        fOptxG4dRV29AuE9KFcywU4iMw==
X-Google-Smtp-Source: ADFU+vvKRqzKojPsnzu47XlfEmFywvbZvI7bIuc0VHfmPVsSrBbWdmKhaDCO0TaazIr2/co3EoA9sw==
X-Received: by 2002:a1c:5fc5:: with SMTP id t188mr1007720wmb.110.1583930828211;
        Wed, 11 Mar 2020 05:47:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:47:07 -0700 (PDT)
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
Subject: [PATCH v2 10/11] arm64: dts: fast models: Enable PCIe ATS for Base RevC FVP
Date:   Wed, 11 Mar 2020 13:45:05 +0100
Message-Id: <20200311124506.208376-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Declare that the host controller supports ATS, so the OS can enable it
for ATS-capable PCIe endpoints.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 335fff762451..9171bf0254bf 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -170,6 +170,7 @@ pci: pci@40000000 {
 		iommu-map = <0x0 &smmu 0x0 0x10000>;
 
 		dma-coherent;
+		ats-supported;
 	};
 
 	smmu: smmu@2b400000 {
-- 
2.25.1

