Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D7433E73
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782798; cv=none; b=oqcZCWbb9pOuyEzN6gPO/ogYQR9KaBz8Cny9b8yAFBk3kJa7zLepoEbWV5XlxqXVWI9QgshDl4d6JRKm1v/Fm9/2cTslqReDmfOVMXASbDRL3ZP3vmgrDhOXSrSQ7ZmZxjqULvLdXTTn2HHatI5YvuN4K4bzPeMnrqSEXDD1DcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782798; c=relaxed/simple;
	bh=0sp+LL+IGp3ZeyY6XJr568Go26r/gnOE6u+jQgckNpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gpe4sr1trYJOQLzw3cwwq+thCcVWsfO3QFnibajfYlOvcrMJ1hNvM1Qnlz9+8iXnaKd6TUIMneBbjv9F8mbDM0/dk+ARSMWOdpmx7TOKi3FIcJcGW8fvqVa21YPhV9SC7MxL+70CCeausYDW0+A6i+TVPB0L5cpGccBScRoCH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtiWCcJ1; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtiWCcJ1"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso2051403a12.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782794; x=1786387594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ZonO5ix010aZzRGfU9+z17NRtx4Moy27jaGI8Gtqd4=;
        b=WtiWCcJ1dMGefiHkoGPJxGnoo2rL2L+r9eQtl4b/pLivlw3//HDY5stvljTTRo4q1+
         JIKFG3lpKnIBI7Yf1E/K5IV90D/L6/DB068cnzDkjuDrg5Gdej8Upq4ai2K+wc13qqP0
         DupWL4Hwa48gw1gLAmfA2uB32aISp+bFR9rSNCFG+RfuWaZTPx5bEXtGzsEtwzUfm6E7
         704JPJ/LxzHhOWB/0TEvzNzaS7+fdMm3c5w3J7EE4RH52ukbx/fvJjSPRXghZZCPil26
         kWAGJ+anRGjbHi73d6KPPGEtsvyeRtdtRsnPZ/NB+OAIJRNu+GHVfEZgrEVJTkMOlpqw
         LcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782794; x=1786387594;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4ZonO5ix010aZzRGfU9+z17NRtx4Moy27jaGI8Gtqd4=;
        b=RLcskY7xjtuI6/z46OUKd5ZGhgECXxw1WD74f02mgC//s/uT76TkoVz5JY6bZtngrC
         Bc3ph0L/4R05al+WPsBqgPVLfPQaFwd4J2pyFrpnfvEx89RWXDFobZnFRh4nUq6tcaou
         fZCGIlEYwDJ9qnLMXdPMLmfmgZhmFB0php/EBf5iqAHv6e4VVamQd38VVaD/8b2mnkbJ
         gsBEHlymSMqHUdzBAr60zzfKykr9wW7PFIuPJNdrVTc1Rz+zT/aHPjj5rRiOztzqt1dt
         /aJgGmjxg45hopEhq4ANTd6lR2pkHWRjZWmhd0/qparYv4tXFM0DY01F+D1KoFbQBPjk
         s9pg==
X-Forwarded-Encrypted: i=1; AHgh+RptVAgBkqXSaYIFr4kUsGv+mc2H7HllyOf87SM4cVW44Ry4q5bdu21BbS5HTMcTRdevuhv5zkUyzvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqcmikHe4EjH7LLMBQ+H0ZCEkaeSbrnXENChqgxE4YeycRHDH
	0cx68LewF0871OFm8R2lYW41ZpwMNrPf79B5Ogp2vkp8A8olV7iU0MqP
X-Gm-Gg: AR+sD12KAZQyyyzy5zKF4wYPu+KKSFuENt6G77Qf8T3jnEseE9wf/wcPAzZQEq5bI/q
	Ly/JTqHEZ3yTGQk9LDe+As+ZZ6i4mIlMU1r7Z3+5yoUcVHoobzDadLbk8Qmg8OF25SqlFC0YMd/
	DhxJvVGje12BW31El6urGc9IV15ffZEDG6Pg8eabRqHWv+S77V4wiLhGD0sHzfkupdLzrElDX90
	vNCI8Wp6RHjNg3+275Nu0P3siBZaTE7Iyc+LUWZsDPaDTXP4E7vPBamBOVHqu4pE4BEHNLWD1ib
	eMsVBYUSJ4Ed5bQHJBc3J0r+SAl0pdc7TWnBqzQ3XEYYBmMivtCDqz4DjLT6Q+vC9oeUBH2hoZ+
	dXTb9/2h+A32++AUHuAATjCR67zFC4yKU+kuWMX4aTJfujEiVrPtScGx6TVq8oQSepeDGNfKRxQ
	jUGvQYFoEHHjVi8xn8uoEF6+RW85g86HZrOtw3Fe/I5Nt9zk06bwcygWFxehScf6/rmAfH1ojHa
	0ni86brmxC9Nk2Wu1gWvCCHsv5DhoE6SLaQREceIalXz4nEF22fgKSFhOeJwf8+
