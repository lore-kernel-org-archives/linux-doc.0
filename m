Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EEE279357
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 18:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631014; cv=none; b=Szjk9sLS3X0/fKaVcX0hZq3O6DqhaODHHTxNCTfVOyh4RZD///tJ2Wky8XqI2GOnU+FSrJ6zZ5T0rlXBR8rqtkyZ64sGuaYVwn+yLgORayyHZk4TU62Ly7am2XIHKOPHrMo/7sa0R0scHAirbAX7IfWIqh/utwu1KSNN1Z0Z1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631014; c=relaxed/simple;
	bh=D1P2hjUoye3he0La/a+iQ8GuVBH89z9c8PtYeykiOpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMmlG6NrslvUVes6YE+zEgvPNuujijGDSkr9tGEjDDrDF7cMzXgiirUnGbX3MsKLcE6CXw6y6cxIiAsaAPNfk++eqdtYyJHytc56f2OYU1b+q+A4y8Xf731Rj9unVRFCIyPxi1rNnK+IkDQWf0BPhEXcLY2u8X0SlT5vOra8i8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b=o3r7N3Ld; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20230601.gappssmtp.com header.i=@edgeble-ai.20230601.gappssmtp.com header.b="o3r7N3Ld"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22d95f0dda4so29761885ad.2
        for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1748631012; x=1749235812; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CX8RVGcjNGfza1J+8Y/TBJXjjM61IDQf7sORQ0CRlUE=;
        b=o3r7N3LdxZb+mP2Gi74J071rrydJRzZ+Pb9zspL7Kt8x0zrmQxM+TjOg3IzLGD/Ilz
         I9QlyrEcW1Gk1nJ+zPUnzYkWa2KDfhDcUtN5HG0Ecy1/ncvas1i2OX+rBns/e+uZ7a7O
         4ZjXRvxqly4y5z452RmDlkKSjHrXGlEENaQy4Z1Ei4CHWKSBVWoZnddG8tvU/7EmL/D4
         wzu+Ke39byEHVqJSIky7j8FjKC0+Zsy6ZGEqYeowS0g2ahqv7unAIilzTtq9JQ23mj5/
         AL94ioEfGZKMoTwgPM4/h/yVuhMCQhpOTWSOKjHRjGO38FkJjZmSv9BDBYQ55rbyOo+t
         7tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748631012; x=1749235812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX8RVGcjNGfza1J+8Y/TBJXjjM61IDQf7sORQ0CRlUE=;
        b=w1XnC8nHnKXSnzImQxiXsvWuZXML1UTULtMgqtRG7Qtuxr7Yyj1qn4Zte7yPJf4YVP
         FpUGgsNgr1DDvGvOHDO4vWUK1+OlOrvQ7L9pYWFZ50KlO33uTmq0Zp4f0p+zDALiDlJY
         UcRq0dXXtd5ffvFvfEmgFlmWYwQhlHFceP6fQdyyuVQxJz2ySurAQRTjXnawGKew7Uc+
         Mc7MkenPBP1iecKEOzZbvPQ12ScLbG0xezef51PB4bIezW3/nh/krBJPGAkOolYPHjdO
         /BLxyGHSIdFd8yZCn7ojCY2U+DcKQMhmlBSWEQz1AfzpmSB2rbYFX9cb15Q/LD03JjB/
         VSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlleyHwg/jzNIqzpEQdVaglB+6o1258CyKtacu5n3T8LtCc/iHVG3YWHkqLA544RrB1Q95jvH61Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGib/FYPEiRYDCnUBHv3fkasJyBnLf83WPUxV6gZihyOqk/yV/
	vn4xtMqScquU/0AYfjZyMZEgi7MLac1D/yjFMDAkqpP04HUkNiO7eQTAIlwZj1TS/ELo5kipXhK
	c/eFs3K624uImQfRODw2zBe4R7fw97kCLA+h++PeXFg==
X-Gm-Gg: ASbGnctOWeK46cKiF55v5aIIJ41KycIcv/pQ+bc14EREZ6K/DjSsFg9gW0Km9gJw5Fx
	oX5tNZSGD21a9hpn2SG1jEEr4MC+5/O6Ho0k1FuUX/xEomYI5dgtu15A0CyhwE4tmD2xPPJJx/G
	F5X85DXGhf4MmneXNsIaNHdBur5gntFmgt8seyZC7eGg==
X-Google-Smtp-Source: AGHT+IFy6gculqd6TMBrN0rYJWssXVz6+60yi4DzoSheepAu+OoDDguVK86eUKc83jB1uCOQJbumvqYQqLIeYGr+pL0=
X-Received: by 2002:a17:903:1b6c:b0:234:ba37:87b6 with SMTP id
 d9443c01a7336-23528ef7833mr65464395ad.17.1748631012585; Fri, 30 May 2025
 11:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
From: Jagan Teki <jagan@edgeble.ai>
Date: Sat, 31 May 2025 00:20:00 +0530
X-Gm-Features: AX0GCFvkNnwtQ--V1GCDW4BcbIzs35k_zL3RhgmHKFDsjekxRIDXrFhtYRu24lI
Message-ID: <CA+VMnFzisyMFzze52RRf6=Gstq29jmukrPSfqXfBWrVw0a7k1Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 May 2025 at 19:14, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
>
> In its current form, it supports the specific NPU in the RK3588 SoC.
>
> The userspace driver is part of Mesa and an initial draft can be found at:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
> Changes in v4:
> - Several fixes to DT bindings.
> - Link to v3: https://lore.kernel.org/r/20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net
>
> Changes in v3:
> - Reference in the device tree only the register blocks that are
>   actually used.
> - Several style and robustness fixes suggested in the mailing list.
> - Added patches from Nicolas Frattaroli that add support to the NPU for
>   the Rock 5B board.
> - Link to v2: https://lore.kernel.org/r/20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net
>
> Changes in v2:
> - Drop patch adding the rk3588 compatible to rockchip-iommu (Sebastian Reichel)
> - Drop patch adding support for multiple power domains to rockchip-iommu (Sebastian Reichel)
> - Link to v1: https://lore.kernel.org/r/20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net
>
> ---
> Nicolas Frattaroli (2):
>       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
>       arm64: dts: rockchip: enable NPU on ROCK 5B
>
> Tomeu Vizoso (8):
>       dt-bindings: npu: rockchip,rknn: Add bindings
>       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
>       arm64: dts: rockchip: Enable the NPU on quartzpro64
>       accel/rocket: Add registers header
>       accel/rocket: Add a new driver for Rockchip's NPU
>       accel/rocket: Add IOCTL for BO creation
>       accel/rocket: Add job submission IOCTL
>       accel/rocket: Add IOCTLs for synchronizing memory accesses

Can this be possible to infer yolov8/10? Do we need to convert PT/ONNX
to any other common format's unlike rknn?

Thanks,
Jagan.
