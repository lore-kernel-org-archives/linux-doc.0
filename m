Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F33C2799
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334406; cv=none; b=Uhr7Z8XdXITh9q/dP4JuEXP61XK+wYHOhDlWe1eHbIYZh5tgFckUdm9JftyJ6LlQiMeAvcsknBwoaxmZVl3neuYaKLR28PBkrBow7Niwq2imlQmc/GS/8IN2UofR+R+XLL4fGCrzkYtZynVBFZQAxUwyYO/lnalgg1R0OCvPBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334406; c=relaxed/simple;
	bh=kWMVHrbTgq59qsBF4CpPuynsRpdHuf4qfybAUgKcv1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ti+nrALAkdlkmvpJZ+8QHsAbJak9AaIqtPOT0dQuzkQEP9xEFKNpi+TEFhHAc0dNAEjqty25afNs6C/kUoDVupy987h2LUAZM2zK7Po3rBaB0dMaM3/VyLpKtxS9ZfoHRNrYeWMXnGL1zkcyJI0Tz0FxS8Ne2VMxDZux5QG23MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bayty719; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bayty719"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b056b7f783so25519205ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774334402; x=1774939202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1IUdQ9vciBV4vtJJEjMhyajLdYSBJmzXHlAoFV09cM=;
        b=Bayty719eLyEssE+D+sV7sxnwd3YzJX/N2JvH6d1IMTp5T2Hc6FTt4RU3pi/uklzv7
         1GRDTN5+KbE8hkEp5TbTp5rrxZ18TQXE07sTjhBK6E1+Hsnl9QCEh+E6jIIvB6bWoGZI
         f/u8lMsQU1Lg/5VFN2gEvR+UZDC1+WWGybCO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334402; x=1774939202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1IUdQ9vciBV4vtJJEjMhyajLdYSBJmzXHlAoFV09cM=;
        b=bAbQxbibAz9yvHuc+dYzC5cSayOuQrg1BkG8r74t0LwHTFXP9vYJCEXht16ff8jyR/
         6OQBAfk5N9NCNBOWRgGTCjzUPvEX/TgU+wgtbY+wm1Qr4c8bdwv1d6u/c6r1DcBNEhlV
         MxqN14nGRpnUiEb6FIQtkfPV3KSedlxHKY0ehPTEB+SAZ5ll0wxYnR4Pg51cdZdkCnIg
         /2AoBifyc8fV3TBqTYAOqxsHTIt48ATp1rn7nq7TSE4sbJ5RZ7KBMapCEkHgFRFYRWQ7
         yCjaqheM1GTyl3WkPslO5E6ebm/SGUkQ8FDvTYgzVZCNENW4rZ9rcj90Tv3Vt9vjFmRo
         0yog==
X-Forwarded-Encrypted: i=1; AJvYcCUI5kdZqTs3fUr7SQONkFZDfJ5Xm/GRgxDmdhsHDQxaQ5FkC2Uh30Zg2R7KsVtivpJ4f85QJDi0dQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMXDhw2P2aK7Tdyhbf8vrfqCDwkWKu4W4JthB0HXzpasQyixj
	Tq4lVYeeJsFzsnBEUqSUsykIIlBZ0Vjs/NLTArxTg7A1/a2FEYp9QFKq4pGzUTCxsg==
