Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A591399364
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594591; cv=none; b=W8Lr88NEfJ2/lIo9GoROvrgLAvEATpu8ItmVav0wOJ/wt/0xyox6iNQKr7TXqwZ/nvaKkTSOJyJrWm0ANTBkv3BDP9ec0GdFr+6hJ85G+gH0WByPQvGL12qPHsghVZKp03aZDJDoYQWpDNBAeim0mfAZ/OZazakdDTfBdhQS6b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594591; c=relaxed/simple;
	bh=Xoxmgm/2WljGfQ4K+kmEo1qqc24lFdHLaHJ8BZjAi6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5SXVUp7mRQ/ws7mpHjg2KMAaTnM65JDLcMr6X/NfQTnuMW6onC5LluNtOzHoco5t3eioxqhygfcbk/9ugBo8HrHDynsaJclkoAaBuLdcin3xFIkGJ29WkerGNoV7E0wM0s08lcQ50LlhMcG9gbulMrAjQcPhNc6HjBO0uNl6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtQULGei; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtQULGei"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b903567fdso4792411a91.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 00:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594590; x=1782199390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUXY+HD9eIceYZLxnN05/cYohFkhygsTl0/Uujw94aM=;
        b=FtQULGeilbRm8Pkq67H7CVMsSHFwp1gW9Cs/Ez7EsvJEyaMN/FDVh2npPv0LSr9bhE
         4aZ7LaoYe2/Yu/ow3ppYvQ324iRMrPyebpiGaAQAU101ruToynyGrK69YyFw7vibmpxx
         ZejUesQBgiSRNejHoC3TRUEJd4juTzXNK2SK+0ABYo+6L16yTXnVetNli0fZ49jj+vdW
         kzuiqvtOmAv1DgietDoyitAfdkFAqRa5b0IlMYVotyrDLPX46h54UtA72qIWteNnYiik
         GxdnKGRyTfeMWgJmmq//VKiDqU4dsyGMecpDM+nAah2MwldiCZFJdpx7W6L0779hP6Rj
         7VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594590; x=1782199390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUXY+HD9eIceYZLxnN05/cYohFkhygsTl0/Uujw94aM=;
        b=hhcy0+Num3BDacNF1cZo+CRRycjXK51UdufvdjEyAt8BfiK38swfzjJ1SFjZkgmqkc
         x5t3bbwSPxKmm9v/YEs+7T/8mfkZDFO4OAjYZka/qB2/D7875lLQPi358MXgH8hzr/mX
         0wzP9cnDkJU1N5gRjUdGbYS5jDP5SAi4ibLT4w9+63RMi7Ng2yNz4PQKeSFbjmJwKn/a
         rJrnpFGgXAggWCBit+nTzZjKsv0JlqbQ8wSsv3QlTbMUARk0376zE8pLjB5DD+WheveF
         2Wb9rKlsAPFTWMIaaVAi7V7HOQ8wNH7Dq63n4iGOwSbyMBRXQZ90EI5kHHvJ56/2n5Ps
         0IFg==
X-Forwarded-Encrypted: i=1; AFNElJ9rQ9Ars4Q51QfRoKz9i3qppMxf3k8z602StwXftNqKJDCg75jScwdhlVsp5/3KrpzfrgnF+C6Y50Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMX+SVjfKcUO/tGKrU/j3JVpenm/8Qs7FR3cEgE7IP1mdHcFV
	H4eYtpq3aGjsHj4rxpNzx+PDOw6+J47cyKgOEZfv+GGhUHXA1krh311v
