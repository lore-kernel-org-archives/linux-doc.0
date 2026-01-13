Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785934EEFC
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326289; cv=none; b=gJwRVWcHHXzbSUmfi7w0Zb69cBVr+JXw252rdzSGwQHgehdIO9PUjtUlXHrP4miOaosYVkuhIYqnVjhiRyItE+cq3UIQGuEvPFL8kosRo3T76jZSmTLlC6UJ5qMSXX16aXoL15IG2+KxreyKuxBY9Z8usYDUHmxbB1H0hFWemHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326289; c=relaxed/simple;
	bh=ydCY4dMkYiDlitiuC6Z0F5oaftjzbWrrsxFgbMP3eh8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qihj+YUzDZQksuSALw9y/1UatRvXh23OkHE9TlRNnWe988KNXtohs5vwwa/jbB+llMf6SJwAap5DoxbgkFmU20kt9UcogMJC/wVg5y5ic7YFU6u+g5t8aD+3DKS9Ix34DfGqQZpH/I15Mr8q2rASbnDwH/iuUrc3GK9cVSQOrSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8712507269so353858966b.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 09:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326286; x=1768931086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRDDaI8PSQ9i8fUQYmRubU2lZ9FKKoqL8+7T/Yos84E=;
        b=jhb5DOsFhd8pksXSNdN1fDlA53EPiErLmZtxwPQvJCJ2aC4a6AFeMVwEm7zcejHwJA
         ils+W54/EVqIGc34qc8MPb8vMMJ1neRLNHbikHXOsRIKyXVP08gQ/ZjZJn65N1EEQ1K/
         xW3SSACZg8yt6Qni34SiQo0xOPnBISbdXiD/8aB1PHYfbI50gqFIGdLo+LCceu2hyecw
         5snzcPq9EB8jXcxu3XNhj7MIgKvj489iGEnmgtt2O/O8bOgE52+uMCLeD3N2bUzTBvSi
         kYY8sBf2R89UcXCupr7kKXAO0spOHmWZLKoRAItUUCpHR202hg2kKsy1OzdfEcy2wy6/
         0M5w==
X-Forwarded-Encrypted: i=1; AJvYcCU9xxXG8WsKqnIsagqQ5EAtiH7p+pk7nC+bfrq8q4ya6fSlb1vJT5EMF9p6tAM84Zlt8KsYso99N2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IGfQk405bC/+u9Y2atY7oduvPITrw0XmHWCvzJAFd1iuQ7Nc
	o10xmDjPVFtGJ8KtlcCBfdzlYbL4MU9UZMsoWyYS8o9njr3cf/1Dp4zX
X-Gm-Gg: AY/fxX4/5kStNsfWn3+IYfogzCZ/Z4587WVc0qb3rebP+L4SsNmSBbgL0gMy0AiHe+I
	ODBAlmKIFx0lvxmkl5NOWLaV0d6KmR1YmiqFgQitq5M6pkNSFNvJFQ7R01TBgT+6XD/zJw2TKj4
	y5jkavtKzE1QkqG1NiqxAgg0QfluwO1fWQm9leygNVSCG1BP+98hjR4rNdXtKi4dBEcXcPa+Jeo
	YuqwkpTresh/wZvEm047CvZSfuSIgUruEliwyFIQA+nrfAyyhwWr8m5yXuHM9IjmH1U++P+Mpa2
	tFLrqf/0KkIjOpq/hLVYg+yjPDnupVEo8irnL2NqpnB9IVyjks9tUuWYttANCmDSlVthz9mZg0L
	cpxsonhKuLBwtVSKnEsqMu68r5+udqhu7e1mgoC5jv0l/hCDmCUnrqAcWHdi/1/RSeaDUMnX+yI
	Xo3sKgTwc0IA9wC7ADTUytknKn9DvhC6P6u0yhZrB5BGFzMQ==
X-Google-Smtp-Source: AGHT+IF2LxGsN/6Keoe3DyT2UHG1IbdrBpLZY09D3elBScNdSzuVpg3kGMzeCVp/wgijXP8twmjnjw==
X-Received: by 2002:a17:906:7954:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b872579ba1bmr579850766b.41.1768326285367;
        Tue, 13 Jan 2026 09:44:45 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:44 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH 0/5] New DRM accel driver for Texas Instruments' C7x DSPs
Date: Tue, 13 Jan 2026 18:44:34 +0100
Message-Id: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKEZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3ZKMxNzUYl1jYxNDI/NEoxRLwxQloOKCotS0zAqwQdGxtbUAsQm
 1olgAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This series adds a new DRM/Accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S. These can be used
as accelerators for various workloads, including machine learning
inference.

This driver controls the power state of the hardware via remoteproc and
communicates with the firmware running on the DSP via rpmsg_virtio.  The
kernel driver itself allocates buffers, manages contexts, and submits
jobs to the DSP firmware. Buffers are mapped by the DSP itself using its
MMU, providing memory isolation among different clients.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames_firmware/.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

If there is more than one core that advertises the same rpmsg_virtio
service name, the driver will load balance jobs between them with
drm-gpu-scheduler.

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Tomeu Vizoso (5):
      arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory pool for DSP i/o buffers
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add IOCTL for job submission
      accel/thames: Add IOCTL for memory synchronization

 Documentation/accel/thames/index.rst               |  28 ++
 MAINTAINERS                                        |   9 +
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  11 +-
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/thames/Kconfig                       |  26 ++
 drivers/accel/thames/Makefile                      |  11 +
 drivers/accel/thames/thames_core.c                 | 161 +++++++
 drivers/accel/thames/thames_core.h                 |  53 +++
 drivers/accel/thames/thames_device.c               |  93 +++++
 drivers/accel/thames/thames_device.h               |  46 ++
 drivers/accel/thames/thames_drv.c                  | 180 ++++++++
 drivers/accel/thames/thames_drv.h                  |  21 +
 drivers/accel/thames/thames_gem.c                  | 407 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 20 files changed, 2113 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

