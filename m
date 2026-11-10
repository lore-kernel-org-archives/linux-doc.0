Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314358;
	b=corIhzo5YHbNCGAdaDO5upHLKPrKyCwALBVssbHHSVgXeMg+T0/JA9e/9kYgzWHS3adx
	 slBjyPPVVJMVeqEwAnoCYlKf+UliXrI2Xt/BBQj5tMhyw6pb6307szMv8MYHQICda7l5q
	 I7EaRUx07WT2wjFtjMV6aJnOjJrCko6KnIYeFMH7Z1HRzCOB7aQ3bRhaHGhzn2unGzunT
	 H5ows44348Et9HTLDq4mgInBTvrm9x1Rqd9WCCzpBx5ZE3T41/R694Kph7UGsWkbVP65c
	 Dq/5d1Nz0sSBoBu58DOxfkT8M1ZBuXKEjYlVNN0k8vxc+Uwf78evA84TyVPtM3ZGM2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OZA5SPU2mRDufyjwAtelDUROJpCDjs2VMU42+tn57Ec=;
	b=tBznwHobcAYJV6EuvJLV/OCVjppORTaJwt3mq1jeD49LNzeRi9f/KxM9yltXd4/0pteb
	 0mpJ/WexjiZTAMAjghYQDd4xheMiA/INhvFvb4/2zy4GQfyGyaGnuR0Zy/yVcQ82Wry/i
	 6ZG3OFCKCXp8eNJQs9MW6t4L+uDXyLhZ8kC11HMLrY0fy0Fx+ahYvpIPZdz+Zv+rf9vLY
	 rTx1iXj6wUmpVG7JbAPL+lKnwEJEevYzxHacpmtaeeH29fI/zDnR4V5aJ2W/KhvuUNKBz
	 sju7FEzxi0KhVR5bnchuOA/Fgm0bxxO1c39/y9fWUuW1oc7MmgL6GE26oAe4NWpWS+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz8+8w+j;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AE9606A321
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07AE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz8+8w+j
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so22512905e9.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 04:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314356; x=1794919156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZA5SPU2mRDufyjwAtelDUROJpCDjs2VMU42+tn57Ec=;
        b=Wz8+8w+jVziIDfWNptSTmLnFeI93h0avw0Xiq7bpV40LNJ18YpCROGSGMGCIUQcE/c
         CBymg2LEgIOQ5/0hNk9V/WgjGnzjFnfBX5e+ZVAdJit6StFgI+DhR/+5Fc4SH2WEw+MQ
         YRcLKRxwa6citZXQZtQ9j2d8GDdziuibjASNrPOGyeWtan8aeTbp4lgTDegGyxLojmqe
         gAk5QyD0Dx0lZwXLu112ruyhSPO65s8W0B3gNZgc+7DpMWNUnvQEe48JE+s6+P27E8LV
         5VJXXrWtFeLIHio4EH7SHZbadXfxLVjxZqNrdQduM58c/qKLRrRuzZNJMZF5+d1gmpYX
         bucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314356; x=1794919156;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZA5SPU2mRDufyjwAtelDUROJpCDjs2VMU42+tn57Ec=;
        b=ECFOiP0QHZT+nWfHKM3is/LedYWrSVx8uCDjmKL6pTexB3LXW9e+OOMQVmEJKrOBxo
         4s1yyrmQKB38ApNXaMnF7tRFNr7wkpTwNkQLUqr/bYP9X6P4SrwyqLxq0mfGUAUw5wWG
         NjLY20wK3VKhwu6BwB2OvG3loCHs1Z27mYQgVONAzw4tQy8bXqoOv6+JvARmnUZRPz6r
         GyMVOOYf1GCVQSaWCoZ/TU16cLZtJCkn20myqDCXS/tG2D8jag/CqQO6Qu7bBdRXzRlQ
         +5e0r8IPiC7/0AuHdzf+Sl37RxfcUdoRuA5Y8haw3v8txvibYLn/lxBKprLXgK9/Klt5
         dFqw==
X-Forwarded-Encrypted: i=1; AL+hErHV33aHFMGPgGyuLaSeEqlZmGAMBzU0DalzU+ZQDGrgij6ozYRP6e/zAwdVfJLp438gTrLJWFSDjkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D3S7DZ0CzR3wGIeIjE1uTwvyWkqtWWL+DruL77Rn1Su5ORNFb
	+4g/ltxHF7ge+GxIZv8v6esrS0JYS4K31mnsA5l2vpOCjmPCin7u7nI/
