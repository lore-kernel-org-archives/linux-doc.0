Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939213;
	b=JLxuEj6QMGm60QVW8IvDl8qQVYrgQp+dDFkHPzXyIY7dUOySuFESuazQzIQZkhk8B+0V
	 hIurzvMpmfe+v0HmszMEMDlMZ9U9cnS2vJsdCqcBFfI4L3gsX3CWP2k9BIKqg1Dd03G6v
	 94G5mPSqng8nMsJlPlhYxXUf3nGHcljosC/lpMAa7EV79TgaXGBXzdHlAlwb4KXqi71De
	 VHBxAnGpMxhL27hQQV1qz51MlQYx/5nfr17VVoJtjQxw53qzs2+nMrwuWnmm7DuK+f8Xl
	 6/YqDWt4q9zb7nG4xzz4ejxcxkMXhtHHZv07dFabDAz5j8arco+O2ptY3/V8LJVLSOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qYI+mRtKZV9UtpxqtLIVKCpJPhMRQgiO7jm/7Ia+5NQ=;
	b=JugbLxBfTJA8pQfaAvm2CmgboFIRgOX4BdXT2RHJdqm60ec5dVAyVENkMCOVPUsQVAcV
	 HNWy9GhsatXJmoeunaFgf6Q+L6lkg7EAIGwtvgoajZB7Z6BO6BlqcmTxorEAfEqui3jwp
	 GAd/mzOzwf44vT0rN7vZ0qTovMVy4T0+WjdKpwvI4y1ufpFzQFyJ1ke/DDSt8wfrLQhaI
	 4iMNkrsQoeKuxw7Rhlqvo1IGfRg8UvmcvZnk7dURxIDDdvSLaX3goe32fku5yL3PXG37x
	 DSbntQ72co3mSk5FV0IJuKs7KJHTzKa78w0gyIS76cLXeWANCTZBYgK/eFx8Yn7epoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ank3qD0Z;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C5606A32C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ank3qD0Z
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4e04eda5aso236237b3.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939211; x=1795544011; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qYI+mRtKZV9UtpxqtLIVKCpJPhMRQgiO7jm/7Ia+5NQ=;
        b=ank3qD0ZWcEjB90MF684wTGo9+qxPE/A9EE+B5XaZk1tgwsfpsLKAB66NZ8LTD75Zk
         hyvMmfXg7NePxjO71pXggBnNbu/WPYAhKgUJhZ1veGH52i2Hk/LNsecgoShydNmmLCPs
         cl/QpeWEntG17eTsoyguTWfjL9DYLpz2C2jkMoSC6l5HeCu0dtGfy9rI69lty+vst0JD
         oJ9Z0qbo+GMWuie+YdpfwMhY5Wqz0hizujJ67KqInIMnSUBG5RBh4szvIQKqhoXze4IO
         hXDe83uuyqzFh8ca56XomKxm8DT4vV37joVIQdD+WNQz8QuPrR2wQ+vGuOguix3Kn69v
         YJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939211; x=1795544011;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qYI+mRtKZV9UtpxqtLIVKCpJPhMRQgiO7jm/7Ia+5NQ=;
        b=obLEA9mKAFUA/eUUNitlQFDduTRsNkKLY3rvnIvAVXO4+AKp6V+M8zZ4PNDk3J/fNG
         O6FoZdLTW08Lh9rb7kJWWGANJaekH4YJsyWMIDykhgTYeuDl5kIsIkJwerWAtsQxx5dv
         htNPSi9wc4xhN1rIa1D0QA0w3dY+L7LotQTXtwNAHH/AXwuNYElxh/q3T7e/sPYkeDYL
         dunBTVsfBrOXzneUH2IeNiCT7Ry/0aWeafLG6ge7DRbYmDlQR6Ou5YhdJKkj1qjM3yUc
         eivYpsxY/6z5suKeP1isPRhaIv48CJUNZ9Lw55DcaKiTlHqHAS+shXjYdXMGVHSvndPm
         gNFQ==
X-Forwarded-Encrypted: i=1; AL+hErFstCBPZHBFs77GTHkbYDCtXf83VDiQyaOu7EAT4rMaLhK3kFjt2ygptviXMrSlc4kB84Xme1Ix4q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZaOaC7L2TUrRsHyGc4aFU31rgOgOIzs3SLr8lXAFAhW5FZqbs
	vHgRyexw4hxC6U4QaQp1IvrisQMDapLNEqJaPeL6uTPzYiWd98Y3PzUs
