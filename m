Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800A1C77B61
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 08:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjC3IU5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 04:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjC3IU2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 04:20:28 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A917A8F
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 01:20:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j24so18208753wrd.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680164416; x=1682756416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFwkjW5J5CdRehsc8GlLIX3o+kL5YH8nSEZdD8MaHYM=;
        b=dXjme056DTy8sHP4s1EAWEL6YupV6McLTfEapsv6rv2UU8D7SwBzbbnxVsYaC5NiBk
         lHj5KBfkPK5j/0VajvU01lsKpLqNr0U62PmV4M6nWctEid50435jenXQYs7xDThwdCU2
         hFWvEXC6Vy5J8a9YbR0TAwABWN+yBEQaax2MpbROP2H9gOj7PS7fCOKJMSUSyB+1HvvZ
         l8oKTmAxPPPneaYTV2a1q08U7xYoxmECzWhc92vvec637qWz/J8KoD0YZcpu3FMziu6I
         gYO8/aBg28WV5iO3qd3STep0g2UxTIwyuBUEdPisrnnRNOmx8YrpIafbdyc+4EvlSOCr
         y5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680164416; x=1682756416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFwkjW5J5CdRehsc8GlLIX3o+kL5YH8nSEZdD8MaHYM=;
        b=QoAAKRfctK6b9gXFlrm1sf9MrWfHZIQkU65Ggg7C6V8tD/33rlfzuDv32nPDwrEewe
         PfEAeuE+JvGnOIhgt6sycPb1eGFwclqMwtHLB0Rl2WT1WF/cs1v6CgBYI6AfnCeFDtB2
         RJkhoa/IT7gsvhy5kDnP46CC0PHMmM0EPArCYZdrMvqIDsXZwzHVa+SpjkQaUYPUXBwD
         hfcIopeNE+PTIL0rXSqjkPuRF8BBJBy8Ok2vGkqodycd1g22q3VdiQIrB92Upl/DS5WQ
         zwoV9XofTOaq+ECXJk8UMOQY2HTH0vjpfGpJSOvUST9yuyi0PuOCaGocLC8KsC7Fsick
         rjDw==
X-Gm-Message-State: AAQBX9eF0u5GRdVjkiLqox/mTAQYwGI5eL3DtToyC6i9wiXnSvkL/mPO
        6UG5+UskOrlVfImATxD8mU2XvA==
X-Google-Smtp-Source: AKy350YL9SnXKBsk86jHV6agBmqmZBdn7gTtAxywfbW2/dIqR3AXt8r72DiptG68yCUP65jr61vl4A==
X-Received: by 2002:a5d:55c2:0:b0:2d8:7bba:5bb6 with SMTP id i2-20020a5d55c2000000b002d87bba5bb6mr17377164wrw.28.1680164415935;
        Thu, 30 Mar 2023 01:20:15 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm32286588wru.83.2023.03.30.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 01:20:15 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        gregkh@linuxfoundation.org, derek.kiernan@xilinx.com,
        dragan.cvetic@xilinx.com
Cc:     yi.l.liu@intel.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, prabhakar.csengg@gmail.com,
        contact@emersion.fr, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sterzik@ti.com, u-kumar1@ti.com, eblanc@baylibre.com,
        jneanne@baylibre.com
Subject: [PATCH v5 3/4] misc: tps6594-esm: Add driver for TI TPS6594 ESM
Date:   Thu, 30 Mar 2023 10:20:05 +0200
Message-Id: <20230330082006.11216-4-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230330082006.11216-1-jpanis@baylibre.com>
References: <20230330082006.11216-1-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds support for TPS6594 ESM (Error Signal Monitor).
This device monitors the SoC error output signal at its nERR_SOC input pin.
In error condition, ESM toggles its nRSTOUT_SOC pin to reset the SoC.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/misc/Kconfig       |  11 ++++
 drivers/misc/Makefile      |   1 +
 drivers/misc/tps6594-esm.c | 132 +++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/misc/tps6594-esm.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 433aa4197785..c73c02801330 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -538,6 +538,17 @@ config TMR_INJECT
 
 	  Say N here unless you know what you are doing.
 
+config TPS6594_ESM
+	tristate "TI TPS6594 Error Signal Monitor support"
+	depends on MFD_TPS6594
+	default MFD_TPS6594
+	help
+	  Support ESM (Error Signal Monitor) on TPS6594 PMIC devices.
+	  ESM is used typically to reboot the board in error condition.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called tps6594-esm.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 56de43943cd5..3dc69ec69912 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -65,3 +65,4 @@ obj-$(CONFIG_GP_PCI1XXXX)	+= mchp_pci1xxxx/
 obj-$(CONFIG_VCPU_STALL_DETECTOR)	+= vcpu_stall_detector.o
 obj-$(CONFIG_TMR_MANAGER)      += xilinx_tmr_manager.o
 obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
+obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
diff --git a/drivers/misc/tps6594-esm.c b/drivers/misc/tps6594-esm.c
new file mode 100644
index 000000000000..b488f704f104
--- /dev/null
+++ b/drivers/misc/tps6594-esm.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ESM (Error Signal Monitor) driver for TI TPS6594/TPS6593/LP8764 PMICs
+ *
+ * Copyright (C) 2023 BayLibre Incorporated - https://www.baylibre.com/
+ */
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <linux/mfd/tps6594.h>
+
+static irqreturn_t tps6594_esm_isr(int irq, void *dev_id)
+{
+	struct platform_device *pdev = dev_id;
+	int i;
+
+	for (i = 0 ; i < pdev->num_resources ; i++) {
+		if (irq == platform_get_irq_byname(pdev, pdev->resource[i].name)) {
+			dev_err(pdev->dev.parent, "%s error detected\n", pdev->resource[i].name);
+			return IRQ_HANDLED;
+		}
+	}
+
+	return IRQ_NONE;
+}
+
+static int tps6594_esm_probe(struct platform_device *pdev)
+{
+	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	int irq;
+	int ret;
+	int i;
+
+	for (i = 0 ; i < pdev->num_resources ; i++) {
+		irq = platform_get_irq_byname(pdev, pdev->resource[i].name);
+		if (irq < 0)
+			return dev_err_probe(dev, irq, "Failed to get %s irq\n",
+					     pdev->resource[i].name);
+
+		ret = devm_request_threaded_irq(dev, irq, NULL,
+						tps6594_esm_isr, IRQF_ONESHOT,
+						pdev->resource[i].name, pdev);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to request irq\n");
+	}
+
+	ret = regmap_set_bits(tps->regmap, TPS6594_REG_ESM_SOC_MODE_CFG,
+			      TPS6594_BIT_ESM_SOC_EN | TPS6594_BIT_ESM_SOC_ENDRV);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure ESM\n");
+
+	ret = regmap_set_bits(tps->regmap, TPS6594_REG_ESM_SOC_START_REG,
+			      TPS6594_BIT_ESM_SOC_START);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to start ESM\n");
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	return 0;
+}
+
+static int tps6594_esm_remove(struct platform_device *pdev)
+{
+	struct tps6594 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = regmap_clear_bits(tps->regmap, TPS6594_REG_ESM_SOC_START_REG,
+				TPS6594_BIT_ESM_SOC_START);
+	if (ret) {
+		dev_err(dev, "Failed to stop ESM\n");
+		goto out;
+	}
+
+	ret = regmap_clear_bits(tps->regmap, TPS6594_REG_ESM_SOC_MODE_CFG,
+				TPS6594_BIT_ESM_SOC_EN | TPS6594_BIT_ESM_SOC_ENDRV);
+	if (ret)
+		dev_err(dev, "Failed to unconfigure ESM\n");
+
+out:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int tps6594_esm_suspend(struct device *dev)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+	int ret;
+
+	ret = regmap_clear_bits(tps->regmap, TPS6594_REG_ESM_SOC_START_REG,
+				TPS6594_BIT_ESM_SOC_START);
+
+	pm_runtime_put_sync(dev);
+
+	return ret;
+}
+
+static int tps6594_esm_resume(struct device *dev)
+{
+	struct tps6594 *tps = dev_get_drvdata(dev->parent);
+
+	pm_runtime_get_sync(dev);
+
+	return regmap_set_bits(tps->regmap, TPS6594_REG_ESM_SOC_START_REG,
+			       TPS6594_BIT_ESM_SOC_START);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tps6594_esm_pm_ops, tps6594_esm_suspend, tps6594_esm_resume);
+
+static struct platform_driver tps6594_esm_driver = {
+	.driver	= {
+		.name = "tps6594-esm",
+		.pm = pm_sleep_ptr(&tps6594_esm_pm_ops),
+	},
+	.probe = tps6594_esm_probe,
+	.remove = tps6594_esm_remove,
+};
+
+module_platform_driver(tps6594_esm_driver);
+
+MODULE_ALIAS("platform:tps6594-esm");
+MODULE_AUTHOR("Julien Panis <jpanis@baylibre.com>");
+MODULE_DESCRIPTION("TPS6594 Error Signal Monitor Driver");
+MODULE_LICENSE("GPL");
-- 
2.37.3

