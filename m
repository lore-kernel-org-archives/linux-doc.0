Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F10B37D133
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683286; cv=none; b=YdrjmkjZ9CwHKwMZk2yqwPLA/CIBX+YP5TV9x4tdEoDyJGwljO7PXV4HQQ8hDsCli8Qpm5vSZFu+PecdelO4HEJD86k2jFDnrTHTFWHkur8/HUPdpNEFjLz63g43hnkOptATt7j+z1FBZ6tO8WBAf9RpBsQMC0E6scgig0rxCdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683286; c=relaxed/simple;
	bh=Tb16IgVakmc+CdnVzLzlZmsZXBKmafpDroRRtjeKCcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GVupXBEy1nIUOXVPOkI0hJmmERMr2s+w0qB8/hS+XgTfCg56ZuF5dNF2u1XPXtFLjNJ0oNqAdwH1YF/s16LobSY7HpPQxxJ7b25jT3yPF+P6ambTE85mC0TPsalW28jGrOJE/BhbwpWibMS1wHudvHBtaZCue180QLCR78rM3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSjBagxz; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSjBagxz"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-782a16d4ea2so80159137.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683284; x=1788288084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3QyZWg1WsZH3UzmNsJ7DFfIwK6PjCgdZzJDtgoRKH0=;
        b=sSjBagxzymuaE686txZ0W7Wx2HEQ2IeJrmCy++blG5CcADv+jJhYC4WhXB2KBjd9xU
         ZvpTwdFKl4xd7gZi9jEc2/P+nppnd93HfZp/MQDKS+z2UblPAH25uRHT4+hnBeKERMun
         kgInfIlfVhmtL6nNde5E0PgGmMimibS0XofHAxaMkC6aMd04Md6yrJQvQatFFsSQfB/m
         o97QwdcfLQiX3OxI+83CrRPLRyhMj/8QD9OIMpFQABJOz5/WV8FqXWWxCvvK8ftphbaQ
         4GbWiK9Q3Fpc1vdk7ie//bUK8NhvZDKhLCqmCGW2IhgsqY00J0+upB6zYxfktPNIb/Lx
         Q7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683284; x=1788288084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3QyZWg1WsZH3UzmNsJ7DFfIwK6PjCgdZzJDtgoRKH0=;
        b=IxLRqGEXesXjHqsY5bNOaoTasOym5/1Vqlox3opy/6bluaP5qtMM4lFXQpoPV/uutF
         M30QjsXG6E7Na0T6DmcIhlY+vaN+UVMgu2teJdJcvm2OUt/RDxNoyBCKrKGizA0USDkU
         P2B7CXGF7/4GIw6mvLA0XEg7mtzzi8kvYJ2hRmBys14VpT1hzMmP0r5mWtwQmbKdw347
         Glr2mzuCvjdvPtDP4u2Zu7wQB9tgYnxZ8fl5GUd4CSfatpvip0Gr0iM2ljg14XpMOHKI
         1HLtXBxFP8z+6RheA+c2rSuforu5o2lwVQyx5Y2RmDUdSMYbgVTkYrG87cZKvhcFMiee
         YYlw==
X-Forwarded-Encrypted: i=1; AHgh+RoPJwm4DjB5ukTfrkmb/9mjGsRCraqg8V/Z771l8b+s1DanV3IO93OrLbaTiXU7r44S6sfHGWhC4mo=@vger.kernel.org
X-Gm-Message-State: AFuF++mo+ejoSNTGJlaqyMlPLYq5GEGuLX87ZEDLz1AOmQw/bWjf6i8R
	v0hzuvP9tsR6JrGo50YRTO4TMBiyHVyw/X+XR42B/Ph+2T66kq5OWnqW
X-Gm-Gg: AR+sD11Ww29pOp4ibxwEnmk0bGebJGZ3wcYFhbGvDmfbpVM3OFWwFC01jrSlU/Q02iN
	fC2Cpi2ul9vM6UpkW3/gOZhzf1RzMxz9QzN7rsvPo5L+baWsZZfaGBhd9D0QfPxAtQSPJ3lVhi2
	g+BrnLoV8l4d/ldED99k3kaV9qbPiBhmr/7P1819k9vWuyBVq+zBBVlEREdfN+EJlNsDza1xn8y
	8EgCsbxBqsF5+sNPMbz/QusGLaFA39L6hQLNP7WXhrj56uCOwvLgmdmdTyGjGZb8uvPragZhIXE
	61/Vp0BFu8k4oGUPdocuemC9ycoyR5ZzAZUJ0R0Ogrv4yAIx4sJyDKr6kSFYagb1uU+nRcJD9Qv
	x0qXh8x6IXEoUw7pNWjYIWyxNu5d5cmskpWybOiZcmUp95i2t8K4/W4tE/miV6Xs/6o+RkI0v0S
	v3Xhuet4j+q9+ZLdx1Kev25cobgCYLkfP9FM+hWv4Ac7TUdR1deTBOdXUVpbGBgiSn
X-Received: by 2002:a05:6102:1628:b0:74c:7fd8:73f5 with SMTP id ada2fe7eead31-782c07ff7a7mr381538137.6.1787683284313;
        Tue, 25 Aug 2026 11:41:24 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:452e:e094:2a4f:7300])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbb258a00sm381605241.2.2026.08.25.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:41:23 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Tue, 25 Aug 2026 15:41:06 -0300
Message-ID: <20260825184107.355980-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DMI-gated hwmon driver for both fans on the Minisforum UM780 XTX. The
EC is an ITE IT5571E, but its register layout and OEM commands are defined
by machine-specific firmware, so the driver only binds to the exact board
revision and BIOS version on which it was tested.

The driver exposes both fan-control temperatures and tachometers, two OEM
automatic CPU fan profiles, and two writable system-fan transition
temperatures. It preserves settings selected through its interface across
s2idle.

Tested on the target system with concurrent RPM reads, OEM profile changes,
system-fan threshold changes, unload/reload stress, and s2idle resume. The
settings were correct from the first userspace sample after resume and
remained stable for 15 seconds.

OpenAI Codex assisted with reverse-engineering review, code editing, test
orchestration, and patch and email preparation across a long interactive
session. I reviewed every change, ran the live tests on the target
hardware, and take responsibility for the submission.

Link: https://lore.kernel.org/r/20260818181345.203295-1-speyrott@gmail.com

Sebastián Peyrott (1):
  hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

---
Changes in v3:
- return -EIO after bounded RPM coherence retries and -ENODATA for an
  unknown CPU profile;
- seed saved settings at probe, update them only after successful hwmon
  writes, and restore them at resume without reading the EC at suspend;
- clarify saved-state naming, live threshold validation, and resume
  documentation.

 Documentation/hwmon/index.rst               |   1 +
 Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
 MAINTAINERS                                 |   7 +
 drivers/hwmon/Kconfig                       |  16 +
 drivers/hwmon/Makefile                      |   1 +
 drivers/hwmon/minisforum-um780xtx.c         | 501 ++++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.54.0
