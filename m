Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F1A2D738A
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560530; cv=pass; b=p/ddzGaHY3cSRl1T9zH0L/UCkPXc9y1C76zuxQAMBSOfu/LAPN1sa/KBvYV8ZO4DiWXWRneZ3qcD05ACmnNqL0KwXf74qM3cWZQkyGLJ//Q7os7g4eJ3s8pbDtlZyKAydKKuBwa8wovalxY4Cdvh3cwVLMbQ74AqRdENwuG3vi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560530; c=relaxed/simple;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+cF+Pxux/mzlrTu3EDEws1M8dopwGd8bR58Cy4VphtVTEDp/N2udVgJ3y/KNqJO24RSwylH/BAb7qdWXWTy8ywZ7W5jB/7HunwozD/ryjBfweqczJemmFdHxmay4D2pXqLzgFqwHdTv2qxgBwU9ujcEStD5bvUDx6f9KFEreY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa0titk7; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa0titk7"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-44aeefa1c00so5149062fac.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=Ol7jfIdhr4eO3aUxoYPepW2hQi3cZKMozUXOa4SG3s1rQLs9I2XUsWmrR+lZTkPNHN
         fEDzJZosn+6FY6AdOrQcsxdq8MJzB4zzO1NtTnsOu5wEDLMDyS9K1WMNunrncgO25bJ1
         6G5HjV7BTVxDdo4cQI5JCPYcn4jAUWFRJ7mUgFPlDV/83RCRwa/e8UoSVVc07KkYhPPy
         txknS84/1io2OKnbJIljRPz5zatJsT6wHTf7+35uDAn2kA2C/P++SUtkx1U+zq2vwcZy
         mxLrp22TDedzCbL1zUxuMnyfa41ganYHT8pxEdX5XJS08G6Wa3heRCX9rK/qYEy9AaDN
         yqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=mvJ2jm7quWyEXPZaJ8+VXrZHzLAO7Up8pKftsz1ehAk=;
        b=RTkgYkxzghAU55glG1hUHgLrVR1lcCF6q1jmlyRioS3dH1teAQeJjUq2MPl0BsThMc
         59Iq/41OewdejlxSfngk9izEv8thQFoh2OmJCKzeV3HBY/3Gw84Q6qiAh6I4uPSgg6qB
         cHDmNkw5sd7EJMS6YOFSnqba9GcJ7etWNhzjrcnW6y4CFbZ/5Ni7f36bdf6bl5Yd/NLU
         MPYP02Us1hfOi5b75a5eBsd3THQwTv6GTQfOxwNIN8L6YKtLkekTCvR8hnHfh0rxm8W8
         wkrMkXC1EC4Fe7YjD3Wh7UfvLUJxpBUXGiiofpKJpBBo0+trBV0wU/J7IbBlFASQ2Q7d
         kRqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=Qa0titk7cfg9viilFM7aeV6rGktWqe7x27okTN8DPh4jDXARUYMWgxFqxEmt8YHFW+
         +Dy3mi/GxA2kDbvpK4sXRTXDMIx5qZMoh1bmYVVQnnXM7jzGCCq237bpKk0kli6zUIwC
         RgrZZlqITt9lVBKOzUieGKvb1HV/BfWBY/b/Rd9Rz1cAQ7x8FjzLslZp0N2vNpZmfJ4M
         kEbCbg6fooOpLtFBl7cVMWXd6yY/4Hm7nVfgRd7zX22de0JrbPTmGMj/gm0BRTPniOZP
         xv/19X3ArFMOQLOzuBwpydTPmof4NiCVAQjsRUDqg9jUJNUcr08+k2jKVpsfpLEJpR35
         selA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=Tp4X2V68+AT3VbAA/ZMeV3f7ggAlV0HMZlD7GjpBORHve7I/W7WKPRDM/qV186XR1c
         qeSuaeUs+jXyTvwN/1SbBPjCpws36ZD0ASDQeAFl0w4Ef4rCnmo1hyz0Fk4kI8uD+vu2
         ONfTt5RdBJUvJp/er+3RXyBu7z26i+UOe9/VPkAHfCqivMf7cg5cewDg3e/4cQAp1Gem
         s6BBBLCNz4/2i5snqIzEw0ua0wEN7FT4E8WW8upPiwSwu6oehld/Z/PM8Y2owcegcqra
         fzq3Er6Z81DSwNaVeyf2GDy+7ttA7i1cENSX8KaqF/sMiiflxRvbm1x0Mr/yVjIUbxYu
         fYOA==
X-Forwarded-Encrypted: i=1; AHgh+RoWG4xWcmlNsRj750Uw2g1g//wGNK4JAcBH88H7aCT1ZfFOeRuuPJgz/8qw1tMdHBDasRW2+Ui8gCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YysrrcD4KxfPoW/EactYp2cVlD0vPZ5TsRQaDBs94tDPjEio3lJ
	aRVZMiN2lP78/rNbfRSvGtuv1r8q3dWh0M7XP6wro2MZRHfRwSmj3Lw+iJQToMV8KGdiP5JycP5
	vKa3PVwg605cwIpV07/LgmW6QVJFHwj0=
X-Gm-Gg: AfdE7cm836fKyfzeeJOKMCdbPeC8HBOFPF3Tf1uNtIUq/kMrukQkcSQ/r473JVUEUW0
	ShLQIP6NP3ojf1kKCrrN4uEjQybNgn7S7eCXJklLxvxEXFXpIRiM+PUR0h9CNm6V/X52zfDq6K/
	gEofzeCYI9yn7oHcwnnzy2BxsyuV1M5gZCTnhZjTLuOpdnd5BvUSU2kMIYLjzhmsITVeU1itPRd
	Iw5qMRyIXDxfM7m1DszZ1IkJZxRXPygfEtmUZi0p6CcIvQHY1GfL+Lb7+XE5HWtDwSNAvu7dVD+
	LPX0L4x0L62LAUO+hH8bkYbsVVo=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo
