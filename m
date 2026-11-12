Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501220;
	b=3s5cYZ8h6JLIwqfcbSEsqiVzT//o+p9HcSC8+Dzj/nONTmtMIGlYzavp+QF4n71rQIza
	 Ygi++6VGZitYdNkyucO9ALQMZLTOmoamonahXapbZWslIEHsaOyPqktur1SAAumcre04G
	 XYtJaZalphxTyXO2F/xZeSq0hiEw3crUeHw2mbJVTB1MyrwZzVX/aOSq0qNXVPjMa7A7l
	 ER5Ov8lWcpSf+g0nfNIRfEwsFfshp+Iu3JBY+XZinTp9foZ9fH93HmuIgRre3+F0OIvEZ
	 0jKxSyBKOXgLUJKabi6sAKiBIjVlzvmD6AeFLVixj6Ha8r0vivmIotYKUd3OqX9MbSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
	b=Bkp45QaWQmOi/94a5B4PoZoR9UAGBz0mq+NgsiDfz1661/CeHLhcvhhKRE9bgLlo/Yrq
	 DilDCDh6TTFFaMcIGnqc6iI+t0NxMvbGd3jenaTm2O21IJR0dVuqx+6BxQV/gUVbmj+Vr
	 pXQfprIvQw7QQM/dfJdcAdgNTHsdgTwcafb3AKbm0HKOtzgZH3asnR05snOwhgTwwMZmr
	 P0CTZiR2dVPGYIt9sONVIvUcL3HLbS7ubhw1PRDt/FgAHGIyiz0tSNazLiGKqkwJHxtRo
	 Fb7l8CXwNMfxx59jD5re2F8upd/uq5uLMnTBdKyqY+08QLS+zJ1AW3r8kKueu76gwFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOOolabN;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB39460A3828
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB39460A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOOolabN
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so69917eec.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501219; x=1795106019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
        b=bOOolabNHffCQAuwLQ0DkkrmI/0xfrlO3ZGMi4uEqUSA/ruC8Kgzg3IfqETXANiCSc
         nE5XTUMOGB8+pm3D1vOJLl2dghi+dV6+Vf8rRysaZFAcqdtvPVkoe6QXZX87YeIv7qG7
         lfylAT9DyUHn+4Eh7Ynj4HzZCeDttzszv+l+bobVFsJjNhRSkAE3y5pQNLVCbqsXZfvX
         0sFEpdUsLOmCJy7pb/Wb5YJ0zdceVdrQpVM+F7Q5aHZisnn6mlBxmXh9varoskvH9SSU
         ko83HninfW0bnflBqx4NP0nlDvUvEjXEhUVdASmv8xP0a8g+0Ska9Eos+DzE6V4AAGlQ
         ELAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501219; x=1795106019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTf5xwUaVqhCGYlOB3/ivLsxy/QQjCllvG43X3tVGp0=;
        b=VoplniLXF4WXw3md+In3ZKmHbQTuXQMqBfXittsjfeWLunH0PDR0cZYehDUV1jpVS2
         I1t2EnG0BTM2grhsQqTQeNYKD40OmT0owyG2p423vtZv4NN83BNC0TQ2WNmMxyFR/bZ9
         3BQXPc2VK9N5eX8Vm+s6Xe2J0bWegyeU5a9cSb4LMebIK4JwPfgzrSV1oEOugqvDWPJA
         N3qNVWonkzA0l2aS7+T/ayJTgCYNo9HTKQYfQ64/OMu4mZpl02tcYSw0uZS3WgYlCxrv
         z5bVJkbZtrmEuPLJdA4fky1/Aspk29b9h6S6/5RYgy67P3ti/a9nUCPNLW1FFzjuXH+3
         7NVg==
X-Forwarded-Encrypted: i=1; AL+hErF6QWmLaFVDVCcCozT34TjxcF2ztKpdO+Bc61TNlHIDaBii2rLSDv4yhtFfHxIKk5OUv/vtTEkaRVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Je393MJNAop2aIqECYg+KnKB7w+2NDoW+RgvbJV2OiekVlDU/
	M8HttI9aYM+uGpE4Vd/o0RTkUr+qkvllS/MN1T4I77FdPdGNOfFPRx2x
