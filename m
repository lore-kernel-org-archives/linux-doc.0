Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939225;
	b=A6uG18u8iyHtp+4HaCBi5WisI5OgP+wPowvgXOOx0xLPH3hd9ns2l7sV0au75CYWElpI
	 tWgTXo8gD730z0reb6lR7Vo8CR08HmZ78me5pW8ZO/GuVr5LwfkuuqrRS4ladLKmk5F/K
	 46azwKIAoAokd3Gfh4LYc/XVpk/S+pPXgMSoXsHh55neFTKUGJkYUy0cVq9enhZJqYrBf
	 G515xpzn0YYBfCUdIvUZ8+uIthM6gmFTwKQ+QypJ76P+U2rFk8iAqZWoV2daPxx6WwRXr
	 DWxFcSFjYlImmaIJJ0ejCTuQLHvfr4aWs5nq1lekOTpe++IVvDlT5NKrFXDgiJ28T8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IuYcK6POn3Fh+YsuRaRqnwwoF9K4vM06+qI0JevesZE=;
	b=Y+c6ulqqLdp1Wef252FFgVSVv8PXHqdVqAzMqpnSp5y5c3+oL5aSI5GyiQLVuKzmI39j
	 gZGbhzSh0Jv8UJuAEGPyQ3K+B20neyjE+yjgix2vltP2yeOkrdRkqlJnviWaWrwfVJl6A
	 PdkiXR/Y0chQuMv27yRCVpdgO6eh2qEp+fRVn1uSpDjrgAyEyKUtPn/sFuf9j5K3yVfP/
	 bOzReI0zK9yH/H12Lob70xesxqCGWHMyh02xSpDfDbt6eEdCbXeuQZaf9+2F+RYU+TRDd
	 Ww2OFc5zr/gezkx3/HPFZaJV74lP+0ZLGD+Fhvjx2S284b04GElcuxOfX7de/Ogx0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wym1GRZk;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED85606A333
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED85606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wym1GRZk
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4dbdc9592so35737b3.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 10:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939224; x=1795544024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuYcK6POn3Fh+YsuRaRqnwwoF9K4vM06+qI0JevesZE=;
        b=Wym1GRZkc21wzLnSjY5QqM5geVgDbeODScfg36VVmBeUYBnGA5iLSeSjW8LZMbEc7/
         QKHXoR7WIv62SSCBm3cNymGA/nOujkDT/QBUk/xJY/bTQJhoYJ6xn98mUnbYr5o/b5LN
         xRJH9DmsvPU94PS1SoGU0SKR/CUmgT21/m1TatI2Pjgmkj66EIxFxQeEfm/AoKVN4lXY
         qOJfIRQ3ZDTulWpHxQApk49VeCZJbqpAoy7OC/xTQil44RJ9zXD8uV1xuILEx1gVUUFl
         l6qM4Bjyj459kwPSXj/4zP43Ldm4W0CV3XTP/vFsHpgy9IU8AQ1ItSGhU1LDhJFNDGQK
         ltyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939224; x=1795544024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuYcK6POn3Fh+YsuRaRqnwwoF9K4vM06+qI0JevesZE=;
        b=eU0MQljQGjytDNNFcuFAcoBvGehL0P/Op8e+JKjkZD5wxBb6wY/OGy7LMWw4kvDGlf
         XvB4t8tJsxdXxyguSB/8qQFeeheQKMxK0dqKCB8PlXARIGRhvGTbxO2lCPiyX2kdGEYn
         5uM0i8e4NNl9/I9R//W/xOtHX5yWVpeD/ip5Ckq/SlVR4XsFAa6ep8/JD9oCvu7d1/Il
         Qhghm4utjnzqK/y6B5aYVOsFxsyfRjH6ncIj1oJTk/+6ZtmvWav3Dm7/ZMLqyGP+5HEI
         0Wr1iFlSAXCxiPhOubuHMSkF/MKXB6WuDghb/nKZ0IY5c0dC8JxijI1m1ipkMzLCXCiP
         spIQ==
