Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678007;
	b=pefyRHRIeItqdDVdui2kA8cDs/pdekyFCBckj1gV1yPTMjVruRVA4ZRSDzLzG2afxmB/
	 6OJr4MdqIQTlb6l+JHOT/8vSibnLtLDvniiZqt4VxyUd5jQ+fgeS2DmchVR0KiOI6EIdC
	 uEXf89TZ3v8GtXiaK7X7WlLDmd41qBNKIpsqy2VMQdk4khWm0YOtEHV4Takd9REe9iJ1A
	 lT7sNfsGBRudV8Aom1FcGuN9UTrGpwzdg1tiIBabYnRjRb0XhBumPJjcwKbS9rZQc7svW
	 tzNhawt4ZNUiPgVh0g0q5TLXDH77Hm+PIykDAGRlx1iCGdXz3g2AX8y9z4WPlbn3/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k3g27v4he1Y35c61e7dXTzRWz7vPfzQZbMe//YhomSE=;
	b=HoriaOrH03rNK84qyhNtAQAkC0vfY7LL1EawiZfhK0V0cqeQrBOCWWHajqR+x/4KPiq4
	 8lINL/rzdtY8D2IlxU+uWPjRkmvoIlnaGCSv/H4jk9HFCHSMjHNxf3jEzeM1VvOacY9rD
	 nkfnL4rjftq0WMWi+PVyrjUOa7zN9rY8/ufgJYXPO9WNJsQ4raey1Qec6OGKAXnulsLtq
	 LGVO5grwTL2FqCxmwqzP1BmR/0U+om77m1sUDkc7fqclci9o72uV+L+jf1vYaDuJQncS5
	 I3b2uirtbvlfyyrj61e8o/anUIChhh1vukp88jgqdJg4lWacbKsAK52HGjhYG0OtINw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCH54y6K;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EF60A262C
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38EF60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BCH54y6K
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da7d18f2fso213510d50.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678006; x=1795282806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3g27v4he1Y35c61e7dXTzRWz7vPfzQZbMe//YhomSE=;
        b=BCH54y6KG4eV/fIwz6HxHdjSUaiafy3MIEreqfLtbvja5qKwC9dp8njMjfMucTwLwM
         o8PZ0jSNhahVAI9AgRxRcT3Yf5i0S3Rwpagbi9rVH7HcZ0e1Hd8DVLX+rQOOZvlGfLwo
         wBGi6noVk33eYVWYwQWsYG4/LNekxiTWL44hyJs9TKGN55EOjc0O5I0nba3UnaaKn1QP
         a4rwkh0EnXVXjV46vzAjPOu7kNISsJVqyV9mZhhm+gOf1yb555eGEXwhs29L80xJAF/c
         6tNStKC5YpMiX2AL3IRT3sDTr5l4uPPB/AvBnRD4JmrFKt46an2T00J+NuAngVRMlQw2
         +1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678006; x=1795282806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3g27v4he1Y35c61e7dXTzRWz7vPfzQZbMe//YhomSE=;
        b=pgJxycFYtQvN0AVfOgpLwZFq7hyfihpYMnOwxNoSsijTY5KMP2YB9WLUyR2C+77Azs
         ZUvObc9J/Nq2pjAt6RQL+PijJ4jvC6Tz3/UPNEmUXAGWkyl8CdhwGmxOPyxPoTnJXuJm
         jvcoDxynFqic+7LPTCFBP6TtB1fUCiAzl/SE8Sq3k7ZYkLubjsTDI84PPM7QfgdBfQp+
         hZjkB+dVogGi4EEq8AkmS744ANE787JL+6lxy6cBT11IuvbruqV0yRGfjegVqySdPJXt
         kDju7c2I0fBoOR3x3unvFzMIsBjdixFW9ZsgwLheRFW0ENCIGf4UPVWyCLNrlAV/7mL5
         f+sw==
X-Forwarded-Encrypted: i=1; AL+hErGbYFpNn2YN7HiD4r8pXyWzG9Q4GJcQl/jR2DX143IcJhSeVYjZ9i1Zomzl4sfHhgvV8kCdDjpskus=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LA/kCoNP5ik18eJck655e2GCsIXLSfRi3gscJRAKYvccPH+wF
	HOU9Afb6qtHOGj/wrbU3uztNkE6bjBPXF92VcZOmmMBgtR8AlMZ38GaEiCjC3wavZt8=