X-Gm-Gg: AYBFou03VMxjT6CHq2NXYAD885W71gnJWZGTcwjBPxKIyIPMbbSJipjZmnWeTtRWu+o
	LD/+Y0+mS/22TaFleBY6UDR1pKsC6ujDiP+au6UA99l+3ip1OENwDycuAnR0NCrv5JfP8lwys6I
	eg2pQ3R0rQMAMcxb4FzWImvJq6A6r8dhUkvab6k51mnCM/GZSf1ZfLjiYwi3CeUq4weq5utcYRV
	8boAqL86N7wQT50rz83PqpM4h+Hv8PWUzDGW/vobKAO6URTjT2RkswKWTvldMGawIkpu/+U8Cpb
	jpETcrz+lB9vRg0gg4iUvsbrgTUiQVFf0dmOCn9aw3ot93ldJ4By6qprkLK+Jhj+ej8mbF8EmlA
	6L6o058RCDZLJ5dw1F7lWRdZ+a1DTJzmjfxq8Ftf1TnGz7VFdv13hdDjNJzMG6e17pFHnQeDsn6
	ifLvAc2t8anCGHPXNWPGecQWnw6snbP5kyBS0twBoh5Hti+Li6xaOahBnHQim/eaKUCxCJ7TbOD
	3e3P2ETywR48oPirfoQKLM2byS0H7+Hqqomp53xyvemrDoqlyJPR/bduR9y8drCT0SheKyQ9x38
	LwuZiQq5upQtplB9dBIRptuqaF9kSoyA6e6U1X47
X-Received: by 2002:a05:600c:4f48:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ba0234bc33mr47799765e9.24.1794314356334;
        Tue, 10 Nov 2026 04:39:16 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:15 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 0/6] watchdog: tegra_wdt: Add Tegra20 support
Date: Tue, 10 Nov 2026 13:39:05 +0100
Message-Id: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBAF0KsMf92BJGgbcxVx0capjmBbJqkIp
 XcXdfk2b0MRUylItMHkpUXnCYl8Q8j3froJ6xWJEFxovXeRa3A8zsbrUqpJ/+TDqRty1x59jBk
 NYTEZ9f0rz5e/yzo8JNfvg33/AB/jS+l0AAAA
X-Change-ID: 20261108-t20-for-upstream-497bc765188c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=T2iP2KMR8ZGTOcw9sKv5YtssoUQpg/rlCJarXcwIR1M=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngUKDBQlPouvfurE4vZo4c4ayHdOLveyN34S/hf1b5
 vvjG9/GjlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRCbMY/lkt7jy9ep5b//s5
 13bo+Ty3sFBZl7xDW27x1P7A/4fyguUYGQ5JnmK9k3Owbsa6YpU8v4rilYZJK78fMlrlnDOzcrl
 3ERMA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The motivation is to improve recovery from kernel hangs which have been
steadily driving me to the doorsteps of psych ward for a few months.
Those events are rare, some happen at boot, others while trying to use
tablet for something real like reading PDFs, browsing web (to the extent
possible without working GPU accel), or just using it as thin client for
another device.

As all my attempts to hunt down even slightest hints of what went down
have fallen fouly (device just refuses hang with UART connected),
therefore this patch series is born in the hope it will finally enable
me and others to catch those bugs (use wdt and pstore).

This series adds Tegra20 watchdog support to tegra_wdt. Tegra20's boot
ROM hangs if VDE partition is off after warm reset (for normal reboots
this is handled by 8f0c714ad9be). The series offers two mitigations:

- By default, tegra_wdt stops the watchdog for good before the
  partition is powered off for the first time, using a new PMC power
  off notifier (patches 5 and 6). A watchdog started by the
  bootloader still covers the early boot (until PMC driver comes up).

- Booting with tegra_pmc.vde_always_on=1 keeps the partition powered
  on, so watchdog is fully usable at the expense of higher power
  consumption.

This has been tested on ASUS TF101:

- with tegra_pmc.vde_always_on=1, watchdog stays on, the device has been
  idling for more than hour (heartbeat 10 s, pinged by userspace every 8
  s), no issues encountered. Suspend/resume works. On timeout device
  reboots normally, u-boot still works after warm boot, Linux boots.
  Tested both with userspace opening watchdog device without pinging,
  and by crashing the kernel (panic=0).
- with tegra_pmc.vde_always_on=0 watchdog is permanently turned off when
  the PMC driver powers off VDE partition for the first time, after that
  userspace is denied opening the device with -EBUSY. No issues
  encountered.

Another series for fixing some other issues with warm reboots (not
related to watchdog itself) will follow shortly.

Patch 4 got flagged by checkpatch (WARNING: ENOSYS means 'invalid
syscall nr' and nothing else). I kept it as-is to keep consistency with
existing stubs. If this is not desirable just tell me.

---
Patch 3 depends on patch 1 and should not be merged before or watchdog
driver will conflict with clocksource driver.

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
Artur Kowalski (6):
      clocksource/drivers/timer-tegra: Keep Tegra20's watchdog timers free
      watchdog: tegra_wdt: Move SoC specific parts into match data
      watchdog: tegra_wdt: Support Tegra20
      soc/tegra: pmc: Add an option to keep the VDE partition on
      soc/tegra: pmc: Add a partition power off notifier
      watchdog: tegra_wdt: Stop on Tegra20 VDE power off

 Documentation/admin-guide/kernel-parameters.txt |  12 +
 Documentation/watchdog/watchdog-parameters.rst  |   5 +
 drivers/clocksource/timer-tegra.c               |  40 ++-
 drivers/soc/tegra/pmc.c                         | 158 +++++++++++-
 drivers/watchdog/tegra_wdt.c                    | 330 +++++++++++++++++++++++-
 include/soc/tegra/pmc.h                         |  19 ++
 6 files changed, 540 insertions(+), 24 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261108-t20-for-upstream-497bc765188c

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

