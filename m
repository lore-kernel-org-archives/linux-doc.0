Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554376;
	b=ixnpgqe79TCpK7mzh5p/e/ew6mDtOydriMeFv+RDWObQKHeDLoslz4u9X4jXImEFsMsP
	 LngCeZ096Lz27x+lve2wZwGNF91gUDDCiNDqf0i/2CpVnZAM1TR1FO//BvzdCtfVG86WX
	 tesxBpMYzRvvIxodagBHt5d+WpGf2H5QIDpYyMdFIIOJAe8aApp7K1suYsF5pQjQ5ePHi
	 D+qPqLjy2HDloBCF0xqfHpZEqfAYsPDhng/AFDDYyAM+SWuBQv5fmOBpJDaK83kMjqKJj
	 wWLMJpmxROLnjyQE7Ch4OqlTYohl6EHicgZTzYwYDUViCJ27d5ODzChVqHWW/72vU6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rz9cXwSdrIyJkGKwTLKEziA5VeFet9zhVgH+uApk5dg=;
	b=uizzX++A+m8JX5pckJpCLQzhPk2DkwzSJXMXHdlZ2pUy1GnOO9rozdeZGh1XLUkxGtWj
	 dGs5z8I5jyK8jjVZqFIdDxmaAqGu5Uj7rafsJax0BVtfvvlqAXsGPtuzmMhzWdN9IxXQ8
	 p3v4ezGUEEpaMIvFVI359f7WlQM75KS4TzoApFcM+7DDkVh8RT96Ez2/CyOG8hgnE6d9M
	 yASaCE/4ZjLvAT/Gob010AgMe/T5Sb2nqwmqHU/QSSUePMT4vEicJ4ik7MocwMzaI+rpa
	 W+2QAGLAmq13G5QmM+VA+9TEXR1RK1CpmjjBdJFws3JBYxp9K7uJ3MxaMGc+K0AMDmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBMx8mG4;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A989606A326
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 21:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A989606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DBMx8mG4
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso4975274e87.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 13:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554374; x=1796159174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rz9cXwSdrIyJkGKwTLKEziA5VeFet9zhVgH+uApk5dg=;
        b=DBMx8mG4eYblBXo/XBW6v/IeuxqOAFfzjTNYQexTVYZaEvGSIOooL9Qey+mRSD4ve1
         2UPPuq0TOyt4yZrh92966E5Pn+LVARENCz+Cp7LeBuGkbXPbd2PHax9NqlakbHIHcirW
         S3EJ4AcgFr1rvvYxrAoi0ozfiUkpzHznANVBM7iPNu5XpZ3bMcjGcmWSy8lqteJny2//
         1eYoL25MVWny0JgncZI1quQUjp4DnK3ZPCtuC/oarxBWmQtgTJDyzasMmlbo/no1BEmI
         V2Gu4UBlaoP6SsfD/vNK/wmCjAVtRzkVHSZvpELWdFIBG1uDjwk8BN5bkINvxbjtyQio
         UYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554374; x=1796159174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rz9cXwSdrIyJkGKwTLKEziA5VeFet9zhVgH+uApk5dg=;
        b=fsRBG5lFd6pH8SA3FN7gIXaHv25eIMYWc6s3aL/nbu5z8ig9eKU+iei51Dk529NeCu
         tKSIMQJB6Y7Xk0jurEd2xmUdJBpWKdsYIQRWaMEr6rr7Q2BNB5Mvag4iTt1+/yiVZj9Z
         A5m7emkwiA8zQpMg8ZWg+v86p/rHrzi+6HB3YJwm1EdBl365iTkg6WKgDdqPSO1p4siJ
         mU+6V3rvzhJZoB1+ZVKHxpM6BLBo9fNsLgdRAm2LyDchvRu9YvmXnZjfgWKDo/JTF1Qr
         dttd29TyaRKDxpU3pbbKe8veiHaokBo8pAxoCh0euvzrLo6ZpNof8WG18rhrDVG8XkZz
         smTg==
