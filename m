Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1D175A71
	for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113562; cv=none; b=kV709GxliMaa2e+yoPA2CCuWJkQ/a3O1Uwa8woKj00BHgqVvPt9pZ37fxWxB3bg83R9xWW2Gj6rw7eiFIh8+b7GL+nLCrLa1YeTngR/3/kIg36j9ed5sMN5N4WwXbcfr7e7/pzznTPuYzT725nBLEVHiMMN2fNpS6hztiAyDXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113562; c=relaxed/simple;
	bh=7lbuSXy266xvscn6Azstf5i7N7zEFerSJLOUbFcN/qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdz9nH9cpVq3dOSbWywdhTp7bgQ+IYGdrz6SiIXZc/Hxzg24QskeihazN4DSRfGzhgDeL/D5uMkHpvxm2dPGQr4vMxNWvyO07kSOZx+LZvoPu6GSK2WgeVMvWDTTOIXMiWgXyW+AIl2PNhYTjx8vbs0cCgCZFLd7cEpbqRCPMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=T/+11m6d; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="T/+11m6d"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89c5446f3caso19371806d6.2
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1774113559; x=1774718359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=T/+11m6dKmTyGpPF7fjpD08hWkD2ZYX+r6dHWeqSAnFn3o0dX82br7KYP4a9vUQEMs
         7IpXnslNjiWHeO5F0o66lLmNXPqRo4UybHNXDNB9NVf/8nghV8CDNrXFpuDi3ewouJ77
         Cv7XYbKzR6pjUqPH0RLJaLJNrQ58JGBdCHtzPPPfbK79L7+OIkLcmF0IK7iKa4oAVOaO
         W/jEQ0Md4OoKD/hKZ+Lov6os69/2K+vTFdT7sDFIA7awBmuaqN12jyCHrpT9oFepA6d8
         rVZMjKbWRifzuqUCoo+jx4Qew1KwpeXexro6x3fRp30qVDvIN9GBjrXtrBEBSsCFiOKk
         m6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113559; x=1774718359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=Z1v2V/mKDqK2ua4EONIpN6L2TM8eQfyh5TKM9TgaEZ8Ruf6uAr632T2dB4XbYhmD+f
         M+VCyw22dqeHaVajTRNBgx3iCxthLGzAG3o7sNvfb7rfs43za7fJQH0xTaUA6VrWZeX7
         4UWDGW8juHLFlhXuEGj0OoAbdJTzLkDTibBeykGW6ne7YeuWOOe3LJ5Dq6gpupb8rkPB
         AS3t0znLYbTfM4h3PZ+1iB8Ep9PTN7oheUL8Y3BgI9Kwvntdp4TQps+p4Vj0n3RM9Fwv
         vCIkofiIbngzXXT0n0bjNvFK+xdcRahDLnJKX5QAeHC8Zr//mKNGNFl8/ezaWDCdmS+1
         o2kA==
X-Forwarded-Encrypted: i=1; AJvYcCUTaFhy97xlSBnW78K8+kQ9v3gh0v5OPMYRGdgrVv6aldmHogkTH2NNfCc2pLKrkzXSMd3HALQWn8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLZplknBx8qdvpmqZV40tbhC/XIRtTRtqqTTOPJl4BvWvKVeQ
	3iqGFytJTiMirGPYcQNLhyy7RXbbL1UTeuFJ79jFw5Xr7ZbhqocmBvzIVfLelftx0aRPaBPx5Uw
	Rufw6MDfHp/w4
X-Gm-Gg: ATEYQzykUgc/xpTHp4hFF0zUSw0YlSN9ERiPJOdIyaDFDf34IMltv+ym4tzqArvfjrF
	JcHWqg0tgBq28bZlmCZ/cL1/QyMkwRg8w1nDiOV/zx22wx57gVDN27VNu7u5f7ccdI7YzbE3kml
	hWJdHCICwqfiooE1I/t4YfMKiqMXHskcARFwvP0fc5sjjLiL6cpwGp0e7iHSybkJ44g1Tke0oq7
	yjwtMgjd+hVLUJwU3JOu+fpZNXdzH5JNxWUQN3dU25zMIcp9ITmN56GflLJC3EEkP3MVwZ5Kmem
	QSjk0PH0cnS+JUBjt8FH6pQJ9b1ktGFOhnMGLhF3yT+KMM650afTG4qIv+fIqtHVPNvUtn+7G5g
	fujjwx/R60UB89MzhgkNPClY+5XPK4rEa4Yk3I3cIMCuCajRcMF6BGo8I+e6NELrY0aINoR6523
	TD6GzdHdBc/bXurguPxfZtS5dExWYVLaOfSRcJ5lXK1N2oraPxnfi5esnrBV6rgw==
