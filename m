Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314363;
	b=w7INo38RPjBjnI794dD+4AwfoxxpLDb6P2Udarp4tzO9autiUjCR5TGVuGj3w+e2OYRb
	 Lznc8+8IBV3l5gmpJcFDPMm+e1jTJ5s9LsIXsgTDjQq1XvgWOx9Jhb0FhGvzM2/Bfy9Bl
	 44fCOh18ZQmF1GFHgKbsI8gfYdkV2c92zMv5UDEkNhNd2FI4prfm5r/Q4tmDReAouTNLE
	 nF2T9rEBIH+zINVX+QL2aumlzCsOKfSriWDnSbeJXuDq2i5F0pV8mj65H3vhx5XUqCwlT
	 u+6hkvHK+EwKGdis40AoIjm6SiQZpJS68biqDGN9FOj0mEpbS5k7YtReMglgloN+oTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Iy6Yy7gano/rTieFyFW0+WYe6A4vyPO/l0NXu+7gqgY=;
	b=RCLLTsmpuSIC78sRz8Xwv/YrT/OlwbkIJLX4rFOba8mghKa/0UwH16Sjnl2Bw5wzl4fc
	 TQegdTqHUsAoR5+61kYcC0sZwgkvW4msgS0uAmnGzz8vBNsPGe1HCYKVPLmMCTcV8fN3z
	 b18aSxkXMGfLOCW11L1qqynhUVRoRo4hPJzy4j6DqU/CYfOr2kDt1zZaonVHUdqz5eku7
	 vPPDKl6pHKpbxD826/FdDAC3DnSLzU3PCcU/hK31TL18sVj9LbamGNYTWZkMnDnZEvbnW
	 mwX86ILUqrkgVHDEcSO6LtOtGuCKY6gihHeXclT8iNK0HtgD9S0mb8Pq0cnTazz8UcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wssMvZRK;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678560A2638
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B678560A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wssMvZRK
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1326289f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 04:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314361; x=1794919161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iy6Yy7gano/rTieFyFW0+WYe6A4vyPO/l0NXu+7gqgY=;
        b=wssMvZRKXnq3mToSipxcExedacRQ+uIeOL4oNpEyUVKE9wq7WMZ+ykvKKj6EXM3lAM
         VOCwNOf3GCoPhX2+yj2ljw6l89Hs36jRQaBIK9vyuAzCTVCfH5eTNH20L0vb7FJfxghu
         pxB90YCqnfZtTScQD/zB+CsoGrqc6T7r1VyL45apEUjJJnk0XQTuvYdrIaS+bSIflIFD
         wKR1Hik6lw80e+ulIAKNjSi2352nAb30pz+IF4dRUAUXADx2c9RJtwxooDaHfq5nLriU
         Abyc1/dqobi1wEF9WyEEpAhwbbvdUqdAFpbTLNrORJYXenU9j3oONV0t5QAHR0CcyQtG
         9Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314361; x=1794919161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iy6Yy7gano/rTieFyFW0+WYe6A4vyPO/l0NXu+7gqgY=;
        b=ztKMy+tOxR7PFiygXfsSjGK+XNj4yJhErjbFORN6MNvWiUOWlyAzoJa7A86FO4C333
         v3mM5kIcDtpYtcc6djefKH7rQvFf8lz4vshkwZLTXyq9JZhfEOYCF3IbIDxr6kUKMZcC
         k29k+NHhJABOL0xacBQdjqzfBeYVWKWmgo2/olb7bvS9tO2O+sfGQ7xlSCNTJ0qafWEI
         gh6eM60/5Vy9XwP4D4D3pxQcE6jkQOj6MArUzNc1UTf03a1jVWv/Pc1+BrYJtP28yxrR
         YliJgpxJplffMJ+EtYp4gsy0q2bHBktwaHjtFwqc29cYzSFVBkaIyQzaqXblLF2T/SDm
         Brlw==
