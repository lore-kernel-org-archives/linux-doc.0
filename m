Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A951DDED
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755926; cv=none; b=eq0FNdK6BW9cV2rHBsdwkEzhWhLJGdRc10q/kfZGCO3z4ZNWU8yOq7QyCgwak0k9+tFJke4Pb1oeQrCcmMwIpqjUNdMIO5J7NBS4Bd5c4FxlwtGyn6GGsixOtWBPJWt+21Z/tU13AF2niomo8a1nsNCpZH8lxZgKWXkbZlN2V0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755926; c=relaxed/simple;
	bh=ul0rys5upXfFQ1pgUywuQQ+5Z1mTk6pcDtvaCiiHLbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jqhj0GE921kF2tbwdFGsSGWf7k7da2CfaOdnv+r6VyWsBVKM4O+1werpoadDpogt+e1hmABtbtREFzXzplqAXM4qBDZbBeZcj1Tnwt28gV3IlQME+/bEOyVT5lXskOghwIXtfYXVYD7Sh1QGJxzbRJctyzL/ff3g4fcf9+0jPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrU+zwrI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrU+zwrI"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300816so3189455ad.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755924; x=1790360724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MQhldycE9aUQavgxyDeXbivCGtgn7Aq1X27dPA9Ny0=;
        b=GrU+zwrIavlODt1WdeILKPKGc3gcT8FnJGE/0O2nnfC504xIPCEM4kw9Zy5ozoGZ/a
         DFU3rOm5I++Y6CaDhaTutF72MaAmljlx9ASb12axy8/oaTTI+u9/WHvEMptjiDVKfeyg
         XKh+90+PTygWV2SucUezI7wd0+0jnXYfktaIR7cqEn/UTBOfNa8PPSChRK82f6fHHorR
         B9UbANBpA7zs+euT5je5ALvqLP+BuNa6t8E4CtYUqBDj8/6LOX+sxqCpOKf0BJFVGKC6
         d/fvnPkHOJUlHXXN8vk4V7MWlUJju4G/BPb2EhyuDtYr0UfJajNP8DAAK0uTKW3SidHr
         Nd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755924; x=1790360724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MQhldycE9aUQavgxyDeXbivCGtgn7Aq1X27dPA9Ny0=;
        b=v0u8abw2yMszMzJSrpwtQnvEOQd5PY57FyaDRcKjqc5UkhyC01VWkGxlBiVyoUokIe
         wUiC8mk79ZE5d/48RDrWSjkv3aDZt1BK0fM5rDnInQ3VbB5py/3dYXVhyZjbDbRr4UOm
         Tpp4C9tmwMJSvWcUA6hbZ3Ao8cChiS1uhtjFxXEjEaAhd2dzzT94uHaKj0OwkvbNOgFa
         i4k6VjQko7GKjv2tdUw4/MJowPpylWx5cEU4Wmlgf1UPM463xSxwcZVNf4thZq4Edf5c
         GMWw3xq14vr0lAhvEnhK4jmwZFrGaeBN24BQukiyCRqhRw0xV2INxiGWHxttfoIdkx0J
         nVKw==
X-Forwarded-Encrypted: i=1; AKwUvByy0tgCqnDcpCTNRyPAIJL0iD7j4roNeEr6N8POhUwM+3An4+q12Hh4y8SfQ7JzI0yHNQScIJ8/hBM=@vger.kernel.org
X-Gm-Message-State: AFuF++lbFtkK1fm9V6cQTOaS2nHPw5Ay/bplIbBPnwgG8HMxjUFDGI2O
	63qKydrSAdyzR6wvYhyegLvxp/CiUdLETYVBOQaD0kbBhfgrIf9jvzXs
X-Gm-Gg: AYBFou3Caa35nl3NjoShUzJL6KYH2QqgXh0rtB2cIfuZYr9Axcwcv7qbJzpwTOIYel2
	OVrlbZw8KvdxRKJkV76i54sVEgUsGcM2Z17rowRNISwkxq2fJwcjAr3wTDJpEjQ7J6P5BlxvNPF
	eBWOBlDvxoVdGoc79fNyBecEQ5vYnEfy0E0sbLWt7uzE/tWKmzK5ovyAn4hPh/UKOBDWc3j/4I2
	1fzMWD54pihlzXepMPBpr0z0+TVqa/GaeQGycgQ9yMoLVWYj2HAorqE6QQrkFWXM9d72+FBp+Ii
	DHAtcj8SxTdm9NCytnE83BuFZV6yiHJFEh4I132WJ2z86gk0NN6DoPvYNszKpKVpNiZysn13wT6
	HNZgnQfxyT5c0CBaR5CkB0SL5yPyhuk91WnGFzg8YW8Hcg5kkAMV2xUl2cFhRxZhbYCvapSBWqy
	R8sanunARW/bIlP7gl9jpaUx16bmI3CZZgh6lfVlFzMsykWovqFBVPovtDBca8WC3sp2QrW3qbF
	ovQ9/b10brDUF42wojWSgj8gkhmXIaHD8NpjjTSTt7oMp4usMTURdm23Hg4SVWIYqhMaY9t4Sjc
	GLjrReDh
