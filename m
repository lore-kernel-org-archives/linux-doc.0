Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6333C9881
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 04:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980099; cv=none; b=qkrLgwx0sBRDq2FfI/7eLxcVxmmwlIOQVs3Td8Q1yHunUsSil1nU6RLcI9vVHShyTAQSAlyqFbyLWQm6d3nI/VOrovQfP/5odGiIro0X+SP/Cn+rTgH3XY9su4OxcJ8heCtOXLZzfZn6gwkmwtj5sfaWMQf+3k9NRZvK0IgoW6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980099; c=relaxed/simple;
	bh=oFuGc3tJiwCr2zCPxHqXkgQyb1lc5qOYN3lPOUvtDUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p70RguMBilrJkYkenWTv/rGIP/XnkpdZKgrYJq1+5OkpCpgUw92Jq0QsDOlPLdt+XYbv1I2Y7z49oYne7MR9eXSLKh+XIL2TDNIkC+Q3feShgXLyFCy2pojMIDxeX7sbluEnhWaFMPcdNyeUCzNlyHIiE1n+Aq7uJhLFiGOE5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=liHwSfe7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="liHwSfe7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf125989f2so36739695ad.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 21:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980092; x=1781584892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YK8R1SlsKAhKfLkzDqnTrpzRnHx/wAIPaeuSh5XPa8=;
        b=liHwSfe7wfvjvRBKova5RIN/XF+P4ivYD3ou7HnAdFMU3OEr+yamSiRlZWD9O6CCEw
         o8JRzPnKfN8SFl/CF3THegHhpNvh8S/qj6kQsr+4qybI2R7Ukj3RLMr1ZSbjuaPhXYgG
         7pOpd99JGvwrAfUqHuvcJlqBB1k2qaHjyOEA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980092; x=1781584892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YK8R1SlsKAhKfLkzDqnTrpzRnHx/wAIPaeuSh5XPa8=;
        b=h2I+YxDQGgLL05wStCURcYLY7IuNhyMhIhqfJ1yHRmdtWbxRTuSiW8NeDJx2z742Hg
         LuckMTpN2SoqLHUW/093oNdV6czEHVG42ElI7iM9xFgB9D5a25aRRD8KULS5/fL+cQT9
         5qWBcQhxz4gKEQ6tlIvTYw8QS/w/gxmNlb29hvDz03hbM/DM8rjw8HQKlM5rVFD2Hq2+
         W6Mr81cDw201dEJPXLG0DYorpFZdAeN3Y4Pn/JzJM1sA3yNTaLN6l0O5XOfVECqkqtv6
         vdZ2BnuDmGSzJwt20Dil0Y6Bb66A0+6vF4deG4kRo0X0AQBO1K1jQ5lLyc+ld3wV1+V+
         37FA==
X-Forwarded-Encrypted: i=1; AFNElJ8tnezGwws2jASdS+Rwd+CvTT6hztFM6HOCjLEOI8QJGbXIhkw3+xf67b4sW9q4+oE/mwiBH4wYHBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YythsW6b++hlIqluuZDu0FMKcUP137p5nm1sjUdFnuIY6grsLh5
	jshnFr6kvNuZt7j8ZjOlJg4mqrQCUkvTn3+x9aM++rX6EXaKVCQ4JVALhhfDF5zhCw==
X-Gm-Gg: Acq92OEjAVebRvwnYb7JlEWCA5WRSTnQVKplaxaRjgwQvXs4r97xJyi+JR6XSyZQ75i
	nUTTKx4bF/7bY443wHlIyEbUNLcXn020YoE3NMXEwhebjczxC/dhriu5E7ea5c/172FiuP8qVKk
	3uWiT5XVrlqZO/qYQUKykBk9hO1IgARYfqcC3hIf8cD5HoeC9RbInkIpwVDrC+Y7q807KFgSdY6
	sLFRGTWDv1yC9yR5iO2gnkmx5JLPhss/JGqI9cQh3cwQhsFg1x0wWx3rwC0wQWNaNQ3Ywj+uXCy
	hY1oo1KSj+AlKL8eu3QDfAgEuTXFyYuf3btEryAKlGQ4nIr/buAqotOSjTt73IZMo6AC5zn3ara
	BWSD4XoTZHTKXtIbMPLCpBLUfVz+dFPrmv8C4YtI2uO53gkSbQnyUkKMgEcGhMjRNSyoE3gzLGp
	nAebmUrwCVucY0LeVk08Lb2WWR6/PASblB2Gx3ONYgbk8f4u2dceDAFWIUREurOQjgQQvuVOtnU
	fVrBNcI1fjXtIJAtvpWIFrbl70fGvv6aaNyEJCLnMwf