X-Received: by 2002:a0c:f111:0:b0:89a:b7:9a98 with SMTP id 6a1803df08f44-89c85a7f5bfmr93200186d6.53.1774113559370;
        Sat, 21 Mar 2026 10:19:19 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85367ba7sm46803336d6.43.2026.03.21.10.19.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 10:19:18 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899fb2b94c1so19110786d6.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 10:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW19Kk1Xyke5WDcelO/v8sDFxrC/QQvagqzMai4LwoTMCr6roaXO3MiyBfe0H+kUqVs85Lrl3wD+70=@vger.kernel.org
X-Received: by 2002:a05:6214:2503:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89c85a4415dmr120844646d6.31.1774113557567; Sat, 21 Mar 2026
 10:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 21 Mar 2026 18:19:06 +0100
X-Gmail-Original-Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
X-Gm-Features: AaiRm51EiMaDZyOBoTxsmzhD9LKdQqqk1TUMHYTLZEpIizj3O9FXdJaoYzmTmY0
Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
	Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ioana,

Looks like the userspace portion of the driver is closed source
(libNeutronDriver.so)?

https://github.com/nxp-imx/tflite-neutron-delegate/blob/lf-6.12.49_2.2.0/CM=
akeLists.txt

Regards,

Tomeu

On Fri, Mar 6, 2026 at 2:27=E2=80=AFPM Ioana Ciocoi-Radulescu
<ruxandra.radulescu@nxp.com> wrote:
>
> Introduce a new accel driver for the Neutron Neural Processing Unit
> (NPU), along with associated dt-bindings and DTS node.
>
> The first patch extends the GEM DMA helper APIs to allow bidirectional
> mapping of non-coherent DMA buffers. While not part of the Neutron
> driver, it's a prerequisite allowing us to use the GEM DMA helper.
>
> Neutron is a Neural Processing Unit from NXP, providing machine
> learning (ML) acceleration for edge AI applications. Neutron is
> integrated on NXP SoCs such as the i.MX95.
>
> The NPU consists of the following:
> - RISC-V core running a proprietary firmware
> - One or more Neutron cores, representing the main computation
>   engine performing ML operations
> - Dedicated fast memory (TCM)
> - DMA engine that handles data transfers between DDR and TCM
>
> The firmware is closed source and distributed as a binary here [1].
>
> The Neutron software stack also contains a userspace library [1] and
> a LiteRT custom delegate [2] that allow integration with standard
> LiteRT tools.
>
> [1] https://github.com/nxp-upstream/neutron/tree/upstream
> [2] https://github.com/nxp-imx/tflite-neutron-delegate
>
> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
> Changes in v2:
> - rebase on newer drm-misc-next
> - dt bindings: clock fixes and renames
> - update DTS to match new names
> - remove unnecessary fields from neutron_job structure
> - fix use of uninitialized variable
>
> - Link to v1: https://lore.kernel.org/r/20260226-neutron-v1-0-46eccb3bb50=
a@nxp.com
>
> ---
> Ioana Ciocoi-Radulescu (9):
>       drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM=
 DMA buffers
>       accel/neutron: Add documentation for NXP Neutron accelerator driver
>       dt-bindings: npu: Add NXP Neutron
>       accel/neutron: Add driver for NXP Neutron NPU
>       accel/neutron: Add GEM buffer object support
>       accel/neutron: Add mailbox support
>       accel/neutron: Add job submission IOCTL
>       accel/neutron: Add logging support
>       arm64: dts: imx95: Add Neutron node
>
>  Documentation/accel/index.rst                      |   1 +
>  Documentation/accel/neutron/index.rst              |  12 +
>  Documentation/accel/neutron/neutron.rst            | 131 ++++++++
>  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  96 ++++++
>  MAINTAINERS                                        |  10 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   3 +-
>  drivers/accel/neutron/Kconfig                      |  16 +
>  drivers/accel/neutron/Makefile                     |  12 +
>  drivers/accel/neutron/neutron_debugfs.c            |  34 ++
>  drivers/accel/neutron/neutron_debugfs.h            |  15 +
>  drivers/accel/neutron/neutron_device.c             | 239 +++++++++++++
>  drivers/accel/neutron/neutron_device.h             | 155 +++++++++
>  drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
>  drivers/accel/neutron/neutron_driver.h             |  16 +
>  drivers/accel/neutron/neutron_gem.c                | 116 +++++++
>  drivers/accel/neutron/neutron_gem.h                |  14 +
>  drivers/accel/neutron/neutron_job.c                | 372 +++++++++++++++=
++++++
>  drivers/accel/neutron/neutron_job.h                |  43 +++
>  drivers/accel/neutron/neutron_mailbox.c            |  47 +++
>  drivers/accel/neutron/neutron_mailbox.h            |  42 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
>  include/drm/drm_gem_dma_helper.h                   |   3 +
>  include/uapi/drm/neutron_accel.h                   | 130 +++++++
>  25 files changed, 1801 insertions(+), 3 deletions(-)
> ---
> base-commit: 6716101ae42949e98ad4b9e71eeba08c055be410
> change-id: 20260226-neutron-c435e39d167f
>
> Best regards,
> --
> Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
>
