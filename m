Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD04C636D6
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 11:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjBPLo2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 06:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjBPLoW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 06:44:22 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD0353545
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 03:44:19 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id b2so4424382ejz.9
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQj0wX+eygzuFaMxsiWrsz+U6ZlMiOOfNErdfhLOVxQ=;
        b=dT9a1BjSnHtF7DUXQlypr/DqQ2+NFXPPcaYR29pxlfO4qKw/EeqxfUO7wjUMWWaZOe
         BLX/yq2Kd3kRQkJNe8+WkYm7mTSqCBSwL8sxjDJF6zuP8PFFFdkzxCDqLjVvLlzGoTQw
         3iTr+M4ejabYYqxDAKXKKbQn72Ao+o8EXemQs6iIAdtR8u1Cwzz7MnK9KV34YUrk++HY
         C9ZsP6Jd8rTATVBDqLPaLVuYZMrLOp7DOMgRmL4DDB++xFZm9piRJLN8JVQuI7Z4s06t
         Yn+UeLzhpLaYKSVXsQ83W3Imefo8FQ4SjDjv3QTWnQI/KG/M/t+eXJMz72lT8HD099An
         FxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQj0wX+eygzuFaMxsiWrsz+U6ZlMiOOfNErdfhLOVxQ=;
        b=Ok+FDMEryPaBIkS/L0LtSG0PdcibdjF2MThfQKXl2KvuGYZQzRu3UMqpDANZ2GB34D
         55AiptBceRnHk2zGYWNQKxZuEAERil/w+1JIKuDlWic3C8ybbDPMZjemGlRZY5NlhVED
         bRpa8Erwom9MXMqkoBn2+t+jmlJ5bA+UCqAoN9OX/6FV15vTfGAJmJQ6TWFzxnnB56tx
         o86hBmRvA7p63A7J0ulgahuibkgiaO3jp/SAxwZSNnonBNoLLjiT2GxdsMy+bFB3UTeg
         fZ+mrR/dyTUDMTZMIl9Bh1sYD40ezi07TIekjIOvaVTwNzM3qaexwGHCLhqZELhwYqcT
         /lZw==
X-Gm-Message-State: AO0yUKUcf98tflNgFGt87AQvsMeIxeVnYJMcLDU1atN1/Z2bvCKbBc3a
        lhZfb2fmE2ud1M6TzUbDb8l2Ag==
X-Google-Smtp-Source: AK7set+J6UQ/ZEl1p92CJRq+oeZpufPJOl79/yrCM/zR9hJwL81ayTWQJxBCvFLfRCX+B5SyRTHNhQ==
X-Received: by 2002:a17:906:349b:b0:884:3174:119d with SMTP id g27-20020a170906349b00b008843174119dmr5850976ejb.14.1676547858140;
        Thu, 16 Feb 2023 03:44:18 -0800 (PST)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (247.165.185.81.rev.sfr.net. [81.185.165.247])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906a39400b008b14c5a82e7sm698153ejz.127.2023.02.16.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 03:44:17 -0800 (PST)
From:   Julien Panis <jpanis@baylibre.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net
Cc:     hdegoede@redhat.com, eric.auger@redhat.com, jgg@ziepe.ca,
        razor@blackwall.org, suma.hegde@amd.com,
        stephen@networkplumber.org, arnd@arndb.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, eblanc@baylibre.com,
        jneanne@baylibre.com
Subject: [PATCH v1 3/4] mfd: tps6594-esm: Add driver for TI TPS6594 ESM
Date:   Thu, 16 Feb 2023 12:44:09 +0100
Message-Id: <20230216114410.183489-4-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230216114410.183489-1-jpanis@baylibre.com>
References: <20230216114410.183489-1-jpanis@baylibre.com>
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
 drivers/mfd/Kconfig       |  10 +++
 drivers/mfd/Makefile      |   1 +
 drivers/mfd/tps6594-esm.c | 132 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 drivers/mfd/tps6594-esm.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3d2f5a10f54b..cbf7cfb70879 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1722,6 +1722,16 @@ config MFD_TPS6594_SPI
 	  This driver can also be built as a module.  If so, the module
 	  will be called tps6594-spi.
 
+config MFD_TPS6594_ESM
+	tristate "TI TPS6594 Error Signal Monitor support"
+	depends on MFD_TPS6594
+	help
+	  Support ESM (Error Signal Monitor) on TPS6594 PMIC devices.
+	  ESM is used typically to reboot the board in error condition.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called tps6594-esm.
+
 config TWL4030_CORE
 	bool "TI TWL4030/TWL5030/TWL6030/TPS659x0 Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index d2cba7326b07..ae2d404cd6b8 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
 obj-$(CONFIG_MFD_TPS6594)	+= tps6594-core.o
 obj-$(CONFIG_MFD_TPS6594_I2C)	+= tps6594-i2c.o
 obj-$(CONFIG_MFD_TPS6594_SPI)	+= tps6594-spi.o
+obj-$(CONFIG_MFD_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_MENELAUS)		+= menelaus.o
 
 obj-$(CONFIG_TWL4030_CORE)	+= twl-core.o twl4030-irq.o twl6030-irq.o
diff --git a/drivers/mfd/tps6594-esm.c b/drivers/mfd/tps6594-esm.c
new file mode 100644
index 000000000000..db242b50846f
--- /dev/null
+++ b/drivers/mfd/tps6594-esm.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ESM (Error Signal Monitor) driver for TI TPS6594/TPS6593/LP8764X PMICs
+ *
+ * Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
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