X-Received: by 2002:a17:903:22c4:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c1e7f92475mr193667815ad.21.1780980092081;
        Mon, 08 Jun 2026 21:41:32 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:31 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 09 Jun 2026 04:41:01 +0000
Subject: [PATCH v4 10/11] HID: spi-hid: add power management implementation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-send-upstream-v4-10-b843d5e6ced3@chromium.org>
References: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
In-Reply-To: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=7125;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=oFuGc3tJiwCr2zCPxHqXkgQyb1lc5qOYN3lPOUvtDUA=;
 b=6KjYSLF9dyKRplumRGKjaPMEvPCklBGYcZiB4Fvn13XflzP0axAXOG9n0bIZfzy/jjHS6a143
 iqmFKGwB+zQAqm7GN6YR9+aEXY7KRkWGhqV02DkkcMd139gl3XmBH5Q
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Implement HID over SPI driver power management callbacks.

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/spi-hid-acpi.c |   1 +
 drivers/hid/spi-hid/spi-hid-core.c | 133 +++++++++++++++++++++++++++++++++++--
 drivers/hid/spi-hid/spi-hid-of.c   |   1 +
 drivers/hid/spi-hid/spi-hid.h      |   1 +
 4 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/spi-hid/spi-hid-acpi.c b/drivers/hid/spi-hid/spi-hid-acpi.c
