Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853249;
	b=F0fi1a45WIjxE86dTAQ9vWO7pvzOkAUjFsg7+EfZ463Qz5za+qMq+XAMZPjmM0qb7hLC
	 kDTGl7mIrXMBCL1KclVVCRwAFJ/sZiKstn1Jru6pGkMsYG4XDmFU+T4h0Sv/a78CqPtiT
	 X282t7xzROVjnMn4G+YC+i76tiwMhmWK//3kfaLLf0tH4c90LOX3e7t1qeUBuE6mj0BX0
	 8DzCGWfzotHwYR4Yb+lMWvKeF/81fayZCOQSulYminn9iArLLO7h+G3Y6Wj1WKgOo+acb
	 1fbRtC/RPakzBLmz0b4fALC3ZMGX11iXQHaWpZq97oCxyzM9s4yqvQjATxXem3FTImw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
	b=kZJtQZELMk5cJ/1OSbmr7csYFxulq9tbZl8bES35crF5Fxl+T8DJAisthbNr/Sbuyx5i
	 f8KP8eOjneRc6MzTt+azPDLkDSzQdroaLoM0OFsAntWMZCcsyVqlYQ9cnbTg3f3PTAZlB
	 32Aj1gRDnCnmKOSqRJHHxmtUTjHgya43wwnEz+rmMycVijVym0yowADOwczsW6JRf1lKR
	 SsZYvJH4miXVha+pwzUNR5Ot2hUICQkZGCCCAd+uRBzGouP7tSpJSGGvZHLWPV+C2ixRH
	 yldM9BP8BoF5TvtC57gZNYSfxvFfpE01wtClskZ2inu4Vrb3jiO09wwNbGtaNNNYzIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eqpuz/BN";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18500606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18500606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqpuz/BN
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb2893531bso2742155a12.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853248; x=1795458048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=eqpuz/BNRewwnqPR7Lwmmdgpfh+V3P3GN1xkaOj9TGIfVxlvvUaeb+b61A4lFcZakD
         HKNV7dYJ5vMNhJg2Jtbs+B/yB+qpMSvukXDC7F3N2y0KoPs7/Y2DMUDHjToOQFC0fBAL
         1F3WSIjqXrRakyePJsE5t1QMuZKR/a/3H2nsMYW3k+MBDY+ry39LkA5DOakoRD0blMH+
         UWilVCKHWpXJjoyXUTyAaA94q1v22loBGudWyAzccXQGLvpgst0Jk3lXv2X7lCgf5XTq
         fQG8FEsdOvc+d50IF/heXA51aqJrZ3ReT2LM4/3aaH00qUJSwsxvMTXEuVGJP6gKVyvS
         e8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853248; x=1795458048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmcXc8PpLN8Y0P2f1bs8epH6lji2dvrS3zcd2mdMtMA=;
        b=dCbu24fBS3R+cEHvlgKxXA5hgOwldRRV/V7TsW46s1ap+OItK3uJrlyNjl4ugD+vOQ
         tkI5vQtRMwZU/h1owFNjAxVAbeatpmcTkg9vMCsLsxRuoyH05UFwavLAvk/6Xk104qr3
         KE9F2ga3P32Z+SISQZPRY80ccyOWCwjyMyRfyNnqrbWeccV3fBwOcU1x6BQvhrzASLZF
         w2M0rIaim8WLCOkbpuWemyaWeOxrgCzZPTB6s0C2HXtNIPxoVcf1Yj0fjofkf8J3Wvrz
         sHkNMyHKyg5Apt1Gj+mu1lCYBHEzdB8ScJJ1Wa69PE++ACbGY08vDBBBUeWFBhGetx6W
         34mg==
X-Forwarded-Encrypted: i=1; AL+hErE7b53xXqVxhe4qWs38714yLj+tqHorxocViXIrSukzDHnm9AIq7OZ3tukW7EUi3NpHrfMMMVU+9uQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Enp3YUIZtHjpCRTzsfvwVDqw54P2KwDrSNsk6/QU1qLTO3J/w
	l4ehIZ65vKORbMeI0CO56/tyOjV7fw2Zxhow0+/g3ja7Xni4IRMR6z6E
