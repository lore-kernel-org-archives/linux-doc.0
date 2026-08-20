Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972C440659
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 05:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202398; cv=none; b=pwHiJ44BVla71ootWbwwG3JPTgD5DQ+LGeH2P8XqzECzsR4fXt5JA80N2dCZE1UUu3PNoXeTXgO2LABnhiVnpPN1MYIMqrWPKJIDUONP1ImCBse6G4fiKitO6sDNlMuGnrUUzn+/MUfxsrGXZD4c7tYE6ujf84GVOImLTBQSWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202398; c=relaxed/simple;
	bh=8UtX3Dd8gyBxCOoHOjGxAb9XHakiWDFR2Z/SXhpSidA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mxMl5oeYQYXqH1MZeHLenn+PqZJ8QNVDWRgmo4pS+pJstPyn9VipTu5y9mGU6jM5aZRMknmDSnngWYTYcgU3bAnsjjUPUMgFgKUxgCz9rZnJHfNWmAFvf16Diq9MXTsrq8mbyDB3bnfZrMK3SHUSKIbN36FAp14Rb3vdxbvLYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2bFhZen; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2bFhZen"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccf2360620so13281575ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 22:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787202394; x=1787807194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdg5mjbxDlejn+rt1v5VsfqyiYFBYbUL8d5FdoHC6sE=;
        b=J2bFhZenrcmN/NvS3CLmPCaQbDZuecpFdZr6q4kZVGq8vGPrNijfayw0EGZAkowCeF
         znNZP6b6NLV88zgZhwC1U8UZ6PknFOF6IFXVPSkv6Sk+kNx5BTtlV5nF0K+HRFn/xEG5
         KKyrKMKZZxhNZsoyyKnQHp9+Gy0bQpl6KgJ1Jy3txDkDFydu9lASh50IgTVkUcXk9lNx
         W3EihkL+raXv/4xFw1p8H4iF4MDSQ1EGdO90tYSKJICcAxWHnoF0C+G8A1pEs0QlEjNl
         mrpFNoYxlsYfObV2syMM9lPeYXd+GOiDUArdyGrS/HM2kx3/PghUdyHyM2WNDMv0oxJb
         Q3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202394; x=1787807194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdg5mjbxDlejn+rt1v5VsfqyiYFBYbUL8d5FdoHC6sE=;
        b=NqpeomsGQRdhes+eRvg91o9mEXXbyD7C4F/Etk6g3yAehmJsJ2V5WsNFXbBeF8e9v4
         iYHH8H6mzhkiSAJcQRa3Yt/3PV1KjEKfiOfzFxoxIPRshONQQqLb4yv+AWwmjG090uUe
         iCb6DFhJWBDNZX6Qo09ncJrIui66f2aHa+lifi9YR//hvwSpfpUyqTtPVPHB2qF2vGoK
         vS9LuEkCbGkkZtDds8n4slZmLyiH2eZTstiEpz7mUJ/Kml0Ui+rGSkzLrgcQYkyu++83
         6FdPCjIFLaVF338h2ZCQvrkC6HE3njn8jdDl6kpwISZ+o9wFcEJjORNipyFWf0VMoxrx
         w6QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob61UFKbVAFHnBZqd0fU/7s2nho/pWmyXV2yJNtj9MWuOO5Dxsw0zUzv+6Ndhx0xP0YYE4NnbkNac=@vger.kernel.org
X-Gm-Message-State: AFuF++kOwqgAAGfiE7VGApLqRdHWEiSwQv+rFdeFI0Ct7tChq1Ww/pAm
	RRCqRb4RtexZklo0R999d3epXiuJunzda+rm/52c/TXoCgJaaq/2o8m3
X-Gm-Gg: AR+sD13xpz2y8at7H8ADqm1eMnsKjik8ebow1bs5tllSaXvOdtaqj6yMdGcl03/n1Ht
	GACATeO0k4aebfDVIWOaHW97tCx1aLVaIUBQtTHEpcl4NItWq5IVqtCKEwnvnkiVqLYzMZLDHHc
	TRNfaIBYieZ7Pi1yJ5hVwjjsEPKyHdmeD64W+v5CILmqczPjv9XWzZPh+tLEApqog7CfIp8LKlW
	QCSAhjHMJ2mLJ+F+/n0hH7e5xwvYbMAnpMqc6FfuOUrqrDKUewxcZB3zfxOrxMTk2Au0uBGRcHM
	D64GbzAniv71XSUgknwvjq1om8IDdGBJADpST2ok5QYMniHzmy/XqWPGOR78cFxe7QyWv8qqzK5
	9KVkpHLf1qNNurycxtocKtR4ETAYxP7HgQIp80UazOfLi8cutgnmrs+qWBJIy9G+u6OS+KSkTVL
	GtbbV7m/N6pWNOsnwtP5HLsOXIOWNXMw+/Bi2Y8hChoNH8m8E78GLWhyIf9xpq8BsRweY+xQsvj
	kwB/FBSxk1ZL6blPPhxM0YnO0/O98Jx62G2yBgGglshwDnWg6yEUSU+oBmWon1vXL4DPr7t8lwd
X-Received: by 2002:a17:902:cecc:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d601a8ef08mr165271975ad.12.1787202394458;
        Wed, 19 Aug 2026 22:06:34 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d58a82dsm2040685ad.18.2026.08.19.22.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:06:33 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	grondon@gmail.com,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 0/5] iio: add Open Sensor Fusion IIO driver
