Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554380;
	b=RrjdZ+L9EuJJxmeFzR3O3PSjag0pFLq+QK4DPfyU8EY+U+f6p+S1bCezuwfve/eQ78+q
	 N9h0Gq/rrJXiKE+U4Bsq9HBhFoLXX7h3q4qn5gYUNiFhv6e6MLiP8OhG7S5X5I8BMHRX8
	 Elh2KACOLy7bQ/AW+7ztPLx7I27TXCgIz7a2+6GzXWQrXf1RHQgP7g3yVLpHq/wUG2TW5
	 507CTk1TBtMZ0pA7Ysiz1NGmeqaoDXBly28P9Fxonf8dwi1MInIqy4QwgSei3fF7BRxAl
	 JB6bEOHw1w4yVH5R56FGBRMKzpoPMD4zEEj/rbAKtwq/7qSBgqxhAEbHBN4yANXLTRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ji5DBvHMt9pEPGCAjXMKV7F4pZO8U3K9gVXBlfCjXhU=;
	b=NANMotZA8eSoaddSFJHTtTi74VnxIRhoPIjDqq6oDnPoWxmHnP3S1CNobKJhNREIlqG4
	 v6FzA4c42G6kkFCT9vOVvgRvZYFqtLgMCpk9wxWgthn9akkp69yyUsjqOJDrdz+iwfcs3
	 +o51EWsI7cUgyz8/OnO4FgqMUeqAF2Bz/1WEDAWK4ZPXPC+M6pSFb5ZJ2btXcsSrHWFat
	 KIIcw2n0F9OOSmbxioIlWeCpvCxgjP8GLSlo3YQ0Q+t30fADRICQRNdL0F+4zGNmEsiSP
	 STrVKEothfEZino+h8+cUyOTVyDQx3FgCphUcnYn7d3y/3zS0SMsXtB2Gq+uFredwGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmRHwFwT;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EAB606A33A
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 21:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EAB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmRHwFwT
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so43673501fa.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 13:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554378; x=1796159178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ji5DBvHMt9pEPGCAjXMKV7F4pZO8U3K9gVXBlfCjXhU=;
        b=OmRHwFwTSawmkAFTR+o9w8xLXrxw7BfrpxHcwbaPH2om110faqBJfdN3CDbluszpla
         MCCatk5dE0MmP31YcqDqerFj7VzrSmeoQ6UgRoURqgJbg3tvTLPK3sSHdU/txDIRzCu4
         /GDjSoJKo/n24GC5G2O3xTy2o1Jtjv7zVzLyAuBAJv9beFIE1vfwsOt7NyBDlWl2262K
         3jpc5jYMz3F0/PWkbQMuGx027L6vwwl4AYy7Ust8JJ1H86hY7MfeHndyAAgKBq8YT6Xx
         RYm0U9a09PQznO/2YrgqaRGylyoTDIPFFo5eISmZgxcqnYgRxiuzqEN8CegtQ1Uz5d3X
         DXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554378; x=1796159178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ji5DBvHMt9pEPGCAjXMKV7F4pZO8U3K9gVXBlfCjXhU=;
        b=o0+vNnRYVWCeCAnrfvXZIeIzXVoHBz9HIXQk7d4EAJeu4DvWC++kpoWeihoYyCWcQf
         TeqieIa10vbFlvHNamybqcPmCgOOsPgnaLKftvjpsgL+fWb+U9t/qN4Y7iKIOX8IbhTn
         JHKBmPJtC4RET+/isoYX/E1H32zb7ul+S+V5WefGNZBm5Tv/Ry0WQ1DWK78RhJdUCQK9
         hmSXL8aEp5d7kZqu8m8j1EVEdAZn7mJ1D0CsQrY5p7JLbaAGZXP4k1xoQP141nFbHEaq
         4zauNEpj6zeGwbwZpYhcKBYg7F/OV6/RV78hYT3hpaPmMnRqZrwIqiIiFdnh9+TJ2Lyj
         vc2g==
X-Forwarded-Encrypted: i=1; AL+hErGDjguapXKMkUQixCyUyLJOdB172vn98N+ll4sydLVG9qgaCA6KUXFoaRUrI+Sb3TrLiKeIjrhsab4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E1YRRuYDMIJsdunGBHKTpOO2xjAxrF+5IuTASngpA2VazLkF7
	AKONlb38HZvbCY/RXP7G9qgGAybc501oR/IUHGv15dr+Bzz2AF24vssm
X-Gm-Gg: AZFdTZc1jE+Uf2vrsWe3A/BLKuutHrfgO8eIIp/O5DVGkh/CfEwH4VzjmTtlT8ObMUC
	5+y4Zxdz7Fyzvig8Al289KnOZTs2SCqSrGrjnYSg7TFVw8T/LB8FWZ4FlzUZqnYyRNY0LeP/Pr5
	PiiL3tJ0odW2zHc+/b9UvLM/OxFh8Ycof6yrybdTxklvU0T4bVI18B/R4A+ADyT+zV89g9YDV8K
	RnOiCsMvdgSsKZw/itmiqGtT6yLfV15mdeFT6bBECvOt2i2YQVvQ3n/zbR3AA+sqtQBPi3h8QoM
	+gR7MetaIBtV/VICKds7k1inTJ5qhpxhJ9ljA2PM4wbISqGKjW+IiUOQG/ilRj9x0Dd+yQsLCcW
	oHmHemYGbMteFw1cb6tDbcUosqX2udmw0O0+gwOYW65ZOdMAuqtkO3n1aPWpoGinoNl7tBUtMC3
	3VGCPHpUsNRK1h5/UJwhDItLrFVDci7DmPhQtIAIHFEMekwuY6GwI2C/NfDzKXhwzqeaYhcpMy3
	fmavF7dM86sFeaL7/c69S676xkpmGERhPtY30g21HHKxVLDQ9G/9JDxveIRp/VI3DrFTq7e99Id
	yoEvq10y+yPQO5sjsDDxb4xciUr2YUVkuII4frkTd7NoRjOEy9v48WPK62xcxw==
