Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A031DE894
	for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204488; cv=none; b=s8Dk5Smun5PMms1I0DRxNL2vWV68xk5HA+FLxqVGUvrfsrLgDHOOHuIu2hXNyZhkGFbq35QgO0RzJSRj+9FvbRz+pOzdlOO1geVA94oKax8VDS46uwrjuhPZ8rAVKJCJeTJAkKk+jW6DK7YRGuRw3Zc55kiAKWLrdM7TBsM9FW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204488; c=relaxed/simple;
	bh=177MnobEW4AW8zxVOoT5YiyKBdemluGYegbd8Mp3tz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=STXaF1SM6Miwwi3eANGzzrFapEsmBP1ww27xCnL/GXwNesx3VAixSNzp+7JmzSw6DTzn5uKp6qnI1m38o8xMAyY570uboeumUZiRxpkQp4MqzqFtZ/2QX0rh4/1ZBUBM9JrScNvObcJBCw/L3KvtQCKd5kPviEj4vFC9Wj9LDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jm69J2k/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jm69J2k/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso130658575e9.3
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204484; x=1777809284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Izl2nx9ZI1GiQgBb28dSYIy+N6GwTm8NILzzFVKNNVo=;
        b=Jm69J2k/bmobPQHrve652/+Gy5PTAYWrtj1HAeMIPSV7oQz1Jk9EI5IdMGBD8zbAZy
         0dBVx4NhLHJGD/AAJl347tf0ueDyzEZnb9UEamQxd4ynBR+nvlDp3X2GBZCJ4+ugU/em
         wXB3Tgmpx5ukK1ijcdOl+WGtKAsEXXaC8xCSzLJYIFN9w21z0yiEfw3K9LxcISzVgTqL
         JV+jRUfal6o4Z/CMEfIlAs/TXLUG7jv3xfhVb8HCLWT7IOC0Y1SeX0+RctjDRQLhOItf
         I4e+D2lUi9zR5iC8AT6sSZKMrhzHaWEtgNtWInQwwRtMcNRhkQc2gQZReE1M0zsF0jRY
         lMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204484; x=1777809284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izl2nx9ZI1GiQgBb28dSYIy+N6GwTm8NILzzFVKNNVo=;
        b=evXnEZVmC7u18HA38wfe/Acd81018uW4EUeP7I9/4KvIgI+ukoWRnfI4v1x5IBR1/2
         0Ch9QR+BypKQREJDzDfoy7GOWhDIY/lmrHjEu3jUuTJmia12M9bwefZixSTVUiKWeUH2
         8+kiOuUYD8snbrd/EIspccIvHsef7k5szSkx8XgYGvln+f/9dIveCEjJBe0zfVdjCA8u
         oss0RheJrH1gAEEwdmWel+EQVhhncE8dqYtI8IbCjsX8cYv4+ZjAnM54xIXCATN9XoeR
         Rk64/EDRN5HNlK83Sa1iAT6wZXcp9LmSyo17hjhqA8PvKh0mpi/9STIiUoeN2AhnugWw
         wRWw==
X-Gm-Message-State: AOJu0Yw5lkQ+wW+Jy2W8lDrJBdiLZ3ef4Lj65ctUxrq2G5L/WLiO8AGd
	A2c3Y3yLRx4qqReesM8JwqIOb9vofJ1xRd3uQI9ORGEGTWIv9II1LPPu
X-Gm-Gg: AeBDiesbeza/R/7hXOQtB6xhTCphkM6LV/xs0u3Q0i7g6M5YCl1zOKUbMs/LY2YJpZs
	RKsQC8g6dB6bEQSYKxrk487r3nGJ8IQMCK401ZbugztLAxJfVP9Itf5N/Oa235nHCh17teyyfYs
	Y3SjRHsn0FQGJitQHNea3Hwsr4EN2WaPumf0AjVIOaTbVya8KtuUx+wdTvxOR2IHFvnEhWRxqxZ
	ygJKNhHvDZ6Z37utq0f4e/fn6s5u/n+KvYx9TvaPd4LhpbYpRUapqvIhJOXYDkliDoYtlEaUbri
	vJNG3WRhkQO30e9LwrMoqI2O95i5fIFsN6FUaDJc4EGMlUlVhoSWy6LP4MulleBXXxhJYD21tTy
	qNXjA4weUn2pEpg9P6VmhDhdlpQI7tq6U/p/rU7CJU+9ZMLa9+IHejSDJTEO8jxwy8cR0nvvV4e
	DrKdxZx/OlxIk8JWYgnaPtFIWDI7Y4uetfJefiUXVidjbi7Ee6c9o=
X-Received: by 2002:a05:600c:1f83:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488fb787afemr547647045e9.24.1777204483792;
        Sun, 26 Apr 2026 04:54:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:43 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v6 0/6] Add support for ZTE zx297520v3
Date: Sun, 26 Apr 2026 14:54:13 +0300
Message-Id: <20260426-send-v6-0-d49efa72bb09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOX87WkC/12MQQ6CMBBFr0Jmbc20tA115T2MC2xHmETAtKbRE
 O5uIS6Iy/fz35shUWRKcKpmiJQ58TQWsIcKfN+OHQkOhUGhsqilFYnGIIzHhtAZMt5BuT4j3fm
 9ZS7Xwj2n1xQ/WzXrdf0LZC1QkHQB1c1pTf7cDS0/jn4aYA1ks5OU/EmmSK0nrBuytZFmLy3L8
 gX2YWVzzQAAAA==