X-Forwarded-Encrypted: i=1; AL+hErF6xiNT7DsFVc4iP7Wg0IDBFdgMjnXu33MEvV9b2E8tdNXGIV2g+cOrUjN5kfQATJudaNer66KCIRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e4XiU6TE6MkOwosALauhRRuRmBTnnQJA4M9UzGERgN99OhMg2
	U291u4uLyxqkdp2WExyFJgUXJWOUY0ycMB2Z1gveGtdUAi6Yhko5bPqI
X-Gm-Gg: AYBFou0/bXmiRIahjOceRLEnUYU4S2oXGpfX0TXJfyxqk8/G6YlgRt1QpXl8YM3ASPU
	cYmNH1xKtlKTyJ6VWE5MG4L5lmgMLdleEGuONe/86m7I8qGU55Ydm53UBpRNTeNVOFi9TewCMHA
	cilSMNLUNu7WRQmwwm4W/2hVQ16NnqlnIKc8qXQTJ0dSkXRmuFr7wtJBzWe+5fMUqAUIlSGr0v+
	wdYwP9/EsO6nyQX4A1uUckVU1H/a8EptSYZBKhWHCp3Z5SU7AI3XzSUhWV6NPsOkOjHOhxIf3+g
	GS7W/8wSpL1k017LJV/AFxo/HW9x9nx1T+WrKMigKjuxhcVG6ahEyK4nxlMLYpHuKAAH9rUfWSR
	Ix9miKRRb949g/ORAUHdEE94wD7KjIWO+3QpYb1hcV9WRJWwDQjutbJHNCwfkO6JoaFdwsEEqRE
	6phzii8PqnO4HAdlKjsb6cSzPcSY45SglUPjPMmm0AYdvrwKkV3UQYt/dCULvmUcw1hcRTAjOPu
	DPR/EZj2brjfTshIB3CzF0om+ELFz4LQu1uPq1+zAxQFMNktYYwEiEBtbM48QM9qyJLx2r9rMp/
	/EFoo6Av6YrcKDXxYIaSijMiFsTepNb8qGoVqNZ3
X-Received: by 2002:a05:6000:4692:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-4982fc495d1mr3139883f8f.31.1794314360946;
        Tue, 10 Nov 2026 04:39:20 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:20 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:08 +0100
Subject: [PATCH 3/6] watchdog: tegra_wdt: Support Tegra20
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
Message-Id: <20261110-t20-for-upstream-v1-3-5923449951fe@gmail.com>
References: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
In-Reply-To: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8534;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=C6ofaMFJfGNrTbXyfwjrWcJd443fFSoc8g6cdxu0j1w=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngSIR2YqWeukv2rf1pLwX6YZn3uE40L584a6ohgvz2
 lzuH9zVUcrCIMbFICumyGL2UOgLzzyv9xtebu2EmcPKBDKEgYtTACYyuZSRYQEHT3XdtnUHT/Vu
 8MgpfpE499j7CRP+GCecz50SLG7m0sHwT3PClP3n/fYKu6fPDHn6eM0My5kFtdJ6YqtWu6aFfju
 WyQ4A
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Tegra20 has no watchdog block. Instead, the clock and reset controller
can reset the system when the interrupt of TIMER1 or TIMER2 fires while
the previous one is still pending, enabled through the WDT bits of its
RST_SOURCE register. This relies on the timer driver leaving TIMER1-2
to the watchdog on Tegra20.

Use TIMER1 for it, running periodically with half of the timeout as its
period. Clearing the interrupt alone doesn't restart the period, which
would leave between half and all of the timeout after a ping, so a ping
also rewrites the timer setting, read back from the timer, to restart
it. The timer has no readable interrupt status, so the time left can't
be reported.

RST_SOURCE belongs to the clock and reset controller, whose driver
doesn't use it, so map only this register, without requesting the
controller's region.

A bootloader may leave the watchdog running. Take it over with the
driver's timeout and let the watchdog core ping it until user space
opens the device. Since it then runs without user space having started
it, stop it for suspend and restart it on resume whenever it runs, not
only when user space started it.