X-Forwarded-Encrypted: i=1; AL+hErH/iFj0i31qT24omJFQQe8D3Jt0Brz2RpAjpUuP1YaUiWH8uHWrO2JiGAfe5nIx/7VeB+yLjf6KKMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DpaTD/EbtR+B1NKQ5mz+djtc5iceFgAhj9A4ZC7ds9qPhh58w
	LoDkOHa5+il8OFQd2/FBzXG4VeAV8hr0yp5cQ04gpGXlo6Sc3tripCcU
X-Gm-Gg: AZFdTZdgDpK3knt/JPQe5NQCaN/m/2xLiwnFHLmUBKT9mBc+jBneKu5nud/IchdrQnl
	AK80dU1CHPpNZXdK/x8TVVfB9kPbaZNMufHPvZljhTYID3qdLF/PFRnKmwtiWo1QJbKRcaeKpaY
	q0tT1/ZN5q11+epbj73I1EPK4ntrRe2VzwKtC1QzRq/3K33bvSjH9BWDgYsFS4BeffB5tLT/tX7
	+iu68IhorlpvAmoqwAPPqvjDM9yHDR063kdITasRb/ZjAT23g0zPjk2pvHi8ePnuC3Zl41G/vx2
	DjVODhZd/eTvRisgZ22ciUvHNh1JYK1bry6OTgttWRQ9a9So276ysAJFehvc1uN/0tQwRzz8cWE
	2C6aVbVZNcma39iDUMkuuhlSsrR8Mk9tC3t70NqgGvexKE2f5i+CVUgxU65JgCJLF54+2HlQYgx
	GQU95BnO6F7pfgOTrjvg5SShm0a/HF1sd++vdGIfpB7D9LONR8WV/LEWSHW8TMadXNh6XA/lRF2
	rhfoWUd9Yl5BJjCZcoAXwREb78wAQMwnx6kSUxh4L2MxOMaWSYByBDhGBEg4p8LjIeMFxzBn9We
	uv73B28KqD9jP9+LctDL5+UT3N/NJm8cLRCJN+vU7ckOomKy/6N0/JmmIKjdwh4t01qpM9k3D+t
	QFNQL6E/pGb71VfPkHSraa7t/fTkPJHMlfAL5s8lJoHjg+yVmAx3oOvF3UL8zIdHxExsJh7u60f
	OM8ludrYUrQn2Yxv/hoA==
X-Received: by 2002:a05:690c:6205:b0:8b1:60a1:cd3c with SMTP id 00721157ae682-8b4fed431e4mr442717b3.41.1794939224207;
        Tue, 17 Nov 2026 10:13:44 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0f80f1sm2669347b3.33.2026.11.17.10.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:34 -0500
Subject: [PATCH v3 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
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
Message-Id: <20261117-marvel-env-v3-7-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=+P2pTQt9/bKPVo47kcpEHymbU8gDtXJK4HPYzUH7m8w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPS495XFuGzV11U1771MTLM1Nl7Yrd3O8GliWS/Xz
 Q6TLyEdHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHONsT0jw60TO3TPHK
 tt2hH34CSH7/1Hx11fn83mlZkpv0iz9EfBopmMDJOeaU1LOX04TNjwb8iiuT9negvsl04tS9H/W
 vyXI1JsGQMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The firmware reports each change of a sensor's state as a system event
machine check. On one, reread every node from a workqueue and notify
userspace of each alarm attribute whose value changed. The notifier runs
in machine check context, so it only queues an irq_work, which queues
the work. The work takes the hwmon device lock to serialize the refresh
with the sysfs callbacks.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/hwmon/marvel-env.rst |  4 ++
 drivers/hwmon/Kconfig              |  1 +
 drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
index 02d5241749bc..4123c44fd2c1 100644
--- a/Documentation/hwmon/marvel-env.rst
+++ b/Documentation/hwmon/marvel-env.rst
@@ -26,6 +26,10 @@ cabinet and drawer numbers.
 A refresh keeps the boot CPU in the console with interrupts disabled for up
 to 300 ms per unit, so a unit is refreshed at most once every 10 seconds.
 
+The firmware also reports every change of state as a system event machine
+check. When one arrives, the driver refreshes all units and notifies
+userspace through the alarm attributes.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c0ce5591c82d..99c5d84c8752 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
 config SENSORS_MARVEL_ENV
 	tristate "Marvel (EV7) AlphaServer environmental sensors"
 	depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_ADDRESS)