X-Gm-Gg: AYBFou2urob9kfBAOYGUltVYP3gYH1fpwnjDaU58q7PM0Ox0k6RtdOHlZ57X26CE9/J
	+0/Il2GJIALb1jGoEhWanMfeB+OkaWmA9k1ucv4pXZCHmzHzKlMcxTYGNEio4kdPnrXyxqL7xgB
	7JI1VMET3POzjl+vVo261+JxTNblL21du+wjzuVXyM86DjGcP5fvyTHmGqz5WWP3JdiZBQIp1Wu
	yAOF53ELzaK+tlnOWZQquteJBeJX4snn+sM8bKz1iXzS1ong9MtPcK/rEdNwb3DZpnbYiGk84rn
	HQvaI4RIuLcl9mnduNKBd8oV7qwGboOucjFIveeZbnFsYDizd+fDoNrk1KSnualUA4DBdQfl8ai
	OZrJvf2TayoWmrTtHtpwSylRSphsuWZvkKm9DzDIDVClLyWs/mgcNZrxKT9+JFwwvfZA06OOomz
	+Wcvbls/g8RPGsDqpw6CXNZ3aAx835FJASN2Fcrw1Wh8NtHV2/m45j9zgWnct1zAVZ2N5pJm50m
	+Al6sxE19s+d+BCSvIHYYfPRmDBTCeQW+SWHRiJwt9q+YBZdfLn+Bu0RSbpSG+vaPqIhKJiduwG
	MzVjXxtBM+9No32QThTbCUWOu7M8f9VtA3ZYFruzcsOC5UWhE67PxlL2a3SJizL1UOPVBrCSorX
	2TnlxnLluga6ypU3DqA9lfrUEmcEcRQ0ymURFbuTjg333aVOF9NvNqJYEl5PDtA==
X-Received: by 2002:a05:690e:1288:b0:67c:f37:1091 with SMTP id 956f58d0204a3-67d895a3fb8mr4087832d50.22.1794678005980;
        Sat, 14 Nov 2026 09:40:05 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5d99c4sm5363101d50.15.2026.11.14.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:40:04 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:53 -0500
Subject: [PATCH 7/7] hwmon: (marvel-env) Notify userspace of environmental
 events
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6571; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=yXiWmmjPvV0zvY4v2iJdPnpM4cSmwwNNa1BHtFeIXqE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHns9y/n+zSvg1pO95/JRGYoipm1d36cUbyNZ+f+V
 NV1cwuvdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1pZ8Z/lkz66+1uh
 Roq6i5vnr9+cpJB034ZwXmys3plIqzK05c9pWR4ZjHjeLwP9otmznZ65fODL+/kIFVopHxXOi6R
 T7fHzhm8gAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The firmware reports each change of a sensor's state as a system event
machine check. On one, reread every node from a workqueue and notify
userspace of the alarms that changed. The notifier runs in machine check
context, so it only queues an irq_work, which queues the work.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 Documentation/hwmon/marvel-env.rst |  4 ++
 drivers/hwmon/Kconfig              |  1 +
 drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
index db36127c3805..f88feba7bfe4 100644
--- a/Documentation/hwmon/marvel-env.rst
+++ b/Documentation/hwmon/marvel-env.rst
@@ -27,6 +27,10 @@ A refresh keeps the boot CPU in the console with interrupts disabled for up
 to 300 ms per unit, so a unit is refreshed at most once every
 ``update_interval`` milliseconds (10000 by default).
 
+The firmware also reports every change of state as a system event machine
+check. When one arrives, the driver refreshes all units and notifies
+userspace through the alarm attributes.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 50a1bf966f30..6d17c2e89a7c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
 config SENSORS_MARVEL_ENV
 	tristate "Marvel (EV7) AlphaServer environmental sensors"
 	depends on ALPHA_MARVEL || ALPHA_GENERIC