X-Received: by 2002:a05:6a20:e18b:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3c92a73a4f1mr11458073637.20.1785782794211;
        Mon, 03 Aug 2026 11:46:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 00/21] HID: fix racy force feedback initialization via
 .input_configured()
Date: Mon, 03 Aug 2026 11:46:25 -0700
Message-Id: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHicGoC/yXMTQ5AMBBA4avIrE1SFb9XEQvaKWNR0qpIxN0Vy
 2/x3gWeHJOHNrnA0cGeVxuRpQmoebATIetokEKWohYSZ9ZoDLLdwo5qtYan4Ehj3lSjygqRy6K
 EWG+ODJ/fuet/+zAupPZ3B/f9ANT678B7AAAA
X-Change-ID: 20260802-hid-ff-input-configured-397bc1503256
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cocci@inria.fr
X-Mailer: b4 0.16-dev-b242f

When a HID driver calls hid_hw_start() with the HID_CONNECT_HIDINPUT
flag (included in HID_CONNECT_DEFAULT), the HID core immediately registers
the input device with the input subsystem, making it live and accessible to
userspace.

Historically, many HID drivers initialized force-feedback capabilities (via
input_ff_create_memless() or custom workqueues) in their probe() callback
after calling hid_hw_start(). This introduces a window where userspace can
open the input node and trigger force-feedback ioctls before the driver has
finished preparing its private structures or workqueues, leading to potential
NULL pointer dereferences and race conditions.

To eliminate this anti-pattern across the subsystem, this series:
- Enhances the HID core to automatically handle driver force-feedback
  initialization during input device registration.
- Refactors individual HID drivers to perform all force-feedback setup
  inside the .input_configured() callback, ensuring the input device is
  fully prepared before it is exposed to userspace.
- Adds documentation and a Coccinelle script to prevent future regressions.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (21):
      HID: core: automatically initialize generic FF if no other FF is present
      HID: add documentation and Coccinelle script for FF registration race
      HID: axff: move FF initialization to .input_configured()
      HID: betop: move FF initialization to .input_configured()
      HID: bigben: move FF initialization to .input_configured()
      HID: dragonrise: move FF initialization to .input_configured()
      HID: emsff: move FF initialization to .input_configured()
      HID: gaff: move FF initialization to .input_configured()
      HID: stadia: use open/close to manage workqueue lifecycle
      HID: stadia: move FF initialization to .input_configured()
      HID: holtek: move FF initialization to .input_configured()
      HID: move generic FF initialization into hidinput_connect()
      HID: microsoft: move FF initialization to .input_configured()
      HID: pantherlord: move FF initialization to .input_configured()
      HID: thrustmaster: move FF initialization to .input_configured()
      HID: zeroplus: move FF initialization to .input_configured()
      HID: mayflash: move FF initialization to .input_configured()
      HID: smartjoyplus: move FF initialization to .input_configured()
      HID: megaworld: move FF initialization to .input_configured()
      HID: logitech-hidpp: move FF initialization to .input_configured()
      HID: haptic: move FF initialization into .input_configured()

 Documentation/hid/hidintro.rst       |  50 ++++++++++++
 drivers/hid/hid-axff.c               |  40 +++-------
 drivers/hid/hid-betopff.c            |  33 +++-----
 drivers/hid/hid-bigbenff.c           |  89 ++++++++++-----------
 drivers/hid/hid-core.c               |   8 +-
 drivers/hid/hid-dr.c                 |  66 ++++-----------
 drivers/hid/hid-emsff.c              |  50 ++----------
 drivers/hid/hid-gaff.c               |  53 +++----------
 drivers/hid/hid-google-stadiaff.c    | 112 ++++++++++----------------
 drivers/hid/hid-haptic.c             |  45 ++++-------
 drivers/hid/hid-haptic.h             |   6 +-
 drivers/hid/hid-holtekff.c           |  46 +++--------
 drivers/hid/hid-input.c              |  21 ++++-
 drivers/hid/hid-logitech-hidpp.c     |  36 +++++----
 drivers/hid/hid-megaworld.c          |  51 +++---------
 drivers/hid/hid-mf.c                 |  77 +++++++-----------
 drivers/hid/hid-microsoft.c          |  38 ++-------
 drivers/hid/hid-multitouch.c         |  10 +--
 drivers/hid/hid-pl.c                 | 150 +++++++++++++++--------------------
 drivers/hid/hid-sjoy.c               |  83 ++++++++-----------
 drivers/hid/hid-tmff.c               |  47 ++++-------
 drivers/hid/hid-zpff.c               |  43 ++--------
 include/linux/hid.h                  |   2 +-
 scripts/coccinelle/hid/ff_race.cocci |  34 ++++++++
 24 files changed, 465 insertions(+), 725 deletions(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-hid-ff-input-configured-397bc1503256

Thanks.

-- 
Dmitry