X-Change-ID: 20260416-send-5c08e095e5c9
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4719;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=177MnobEW4AW8zxVOoT5YiyKBdemluGYegbd8Mp3tz8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+zJK87ZzFTWeE6ZPEmJKpc5rt9HdkrkwJn
 cKb/Epf+nWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI6HQ//V2CFvqcKUo8t2sbKt1+Udb0dTFGutWw
 6qPFskqk9n9FU5I46MswNt0vr/xH5AzLBcs0aY9ECAf7La1JBKkrMmi1byZfW0uIP+6EJSVNIik
 PvOE8inm72tdmMbIUvIgVNBgbzRKmiLOQnd6owWDm9EeCcDI1BoBYl4Nxg/RWXcxLtZn099Ffle
 Yj1Obf8hPu25jrcIyN2IqvtAZ9YDIP/WpO3WPE9YqZvpCyrUwdyE4ebrdreAStgLVqE/SnNbKp8
 iBGLGoywv18GWY1dSmW/ElT1DvISt3XKa2cYap67qYC5UCak0AXL+++0bk5ci1LD9tFjVPE4JvW
 +sRQfQZ2MJFy8/3X4611CtOWNyIIBdN6PJUclj/Vr7Q4CqMrMO/3JHmx7YoecdhiuAug0inyum9
 iG13sUBMbQ5OyxLeElvUOTGuZpKQeBUIbSulpMzP+t9pvY2la2PbM8e5Zed82ea0vkITq19ymHg
 M7sAulSk+4OiEDyhq0LrW2iHLmdnttFKXGGk+TA/IgBTLXwoHmm8svZrRdiphyMfs+i7dy7Zy01
 hhRM+j2dT0qWnPYDdzVcFZF7x0vEhkC0h05wt9PRwltat7Q+zhfI8J8/ZUq6xyWvt9GNqVSlv+L
 YeQoRyHXOWIllF3vBTgU1J7Pns/Gnn83bQCO/PmkJHb9wvVvgtGg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

This is a follow-up on my RFC patches from January [0] for ZTE's 
zx297520v3 chipset. This chipset is popular in cheap LTE-to-wifi routers
sold in developing countries. My goal is to run OpenWRT on them. I made 
more progress in more work on this SoC and it is time to get serious 
about code review and upstreaming.

Since my version in January I managed to get more hardware running: SPI, 
I2C, PMIC with real time clock and voltage regulators, Watchdog. LTE is 
not working yet, but I am able to start the coprocessor that handles it 
and talk to it via mailbox + shared memory. Wifi is working on a few 
more devices. Since WiFi, USB and Ethernet are working, the devices can 
have actual use with OpenWRT even without LTE.

Another hacker created a free software program to talk to the USB loader 
[1] and boot U-Boot and Linux without modifying the on disk files. At 
the moment it needs a proprietary blob, so my documentation is 
emphasising booting with the on-device U-Boot.

This patchset here is mostly unmodified from the version I sent in 
January. It is the bare minimum to get an interactive shell working on 
the UART. Future patches can be found on my git repository [2] for those 
curious to peek ahead. The first 30 patches are in reasonable shape, but 
the further you go the more cleanup is necessary. I expect all of the 
patches go require a few rounds of feedback though.

My plan for upstreaming is largly this:

1) This bare minimum boot patchset
2) Add clock and pinctrl drivers
3) Add standard hardware to the device tree
4) Add zx29 specific drivers one by one: Watchdog, spi, i2c, DMA, PMIC, 
battery
5) SDIO backend for rtl8xxxu
6) rproc, mailbox and rpmsg

I am willing to maintain support for the SoC within reason. My patches 
add myself as maintainer. This is a hobby project for me though, keep 
that in mind if you want to ship a commercial product with these SoCs 
and upstreaming Linux.

Cheers,
Stefan

0: https://lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099306.html
1: https://github.com/zx297520v3-mainline/zx297520v3-loader
2: https://gitlab.com/stefandoesinger/zx297520-kernel/

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Patch changelog:

Changes in v6:
Squashed DT commits into one
Removed for-now unused board DT bindings
Add "zte" to DT patch subject
Regenerate the defconfig with make savedefconfig
- Link to v5: https://lore.kernel.org/r/20260421-send-v5-0-ace038e63515@gmail.com

v5:
Spelling fixes
Renamed dlink-dwr-932m.dts to zx297520v3-dlink-dwr932m.dts
DT binding indentation fixes
Use a manufacturer 0x8b for the UART, fix patch prefix
Declare all UARTs, remove uart aliases for now
Consistent license declarations. I made every new file except the DT 
binding GPL-2.0-only but I don't particularly mind GPL-2.0-or-later 
either.
- Link to v4: https://lore.kernel.org/r/20260416-send-v4-0-e19d02b944ec@gmail.com

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

---
Stefan Dösinger (6):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v3 SoC
      ARM: zte: Add zx297520v3 platform support
      ARM: zte: Add support for zx29 low level debug
      amba/serial: amba-pl011: Bring back zx29 UART support
      ARM: dts: zte: Add D-Link DWR-932M support
      ARM: zte: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst          | 158 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  26 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 ++++++++++++++
 arch/arm/configs/zx29_defconfig                    |  54 +++++++
 arch/arm/include/debug/pl01x.S                     |   7 +
 arch/arm/mach-zte/Kconfig                          |  26 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  19 +++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 16 files changed, 485 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

