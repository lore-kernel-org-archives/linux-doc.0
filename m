Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1F382F0B
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772518439; cv=none; b=gQZQcHIVnPJzv2+Q//GQYqmCwRzojmUq8sGQoIPfMSTfd/H2QF2GxA54Iwu4Yw3Y/jQ3nF5e9XOCABtPkM9RhIQ9KxX/D377Hx4BCzkvOqxfdGr9uhc2+nOB2sO2os/jcKVUALXbuhvienliUG1oW0DFTnZHDUE8uqPo47L8LWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772518439; c=relaxed/simple;
	bh=2NiZAoDC3alIu0louVywwr639R2HWq7OVqahJ+UY2qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwr9/R5Uiqt08gN/9g/FxHia+Wnl8dRUGPmdgZF558VcgXias7B+GnrK1+fF5BA8SqKnR8FW7JvilAwL5XngKCV+Z+rt8giGa2ZReBdljnJe023LmemiRpotuFsGtvRZITzdcko2tXhNCiLpevycFQB6sDLaeQLGSVcpkHBUIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RdQ9h3Us; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RdQ9h3Us"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aaed195901so25013305ad.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 22:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772518435; x=1773123235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUpkwHwpX2KwRPifYdo4IGj691Egz/3WoBPDe25QAL0=;
        b=RdQ9h3UsQiD6V/BKBw+xY0wBto5UiKVJhlxbU4j2Hi0qGvtksGENLY6CMtXoO7Hf/a
         6vLi9GU/Up/6BnYhGcdCELhWkcttK7UbqwQcV3l6OdPzX1/ddDbxZDP2qsLT5H62eGAi
         bfM/p/fG2e/FlZIWQAQyC2s2bgAwCkbWFdiOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772518435; x=1773123235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gUpkwHwpX2KwRPifYdo4IGj691Egz/3WoBPDe25QAL0=;
        b=oORyhxEF3eT8YcGiiK+NBmBJ/EXUGFwPi0vX4Lgm4S9GRelby7mb3kY+AvfG949y5X
         EEi0nAV1vq+P4NkT/Qk8qyV65pzP2NscX+vxTk08sWPVBuABcGpt4n+mbJVR4tDW21ng
         /i892mo0qJaM4uvcRy7p2CjTwdzS39mu1L2CUzSHZAsOfJOUFftwz9wLu4lZ+dENAq56
         9lmO0A2mj+r1zl1ekMFgDZ+rjE1nkdpLJRH7OplQEQZQdAcGLXvYto8PfpVeR6QrsC1k
         NjCWeBa1wrZLAi7wB24Pyek53cJm8Uc/41/mJcJBGT1M/ct6jxz+zM+EWz6dhJSZtBIv
         67Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWLG2GAwX5vlCCQNrWV1YUcdxnKXZPN8RGX9dvcPQsTuB17MLD9U36lWWqj6nO0xFFDQShJZGsYX18=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBHnWbeJLeRQiaTkt8NHP5maU88LRHnSK5NGi7qRJyLlTyss/
	1W/VCDf9QBIVysUfZBfcqIyeV1aSmXbbdW7RP6D73NRj+q3WnQrfFep1eWVvJ7OzIA==
X-Gm-Gg: ATEYQzzI1fREEsNnVQjsIGXc1SjvyPJvtu/C0zdnxbJFFC0pABiH7bB2ywN40ZIfrY9
	pszT0XmSN0FkL+Op5rrhQkOLY4HBH7a6RG3GIrA28dBHSLTSyNStJIX+8Rsxy5gC21K5dopfBsI
	kA9b+ARyMCsvaNIEzTMXFs0/JeYD5WuHfOE5If+ALG+rq8LYgFpzLiVQ53aPHC2UQQf3wQP0SgK
	IWFrXlfyD5ufx/+62pbHxSU7opcNwDiM2yFMWa0QHqOE98LVEaQ5AbEgbSRo4tcSOOsDkA6PCTU
	dXzl8kYQi/FoOG1vpCQlqpEr02Z8Dn0UcqU10N+ssxREyJIFP+4Ni4CI2zDo8vDGIxiXYm9+lmv
	dZd1+KAJuKqe+9MgZtXlxzdWBO7m1UKbrH6r4/cIe1DwVvnDJU9JsX0jcac+Vfb4qMp0l0L2XXg
	/zdxVRmYYq6hCqVtyVXRaO1zv/+vPRODhUxYLKv8oyceHm2aP+2jWAGKAAjChVkndNtEHVKbbzs
	uzm+rMOghHFdk3I9MBrHSlxa60FXW9wBw==