index 298e3ba44d8a..15cfc4e6cc2f 100644
--- a/drivers/hid/spi-hid/spi-hid-acpi.c
+++ b/drivers/hid/spi-hid/spi-hid-acpi.c
@@ -238,6 +238,7 @@ static struct spi_driver spi_hid_acpi_driver = {
 	.driver = {
 		.name	= "spi_hid_acpi",
 		.owner	= THIS_MODULE,
+		.pm	= &spi_hid_core_pm,
 		.acpi_match_table = spi_hid_acpi_match,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.dev_groups = spi_hid_groups,
diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/spi-hid-core.c
index 698e72102c11..517f06913477 100644
--- a/drivers/hid/spi-hid/spi-hid-core.c
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -36,6 +36,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/string.h>
@@ -245,6 +247,96 @@ static const char *spi_hid_power_mode_string(enum hidspi_power_state power_state
 	}
 }
 
+static int spi_hid_suspend(struct spi_hid *shid)
+{
+	int error;
+	struct device *dev = &shid->spi->dev;
+
+	guard(mutex)(&shid->power_lock);
+	if (shid->power_state == HIDSPI_OFF)
+		return 0;
+
+	if (shid->hid) {
+		error = hid_driver_suspend(shid->hid, PMSG_SUSPEND);
+		if (error) {
+			dev_err(dev, "%s failed to suspend hid driver: %d\n",
+				__func__, error);
+			return error;
+		}
+	}
+
+	disable_irq(shid->spi->irq);
+
+	if (!device_may_wakeup(dev)) {
+		set_bit(SPI_HID_RESET_PENDING, &shid->flags);
+
+		shid->ops->assert_reset(shid->ops);
+
+		error = shid->ops->power_down(shid->ops);
+		if (error) {
+			dev_err(dev, "%s: could not power down\n", __func__);
+			shid->regulator_error_count++;
+			shid->regulator_last_error = error;
+			/* Undo partial suspend before returning error */
+			shid->ops->deassert_reset(shid->ops);
+			clear_bit(SPI_HID_RESET_PENDING, &shid->flags);
+			enable_irq(shid->spi->irq);
+			if (shid->hid)
+				hid_driver_reset_resume(shid->hid);
+			return error;
+		}
+
+		shid->power_state = HIDSPI_OFF;
+	}
+	return 0;
+}
+
+static int spi_hid_resume(struct spi_hid *shid)
+{
+	int error;
+	struct device *dev = &shid->spi->dev;
+
+	guard(mutex)(&shid->power_lock);
+
+	if (!device_may_wakeup(dev)) {
+		if (shid->power_state == HIDSPI_OFF) {
+			shid->ops->assert_reset(shid->ops);
+
+			shid->ops->sleep_minimal_reset_delay(shid->ops);
+
+			error = shid->ops->power_up(shid->ops);
+			if (error) {
+				dev_err(dev, "%s: could not power up\n", __func__);
+				shid->regulator_error_count++;
+				shid->regulator_last_error = error;
+				return error;
+			}
+			shid->power_state = HIDSPI_ON;
+			shid->ops->deassert_reset(shid->ops);
+		}
+	}
+
+	enable_irq(shid->spi->irq);
+
+	if (shid->hid) {
+		error = hid_driver_reset_resume(shid->hid);
+		if (error) {
+			dev_err(dev, "%s: failed to reset resume hid driver: %d\n",
+				__func__, error);
+			/* Undo partial resume before returning error */
+			disable_irq(shid->spi->irq);
+			if (!device_may_wakeup(dev)) {
+				set_bit(SPI_HID_RESET_PENDING, &shid->flags);
+				shid->ops->assert_reset(shid->ops);
+				shid->ops->power_down(shid->ops);
+				shid->power_state = HIDSPI_OFF;
+			}
+			return error;
+		}
+	}
+	return 0;
+}
+
 static void spi_hid_stop_hid(struct spi_hid *shid)
 {
 	struct hid_device *hid;
@@ -795,6 +887,11 @@ static irqreturn_t spi_hid_dev_irq(int irq, void *_shid)
 	trace_spi_hid_header_transfer(shid);
 
 	scoped_guard(mutex, &shid->io_lock) {
+		if (shid->power_state == HIDSPI_OFF) {
+			dev_warn(dev, "Device is off, ignoring interrupt\n");
+			goto out;
+		}
+
 		error = spi_hid_input_sync(shid, shid->input->header,
 					   sizeof(shid->input->header), true);
 		if (error) {
@@ -802,11 +899,6 @@ static irqreturn_t spi_hid_dev_irq(int irq, void *_shid)
 			goto err;
 		}
 
-		if (shid->power_state == HIDSPI_OFF) {
-			dev_warn(dev, "Device is off after header was received\n");
-			goto out;
-		}
-
 		trace_spi_hid_input_header_complete(shid,
 						    shid->input_transfer[0].tx_buf,
 						    shid->input_transfer[0].len,
@@ -1251,10 +1343,19 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 		dev_err(dev, "%s: unable to request threaded IRQ\n", __func__);
 		return error;
 	}
+	if (device_may_wakeup(dev)) {
+		error = dev_pm_set_wake_irq(dev, spi->irq);
+		if (error) {
+			dev_err(dev, "%s: failed to set wake IRQ\n", __func__);
+			return error;
+		}
+	}
 
 	error = shid->ops->power_up(shid->ops);
 	if (error) {
 		dev_err(dev, "%s: could not power up\n", __func__);
+		if (device_may_wakeup(dev))
+			dev_pm_clear_wake_irq(dev);
 		return error;
 	}
 
@@ -1284,9 +1385,31 @@ void spi_hid_core_remove(struct spi_device *spi)
 	error = shid->ops->power_down(shid->ops);
 	if (error)
 		dev_err(dev, "failed to disable regulator\n");
+
+	if (device_may_wakeup(dev))
+		dev_pm_clear_wake_irq(dev);
 }
 EXPORT_SYMBOL_GPL(spi_hid_core_remove);
 
+static int spi_hid_core_pm_suspend(struct device *dev)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return spi_hid_suspend(shid);
+}
+
+static int spi_hid_core_pm_resume(struct device *dev)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	return spi_hid_resume(shid);
+}
+
+const struct dev_pm_ops spi_hid_core_pm = {
+	SYSTEM_SLEEP_PM_OPS(spi_hid_core_pm_suspend, spi_hid_core_pm_resume)
+};
+EXPORT_SYMBOL_GPL(spi_hid_core_pm);
+
 MODULE_DESCRIPTION("HID over SPI transport driver");
 MODULE_AUTHOR("Dmitry Antipov <dmanti@microsoft.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/spi-hid/spi-hid-of.c b/drivers/hid/spi-hid/spi-hid-of.c
index ba7d5338f5d8..561cf453e44a 100644
--- a/drivers/hid/spi-hid/spi-hid-of.c
+++ b/drivers/hid/spi-hid/spi-hid-of.c
@@ -230,6 +230,7 @@ static struct spi_driver spi_hid_of_driver = {
 	.driver = {
 		.name	= "spi_hid_of",
 		.owner	= THIS_MODULE,
+		.pm	= &spi_hid_core_pm,
 		.of_match_table = spi_hid_of_match,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.dev_groups = spi_hid_groups,
diff --git a/drivers/hid/spi-hid/spi-hid.h b/drivers/hid/spi-hid/spi-hid.h
index f5a5f4d54beb..17b2fdf192ed 100644
--- a/drivers/hid/spi-hid/spi-hid.h
+++ b/drivers/hid/spi-hid/spi-hid.h
@@ -41,5 +41,6 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 void spi_hid_core_remove(struct spi_device *spi);
 
 extern const struct attribute_group *spi_hid_groups[];
+extern const struct dev_pm_ops spi_hid_core_pm;
 
 #endif /* SPI_HID_H */

-- 
2.54.0.1064.gd145956f57-goog