+	select IRQ_WORK
 	help
 	  If you say yes here you get support for the temperature, fan,
 	  voltage and power supply sensors of Marvel AlphaServers (the
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
index 25c0ecef8e1d..622760e7ee7c 100644
--- a/drivers/hwmon/marvel-env.c
+++ b/drivers/hwmon/marvel-env.c
@@ -17,12 +17,15 @@
  */
 
 #include <linux/hwmon.h>
+#include <linux/irq_work.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include <asm/gct.h>
 #include <asm/marvel_env.h>
@@ -97,16 +100,21 @@ struct marvel_env_chan {
 	unsigned int pkt;		/* packet offset in the node */
 	bool ps;			/* power supply, as an in channel */
 	bool present;			/* known when the driver loaded */
+	u32 alarms;			/* alarm attributes last reported */
 	char label[32];
 };
 
 struct marvel_env_data {
 	struct device *dev;
+	struct device *hwmon;
 	struct marvel_env_node *nodes;
 	unsigned int nr_nodes, max_nodes;
 	struct marvel_env_chan *chans[hwmon_max];
 	unsigned int nr_chans[hwmon_max], max_chans[hwmon_max];
 	bool multi_drawer;		/* label with cabinet and drawer */
+	struct irq_work irq_work;
+	struct work_struct work;
+	struct notifier_block nb;
 };
 
 static const char * const pe_names[] = {
@@ -293,6 +301,7 @@ static void marvel_env_add_chan(struct marvel_env_data *data,
 	c->ps = ps;
 	status = marvel_env_status(type, c);
 	c->present = env_status_valid(status);
+	c->alarms = marvel_env_alarms(type, c, status);
 
 	if (data->multi_drawer)
 		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
@@ -498,6 +507,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types type,
 	}
 }
 
+/* Reread everything after a system event and report changed alarms. */
+static void marvel_env_event_work(struct work_struct *work)
+{
+	struct marvel_env_data *data =
+		container_of(work, struct marvel_env_data, work);
+	unsigned int i, k;
+
+	guard(hwmon_lock)(data->hwmon);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		data->nodes[i].valid = false;
+		marvel_env_refresh(data, &data->nodes[i]);
+	}
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+
+		for (i = 0; i < data->nr_chans[type]; i++) {
+			struct marvel_env_chan *c = &data->chans[type][i];
+			unsigned long changed;
+			unsigned int attr;
+			u8 status;
+			u32 alarms;
+
+			if (!c->present)
+				continue;
+			status = marvel_env_status(type, c);
+			if (!env_status_valid(status))
+				continue;
+			alarms = marvel_env_alarms(type, c, status);
+			changed = alarms ^ c->alarms;
+			c->alarms = alarms;
+			for_each_set_bit(attr, &changed, 32)
+				hwmon_notify_event(data->hwmon, type, attr, i);
+		}
+	}
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
 static int marvel_env_probe(struct platform_device *pdev)
 {
 	u32 *config[hwmon_max] = { };
@@ -505,7 +580,6 @@ static int marvel_env_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **info;
 	struct marvel_env_data *data;
 	struct hwmon_chip_info *chip;
-	struct device *hwmon;
 	unsigned int i, k, nr_info = 0;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -579,9 +653,16 @@ static int marvel_env_probe(struct platform_device *pdev)
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

