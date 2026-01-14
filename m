Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73D37F8AC
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380439; cv=none; b=RyBFTreohKJYuAi3DcH2kYazgtVnCqM6HWeNc7VQ10wXT+GoYu/lY1BRr1esKHoV9oytUfEKBBAsjdrYuUmIbEtvMWlQKjc1aQPMnDYLdhqP/RLCx5iKC6uh+dN2BjYyeWmqxLSvL0M9L8iAqj2+JNbf2x/j0rYL2ctkYCn4O50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380439; c=relaxed/simple;
	bh=J+ezMdLeKDw2KdHjb7fx+7OSZNe9loJWenNTh9oNP1A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LmA5+YvXiMVQdzvySMMqZ7sBX7fQ1d4Ki4BirC1QYEHK0CxChxrE4GU+uyuADkkYLuuhPvzX8llCUdVJsGeDQx/sroqQvv0ASbzzYpCcLGcqCoR2kfUItc8o8tAo0bdLERMQGNcPbAvbJbCO/oLRm50m9p/+imxBDKapSYzOezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8768225837so39764666b.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 00:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380433; x=1768985233;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM8f7jH0taMvYnkaVr76MNplqROK/eiMRxPqXZYuq2Y=;
        b=R4zSjLXQRdMRkMS5WxnwvXzUCpEetbdjlmQE3qsP18aN6hSiGoP8yT1Hsc05xZyvp4
         gyy+aK/2rQPJuFl8S5lnf/EbTxqTL0pItEi77OFvv15PmdP+SMrkUi7hQvQRLqMt0rVX
         BPLSxE84KJSTfz41Ok5KSZys5w/DOHfM/L6V4oL9XOjMsPhKr9rHrubHOzRRPOv9Nf9r
         5qJdNnxSG4f1Vh3IojoW+DSnPpw715cFI5Zf/bYksqhnPei9DZ1jZDlq6Hhgfy8ujPoq
         tuYQxWZANfwlCXBSTEVY+WJ45+Eley+z5pHNyQvLuCOkQNSdqtBgB0kf9boHxev7K/jc
         e1AA==
X-Forwarded-Encrypted: i=1; AJvYcCVwbS13u4HeOayfYuKxz/YQSjTov915XGFB1tTXjFKrLJsiKJEaMVK+xsNv2Lg5xLKQz0BRfUMN4ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIhGZf8KzWJSFLQHKcyMyY+x9ZfNtT79bPMnCOgHJj3LSKXZjA
	jS5KJYCxWGN1sFAG87UMvziuqO1cXoMiMoc14KqjSGNt9Gi/cf8tn3IH
X-Gm-Gg: AY/fxX7vV8JDSBZ9UNCih9I8kHwCRZY9t+Vmith1c/ciUzINO59DhzwB19VHnGFNBQj
	wDrdOixUdmB+yBjUt01oC2i65taoRd3fsUfzGgIJ4Xr58ylmaMhmkc+0F8+581i+OhxPBfFCRro
	g48KYA+KQY6IPXAp6sut8RAA8IpEGQCp7zRqM3OGN9nPaU8UMV2xOdrxrUj/aZzg3PHlUCydS/g
	QU4Yzj/ARceyninq0tWVOI1YFqSX4ZMaSBgjz0v8+xQMS3mfukH2sj0+sHqClIYbcRa6o4ISOKp
	GHZKABDrncPLl2tUIeId1unR8cLglJrBR1J74KXvkqiJshzMq/0k4EEYNxR0x2lSvmY9pY4RgmN
	UVONHQkeLq+ma/Y3+0UV9nNNoIA9mMbImIyEtIwDJukWf8dzOXLvPZ8pJVS7M2/vTcPUR/+S6Bs
	43BfuEqYf5qhXa2i3j5KjfnjnaW1y0tx9RRHz/z1d40UnAOQ==
X-Received: by 2002:a17:907:2da0:b0:b83:972c:77fe with SMTP id a640c23a62f3a-b876770a4famr96020166b.2.1768380432976;
        Wed, 14 Jan 2026 00:47:12 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:12 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v2 0/5] New DRM accel driver for Texas Instruments' C7x
 DSPs
Date: Wed, 14 Jan 2026 09:46:47 +0100
Message-Id: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdXZ2kC/2WMQQ7CIBBFr9LMWgwDxgZX3sN0QcoosygYoERtu
 LvYrcv3/8vbIFNiynAZNkhUOXMMHdRhgNnb8CDBrjMoqc4SUYvi7UJZaH1CNVrlDDro8jPRnV9
 76DZ19pxLTO+9W/G3/iUqCimM0Ub2w+hxvpa40Fr5E3M8Biowtda+r3H/yaIAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
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
Changes in v2:
- Add thames_accel.h UAPI header (Robert Nelson).
- Link to v1: https://lore.kernel.org/r/20260113-thames-v1-0-99390026937c@tomeuvizoso.net

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
 drivers/accel/thames/thames_gem.c                  | 405 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 include/uapi/drm/thames_accel.h                    | 189 +++++++++
 21 files changed, 2300 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