+	select IRQ_WORK
 	help
 	  If you say yes here you get support for the temperature, fan,
 	  voltage and power supply sensors of Marvel AlphaServers (the
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
index cdc7e059e17b..3dd2ea658fa3 100644
--- a/drivers/hwmon/marvel-env.c
+++ b/drivers/hwmon/marvel-env.c
@@ -11,13 +11,16 @@
  */
 
 #include <linux/hwmon.h>
+#include <linux/irq_work.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include <asm/gct.h>
 #include <asm/marvel_env.h>
@@ -81,17 +84,22 @@ struct marvel_env_node {
 struct marvel_env_chan {
 	struct marvel_env_node *node;
 	unsigned int pkt;		/* packet offset in the node */
+	u8 last_status;
 	char label[32];
 };
 
 struct marvel_env_data {
 	struct device *dev;
+	struct device *hwmon;
 	struct mutex lock;		/* serializes refreshes and reads */
 	unsigned int update_interval;	/* ms */
 	struct marvel_env_node *nodes;
 	unsigned int nr_nodes;
 	struct marvel_env_chan *chans[hwmon_max];
 	unsigned int nr_chans[hwmon_max];
+	struct irq_work irq_work;
+	struct work_struct work;
+	struct notifier_block nb;
 };
 
 static const char * const pe_names[] = {
@@ -226,6 +234,7 @@ static void marvel_env_add_chan(struct marvel_env_data *data,
 	c = &data->chans[type][data->nr_chans[type]++];
 	c->node = n;
 	c->pkt = pkt;
+	c->last_status = env_status(n, pkt + env_status_off(type));
 
 	if (n->cabinet || n->drawer)
 		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
@@ -460,6 +469,72 @@ static const struct {
 	{ hwmon_power, HWMON_P_ALARM | HWMON_P_LABEL },
 };
 
+static const u32 marvel_env_alarm[hwmon_max] = {
+	[hwmon_temp] = hwmon_temp_max_alarm,
+	[hwmon_fan] = hwmon_fan_min_alarm,
+	[hwmon_in] = hwmon_in_alarm,
+	[hwmon_power] = hwmon_power_alarm,
+};
+
+/* Reread everything after a system event and report changed alarms. */
+static void marvel_env_event_work(struct work_struct *work)
+{
+	struct marvel_env_data *data =
+		container_of(work, struct marvel_env_data, work);
+	unsigned int i, k;
+
+	mutex_lock(&data->lock);
+	for (i = 0; i < data->nr_nodes; i++) {
+		data->nodes[i].valid = false;
+		marvel_env_refresh(data, &data->nodes[i]);
+	}
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_hwmon); k++) {
+		enum hwmon_sensor_types type = marvel_env_hwmon[k].type;
+
+		for (i = 0; i < data->nr_chans[type]; i++) {
+			struct marvel_env_chan *c = &data->chans[type][i];
+			u8 status = env_status(c->node,
+					       c->pkt + env_status_off(type));
+
+			if (status == c->last_status)
+				continue;
+			c->last_status = status;
+			hwmon_notify_event(data->hwmon, type,
+					   marvel_env_alarm[type], i);
+		}
+	}
+	mutex_unlock(&data->lock);
+}
+
+static void marvel_env_irq_work(struct irq_work *irq_work)
+{
+	struct marvel_env_data *data =
+		container_of(irq_work, struct marvel_env_data, irq_work);
+
+	schedule_work(&data->work);
+}
+
+/* Runs in machine check context, so only queue the irq_work. */
+static int marvel_env_event(struct notifier_block *nb, unsigned long action,
+			    void *unused)
+{
+	struct marvel_env_data *data =
+		container_of(nb, struct marvel_env_data, nb);
+
+	irq_work_queue(&data->irq_work);
+	return NOTIFY_OK;
+}
+
+static void marvel_env_unregister(void *arg)
+{
+	struct marvel_env_data *data = arg;
+
+	atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb);
+	irq_work_sync(&data->irq_work);
+	cancel_work_sync(&data->work);
+}
+
 static const struct hwmon_channel_info * const marvel_env_chip_info =
 	HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
 
@@ -469,7 +544,6 @@ static int marvel_env_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **info;
 	struct marvel_env_data *data;
 	struct hwmon_chip_info *chip;
-	struct device *hwmon;
 	unsigned int i, k, nr_info = 0;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -534,9 +608,16 @@ static int marvel_env_probe(struct platform_device *pdev)
 	chip->ops = &marvel_env_ops;
 	chip->info = info;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
-						     NULL);
-	return PTR_ERR_OR_ZERO(hwmon);
+	data->hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+							   chip, NULL);
+	if (IS_ERR(data->hwmon))
+		return PTR_ERR(data->hwmon);
+
+	init_irq_work(&data->irq_work, marvel_env_irq_work);
+	INIT_WORK(&data->work, marvel_env_event_work);
+	data->nb.notifier_call = marvel_env_event;
+	atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
+	return devm_add_action_or_reset(dev, marvel_env_unregister, data);
 }
 
 static struct platform_driver marvel_env_driver = {

-- 
2.56.1

