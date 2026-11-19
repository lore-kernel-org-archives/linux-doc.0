Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047003;
	b=IF1XqsDVYv5dIJHrpUuQddMbVrUrjtHvQIZIDxWGG2mHpr+/0y3VFiBY8PFK35Oi96jr
	 q7s71cx/a9weevt/7iPR05c+EpuAHXVm/mv3BJa/LXTr0UBBiABojNAFqwJFWxcy8JhiD
	 Kds2HGKtumqyXcmbX1siGeqJr3qUL2//SaPaKrbw6pcGC9LR5uuUraYyA+v5no4QTnnwa
	 pa13nzkJHyzbQEDuYerQwn+XnmMDrzlr/+/FSXJ/sxR5GPp/6q7nSyybw8DFxJtElLM+H
	 vq6Lqy62r8puAHvAtyO90Dj2L2cVqNjKyMgNJKMf8fzds8TxgJKX0DmvUTh2tgziIOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
	b=oi096yMr+KjyLxKtnq+f2Cy14MimZmZup3NmlRFO1BghERsA075yq20sTFjKxgrh0zus
	 kCsYumPUE06zI/V0DeSKBpmXCVkJRe3JU+I49s5a2bdXTYH0Iznq2hBgaXPJydTwCJ/gI
	 oAADIpChJn7Z84/CQuo5y5yd5i4IRm31kGmXznTAMACHoz4AV9HIBOhc6mopAq0eAFsDZ
	 G8I3Kdq9qEDOn5Xgt9Ak5ejXKTYm52PviPSLvu0NYNkisLrq0tAA9fI5Hl/uABQC82HJ2
	 gfmoqqSLUcVGPiYO4Gncv3gWULOpG3/FONl+jxl7sO/FiYOTZnmOMfDHi7GZHR3VqzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HssYh2;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D58606A33A
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 00:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D58606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HssYh2
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4fb5d96b3so6787287b3.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795047002; x=1795651802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
        b=T0HssYh2SSHWHrSuOXQ97kVsD2vAdVHgdABDUZORdNsFg9hXotQCamW/b67k/LRdkY
         oPNq9O5RP9TDGOiVLO0O4j1HRnwaVJWs1ZlddnurfTtbfZWfOrPxrjc+0lQ2SoF655d9
         6fEcL8IpZcxhUdfl5+ehGszFQO2SrXLc2gJ4gl0k6GQM9/IfWfEYfCpwBLqteoTV2uAF
         VCNiWOSYS9GcYMZ1jrlPR9zXjMrrArSEPtNp/VLAo+ExjzvrVBguWhGL8qqxUVD84hC0
         vZCLwQuSg3afgF/hvvz8fm0zMZ4RLnDfYZfxMQojLt+S0F3GMlFk8iDbOEXEq7W50LZr
         pVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047002; x=1795651802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
        b=h7bpROMzAXBni326oc2wVvG76Ov9oKq9zfx9NV6nZEWMjhN/UqiX+sEVcLspF9dM9T
         Xkq0dpkOoYnTa6OhRyP7gRNNMzgGv1EAFgurlyQtxi8A+VgKMuMPy+PmdN1GeJcc9kMK
         htSfQKdORKJ8relapzeZi46GaSvrVDdPSBcb6GXuxzXsOr58CKAac7wuC5KfOCR2sCvC
         YWWkGLqZ/UGMmeBquEIWjbDeL4UdWtzp5MSyfUGM+84GtdgchcaS8xgakuilfY4BBtln
         JUhNAUb62YdVzC9i2QHQBPpeuob6+r3cAOdFokP2wBSBo0CLgr4h8zSW8P5FTYqkBt45
         ApnQ==
X-Forwarded-Encrypted: i=1; AL+hErFalk5vgYw3BCF2cAJem2axu6DLg13axz7yufwSlVi08eD8gOALPntq9RSzvSE8lpdnFLWHnjhmOz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D5v2jslro3jOGfrcbhFVufz84TtI3mNczhBOPgNkVKeoSqwXe
	fQ2RWzphXHpaOsHTacXxB0/O+2A/mfCx9b80uU44tQl+CB1vXnSTeCbyVympUVnZ
X-Gm-Gg: AZFdTZfriFPKPrsrBycTF0IONHfCK+m10tAwCP8fKBukWwmfa2GffddI3iPOhjKQn4K
	a1KtiPU9eo8W18TRiGD9hU3K60/cPLPcGi1Vy+qbQHuO/qMPfWgvg6ZQecfAF22RiQQ6Sc7vgCD
	9TLz5IekJbnFGmn4HBn9i6KHMSyDfL7cDJRQ2X9D7aM+cKpGi1I4+060sgXj2ADvlOvkmBfZCte
	7IfAiLJ6tp9gqxHgFuu6DRbIt67A1FzFhEPQTDLWWshoA+ErVKZnaWpj8KHvkmhBZcj7/f/jky+
	yv8yZJzIdDWPeiP9m57A1nMxGAgAm0F5MEA07HyKSZOwsc14mQ43LnJDlMl7ATPSiGEQOsgqYmC
	WohyE69eI3UCEqH6Wy0mPsTEUjzDv1caVxocdE1UOPMytaNlwGkjwkjRj/C/TM9e1Y1zzRsVV0v
	0tEbbs0ccv43GeJZK8MehtaScUgoMBYwAfnGx3WUccc5CndLsptcZRrYug3xL2/zfGf51naI75p
	wYcGlueB9F5pD2sm6XOEqYmnp6sjC8DswqWKHKXccocEDWBV5eYythnMG5nL7o8ega6gK90fL4l
	RULh3H8eUBtYnQS3GzRz4PFJ2YEFkcdGcMId+tN8cbw/cb+oL9CLJx9dgT0DQFHLnwqlPKEfoop
	qnnqdZ8Vivw+ziJcTl+1FeW5Q6F2i3I0m7RhQrh4XdlzH0Nf5IuhB66FY79hnU9ZpN2rdutjizS
	8ZNAf6G4urZfs9I4cDAA==
X-Received: by 2002:a05:690c:4990:b0:8b5:2a0:606e with SMTP id 00721157ae682-8b513d44ceemr1089987b3.18.1795047002245;
        Wed, 18 Nov 2026 16:10:02 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0eb8d2sm25158667b3.36.2026.11.18.16.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:10:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:52 -0500
Subject: [PATCH v4 7/7] hwmon: (marvel-env) Notify userspace of
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
Message-Id: <20261118-marvel-env-v4-7-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=qZd97RW9IxalQgdmkxJLFmDFqrpkV05FcdnVxnLWCBQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XlJfX753nl10dmpc/37opgy38RU8HLwzZXRzH0o5
 7um7sTbjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmqjQjwzXlfz//+G
 2/+rxfSsn6Z13/ZyXf+qtn9s7I1vfYqv3lxDlGhitpGw5KN/FuDT4dXvhbJfDZri2+WzMu+h198
 euZ6X6FajYA
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
index 8ec3dd7c0b23..effa70b3b35b 100644
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