A watchdog reset leaves the PMC alone, and the boot ROM hangs if the VDE
power partition is off at that point. A following patch stops the
watchdog before the partition is powered off.

Tegra30 and later list "nvidia,tegra20-timer" as a fallback compatible
string, but they keep matching "nvidia,tegra30-timer", which is more
specific.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/watchdog/tegra_wdt.c | 164 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.c
index bb6233320579..7c2c21f90de5 100644
--- a/drivers/watchdog/tegra_wdt.c
+++ b/drivers/watchdog/tegra_wdt.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/stringify.h>
@@ -57,11 +58,35 @@
 #define TIMER_PTV			0x0
 #define TIMER_EN			(1 << 31)
 #define TIMER_PERIODIC			(1 << 30)
+#define TIMER_PTV_MAX			GENMASK(28, 0)
+#define TIMER_PCR			0x4
+#define TIMER_PCR_INTR_CLR		(1 << 30)
+
+/*
+ * Tegra20 has no watchdog block. Instead, the clock and reset controller can
+ * reset the system when the interrupt of timer 1 or 2 fires while the previous
+ * one is still pending. This is controlled by its RST_SOURCE register.
+ */
+#define T20_WDT_TIMER_BASE		0x0
+#define T20_RST_SOURCE			0x0
+#define T20_RST_SOURCE_WDT_EN		(1 << 5)
+#define T20_RST_SOURCE_WDT_SEL_TMR2	(1 << 4)
+#define T20_RST_SOURCE_WDT_SYS_RST_EN	(1 << 2)
+#define T20_RST_SOURCE_WDT_MASK		(T20_RST_SOURCE_WDT_EN | \
+					 T20_RST_SOURCE_WDT_SEL_TMR2 | \
+					 T20_RST_SOURCE_WDT_SYS_RST_EN)
+
+/*
+ * The reset occurs on the second expiry of the timer, so its period is half
+ * of the timeout. The timer has a fixed 1 MHz clock and counts PTV + 1 ticks.
+ */
+#define T20_MAX_WDT_TIMEOUT		((TIMER_PTV_MAX + 1ull) * 2 / USEC_PER_SEC)
 
 struct tegra_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*wdt_regs;
 	void __iomem		*tmr_regs;
