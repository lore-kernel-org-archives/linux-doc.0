Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677992;
	b=swuGN/obnTM2VDueQUGW03CNgVsXAuyhDkZrSa9YlhpHAubcYPTkDDtFu5oqDHnc25cy
	 wTGT7b1u4fy6EDZoOzdbuJVPAeatLEfNqQna7tNONSnRZ45FYw0hY3iX90QMpPTgOpttR
	 cn3k1LEtX8a+T3kneSdNu9MX/BD2nbMEEDZf1ta+9i7QzlXANo89Sd61ebiSbdwVCHLt5
	 EWc/1D5jjz7FKMnNKr0qkoe3x4OJEPH3CAXeCdTb7/WU+VD8fNO/CNAXTilfjy8eJ6uux
	 7Mw5RbK2emoEftl5AzTB5N64YtJqns7cSyvcY3CdeNXMVpcQUeOzYnbmMNUE2xhbGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
	b=KpaZXgVy2kSL3ejZ9aXSB8E4Hgo9iQOUAPzUjUjaphea4INWQjFhOyZYp81B7aF73iMw
	 7SjpfIwjd5ON3oRpxSWRlN9LLqzNDnpNmF5MVwBt7Xu0z4SDx2XJhve3b58Mwz31eJGVP
	 fz6TnKtqnAqJWd+Fic8VcXpjSPvFOVUiHISFXTQOgAkpa2mp3wmcsdN7+p78cju3vW5p/
	 +neb5MrZgh/KvZbTsRG4zBKsICTWu5qymfNvSPzz0b98lr72DVdcrIvDIGytCSKMquHnU
	 gespOnlssNzM5zeWmOSLn3sDGQlubGmHiSvzT8sR0WGhtDjkgLvjmKi4yBrjOIAwhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQSU8uV;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDBF606A323
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBDBF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTQSU8uV
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4a2688f96so24064367b3.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677991; x=1795282791; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
        b=lTQSU8uVsfdWtv5lFWi8oI96fpZ7chFSLTW1MkdhL2aJM/YWp0P8h8pJQH3FsIMGuL
         9tqgmuPMG1HHCbeNdpj+ZsyiAA03hdYCisY04HbNyU9h8VomIWFukyO/rcQUSDYJPc4X
         v6Vu4vfIFHSXQpg3rzDf9M62DuDOPXw/99EQRXowFGIASxR278XNQg2O4d7JiXJjZ1j3
         UMapZXz6AavCH5LjAoySZTpN62kZ6eWeVaKyAfr7afZItxTqpHS31C0dC3tALYAASwmW
         OPgqMPsnyop+TOt1J35ozAw8FytaUL0YPubxz3YhO7TpLBTQWd0mkrjUJWmysRDDrpV+
         qi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677991; x=1795282791;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XZ4jEuzVPhQxDlu9ccpWTmq5Uzqra9S6JEfPfNphmHc=;
        b=dTzH9P1krVGLamWrMxmRfK+vu2wuvQ+11snrGmpj7x87CM3KIp5t/CdnXbStl0EXmM
         FPLEQQ6fo9a6uKCL0gjzzhWBkiwxu62U2wpWOZUuj+kFFn7s+YOaLsgteTrwDGUAsTIn
         YUdGvkgfy7mEX1D5j5ZM5LLwoxthLKuXVTHWU2BjCOalJFL56GtK7zOiZywq6PfixCjQ
         uBGY94k0F+BIXbtYxhCBSEuTv/fVbUVWcGNkSkMREqnXyU1rxzwShLAGblP6vzHVTZxJ
         43xA/C+QpBPm4cyvD5TECcmEunmBLwWCO/RaTMlpXmBBDM6/mrn3D/Q+9ENXjq9/Cn1E
         dvrQ==
X-Forwarded-Encrypted: i=1; AL+hErED6m4CtkyvZfjUwEf2tOyLSqkyiND7ye+tkad2Fg17ug2e3WJsENAFNuNqDr//aGGDrq7p45zV3go=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8PTl5jL7rh/EPohuoIIEGQVjxMwjSMw0Zoa1gtKBDEQ+reyq5
	3qhyhKEHkU1uMc9Rnv6YZguvaajnMIlilh1cpkvYKG1s4+1i7tzqQI9c