X-Received: by 2002:a17:902:f605:b0:2ae:4fc8:3f5d with SMTP id d9443c01a7336-2ae4fc8413bmr60047075ad.48.1772518434943;
        Mon, 02 Mar 2026 22:13:54 -0800 (PST)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6fe4f3sm152639735ad.91.2026.03.02.22.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 22:13:54 -0800 (PST)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 03 Mar 2026 06:13:02 +0000
Subject: [PATCH 10/12] HID: spi-hid: add power management implementation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-send-upstream-v1-10-1515ba218f3d@chromium.org>
References: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
In-Reply-To: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
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
 hbarnor@chromium.org, Jingyuan Liang <jingyliang@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772518424; l=5475;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=2NiZAoDC3alIu0louVywwr639R2HWq7OVqahJ+UY2qs=;
 b=xTK6qEpzG/F1jIuNi2IahxlTcrTi8zoxhftG8itoIwOTbVRnoTrMkT/BMzRjaNtHEQhGmbviq
 M3CBY14dXgSDE+8gnxfC1va3/UGPdCQCTCkJ+y+nSwaRTGTN4SEpWs3
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Implement HID over SPI driver power management callbacks.

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/spi-hid/spi-hid-acpi.c |   1 +
 drivers/hid/spi-hid/spi-hid-core.c | 107 +++++++++++++++++++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-of.c   |   1 +
 drivers/hid/spi-hid/spi-hid.h      |   1 +
 4 files changed, 110 insertions(+)