+	void __iomem		*rst_source;	/* Tegra20 only */
 };
 
 struct tegra_wdt_soc {
@@ -197,6 +222,131 @@ static int tegra30_wdt_init(struct platform_device *pdev, struct tegra_wdt *wdt,
 	return 0;
 }
 
+static int tegra20_wdt_start(struct watchdog_device *wdd)
+{
+	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
+	u32 period = wdd->timeout * USEC_PER_SEC / 2;
+	u32 val;
+
+	writel(TIMER_EN | TIMER_PERIODIC | (period - 1),
+	       wdt->tmr_regs + TIMER_PTV);
+
+	/*
+	 * Clear an interrupt left pending by an earlier use of the timer,
+	 * which would otherwise reset the system on the first expiry.
+	 */
+	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+
+	val = readl(wdt->rst_source);
+	val &= ~T20_RST_SOURCE_WDT_MASK;
+	val |= T20_RST_SOURCE_WDT_EN | T20_RST_SOURCE_WDT_SYS_RST_EN;
+	writel(val, wdt->rst_source);
+
+	return 0;
+}
+
+static int tegra20_wdt_stop(struct watchdog_device *wdd)
+{
+	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
+	u32 val;
+
+	val = readl(wdt->rst_source);
+	val &= ~T20_RST_SOURCE_WDT_MASK;
+	writel(val, wdt->rst_source);
+
+	writel(0, wdt->tmr_regs + TIMER_PTV);
+	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+
+	return 0;
+}
+
+static int tegra20_wdt_ping(struct watchdog_device *wdd)
+{
+	struct tegra_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	/*
+	 * Clearing the interrupt alone doesn't restart the timer's period, so
+	 * the reset could follow as soon as half the timeout after the ping.
+	 * Rewriting the timer setting restarts the period. The interrupt is
+	 * cleared afterwards, so one fired in between doesn't count.
+	 */
+	writel(readl(wdt->tmr_regs + TIMER_PTV), wdt->tmr_regs + TIMER_PTV);
+	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
+
+	return 0;
+}
+
+static int tegra20_wdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	wdd->timeout = timeout;
+
+	/* starting again reprograms the running watchdog */
+	if (watchdog_active(wdd))
+		return tegra20_wdt_start(wdd);
+
+	return 0;
+}
+
+static const struct watchdog_ops tegra20_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = tegra20_wdt_start,
+	.stop = tegra20_wdt_stop,
+	.ping = tegra20_wdt_ping,
+	.set_timeout = tegra20_wdt_set_timeout,
+};
+
+static int tegra20_wdt_init(struct platform_device *pdev, struct tegra_wdt *wdt,
+			    void __iomem *regs)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct resource res;
+	int ret;
+
+	/*
+	 * RST_SOURCE belongs to the clock and reset controller, whose driver
+	 * doesn't use it. Map only this register, without requesting it, as
+	 * the region belongs to the clock and reset controller.
+	 */
+	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra20-car");
+	if (!np)
+		return dev_err_probe(dev, -ENODEV,
+				     "clock and reset controller not found\n");
+
+	ret = of_address_to_resource(np, 0, &res);
+	of_node_put(np);
+	if (ret)
+		return ret;
+
+	wdt->rst_source = devm_ioremap(dev, res.start + T20_RST_SOURCE,
+				       sizeof(u32));
+	if (!wdt->rst_source)
+		return -ENOMEM;
+
+	wdt->tmr_regs = regs + T20_WDT_TIMER_BASE;
+
+	/*
+	 * The bootloader may leave the watchdog running. Take it over with
+	 * our own timeout and timer 1, and let the core ping it until user
+	 * space opens the device.
+	 */
+	if (readl(wdt->rst_source) & T20_RST_SOURCE_WDT_EN) {
+		dev_info(dev, "watchdog left running by the bootloader, taking it over (timeout %u sec)\n",
+			 wdt->wdd.timeout);
+		tegra20_wdt_start(&wdt->wdd);
+		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+	}
+
+	return 0;
+}
+
+static const struct tegra_wdt_soc tegra20_wdt_soc = {
+	.ops = &tegra20_wdt_ops,
+	.max_timeout = T20_MAX_WDT_TIMEOUT,
+	.init = tegra20_wdt_init,
+};
+
 static const struct tegra_wdt_soc tegra30_wdt_soc = {
 	.ops = &tegra_wdt_ops,
 	.max_timeout = MAX_WDT_TIMEOUT,
@@ -258,11 +408,16 @@ static int tegra_wdt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * The watchdog may also run without user space having opened it, when it was
+ * taken over from the bootloader, so check whether the hardware runs. Calling
+ * the stop operation directly leaves WDOG_HW_RUNNING set for the resume.
+ */
 static int tegra_wdt_suspend(struct device *dev)
 {
 	struct tegra_wdt *wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&wdt->wdd))
+	if (watchdog_hw_running(&wdt->wdd))
 		wdt->wdd.ops->stop(&wdt->wdd);
 
 	return 0;
@@ -272,14 +427,19 @@ static int tegra_wdt_resume(struct device *dev)
 {
 	struct tegra_wdt *wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&wdt->wdd))
+	if (watchdog_hw_running(&wdt->wdd))
 		wdt->wdd.ops->start(&wdt->wdd);
 
 	return 0;
 }
 
+/*
+ * Tegra30 and later list "nvidia,tegra20-timer" as well, but match their more
+ * specific compatible string.
+ */
 static const struct of_device_id tegra_wdt_of_match[] = {
 	{ .compatible = "nvidia,tegra30-timer", .data = &tegra30_wdt_soc },
+	{ .compatible = "nvidia,tegra20-timer", .data = &tegra20_wdt_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_wdt_of_match);

-- 
2.56.0