Date: Thu, 20 Aug 2026 14:06:03 +0900
Message-ID: <20260820050608.5440-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open Sensor Fusion (OSF) is a physical sensor board that reports
measurements over UART.  Add a serdev driver using the generic
"opensensorfusion,osf" compatible.

The compatible is intentionally independent of a board model or firmware
revision.  A fixed wire header carries the protocol version, while a
capability report discovers the available sensors and channels at runtime.
Supported capabilities are exposed as four IIO devices: accelerometer,
gyroscope, magnetometer, and temperature.

Changes since v7:

  - Separate wire decoding from support policy.  Validate the protocol
    major and reserved header bytes after frame authentication, and ignore
    unsupported capability entries without discarding supported entries.
  - Harden resynchronization: unauthenticated candidates discard one head
    byte, while authenticated frames consume the complete frame for every
    handled, ignored, or rejected outcome.
  - Retain split one-, two-, and three-byte magic prefixes across UART
    callbacks, and use an opaque callback so the stream parser does not
    depend on the driver added by patch 5.
  - Zero-initialize explicitly aligned IIO scans, use
    iio_push_to_buffers_with_ts(), and simplify the buffered fast path and
    one-axis versus three-axis handling.
  - Commit a sensor sample to the direct-read cache only after the
    registered IIO channel and buffer path accepts it.  A rejected
    CRC-valid sample therefore cannot change direct RAW state or the last
    accepted sequence.
  - Add focused KUnit coverage for accepted, ignored, rejected, and
    malformed sample paths and protection against invalid-sample cache-slot
    exhaustion.  Run the same suite against pre-fix ordering as a negative
    control.
  - Consolidate MAINTAINERS coverage under
    F: drivers/iio/opensensorfusion/.

Static and build validation completed for the corrected source includes
git diff --check, scripts/checkpatch.pl --strict with no errors or warnings
on all five patches, four passing focused KUnit cases, the expected two
failures when the same tests are run against the pre-fix core, the targeted
DT binding check with dtschema 2026.6, the IIO documentation build with no
OSF-specific warnings, clean W=1 GCC and Clang module builds, per-patch
build checks, and clean-base application with an identical final tree.

Pre-audit v8 hardware validation used a Raspberry Pi 4 over UART with a
physical OSF board.  It covered serdev probe and bind, capability
discovery, direct raw reads, a 66.5-second simultaneous buffered capture of all four IIO
devices, and unload and reload.  The capture delivered 919 accelerometer
samples and 918 samples from each of the gyroscope, magnetometer, and
temperature devices, without a kernel warning, OOPS, or IIO overrun.

A focused post-audit Raspberry Pi regression then exercised the corrected
ARM64 module in a one-shot tryboot without installing it or changing boot
artifacts.  Both the first load and reload registered four IIO devices and
passed direct raw reads.  A 12.0005-second simultaneous buffered capture
delivered 165 accelerometer, 165 gyroscope, 166 magnetometer, and 166
temperature records, with no read errors, timestamp regressions, or
critical dmesg findings.  Unload, reload, and final cleanup passed, and one
normal reboot restored the stock kernel with the OSF module and devices
absent.

A validation-only debug build from the pre-audit v8 development source was
used solely to observe internal parser and DEVICE_STATUS counters.
All parser error counters stayed at zero, and all 94 DEVICE_STATUS reports had a zero
dropped-frame count.  The submitted source exposes no debug counter ABI.

This series is based on the IIO testing branch at
a9fa85254feee2b52b2bb4fbb4920ece47dfd6f8.

Previous revisions:

v1: https://lore.kernel.org/r/20260520072843.3593-1-kimjinseob88@gmail.com
v2: https://lore.kernel.org/r/20260524085312.15369-1-kimjinseob88@gmail.com
v3: https://lore.kernel.org/r/20260529121005.1470-1-kimjinseob88@gmail.com
v4: https://lore.kernel.org/r/20260607234343.22109-1-kimjinseob88@gmail.com
v5: https://lore.kernel.org/r/20260616072242.3942-1-kimjinseob88@gmail.com
v6: https://lore.kernel.org/r/20260628191337.937-1-kimjinseob88@gmail.com
v7: https://lore.kernel.org/r/20260707014525.1015-1-kimjinseob88@gmail.com

Jinseob Kim (5):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add authenticated stream parser
  iio: osf: add UART IIO driver

 .../bindings/iio/opensensorfusion,osf.yaml    |  52 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/iio/index.rst                   |   1 +
 Documentation/iio/open-sensor-fusion.rst      |  72 +++
 MAINTAINERS                                   |   8 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  27 +
 drivers/iio/opensensorfusion/Makefile         |   7 +
 drivers/iio/opensensorfusion/osf_core.c       | 393 ++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  70 +++
 drivers/iio/opensensorfusion/osf_core_test.c  | 493 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.c        | 304 +++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 +
 drivers/iio/opensensorfusion/osf_protocol.c   | 224 ++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   | 101 ++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 124 +++++
 drivers/iio/opensensorfusion/osf_stream.c     | 231 ++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  53 ++
 19 files changed, 2186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion.rst
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_core_test.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

-- 
2.43.0