X-Gm-Gg: AYBFou1GJSPu/Imd7FqDswR0lKM5FNh0+25jYOsB+gi/bA1dGK5b5vCDXRmopSKMQ8M
	8hQrXUAt/tGP1yoeHizZgf1If6htN5NV1Fv451D7E2H60ZGWyo8KIvNDk/YS/s0iJD20jAFB/QK
	yI3FUnnr/1XXGD7udqlkRqxXjnhsNyxlITtv1R1AkA4tV4FHo1oPvYggZm6vyoqOWxmex3mg5dx
	gekN9hh+0vNAwZelIoJ/XgXqkp4GxcrmnVIeT2q3Ldeko9hGRREYXAXO/V2vQFkKU4lx1Yo7uSI
	bovGZF0fh9U7QxfJfIFcvsm2dDtB8dUVK6MAqXdtUk/tkHrTIEkXzUH5WJmC0Bh4xhdeU8niiFr
	M9qRPFt1n8b+26sIvjeKxRFmtceNMiyScfW1i8537g42qQ71mei5BC5gINH8SR2t4/BHoX5wWvS
	JykdKeFTo4imDxTQZEBrErs821ZIAuGlr7M2xKxdHuiiUa18v7KsTOhAr5A7PTg8uLujdvMtf9+
	7YXVnVU9tb5kYCL7vYBFZeQ2TmkC+U3jXDkd+kCnI9ifbGag0lI3VN25DJjhFqJg2VvZBsnzVqX
	hWoZ0T61kz9yATrAnE6Fcbx2vWWqwDMLw9RrO/C2yykuNVzL/UA5mRN77h4LY9DBASvob3xmiPf
	bUmHahKivJrCXpcXlXXUoath1jSzDR6+SCRSU/eM9ipJhcCiPIbATQLb5tL3GJGz/rzD9abhK
X-Received: by 2002:a05:7022:409a:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b5030d7a9dmr70385c88.8.1794501218632;
        Thu, 12 Nov 2026 08:33:38 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm230248c88.0.2026.11.12.08.33.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:33:37 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Simek <michal.simek@amd.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/3] ptp: ocp: support the WiWi production Time Card
Date: Thu, 12 Nov 2026 08:33:29 -0800
Message-ID: <20261112163333.12523-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WiWi Time Card (2163:1008, subsystem 10ee:0007) uses a
Celestica-compatible register map behind LitePCIe. Its bridge does not
support the subword MMIO used by the XIIC driver. Add an opt-in word
access mode, exercise both modes with KUnit, and enable ptp_ocp on the
revision 02 interface. Other cards retain their existing access modes.
The series does not enable WiWi flash updates or change LED policy.

Patch 3 uses the platform-data field from patch 1. Could the I2C
maintainers review patches 1 and 2 for an Ack to take the series
through net-next?

Changes since v1:
 - 1/3: Drop five explicit inline annotations in the C file and
   shorten the platform-data comment. No access semantics change.
 - 2/3: Wrap the offsets and expectations flagged by checkpatch.
   The four test modes, register offsets and expected values are unchanged.
 - 3/3: Follow NetTimeLogic's PCI revision convention. Replace the exact
   image ID and per-core version checks with a revision 02 gate. Reject
   unknown revisions before FPGA MMIO and retain the BAR/MSI-X checks.
   Report the full build ID in devlink; select capabilities by interface
   revision. Update the documentation and wrap overlength lines.

The revision 02 driver was tested on a physical card running build
0x0000800f under Secure Boot. It bound with 64 MSI-X vectors; the PHC
advanced 3.000441080 s over three one-second sleeps. SPI NOR and both
EEPROM clients bound. The PHC was UNSYNCED at probe; this test does not
establish PPS lock or valid UTC. Only that firmware build was tested on
hardware. Subsequent edits to the tested drivers remove inline hints or
change formatting and comments.

On the rebased v2, the XIIC and ptp_ocp objects built on x86-64 with
W=1 under allmodconfig and allyesconfig. Four XIIC KUnit cases passed
in an isolated x86-64 QEMU boot. Fixtures exercised all 256 PCI
revisions, bad PCI layouts and multiple image IDs. These are not
additional hardware tests. No full allmodconfig or allyesconfig build
is claimed for v2.

Codex assisted with the changes, tests and changelogs using the board
layout, machine-check evidence, vendor revision rule and v1 CI reports.

v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  36 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  14 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++++++
 drivers/ptp/ptp_ocp.c                        | 163 ++++++++++++++++++-
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 341 insertions(+), 27 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 368fbf5d82da9ebce309449c74fc0b128f7d0219