X-Received: by 2002:a05:6512:6886:20b0:5c1:57f6:2a55 with SMTP id 2adb3069b0e04-5c1bc7c3c66mr3363374e87.22.1795554377996;
        Tue, 24 Nov 2026 13:06:17 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:17 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:00 +0100
Subject: [PATCH v2 2/6] clk: tegra20: Add watchdog reset control helpers
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
Message-Id: <20261124-t20-for-upstream-v2-2-440116846f97@gmail.com>
References: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
In-Reply-To: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4485;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=+8ECPpoBhBW0hO7OEab5QMQVuU3PE8Uce0sGxdle7g4=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrHyeRq/9eFy1l7my/tM1WqGl1Z97lTWrt5WLJtTJck
 53fVWp1lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIkw/WX47x8tyL+yytPIy11a
 Kfvdl/hrn3zd8jPyLZO0PT8mGgvPZmS4XB5k9yasIFor3eenj+i31uqLax4F7PLmZFsh/rxibj8
 7AA==
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Tegra20 has no watchdog block. Instead, the clock and reset controller
can reset the system when the interrupt of timer 1 or 2 fires while the
previous one is still pending, which is enabled through its RST_SOURCE
register. The clock driver doesn't use this register otherwise.

Export helpers to enable and disable this reset with timer 1, and to
check whether a bootloader left it enabled, so that a watchdog driver
doesn't have to map the controller's registers behind its back. The
read-modify-write of RST_SOURCE is serialized by a spinlock of its own.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 60 +++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/tegra.h       | 16 +++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 9da82dd7965ba..4b2e0e4540a5c 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -17,6 +17,13 @@
 #include "clk.h"
 #include "clk-id.h"
 
+#define RST_SOURCE 0x0
+#define RST_SOURCE_WDT_EN BIT(5)
+#define RST_SOURCE_WDT_SEL_TMR2 BIT(4)
+#define RST_SOURCE_WDT_SYS_RST_EN BIT(2)
+#define RST_SOURCE_WDT_MASK (RST_SOURCE_WDT_EN | RST_SOURCE_WDT_SEL_TMR2 | \
+			     RST_SOURCE_WDT_SYS_RST_EN)
+
 #define MISC_CLK_ENB 0x48
 
 #define OSC_CTRL 0x50
@@ -132,6 +139,8 @@ static struct cpu_clk_suspend_context {
 static void __iomem *clk_base;
 static void __iomem *pmc_base;
 
+static DEFINE_SPINLOCK(rst_source_lock);
+
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA(_name, NULL, NULL, _parents, _offset,	\
@@ -1164,6 +1173,57 @@ static void __init tegra20_clock_init(struct device_node *np)
 }
 CLK_OF_DECLARE_DRIVER(tegra20, "nvidia,tegra20-car", tegra20_clock_init);
 
+/**
+ * tegra20_clk_watchdog_enable() - enable or disable the watchdog reset
+ * @enable: whether to enable the reset
+ *
+ * Tegra20 has no watchdog block. Instead, the clock and reset controller can
+ * reset the system when the interrupt of timer 1 or 2 fires while the previous
+ * one is still pending, which is enabled through the RST_SOURCE register. This
+ * enables it with timer 1.
+ *
+ * Return: 0 on success, or -ENODEV if the clock and reset controller isn't
+ * Tegra20's.
+ */
+int tegra20_clk_watchdog_enable(bool enable)
+{
+	unsigned long flags;
+	u32 val;
+
+	if (!clk_base)
+		return -ENODEV;
+
+	spin_lock_irqsave(&rst_source_lock, flags);
+
+	val = readl(clk_base + RST_SOURCE);
+	val &= ~RST_SOURCE_WDT_MASK;
+	if (enable)
+		val |= RST_SOURCE_WDT_EN | RST_SOURCE_WDT_SYS_RST_EN;
+	writel(val, clk_base + RST_SOURCE);
+
+	spin_unlock_irqrestore(&rst_source_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra20_clk_watchdog_enable);
+
+/**
+ * tegra20_clk_watchdog_is_enabled() - check whether the watchdog reset is enabled
+ *
+ * A bootloader may leave the watchdog reset enabled for the kernel to take it
+ * over.
+ *
+ * Return: true if the watchdog reset is enabled, false otherwise.
+ */
+bool tegra20_clk_watchdog_is_enabled(void)
+{
+	if (!clk_base)
+		return false;
+
+	return readl(clk_base + RST_SOURCE) & RST_SOURCE_WDT_EN;
+}
+EXPORT_SYMBOL_GPL(tegra20_clk_watchdog_is_enabled);
+
 /*
  * Clocks that use runtime PM can't be created at the tegra20_clock_init
  * time because drivers' base isn't initialized yet, and thus platform
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index f1034e14c1a44..2c88b9c78d88d 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_TEGRA_H_
 #define __LINUX_CLK_TEGRA_H_
 
+#include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/bug.h>
 
@@ -195,6 +196,21 @@ tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
 }
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_2x_SOC
+int tegra20_clk_watchdog_enable(bool enable);
+bool tegra20_clk_watchdog_is_enabled(void);
+#else
+static inline int tegra20_clk_watchdog_enable(bool enable)
+{
+	return -ENODEV;
+}
+
+static inline bool tegra20_clk_watchdog_is_enabled(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_TEGRA124_CLK_EMC
 void tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
 				    tegra124_emc_complete_timing_change_cb *complete_cb);

-- 
2.56.1

