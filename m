Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8F7C48BDF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D0C6613B8
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236224AbhFINZf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35460 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236323AbhFINZ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623245013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GMoGoh2HRdMM9sJwX6YN1+PVxLx5DD2e1fp3oIQPxak=;
        b=fVyw/Yohktt1VX6K0t5VFz9unrrIT6uLS54XE2O8Sg498f+/1o+MIwc6ZIUBmfF0TMMBB0
        tEC2pHK3M5/4s30nmRxwVr0tYwE9l5Yabyb5PDMiWIE42mZlPPvgnCrWM1zARiiifsfHPq
        bDUkZ0nNw2RX4QofOuVJMnL1/cFoSMw=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-EINMcTRAN6uqoSsFKnIM_Q-1; Wed, 09 Jun 2021 09:23:32 -0400
X-MC-Unique: EINMcTRAN6uqoSsFKnIM_Q-1
Received: by mail-ot1-f69.google.com with SMTP id r16-20020a0568301350b0290363e6a9392fso16324953otq.13
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GMoGoh2HRdMM9sJwX6YN1+PVxLx5DD2e1fp3oIQPxak=;
        b=nWGZpPLYb+v8vGPNqk2ANrH9rRhRoUQCycYA28IBVkFdmgiNXkRjUR0rrkRZWmA7YB
         cGFsrmKp2Sm88atOOwdwQYAlPOTbypkaYyucZB5Wq4GQEcGHeido+ixaH0vMgpB2xM2N
         UT9JacwENrilB7wOdpn0qlJNkDE8imJsXBtVVTVmQSyB/kXkjUttu0NsEozTc5+HnFBH
         FfhJyHcBQK/VrzepaISJSRcdlM6ecG8LKiVCl5Xbr17q0hLg4GwkTXWaW1nj77FQThNl
         mjzZGH1X4b/kBgfQNtGK4F5eaujvAJEKy7xWsGSypirPINedGYpp6/XspgVt0TJ5n1bp
         WHaA==
X-Gm-Message-State: AOAM532Tu2dMSGbAAdfxhQ5PCosLy8wWrL5o60fH69ciheD32Le76GcO
        PCwieqMfh/z64evvUpbW+4hd83ZkH122OowkqGxxo61XEAsIOyQRwypZSyECe6PRsIyIT5DjjJQ
        jomOX5Eqar6IdUQq5icqG
X-Received: by 2002:a9d:1d21:: with SMTP id m30mr23363355otm.145.1623245010292;
        Wed, 09 Jun 2021 06:23:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydARdiHq8phH1rVCd2rtPnu21b5nt/oM27/i7eYYIcqaQSBvNa5sJkdoPzOFhOlfjHs69E/w==
X-Received: by 2002:a9d:1d21:: with SMTP id m30mr23363338otm.145.1623245010121;
        Wed, 09 Jun 2021 06:23:30 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 21sm3165654otd.21.2021.06.09.06.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:23:29 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH 7/7] fpga: altera: remove altera- prefix on files
Date:   Wed,  9 Jun 2021 06:21:51 -0700
Message-Id: <20210609132151.3081379-9-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210609132151.3081379-1-trix@redhat.com>
References: <20210609132151.3081379-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

It is not necessary to have an altera- prefix on a file
when the file is in an altera/ subdir.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/altera/Makefile                         | 12 ++++++------
 drivers/fpga/altera/{altera-cvp.c => cvp.c}          |  0
 .../altera/{altera-fpga2sdram.c => fpga2sdram.c}     |  0
 .../{altera-freeze-bridge.c => freeze-bridge.c}      |  0
 .../fpga/altera/{altera-hps2fpga.c => hps2fpga.c}    |  0
 .../{altera-pr-ip-core-plat.c => pr-ip-core-plat.c}  |  0
 .../altera/{altera-pr-ip-core.c => pr-ip-core.c}     |  0
 drivers/fpga/altera/{altera-ps-spi.c => ps-spi.c}    |  0
 8 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/fpga/altera/{altera-cvp.c => cvp.c} (100%)
 rename drivers/fpga/altera/{altera-fpga2sdram.c => fpga2sdram.c} (100%)
 rename drivers/fpga/altera/{altera-freeze-bridge.c => freeze-bridge.c} (100%)
 rename drivers/fpga/altera/{altera-hps2fpga.c => hps2fpga.c} (100%)
 rename drivers/fpga/altera/{altera-pr-ip-core-plat.c => pr-ip-core-plat.c} (100%)
 rename drivers/fpga/altera/{altera-pr-ip-core.c => pr-ip-core.c} (100%)
 rename drivers/fpga/altera/{altera-ps-spi.c => ps-spi.c} (100%)