diff --git a/drivers/hid/spi-hid/spi-hid-acpi.c b/drivers/hid/spi-hid/spi-hid-acpi.c
index 612e74fe72f9..2c1e4de99fea 100644
--- a/drivers/hid/spi-hid/spi-hid-acpi.c
+++ b/drivers/hid/spi-hid/spi-hid-acpi.c
@@ -238,6 +238,7 @@ static struct spi_driver spi_hid_acpi_driver = {
 	.driver = {
 		.name	= "spi_hid_acpi",
 		.owner	= THIS_MODULE,
+		.pm	= &spi_hid_core_pm,
 		.acpi_match_table = ACPI_PTR(spi_hid_acpi_match),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.dev_groups = spi_hid_groups,
diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/spi-hid-core.c
index 02beb209a92d..797ba99394f9 100644
--- a/drivers/hid/spi-hid/spi-hid-core.c
+++ b/drivers/hid/spi-hid/spi-hid-core.c
@@ -35,6 +35,8 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/string.h>
@@ -236,6 +238,81 @@ static const char *spi_hid_power_mode_string(enum hidspi_power_state power_state
 	}
 }
 
+static void spi_hid_suspend(struct spi_hid *shid)
+{
+	int error;
+	struct device *dev = &shid->spi->dev;
+
+	guard(mutex)(&shid->power_lock);
+	if (shid->power_state == HIDSPI_OFF)
+		return;
+
+	if (shid->hid) {
+		error = hid_driver_suspend(shid->hid, PMSG_SUSPEND);
+		if (error) {
+			dev_err(dev, "%s failed to suspend hid driver: %d",
+				__func__, error);
+			return;
+		}
+	}
+
+	disable_irq(shid->spi->irq);
+
+	clear_bit(SPI_HID_READY, &shid->flags);
+
+	if (!device_may_wakeup(dev)) {
+		set_bit(SPI_HID_RESET_PENDING, &shid->flags);
+
+		shid->ops->assert_reset(shid->ops);
+
+		error = shid->ops->power_down(shid->ops);
+		if (error) {
+			dev_err(dev, "%s: could not power down.", __func__);
+			shid->regulator_error_count++;
+			shid->regulator_last_error = error;
+			return;
+		}
+
+		shid->power_state = HIDSPI_OFF;
+	}
+}
+
+static void spi_hid_resume(struct spi_hid *shid)
+{
+	int error;
+	struct device *dev = &shid->spi->dev;
+
+	guard(mutex)(&shid->power_lock);
+	if (shid->power_state == HIDSPI_ON)
+		return;
+
+	enable_irq(shid->spi->irq);
+
+	if (!device_may_wakeup(dev)) {
+		shid->ops->assert_reset(shid->ops);
+
+		shid->ops->sleep_minimal_reset_delay(shid->ops);
+
+		error = shid->ops->power_up(shid->ops);
+		if (error) {
+			dev_err(dev, "%s: could not power up.", __func__);
+			shid->regulator_error_count++;
+			shid->regulator_last_error = error;
+			return;
+		}
+		shid->power_state = HIDSPI_ON;
+
+		shid->ops->deassert_reset(shid->ops);
+	}
+
+	if (shid->hid) {
+		error = hid_driver_reset_resume(shid->hid);
+		if (error)
+			dev_err(dev, "%s: failed to reset resume hid driver: %d.",
+				__func__, error);
+	}
+}
+
 static void spi_hid_stop_hid(struct spi_hid *shid)
 {
 	struct hid_device *hid = shid->hid;
@@ -1155,6 +1232,13 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 		dev_err(dev, "%s: unable to request threaded IRQ.", __func__);
 		return error;
 	}
+	if (device_may_wakeup(dev)) {
+		error = dev_pm_set_wake_irq(dev, spi->irq);
+		if (error) {
+			dev_err(dev, "%s: failed to set wake IRQ.", __func__);
+			return error;
+		}
+	}
 
 	error = shid->ops->power_up(shid->ops);
 	if (error) {
@@ -1186,6 +1270,29 @@ void spi_hid_core_remove(struct spi_device *spi)
 }
 EXPORT_SYMBOL_GPL(spi_hid_core_remove);
 
+static int spi_hid_core_pm_suspend(struct device *dev)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	spi_hid_suspend(shid);
+
+	return 0;
+}
+
+static int spi_hid_core_pm_resume(struct device *dev)
+{
+	struct spi_hid *shid = dev_get_drvdata(dev);
+
+	spi_hid_resume(shid);
+
+	return 0;
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
index a20c8146230b..bc1d3c5a4dda 100644
--- a/drivers/hid/spi-hid/spi-hid-of.c
+++ b/drivers/hid/spi-hid/spi-hid-of.c
@@ -227,6 +227,7 @@ static struct spi_driver spi_hid_of_driver = {
 	.driver = {
 		.name	= "spi_hid_of",
 		.owner	= THIS_MODULE,
+		.pm	= &spi_hid_core_pm,
 		.of_match_table = of_match_ptr(spi_hid_of_match),
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.dev_groups = spi_hid_groups,
diff --git a/drivers/hid/spi-hid/spi-hid.h b/drivers/hid/spi-hid/spi-hid.h
index 1fdd45262647..5651c7fb706a 100644
--- a/drivers/hid/spi-hid/spi-hid.h
+++ b/drivers/hid/spi-hid/spi-hid.h
@@ -40,5 +40,6 @@ int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
 void spi_hid_core_remove(struct spi_device *spi);
 
 extern const struct attribute_group *spi_hid_groups[];
+extern const struct dev_pm_ops spi_hid_core_pm;
 
 #endif /* SPI_HID_H */

-- 
2.53.0.473.g4a7958ca14-goog