X-Gm-Gg: AZFdTZc3zXZ/DPZy4qIU/n4qv8/MLM3NJjJH1Ey7A+IdxOR6SHnIe4GPCbXjSl2n/TJ
	MWEl0526ulLZ0QQavn8f0/g0/G6vLGqP8pQl2eWGLL1dCAibTyg//pHNz5WhdaWRFqAkRw9Yy1Z
	9NUYGB5rZ+arqAsKag4p0LjwSu/GcflQ34frYePTYqTETTRM5Gs//ujPrqWye/Qs1uTFUD3GO3J
	DAgIpAHSylzbvq2N5U63nXxJnfVlvJ/L6aWENAHwyDRABtdjpdWFvzzPOpAEvQoe39fAnU5xijF
	Bc/AsvcVa1GXjDWnXum9khBZaua0bNDlHpAZp7SVdYjLO+rUX4UuhMsLkNQyPsH2hk2fzQhH9YB
	pXIPqnTQROcWQk5UuduveWnnQmf9Oa7qoEjLgClbk6GXsBfYGEP59eDgCn5mLfWGA8vJbHbbf1H
	Biql25yPjvV8Y+6vVyVDV5liPjjAPMKFPNOgvPO7C82hIjFCfaYmmLNAOO4Mmt0g1j7h/wqVRIm
	lomna/Cl5eOeJorEBZ0xLsgUSFULJtD6Uma+BhDdzkx1KdPIrMaILBVd7p76vjF4muDcUmC/AYp
	of6tMLoNO9YzVXKl+XDCsy9a7T+JQxKRmcjb7XWsXSDqO3t9IfO/Kf2YK+xmYW1T8535tm1+jGc
	3XnmgixIYJkb6nYxdBmEcG93ufqGB2b0r634Tw/XqmM8DS7JkA23KymC+c161UWh7F/Al/Y4APz
	t+EsOsXx6aZinJpK8YjZaVP/ekjUK0dqUGnoZnWLk=
X-Received: by 2002:a05:690c:3682:b0:8b3:33cf:1fdf with SMTP id 00721157ae682-8b4fed08bfdmr538427b3.14.1794939210615;
        Tue, 17 Nov 2026 10:13:30 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0d541csm2717837b3.26.2026.11.17.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:29 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v3 0/7] alpha: marvel: environmental sensors
Date: Tue, 17 Nov 2026 13:13:27 -0500
Message-Id: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBQFf4V0bU0fWMCV/2FctOUC1/AwLTYaw
 r/b4gYTl5OcmbMQDw7Bk3O2EAcBPU5jBHnIiO302ALFOjIRTCjOeU4H7QL0FMZAaybKyhZSGS1
 JFB4OGnxtsevty/5p7mDnVEiLDv08uff2Fnja/Q0HThktKyZFCbkp4HRpB4390U4DSeEg9qr6U
 UVUoVE8ByOgaPheXdf1A6Uo8dvxAAAA
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5273; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eqBGttjSTvFfg298IibMRQsEBgA3D8rXLrhSjnbj5ys=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPR4+izn6Irb4SJRDvUuzzfxBz1mr7K7w7/ZstDqi
 jrry+95HR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNNpBMjw8TFFg2r2K
 o4n+9N5o2I8Ps7L2gFm9+axwITj65TNKg4d5vhr8CNS7Zhh7e8O/9T9b3Ys0Nrd26bqdmmzsh5O
 btu468rOxkB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v3:
- alpha: put marvel_env_state() under CONFIG_VERBOSE_MCHECK in patch 1,
  so that patch builds on its own without it (Magnus)
- alpha: declare srmcons_callback_lock unconditionally and restore the
  SRM check in marvel_cfgtree_partial_update(), as in v1, which fixes
  the build of a Marvel kernel without SRM support (Magnus, Sashiko)
- hwmon: check the second walk of the config tree against the counts
  from the first (Magnus)
- hwmon: prefix every label with the cabinet and drawer if any unit is
  outside cabinet 0, drawer 0, as documented (Magnus)
- hwmon: drop the update_interval attribute and refresh a unit at most
  once every 10 seconds, since update_interval is for intervals
  programmed into the hardware (Guenter)
- Link to v2: https://patch.msgid.link/20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com

Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  73 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  59 ++++
 arch/alpha/kernel/err_marvel.c      |  39 ++-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 678 ++++++++++++++++++++++++++++++++++++
 15 files changed, 897 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