X-Gm-Gg: ATEYQzwxwJ7DFQJYebCq0NYnsfpOb6IuAGJmYmY5ZJX9HSqSxL5UO5EN20VsMGoniUa
	emuuZqjaOhr2gzryO3N6Qr/wkWWd/ZFRPqC3sa6ftuwZvGft5Lj2TbrL0Jqn/ESYudMoBAJHNua
	koSZCNmaC09zSi0N4KlkiwwQRGVlB1NP18MiaUP+O1gsj4bBmpFoW5AvohttXWMBKYPmvIC/1O7
	1jZVEx86452vC3Je9uNlv29hqq6KHaZxSwbu9+mXMgNr/Y2AS2Z3qM24/BVzyZ7OZVoYewgCV8H
	Lj2fE+PRG5RmnvLJoT9QAooYDJhfaNMMEHhlnfYux4bohYi1JxFb4FNWNYy6Erlrnf+NYx94nVs
	oKl9l7CM0/MkyFgCYV0cpqeFEvpH3iN9YpEStVUgdQM962eE/A6PZgEkVYRjPUUJWp13qjnC5K4
	L5vJDenGmJ71opxFSZF48fjh36VOLJTt2a18GrWj4Vlnff84orTQvnNxOXGaaACMhIOsEYTyt+d
	N2iVsZV7GdpZSEtTCtH5wAmiknwdDmqGg==
X-Received: by 2002:a17:902:e550:b0:2ae:a7e2:e80b with SMTP id d9443c01a7336-2b0a4e0e487mr23771835ad.19.1774334402101;
        Mon, 23 Mar 2026 23:40:02 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835429afsm128416545ad.26.2026.03.23.23.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:40:01 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v2 00/11] Add spi-hid transport driver
Date: Tue, 24 Mar 2026 06:39:33 +0000
Message-Id: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUxwmkC/13MQQ6CMBCF4auQWVvTDimKK+9hWCCdwiygZApEQ
 3p3K+5c/i953w6RhCnCrdhBaOPIYcqBpwK6oZ16UuxyA2qsNBpUkSan1jkuQu2oLtZX3tXkaiT
 In1nI8+vwHk3ugeMS5H3wm/muP6nU5Z+0GaWVscY+WzRXX7p7N0gYeR3PQXpoUkofx4Lc6a0AA
 AA=
X-Change-ID: 20260212-send-upstream-75f6fd9ed92e
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774334401; l=3002;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=kWMVHrbTgq59qsBF4CpPuynsRpdHuf4qfybAUgKcv1Y=;
 b=dfMXFcVFCiOJHI71GrEDcRWBXlTgiM2SynaQouSI8EGuy2k+Pi8LYvBDwf6lHmC0T/Yh23G15
 5xiYrgKpCW+Bcn6RVOA6XgqL9LfcYcABPhbNEW7nCKYlr2kGEzFiAjH
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

This series picks up the spi-hid driver work originally started by
Microsoft. The patch breakdown has been modified and the implementation
has been refactored to address upstream feedback and testing issues. We
are submitting this as a new series while keeping the original sign-off
chain to reflect the history.

Same as the original series, there is a change to HID documentation, some
HID core changes to support a SPI device, the SPI HID transport driver,
and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
support, power management, panel follower, and quirks for Ilitek touch
controllers.

Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
		  Dmitry Antipov <dmanti@microsoft.com>
Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmail.com

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
Changes in v2:
- Fix style problems and remove unnecessary fields from the DT binding file
- Drop patch 12 as it is vendor specific
- Add a lock to fix input/output concurrency race
- Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515ba218f3d@chromium.org

---
Angela Czubak (2):
      HID: spi-hid: add transport driver skeleton for HID over SPI bus
      HID: spi_hid: add ACPI support for SPI over HID

Jarrett Schultz (3):
      Documentation: Correction in HID output_report callback description.
      HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
      HID: spi_hid: add device tree support for SPI over HID

Jingyuan Liang (6):
      HID: spi-hid: add spi-hid driver HID layer
      HID: spi-hid: add HID SPI protocol implementation
      HID: spi_hid: add spi_hid traces
      dt-bindings: input: Document hid-over-spi DT schema
      HID: spi-hid: add power management implementation
      HID: spi-hid: add panel follower support

 .../devicetree/bindings/input/hid-over-spi.yaml    |  126 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   45 +
 drivers/hid/spi-hid/Makefile                       |   11 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  254 ++++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1417 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |   93 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  244 ++++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 include/trace/events/spi_hid.h                     |  156 +++
 14 files changed, 2403 insertions(+), 2 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