X-Gm-Gg: AYBFou1npjSNq02uDn+jIZVvdn8vMoK23TYplRmeaQ38fUtIJG9giZsSl2Ek+go8xpD
	JH3wNS/O4Pmv+WUcKkArQsQXuTdRC9ncz9HlWW9ardA0lo5ZhARe2IHvLxFKAbu+kUQmQGsWtv/
	kOGXI7yw+o4ON0EEpWUyzhKFURcLJCh4nlDNFbLAV2Od2FcqkyNbLqSr9ee52C3ehWjpKO8VZnB
	yEXXdb4Q2eEZFSJMufo016bdeEdeze95o8erd6fUElZmK/FPWyKAP35bVzxObDqaWWzNjP+y/A5
	ycrjBe5IlhpkvR8QopipKJ0Cm2sFDgIVieTckxJ0znUx4bDVlBExWBmeBCXwdQ2EnQgLkw8FyiQ
	fBmuCLJbZ4DUeJyJ2XuM5ixMqGDF2rhWDjrcMTK9G8uK1lz7o6zXW5vhs4ms9lMOt9FxzSZRGyZ
	nLsCOZjFPPSvM4t626qiK6T7S1M85TwVi++6Zk64fdrgWIQWxsgAmeHo0o0r5gbiO55U/C0KfK9
	9gOEPcichukcjdH3w0D1uF6flU1PwGkOrBkX5UVfsICF9X72Sr8501nX1hJe+6kSuctiGgd0K/w
	rVxG0wxgCACDJAvjJ+59XzTG3rs5EnW/O/b3szDvbopsqyVjvLCJRWaTFGyZLJe2M5TFRDCKQ0m
	pKkS4PutWh4PSUEprs3h9vC1TFDDcgMXbGoCXkDh5aDsIlikStQP3Ode87gYDOCk=
X-Received: by 2002:a05:690c:f03:b0:88f:ccf7:25d9 with SMTP id 00721157ae682-8b4aa2f4a19mr36899437b3.60.1794677990741;
        Sat, 14 Nov 2026 09:39:50 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm47674277b3.43.2026.11.14.09.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:49 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/7] alpha: marvel: environmental sensors
Date: Sat, 14 Nov 2026 12:39:46 -0500
Message-Id: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXRVvxdRSyqBiOUtDQScXfF8
 lu8d4FDS+igii6w6MnRagJ4HIEelRmQURcMIhEZ5zxli7IeZ4bGsy4RRalzmbVKQgg2iz2d36x
 ufrujnVDv7wHu+wHOhOJ0bgAAAA==
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2461; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=RmT7r+x1GuIUeyBqSvzPUTJFmGQwU2dkow/VD15WaTo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnMtu/Z2ta8jT+qZZPfi+980fYr1zhu/aEyEaenk
 udant9+3PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXpNQy/Hc4faLU+0
 xn/RY7N77NCzWu13abzV9y/MfbQwFJ5+TXu/Iz/I+3P5U3SVjrr9gnsYdmfMKKK9qqRQqXf7q4K
 md92c1X2/kA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, and patch 4
registers a platform device. Patch 5 is the hwmon driver, which polls.
Patches 6 and 7 make it reread the sensors and notify userspace when the
firmware reports an event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply alarms. No environmental event fired during
testing, so patches 6 and 7 are only build tested.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (7):
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      alpha: marvel: notify environmental events
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/marvel-env.rst    |  64 ++++
 MAINTAINERS                           |   8 +
 arch/alpha/include/asm/console.h      |   2 +
 arch/alpha/include/asm/err_ev7.h      |  16 +-
 arch/alpha/include/asm/marvel_env.h   |  17 +
 arch/alpha/include/uapi/asm/console.h |   2 +
 arch/alpha/kernel/core_marvel.c       |  59 ++++
 arch/alpha/kernel/err_marvel.c        |  39 ++-
 arch/alpha/kernel/proto.h             |   1 +
 arch/alpha/kernel/srmcons.c           |   3 +-
 arch/alpha/lib/callback_srm.S         |   1 +
 drivers/hwmon/Kconfig                 |  12 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/marvel-env.c            | 633 ++++++++++++++++++++++++++++++++++
 15 files changed, 840 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