X-Forwarded-Encrypted: i=1; AL+hErFhrbAVU4+zXc3KZ5gc3kElusjGUmlkdE5ufRe+rcWzHrG+zPNFi6+lzaG5NC+78TvguQJ6ueH84k0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kcBpT3HoTG1vyPFfrS1Nwy+sEuTJWKpVE1M1ha1KFxG8q0+SV
	xI6iWB7tcvehSusehjZQUA6ga3A5OqV2hKYsmtzodE2LmYxqqMFo/s9l
X-Gm-Gg: AZFdTZe71O91GoLm7KdNV7NRyGY6eZfq0kRwqPnHxwCaKQ9sFH6AXoVOa2cCTwgXW9i
	y586+DD/eFU8DKuMPPsXx1a3/jkZqm2DU/VGv7XFbaY0u1ij1NdexCWUADGJLCgvgtxFjLT0xjh
	mF1speLFMK6IaL6WTnB7rwUY2ZdaJ5b1huKBCUyoI9dmPOe5pvgdi+f4LGaTGnjvjE3YBDpZO08
	UviJyy9p/e9hI2Dh6UIw4F9YPrR2/xW1ag5hsW/o5Cl+w77gaCgZGzK98AzMTE7wmE6iv1mREgq
	IrSDbw406FSR0d0CAD46PLIwz1d3IRyTefb6qENWZIZyvnEK5SincE9I1RUrbvf8wK8yIYGKcgc
	A27j3UIojw25zXsTak5Ixqx7NQIZMSn19DByVkglNIfoyC/QGZz1hLAdD4yaNVOhSnzfUklo1Zf
	LIdJu+T+cOlIOgs0BpzA/SWQjmVE1+JhITBPz7Dsiz9Rqf0tH7rZrixX+dBj6tCmEJT3AeFz81G
	QP6DvOlmy+kLc5OQX4+FThu9pcwJ7/9M+v5Rq/XyQVvYzwaUecRTx/G3yVQ03D/oEGCW1omTAw9
	6nxFa+FnqjgHeFEKlmUEU67Eifn4+ZCMB5P3e812
X-Received: by 2002:a05:6512:1585:b0:5c1:4cd0:16d6 with SMTP id 2adb3069b0e04-5c1bc9055eemr4215243e87.65.1795554373444;
        Tue, 24 Nov 2026 13:06:13 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:12 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 0/6] watchdog: Add Tegra20 watchdog driver
Date: Tue, 24 Nov 2026 22:05:58 +0100
Message-Id: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2XNyw6CMBCF4VdpZm1Np3IrK9/DsIA6wBihpC1EQ
 3h3A7pzeZI/31khkGcKUIoVPC0c2I1QCn0SYPt67EjyHUoBWukMURUyaiVb5+U8heipHmRi8sb
 mWYpFYeEkYPLU8usgb9V3h7l5kI27sxc9h+j8+/hccO9+PKp/fkGpZGr0JUmMSbGlazfU/DxbN
 0C1bdsH9xERBcIAAAA=
X-Change-ID: 20261108-t20-for-upstream-497bc765188c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6648;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=DR/VcPZhN2+mqYyrN5IGtMQShQopJZHsyrrHEo9QXW8=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrH6c3kW8X68xaHdSycdqJ0On/Ez9vjne6eOU82++Kj
 Lf1Jq//d5SyMIhxMciKKbKYPRT6wjPP6/2Gl1s7YeawMoEMYeDiFICJNFkyMsx6fkp+X+vses2c
 YPZ3T6PybFXF7RP+HIr0vq/c87v13meGP/z8H2slrj5s+Sr98tvPx3z/tQ7L2zc8O2HyNq+Gc97
 bCg4A
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The motivation is to improve recovery from kernel hangs, which have been
steadily driving me to the doorstep of a psych ward for a few months.
They are rare: some happen at boot, others while using the tablet for
something real, like reading PDFs, browsing the web (to the extent
possible without working GPU accel), or just using it as a thin client for
another device.

All my attempts to find even the slightest hint of what went wrong have
come to nothing (the device just refuses to hang with UART connected),
so this series is born in the hope that it will finally enable me and
others to catch those bugs (using the watchdog and pstore).

Tegra20 has no dedicated watchdog block. Instead, the clock and reset
controller can reset the system when timer 1's interrupt fires while the
previous one is still pending. This series adds a tegra20_wdt driver for
it, which takes over a watchdog left running by the bootloader.

