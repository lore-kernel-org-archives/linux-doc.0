Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C838E7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 01:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757337AbeD0B0S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 21:26:18 -0400
Received: from mail-ot0-f193.google.com ([74.125.82.193]:34408 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757308AbeD0B0O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 21:26:14 -0400
Received: by mail-ot0-f193.google.com with SMTP id i5-v6so313640oth.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Apr 2018 18:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U9IKzmjGPggyRJ/ezvgFGiVGz17y84H4pFdYSxoUzMY=;
        b=iBZHPgPEC5uXLQYHBqYLsbfX8Qh2CkLArAee/RUkhEJpyQledxv57v/4EvR2g4pI+p
         acVimR6kagpn20qikwVC35vFWpyc8XmPBCrjDRx6HXlioiYapjopQ6vAwl/5sl+INtQD
         vWABF6tf+m6iymZLS/HNeYwj66DvdoHTpfGNjr0IPP/mqwMIvL5XeBajxKNgRGRfSCbq
         0QuExNwMvJmTTlyOgB8ebxe+xj4eQGR+z07Gz3PbA0SeHq6cMuyvLSwfOSmdXnjI8oWf
         CDASynA7BMp/mOqp+mAzmgfNjfmpV36PYNT5cputDy0I0xL+eFubTUHzAbeg20zuw28n
         0tqg==
X-Gm-Message-State: ALQs6tCcMgbngxk7yQUMSyHZH/xzFyZg8FjLjbEYlrGawVqJTdswgvlg
        HwfpCqM/mmC1Wzl5Lnfk7YXpTQ==
X-Google-Smtp-Source: AB8JxZpOBDXgOaZN3bBXEVOmIv+nnLe/lSEeTDD5YdyhNYKCgsur85NeSr46aZyfmdJ+uwo0ZEhFeg==
X-Received: by 2002:a9d:3f49:: with SMTP id m67-v6mr212883otc.133.1524792374224;
        Thu, 26 Apr 2018 18:26:14 -0700 (PDT)
Received: from localhost ([130.164.62.82])
        by smtp.gmail.com with ESMTPSA id g23-v6sm132338otc.73.2018.04.26.18.26.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Apr 2018 18:26:12 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-fpga@vger.kernel.org, michal.simek@xilinx.com,
        corbet@lwn.net, atull@kernel.org, Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 1/4] fpga: region: don't use drvdata in common fpga code
Date:   Thu, 26 Apr 2018 18:26:02 -0700
Message-Id: <20180427012605.28981-2-mdf@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180427012605.28981-1-mdf@kernel.org>
References: <20180427012605.28981-1-mdf@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alan Tull <atull@kernel.org>

Changes to fpga_region_register function to not set drvdata.

Setting drvdata is fine for DT based devices that will have one region
per platform device.  However PCIe based devices may have multiple
FPGA regions under one PCIe device.  Without these changes, the PCIe
solution has to create an extra device for each child region to hold
drvdata.

Signed-off-by: Alan Tull <atull@kernel.org>
Reported-by: Jiuyue Ma <majiuyue@huawei.com>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/fpga/fpga-region.c    | 1 -
 drivers/fpga/of-fpga-region.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index cb0603e07ff8..f634a8ed5e2c 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -183,7 +183,6 @@ int fpga_region_register(struct device *dev, struct fpga_region *region)
 	region->dev.parent = dev;
 	region->dev.of_node = dev->of_node;
 	region->dev.id = id;
-	dev_set_drvdata(dev, region);
 
 	ret = dev_set_name(&region->dev, "region%d", id);
 	if (ret)
diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index 119ff75522f1..35e7e8c4a0cb 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -438,6 +438,7 @@ static int of_fpga_region_probe(struct platform_device *pdev)
 		goto eprobe_mgr_put;
 
 	of_platform_populate(np, fpga_region_of_match, NULL, &region->dev);
+	dev_set_drvdata(dev, region);
 
 	dev_info(dev, "FPGA Region probed\n");
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