X-Received: by 2002:a17:902:e886:b0:2ce:b3cd:7539 with SMTP id d9443c01a7336-2ddb212b570mr42351775ad.6.1789755923336;
        Fri, 18 Sep 2026 11:25:23 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b49casm871895ad.7.2026.09.18.11.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:25:22 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andriy.shevchenko@intel.com,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v10 0/8] iio: add Open Sensor Fusion UART support
Date: Sat, 19 Sep 2026 03:24:38 +0900
Message-ID: <cover.1789753020.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specification status: OSF-D2H 0.0 spec-1 has completed project technical
stability review, has been adopted by the project owner, and is published
as a fixed specification.

Canonical specification:
https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9cdea1ae550c2b4d6f29f87877adae99470744/spec/osf-d2h-0.0.md

Errata process:
https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9cdea1ae550c2b4d6f29f87877adae99470744/errata/README.md

Current adoption/publication record:
https://github.com/opensensorfusion/opensensorfusion-protocol/blob/0cabccf63ac01d0eb82dd9882739ff58eed4a76c/reviews/publication-record-20260918.md

The specification was frozen before adoption/publication, so its embedded
status snapshot is intentionally historical. The dated publication record
above establishes the current adopted/public state. This is project review
and adoption, not an external maintainer approval.

This series adds the Open Sensor Fusion UART receive path and IIO devices
discovered from capability reports. It exposes accelerometer, gyroscope,
magnetometer and temperature data through RAW/SCALE and buffered scans.
Device Tree describes the sensor hub; its individual streams are discovered
at runtime.

The receiver validates supported descriptors and sample scales, keeps
discovery open after empty or unsupported initial inventories, and checks
repeated inventories before allowing new data to use registered metadata.
A supported descriptor changing meaning faults the session until an
explicit teardown and rebind. Existing v9 cache, scan-layout and buffer
lifetime fixes are retained.

Based on Jonathan Cameron's IIO testing branch:
69fa76f0af3414cc189c3b0b807cb59e327ecc00

Changes since v9:
- Publish and reference the reviewed/adopted OSF-D2H 0.0 specification,
  errata process and dated publication evidence.
- Tolerate reserved padding, validate descriptor/sample scales, keep
  discovery open after empty/unsupported reports, and compare repeated
  capability reports.
- Fail closed on changed descriptor meaning instead of publishing data
  with stale metadata.
- Add focused KUnit coverage for these lifecycle and validation cases.
- Use managed UART/IIO/power teardown and dev_warn_probe() for the
  controller baud-rate warning, addressing Andy's probe-path feedback.
- Split the former combined UART/core/IIO driver patch into transport/core,
  IIO registration, core KUnit, and IIO KUnit patches following review.
- Use validated/unvalidated terminology for framing/CRC results throughout
  the stream/core/transport code, tests and diagnostics. CRC detects
  accidental corruption; it does not provide cryptographic authentication.

Prior validation on the identical source tree:
identical source tree evidence reused; no builds rerun for DCO packaging.
- All eight intermediate apply/config/relevant builds.
- Independent transport/core and IIO module link/MODPOST.
- GCC/Clang W=1 vmlinux and modules.
- GCC and Clang KUnit: core 16 + IIO 2, all 18 pass in each run.
- Core-only intermediate KUnit: all 16 pass.
- ARM64 Image, selected OSF module and Pi4 DTB.
- Targeted DT binding/style and IIO documentation.

The terminology-only diff was verified mechanically. Wire semantics and
data-path behavior are unchanged; the receive diagnostic key is validated=.
Hardware testing was not repeated for this terminology revision or this
post-DCO packaging audit; previous hardware evidence remains historical.

Human DCO is complete. No email has been sent.

Jinseob Kim (8):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add validated stream parser
  iio: osf: add UART transport and core receive path
  iio: osf: add IIO devices from capability reports
  iio: osf: add core KUnit tests
  iio: osf: add IIO KUnit tests

 .../bindings/iio/opensensorfusion,osf.yaml    |   52 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 Documentation/iio/index.rst                   |    1 +
 Documentation/iio/open-sensor-fusion.rst      |   77 ++
 MAINTAINERS                                   |    8 +
 drivers/iio/Kconfig                           |    1 +
 drivers/iio/Makefile                          |    1 +
 drivers/iio/opensensorfusion/Kconfig          |   27 +
 drivers/iio/opensensorfusion/Makefile         |    7 +
 drivers/iio/opensensorfusion/osf_core.c       |  465 ++++++++
 drivers/iio/opensensorfusion/osf_core.h       |   75 ++
 drivers/iio/opensensorfusion/osf_core_test.c  | 1046 +++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.c        |  338 ++++++
 drivers/iio/opensensorfusion/osf_iio.h        |   22 +
 drivers/iio/opensensorfusion/osf_iio_test.c   |  325 +++++
 drivers/iio/opensensorfusion/osf_protocol.c   |  215 ++++
 drivers/iio/opensensorfusion/osf_protocol.h   |  101 ++
 drivers/iio/opensensorfusion/osf_serdev.c     |  148 +++
 drivers/iio/opensensorfusion/osf_stream.c     |  231 ++++
 drivers/iio/opensensorfusion/osf_stream.h     |   53 +
 20 files changed, 3195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion.rst
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_core_test.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_iio_test.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h


base-commit: 69fa76f0af3414cc189c3b0b807cb59e327ecc00
-- 
2.43.0