Tegra20's boot ROM hangs after a watchdog reset if the VDE partition is
off (for normal reboots, this is handled by 8f0c714ad9be). The series
offers two mitigations:

- By default, tegra20_wdt stops the watchdog for good before the
  partition is powered off for the first time, using a new PMC power
  off notifier (patches 5 and 6). A watchdog started by the bootloader
  still covers early boot, until the PMC driver comes up. After that,
  opening the device, keepalives and timeout changes fail with -EBUSY.
  Booting with tegra20_wdt.stop_on_vde_off=0 keeps the
  watchdog running instead, at the risk of the system hanging instead
  of rebooting.

- Booting with tegra_pmc.vde_always_on=1 keeps the partition powered
  on, so the watchdog is fully usable, at the expense of higher power
  consumption.

This has been tested on ASUS TF101:

- with tegra_pmc.vde_always_on=1, the watchdog stays on. The device has
  been running for several hours with no issues. Suspend/resume works,
  and the watchdog keeps working after resume, both when only the
  watchdog core pings it and when user space has it open. The watchdog
  resets the system both when user space stops pinging it and when the
  kernel crashes, and U-Boot and Linux boot normally after the warm
  reset.
- with the default settings, the watchdog taken over from the
  bootloader is stopped when the PMC driver powers off the VDE
  partition. After that, opening the device fails with -EBUSY, and the
  system keeps running without resets.

Another series for fixing some other issues with warm reboots (not
related to watchdog itself) will follow shortly.

Patch 5 is flagged by checkpatch (WARNING: ENOSYS means 'invalid
syscall nr' and nothing else). I kept it as-is for consistency with the
existing stubs. If this is not desirable, just tell me.

---
Patch 3 depends on patches 1 and 2 and must not be merged before them:
otherwise the watchdog driver conflicts with the clocksource driver over
timer 1, and the clock driver helpers it uses are missing. Patch 6
depends on patch 5.

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: clamor95@gmail.com
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>

---
Changes in v2:
- Add Tegra20 support as a separate tegra20_wdt driver instead of
  extending tegra_wdt, and drop the tegra_wdt match data refactor
  (Guenter)
- Access RST_SOURCE through helpers exported by the clock driver
  instead of mapping the clock and reset controller's registers
  (Krzysztof)
- Validate the heartbeat parameter with watchdog_init_timeout()
- vde_always_on now has effect only on T20
- Leave the watchdog core's state alone in the VDE power off notifier,
  which raced with the core and leaked its references (Sashiko)
- Refuse timeout changes after VDE power off before changing the
  timeout (Sashiko)
- Fail pings after VDE power off, so that user space finds out
  (Sashiko)
- Document that stop_on_vde_off takes precedence over nowayout
- Document the parameters of tegra20_wdt in watchdog-parameters.rst
- Link to v1: https://patch.msgid.link/20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Artur Kowalski (6):
      clocksource/drivers/timer-tegra: Keep Tegra20's watchdog timers free
      clk: tegra20: Add watchdog reset control helpers
      watchdog: Add Tegra20 watchdog driver
      soc/tegra: pmc: Add an option to keep the VDE partition on
      soc/tegra: pmc: Add a partition power off notifier
      watchdog: tegra20_wdt: Stop on VDE power off

 Documentation/admin-guide/kernel-parameters.txt |  12 +
 Documentation/watchdog/watchdog-parameters.rst  |  14 +
 drivers/clk/tegra/clk-tegra20.c                 |  60 ++++
 drivers/clocksource/timer-tegra.c               |  40 ++-
 drivers/soc/tegra/pmc.c                         | 160 ++++++++-
 drivers/watchdog/Kconfig                        |  11 +
 drivers/watchdog/Makefile                       |   1 +
 drivers/watchdog/tegra20_wdt.c                  | 413 ++++++++++++++++++++++++
 include/linux/clk/tegra.h                       |  16 +
 include/soc/tegra/pmc.h                         |  19 ++
 10 files changed, 733 insertions(+), 13 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261108-t20-for-upstream-497bc765188c

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