X-Gm-Gg: AYBFou2LCC+AproxEHu48WbxYQ/ngXKs5TQfa1CDMEgPXaTrMMwJmEq0fXfSfYPTohX
	oHT4H8YNidd1jcLtZlbnnPIwJRDnTdkUDMsHtUslho9R3UYa1WLLx/44spPh92TT08KeJB8G8cw
	ik5VWE2AcvQIP47TgdSCMzpiW4RViinxT6y0OgRm/W/KKjuGblzvdzyMMgfGFrcsc3Xk7F4siHR
	nIdDAgYwO8Lk3UPjBojs8rAqyR+f/yZifBT537hOiiJr7nqIMtru8HIgMZF/f0HMtY9D8SQxAPb
	uqByry9Crk/wHEArDroOPU7o2YKZ85h8pH7Ghxm9uPjQgwyPOt4xtEukNAea/rBZQIV0IihgkMF
	46QWTJFXy2ZKi2RuKaVSNlkqcEfc6DUyvrshXnOAYksOdi4j4266g5qXMj4gpi+gg/tprimqC9S
	7HuakVlijV0gKhqy3hOJcnNQm0EK7L3AIf+Q2m8Q7N6Kl8NQc/H+mGWt55RdmLL7KpkH3Dvhvq0
	niDbdB0JcVr+rjDFkXpCj07M4fgh4I7SFxCLG5nIGCQFM7ay0hZyWAqDECGfrCmGKLTZTDNHfLB
	sQLyX0ZsD7U49Uv4yjzHZOZ3mJ1xLY3I2DSYhoCcY/Hv5Dnc89tBPfwmAipri2r7dYv5w0QNpDh
	OMtBD7SMjAlg8kjIvHsyX8/VHg9HwTvgNvrxWCbjaWV30z/KCQJSVJuLeRQ==
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:827b:2b7e with SMTP id adf61e73a8af0-3f7a6ea143cmr11038256637.28.1794853247994;
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececce013sm4235466b3a.6.2026.11.16.10.20.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:47 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH net-next v3 0/3] ptp: ocp: support the WiWi production Time Card
Date: Mon, 16 Nov 2026 10:20:44 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
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

The WiWi Time Card (2163:1008, subsystem 10ee:0007) presents its timing
peripherals behind a LitePCIe interface that requires aligned word MMIO.
Add an opt-in access mode for XIIC, test both access modes, and support
the revision 02 PCI interface in ptp_ocp. Patch 3 consumes patch 1.
Could the I2C maintainers review patches 1 and 2 for an Ack to take
them through net-next?

Changes since v2:
 - 1/3: Identify patch 3's WiWi XIIC child as the first user.
 - 2/3: Restrict the RAM-backed test to direct x86-64 MMIO. Exclude
   UML and indirect I/O; do not restrict the driver.
 - 3/3: Match the board by its PCI IDs, validate revision and geometry
   separately, and select typed XIIC data from the static board match.
   Do not expose the SPI flash through MTD or devlink. Omit unsupported
   GNSS2 interfaces, preserve external PPS2, and clarify firmware build
   reporting. Refuse timing enables until the interrupt gate is open.
   Distinguish WiWi's PCI interface from legacy Celestica.

The driver objects build for x86-64 allmodconfig with W=1. All four
XIIC KUnit cases passed on x86-64 QEMU with the same two I2C patches.
An earlier revision of the driver on a revision 02 card confirmed
64 MSI-X vectors and an advancing PHC. The new board policy and timing
guard have not been run on that card. No claim of PPS lock, UTC accuracy
or masked-event replay is made.

Codex assisted with implementation, tests and changelogs using the
board evidence, vendor revision rule and mailing-list feedback.

v2: https://lore.kernel.org/netdev/20261112163333.12523-1-ahmadexp@gmail.com/
v1: https://lore.kernel.org/netdev/20261111041904.48916-1-ahmadexp@gmail.com/

Ahmad Byagowi (3):
  i2c: xiic: allow platforms to require 32-bit register accesses
  i2c: xiic: add KUnit coverage for register access modes
  ptp: ocp: support the WiWi revision 02 Time Card

 Documentation/networking/devlink/ptp_ocp.rst |  47 +++-
 MAINTAINERS                                  |   1 +
 drivers/i2c/busses/Kconfig                   |  15 ++
 drivers/i2c/busses/i2c-xiic.c                |  60 +++--
 drivers/i2c/busses/tests/i2c_xiic_kunit.c    |  91 +++++++
 drivers/ptp/ptp_ocp.c                        | 242 +++++++++++++++++--
 include/linux/platform_data/i2c-xiic.h       |   3 +
 7 files changed, 422 insertions(+), 37 deletions(-)
 create mode 100644 drivers/i2c/busses/tests/i2c_xiic_kunit.c


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