X-Gm-Gg: Acq92OHBDedFnYQrTzt3eK84gJ3PZXVqnmsdebaml8VSPAKG9by33RtiBJ2vh9/q8TF
	WVn1D2NB2dhi7CfaMhnD9DV2+Nvp53rTDemwRRpmBJoo8bZN4SYf6434jhkIGkVbHDsbMhd/a8K
	9yK8mw1yLiC2wFZL6w9gtKltHiobkwmhIVYmTKloBcTah4HK3UNJjIY4PW+sNkp02DsWcEXIjJ0
	valudB3tGGVAEbfbvG+OvdiAIbw8nA7nCAQzzeUxezihjA3XH4rLxtFiYK+kWxQQBcf4wltjWvH
	tEYsiPVGEcWuoqzNrcuMRq0ZZSVELCiqiB3+ZlLWpmZ2WtEeXmZOyKDQEVpCZDwNvMbH5a+nCiX
	J9XL0S0t9tXHYim/+TDPF7BUrXYiIHxP4/5OhAe8ITZwzSr0n2Y8i4pQgUdaiWfW2nBqSgTf9Q0
	bEMtIqzYvnztu+SJucmrH7Wk4mOmlSJG8HrVGEePkqwVmM7nFAH5L/7vOVKz5+15B/UOmAcl2XT
	kkp1Ja8Pu4Uq8dyeCE947NGKXCd6RWruC3rZxX1UNbz2I1ORQ==
X-Received: by 2002:a17:90b:3e86:b0:36a:a16b:5f65 with SMTP id 98e67ed59e1d1-37c5286ca76mr2681029a91.11.1781594589882;
        Tue, 16 Jun 2026 00:23:09 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f1014sm123513435ad.16.2026.06.16.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:23:09 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v5 0/6] iio: add Open Sensor Fusion IIO driver
Date: Tue, 16 Jun 2026 16:22:36 +0900
Message-ID: <20260616072242.3942-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Open Sensor Fusion is a sensor aggregation hub interface.  The Linux IIO
driver receives OSF protocol frames from a serdev-attached device,
discovers supported sensor streams from capability reports, and exposes
the supported raw sensor data through IIO devices.

The initial driver supports protocol major version 0 and the receive path
for accelerometer, gyroscope, magnetometer, and temperature samples.  The
current wire magic is OSF0, but OSF0 is a wire-format detail and not the
Linux driver identity.  Protocol compatibility is carried by the
protocol_major and protocol_minor fields in the fixed OSF frame header.

This is still RFC because the driver-facing OSF protocol subset, the
compatible binding, and future protocol compatibility rules are being
reviewed.

Runtime testing was done with an OSF GREEN prototype connected to a
Raspberry Pi over UART.  The driver registered osf-accel, osf-gyro,
osf-magn, and osf-temp IIO devices.  Direct raw reads and software kfifo
buffer reads were tested.

Changes since v4:
- Regenerated the series as a full standalone replacement series from a
  clean upstream base.
- Removed previous-version add/delete churn from the generated series.
- Clarified OSF0, protocol_major, and protocol_minor compatibility
  handling.
- Added required vcc-supply support to the binding.
- Added probe-time regulator enablement with devm_regulator_get_enable().
- Added the opensensorfusion vendor prefix.
- Fixed checkpatch cleanup issues in commit messages and driver style.

Jinseob Kim (6):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add stream parser
  iio: osf: add UART transport
  iio: osf: register IIO devices from capabilities

 .../bindings/iio/opensensorfusion,osf.yaml    |  59 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/iio/index.rst                   |   1 +
 Documentation/iio/open-sensor-fusion.rst      |  71 ++++
 MAINTAINERS                                   |  13 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  14 +
 drivers/iio/opensensorfusion/Makefile         |   6 +
 drivers/iio/opensensorfusion/osf_core.c       | 306 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  70 ++++
 drivers/iio/opensensorfusion/osf_iio.c        | 275 ++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 ++
 drivers/iio/opensensorfusion/osf_protocol.c   | 249 ++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h   |  97 ++++++
 drivers/iio/opensensorfusion/osf_serdev.c     | 117 +++++++
 drivers/iio/opensensorfusion/osf_stream.c     | 187 +++++++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  31 ++
 18 files changed, 1522 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion.rst
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h

-- 
2.43.0

