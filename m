Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D73DEFF6
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584800; cv=none; b=fmnqeYK2IbxagkW8vLbIhkmeBRVsfEr0+biYYbzZisE/VGSoHX25jV6JaV78VRV6+wjbrsPR25ZYhSpIzsJK5pXzMAXnF1vcrGqILVFL2YY1zYZz/ZcaJQyGtlzewUlu2m9lPMfSO6+40dB7gtDD/PDKvKFhdPxweRV+l23U1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584800; c=relaxed/simple;
	bh=Nj1qlIpON3VaMJM8UbfjiD8khDpWPWvFN1Ci3Mk1V50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QjYqX628d7Mdz/QneRZ/abRwEpQZjWLw/fNNR9F0xCt1emaS2d0OoKnFAkU0FAq1tUF0Rz5RQJVJ22+WMluQzcP6z2SS1L68qagyGZ55/MEPIc5rgFXPVBLTEsSEbRdhHeeVmhkbXWtFfxd/wf4nR8s27LJ4IMoUI/9r2IDcFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LAyaa34E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LAyaa34E"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d032846c95so1630525ad.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584798; x=1792189598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FUz1DD2WLXF8FMCF65KzWxeNZSEe/yJbWO0PR68AnX4=;
        b=LAyaa34EJdvWYlMTFjxZMKlgEtHOeBEsJfmGT7npnHodGoSWTmK/XYZVa7CXL+qIs3
         DlogidZogBIdrAR9Q8ofeigrh0zJLaT3IBGSouQcLLrm+stEKfNb6cQTWD8naTe5O9LD
         mF/unoJvj/AU1mRHJZnvhpMc03BQWOSeX4iX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584798; x=1792189598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FUz1DD2WLXF8FMCF65KzWxeNZSEe/yJbWO0PR68AnX4=;
        b=qM7/pbnHSstEu6rZsWxx43/9AhnE+oSz6MnydSNSpvG+7AAMV63ok5DoIepTCMMH2Y
         AiAq2wqWTx5ax+YvkEdZoPwl1QpGAs+OhUkouN2ZGxKZsrOd+V2D87U+ace83ySCdKRw
         J2mBlfJPxa40a4DvwCF7bfxFw1BcNU0k6uEbAOxyJ05p+muRJ9HHmok4JmosfUtHikN2
         TQC95kKAi4ZCvzwMgsdikkL8gHzFTqgPys0G9thnFUcVrYusstxNeO+6gd8TYYgdfU34
         VR7U1+yQngNGRJ70qNi+znSoTSMSTj3EM0pYrh4sExDb4LaJX7zfCeD+pN9OCkm0BjeX
         AXww==
X-Forwarded-Encrypted: i=1; AKwUvByImF8hAByN8bGnYHOcs38agyzc43fsolS90BZ2AtzpWHV7ZNVXBUY1HmtK3lHnTYxh5tgfjG+Xplg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIGbRmTWxJP195Idu018WgJ3YxSPXTixpfy5e0rhF0AgDRMNBT
	Yz8dO/hkCKMhThPdega2s7s888QiGxxpmbccn6vUtkmZO6aiGPzl2tYWM08peOFVrw==
X-Gm-Gg: AYBFou3B612WG/I670A5xlStze2QgU2y/sHHeW9NLxxE+ggYOKXw7JzgcstWIamIpfx
	1B4k1f1i9DIy4MhSOfR+wh70/LHpiKj4dSfsuJ/LtSes3VMoo9Cqj+xreJLha1MB5uGn0l2QM/U
	wYIRB+hBEirb6nbDS3cLLjjfwoAtNP0mzWp1hvxAMznQtg+WlG34TEHTHox0LfCps1XcfxhwaX7
	sUollvlYjGjqnPkE2jXn6HwxXghXOah7VU6sf1KUucSboSJRfi1ycIRFmRjoBcfbBUeouBkTIPm
	S8Qoox+YeYA7yKyKARcKJ+l7QwjRsXnQhxqud/L3jBmKIHx83VFooepidLF+JZhSTOs6aWSUHa6
	vG97MYFz6yUjMS0rmRkWGSfikG9Dh8Z3rcRWii8JDsGQ3JZJ1i2H+/H0hTWzz2640ML/fsSXMXm
	TIEPa6kagOY9jLXl1scv9EoOCMvTojoX5P+5/T5/X8GZSb3T2dnoti89ncXOdjtadY5d4CtcJ47
	rXtYVAbHmt/qVWjttV4NYadImTxihODARm2a4DGWUSl49QUkiTajtrbRkN7bsxBkVMJAX64PrX8
X-Received: by 2002:a17:903:22d2:b0:2e2:c283:354f with SMTP id d9443c01a7336-2e842abfe53mr30774615ad.28.1791584798347;
        Fri, 09 Oct 2026 15:26:38 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:37 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v5 00/11] Add spi-hid transport driver
