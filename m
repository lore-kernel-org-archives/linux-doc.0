Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBCBC48BD1
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:23:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9807C613AE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 13:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbhFINZe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 09:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236303AbhFINZX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 09:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623245008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qViXgyeh1dlyqh22Awn1t3CyyorftxIelVJ9ElQQ5YY=;
        b=P0xXstqBWHPFK2XOwJO3GVNFfQ1anfxa1YxywY+zcWu+1BkDLFQEetnuZoR0GFgalYvrnh
        fZid45Uzjm/DHcWcmn8f6XJl/klMNkvhsEApmb918J5ygRJDSr6s52Uw1oRyC/8e7w437v
        9smfoh2uXg+AFo39sC3p34e0JfskHBo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-rub06-5gN3i0d9bOvGINtQ-1; Wed, 09 Jun 2021 09:23:27 -0400
X-MC-Unique: rub06-5gN3i0d9bOvGINtQ-1
Received: by mail-oi1-f199.google.com with SMTP id g203-20020aca39d40000b02901f57bf48250so1108049oia.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 06:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qViXgyeh1dlyqh22Awn1t3CyyorftxIelVJ9ElQQ5YY=;
        b=gQck3W6vIK6LjXCRfmmOP9ROEuTIBj2CtodgfV/SiOAWamwb/lu6SbbUZKRJ0nHH7W
         VyFjD6PXQhARFPkSc5Di3N16SvfgfCbYl9ZeJ0dvU2G3/7aUkcZUUfeGftcLt04v1gXh
         qD/HJ/d42E9YhI/W8YPK04ZxZJ9vhM8hgnx+c6u3MUz4ClNqFpR7TFqlbGXa9ROQUMi8
         e81M75+2X/3RIDSI+ZmFJUJqznjJw0oOlGKnU/zR/5nZ3C9ymq2t2vfjuVxI9ymfWfeQ
         xlaUKg8IHaVcWyqCFuQvDbqrXXO6Eosc/C0K5pNhUVoOZxkBm7+uJQFuIaHbYUarvgJO
         vPuQ==
X-Gm-Message-State: AOAM531OWPOjhBdqIupr+XTKClrvRFwGQrDuPOi6kvFD00vx0YevDS/G
        06pAJzBbSfTJgKOQA0yK8T1ph1fA10F/6SK1DhJe35ykhQSwrgNl1xPrDB1klP5qqoEXnLx3Jub
        LHwZDj96M6EvatS65O5A6
X-Received: by 2002:a9d:66d9:: with SMTP id t25mr3492360otm.217.1623245006772;
        Wed, 09 Jun 2021 06:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYlq5NQAg9r5rM56eciALlRRoXOllzEovCjy257M0FuEL28u377Zg2s+BEXW70oM5w182g1Q==
X-Received: by 2002:a9d:66d9:: with SMTP id t25mr3492350otm.217.1623245006642;
        Wed, 09 Jun 2021 06:23:26 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 21sm3165654otd.21.2021.06.09.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 06:23:26 -0700 (PDT)
From:   trix@redhat.com
To:     hao.wu@intel.com, mdf@kernel.org, corbet@lwn.net,
        michal.simek@xilinx.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH 6/7] fpga: xilinx: remove xilinx- prefix on files
Date:   Wed,  9 Jun 2021 06:21:50 -0700
Message-Id: <20210609132151.3081379-8-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210609132151.3081379-1-trix@redhat.com>
References: <20210609132151.3081379-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

It is not necessary to have a xilinx- prefix on a file
when the file is in a xilinx/ subdir.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/xilinx/Makefile                                  | 4 ++--
 drivers/fpga/xilinx/{xilinx-pr-decoupler.c => pr-decoupler.c} | 0
 drivers/fpga/xilinx/{xilinx-spi.c => spi.c}                   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/fpga/xilinx/{xilinx-pr-decoupler.c => pr-decoupler.c} (100%)
 rename drivers/fpga/xilinx/{xilinx-spi.c => spi.c} (100%)

diff --git a/drivers/fpga/xilinx/Makefile b/drivers/fpga/xilinx/Makefile
index 7bb7543412790..4ac727d03e140 100644
--- a/drivers/fpga/xilinx/Makefile
+++ b/drivers/fpga/xilinx/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_XILINX_PR_DECOUPLER) += xilinx-pr-decoupler.o
-obj-$(CONFIG_FPGA_MGR_XILINX_SPI) += xilinx-spi.o
+obj-$(CONFIG_XILINX_PR_DECOUPLER) += pr-decoupler.o
+obj-$(CONFIG_FPGA_MGR_XILINX_SPI) += spi.o
 obj-$(CONFIG_FPGA_MGR_ZYNQ_FPGA) += zynq-fpga.o
 obj-$(CONFIG_FPGA_MGR_ZYNQMP_FPGA) += zynqmp-fpga.o
 
diff --git a/drivers/fpga/xilinx/xilinx-pr-decoupler.c b/drivers/fpga/xilinx/pr-decoupler.c
similarity index 100%
rename from drivers/fpga/xilinx/xilinx-pr-decoupler.c
rename to drivers/fpga/xilinx/pr-decoupler.c
diff --git a/drivers/fpga/xilinx/xilinx-spi.c b/drivers/fpga/xilinx/spi.c
similarity index 100%
rename from drivers/fpga/xilinx/xilinx-spi.c
rename to drivers/fpga/xilinx/spi.c
-- 
2.26.3