diff --git a/drivers/fpga/altera/Makefile b/drivers/fpga/altera/Makefile
index 4d725c72fcbef..c2d626cd1f540 100644
--- a/drivers/fpga/altera/Makefile
+++ b/drivers/fpga/altera/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_ALTERA_FREEZE_BRIDGE) += altera-freeze-bridge.o
-obj-$(CONFIG_ALTERA_PR_IP_CORE) += altera-pr-ip-core.o
-obj-$(CONFIG_ALTERA_PR_IP_CORE_PLAT) += altera-pr-ip-core-plat.o
-obj-$(CONFIG_FPGA_MGR_ALTERA_CVP) += altera-cvp.o
-obj-$(CONFIG_FPGA_MGR_ALTERA_PS_SPI) += altera-ps-spi.o
+obj-$(CONFIG_ALTERA_FREEZE_BRIDGE) += freeze-bridge.o
+obj-$(CONFIG_ALTERA_PR_IP_CORE) += pr-ip-core.o
+obj-$(CONFIG_ALTERA_PR_IP_CORE_PLAT) += pr-ip-core-plat.o
+obj-$(CONFIG_FPGA_MGR_ALTERA_CVP) += cvp.o
+obj-$(CONFIG_FPGA_MGR_ALTERA_PS_SPI) += ps-spi.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA) += socfpga.o
 obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10) += socfpga-a10.o
 obj-$(CONFIG_FPGA_MGR_STRATIX10_SOC) += stratix10-soc.o
 obj-$(CONFIG_FPGA_MGR_TS73XX) += ts73xx-fpga.o
-obj-$(CONFIG_SOCFPGA_FPGA_BRIDGE) += altera-hps2fpga.o altera-fpga2sdram.o
+obj-$(CONFIG_SOCFPGA_FPGA_BRIDGE) += hps2fpga.o fpga2sdram.o
diff --git a/drivers/fpga/altera/altera-cvp.c b/drivers/fpga/altera/cvp.c
similarity index 100%
rename from drivers/fpga/altera/altera-cvp.c
rename to drivers/fpga/altera/cvp.c
diff --git a/drivers/fpga/altera/altera-fpga2sdram.c b/drivers/fpga/altera/fpga2sdram.c
similarity index 100%
rename from drivers/fpga/altera/altera-fpga2sdram.c
rename to drivers/fpga/altera/fpga2sdram.c
diff --git a/drivers/fpga/altera/altera-freeze-bridge.c b/drivers/fpga/altera/freeze-bridge.c
similarity index 100%
rename from drivers/fpga/altera/altera-freeze-bridge.c
rename to drivers/fpga/altera/freeze-bridge.c
diff --git a/drivers/fpga/altera/altera-hps2fpga.c b/drivers/fpga/altera/hps2fpga.c
similarity index 100%
rename from drivers/fpga/altera/altera-hps2fpga.c
rename to drivers/fpga/altera/hps2fpga.c
diff --git a/drivers/fpga/altera/altera-pr-ip-core-plat.c b/drivers/fpga/altera/pr-ip-core-plat.c
similarity index 100%
rename from drivers/fpga/altera/altera-pr-ip-core-plat.c
rename to drivers/fpga/altera/pr-ip-core-plat.c
diff --git a/drivers/fpga/altera/altera-pr-ip-core.c b/drivers/fpga/altera/pr-ip-core.c
similarity index 100%
rename from drivers/fpga/altera/altera-pr-ip-core.c
rename to drivers/fpga/altera/pr-ip-core.c
diff --git a/drivers/fpga/altera/altera-ps-spi.c b/drivers/fpga/altera/ps-spi.c
similarity index 100%
rename from drivers/fpga/altera/altera-ps-spi.c
rename to drivers/fpga/altera/ps-spi.c
-- 
2.26.3