Date: Fri, 09 Oct 2026 22:25:25 +0000
Message-Id: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANZpyWoC/23PSw7CIBCA4asY1mJgeEhdeQ/josJgWfQRUKIxv
 buoixrS5T+Z+ZJ5kYQxYCKHzYtEzCGFcSihthtiu3a4Ig2uNAEGmgEHmnBw9D6lW8S2p3vltXc
 NugaQlJspog+Pr3c6l+5Cuo3x+eUz/0x/kmCikjKnjHLF1aUFbrxwR9vFsQ/3fjfGK/lgGf4Ak
 DUABVDALZrWe2/0CiAWQLL6lywKoFnDrVTGCbVfAeQClM0akAW4GCmcQm3RiQqY5/kNc2Ls0nA
 BAAA=
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
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=5428;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=Nj1qlIpON3VaMJM8UbfjiD8khDpWPWvFN1Ci3Mk1V50=;
 b=etJd3b3UVqagUxqvjiTG6zOPQhMZq5oZ2SbYUYzjkoeHHWcPQb1WlCN+9PEKh/Wi8HCO2T+1x
 O6h+agGpXM0BUSCGRCXk1lARzHY3remF5IYc9vlS0ExrdTDgSttfctW
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
Changes in v5:
- Fix request/response races; match GET_FEATURE responses by report ID
- Reset the device on response timeout; wait uninterruptibly
- Validate device descriptor and report lengths; fix buffer sizing
- Honor rtype in raw_request(); fix GET_REPORT off-by-one
- Use hid_safe_input_report(); forward input reports only while open
- Disable IRQ around hid_device teardown; fix a sparse warning
- Use disable_work_sync() for reset_work in remove()
- Cap trace copies at 64 bytes; cacheline-align read approval buffers
- ACPI: select RESET_CONTROLLER, use device_reset_optional()
- OF & DT: read opcodes as u8, use dev_err_probe(), require reg
- PM: cancel reset_work on suspend, wait for reset before
  reset_resume(), fix IRQ imbalance on resume failure
- Panel follower: fix regulator/IRQ imbalance; depend on DRM || !DRM
- Link to v4: https://lore.kernel.org/r/20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org

Changes in v4:
- Extended io_lock scope to protect the shid->hid pointer lifecycle
  against races with the IRQ handler
- Cacheline-aligned DMA buffers, enforced 4-byte alignment
- Added error rollback for failed suspend/resume transitions
- Moved IRQ request to probe with IRQF_NO_AUTOEN (disabled by default)
- DT Bindings & OF Driver:
  - Required a device-specific compatible string in the schema.
  - Added description to explain why opcodes and addresses properties
    need to be defined in the schema
  - Added `spi-peripheral-props.yaml` reference and switched to
    `unevaluatedProperties: false`.
  - Added fallback to default timing parameters in OF driver if match
    data is missing.
- Link to v3: https://lore.kernel.org/r/20260402-send-upstream-v3-0-6091c458d357@chromium.org

Changes in v3:
- Add io_lock init
- Relocate tracepoints to drivers/hid/spi-hid/ and fix tracepoint macros
- Add tracepoints for sync, error handling, reset, and report processing
- Clean up internal includes and fix Makefile CFLAGS
- Add more details in v2 changelog
- Link to v2: https://lore.kernel.org/r/20260324-send-upstream-v2-0-521ce8afff86@chromium.org

Changes in v2:
- Clean up DT bindings: fix formatting and remove timing and flags properties
- Update DT binding example: use a device-specific compatible and drop
  reset_assert
- Simplify ACPI/OF match tables by removing ACPI_PTR/of_match_ptr
- Refactor OF driver to use match data for timing parameters instead
  of DT properties
- Switch to fsleep() for delays in ACPI and OF drivers
- Drop patch 12 as it is vendor specific
- Add a lock to fix input/output concurrency race
- Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515ba218f3d@chromium.org

---
Angela Czubak (2):
      HID: spi-hid: add transport driver skeleton for HID over SPI bus
      HID: spi-hid: add ACPI support for HID over SPI

Jarrett Schultz (3):
      Documentation: Correction in HID output_report callback description.
      HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
      HID: spi-hid: add device tree support for HID over SPI

Jingyuan Liang (6):
      HID: spi-hid: add spi-hid driver HID layer
      HID: spi-hid: add HID SPI protocol implementation
      HID: spi-hid: add spi_hid traces
      dt-bindings: input: Document hid-over-spi DT schema
      HID: spi-hid: add power management implementation
      HID: spi-hid: add panel follower support

 .../devicetree/bindings/input/hid-over-spi.yaml    |  130 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   50 +
 drivers/hid/spi-hid/Makefile                       |   12 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  262 +++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1754 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |  118 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  243 +++
 drivers/hid/spi-hid/spi-hid-trace.h                |  184 ++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 14 files changed, 2810 insertions(+), 2 deletions(-)
---
base-commit: ee9c669f9bf5fd2c24206746ded9382fe810df89
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

