Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334E3655C2
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375234; cv=pass; b=Yox41HaegLPJD6gz5VteUrsKitrNg29nov2KP1JBl1FfTd18iKb0STy487fyn/OKWugaYFTCRsVOMexuA3ESeoitWRITFbP27YYQuXAugWVBkBxC19RlrJg5d7zf70FmH1rfAlHfpe5MiHX8j1UFH3Lu/0rm4wTNhUT7jLTf6Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375234; c=relaxed/simple;
	bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVq2lJVqmrTKDS/hMD4r88bC9tYQiMo+IjSLaV5f6g2CGGneVghvg1G9VwhE4Ct3q2CfBbm7MRzZnqPlVLJO4V9RTVpt94o/kIFhZJBnRrcjvDWysdU0OLw6jSaGRDi5PYqsD9SMJmQk31zTMMYQFAeCySSmzOlsyavS9aBYMmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=ahChxbWM; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="ahChxbWM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so4023744a91.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779375233; cv=none;
        d=google.com; s=arc-20240605;
        b=BMgk7SCCACEgf2y3kf6DIxQMCx02HjT9ScpVKsEWXeZKzsgiHXv0BfxquP/goM21IV
         bLPR8nx9knzMmBWr8Gv3Ri0gZUqvScx3Gd4S+a5I5+GuFfjw3/MhmGvqcQ/B55MqOVs9
         zwc6cVs1YJDl5gtCEn0dVX7Iyt1BqCwp08oHjE9rJKNRNQcm8YGGkubCoGll+r4X37HM
         2Ehq1vnUqaXR64v7ULjD1Afcdr/5fkxW4EfPDgbu/VvusP/2klUfeOr9ByxK1tAPzoBz
         HksOd7T0DoW10DdimTmauHRwLcDFRg4ZwXV3I8hWSVs/+gszf8gFlPwXQiiJrgxA7d4O
         MESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
        fh=U+DwjWR36jGlJiUmrYoaDxWGhw0nlcO6X5cAoGkIWZo=;
        b=bfU3EumKS0wvw3ROGz8L8DoJLk3gSIx2d/ckUEW7xNI2FTQVyNlVzGk0L8lqNv8vXO
         SMNlXB2uThLTzim9PzVJHo79MLCnYjk7fTDeZRcY+oRwL/kFLo85qUfvcuxb1oleVg7L
         8Kszsb3/zdOnPfmWT3d5zfLwHr/XylMFu1D4f5r+zbvOqLcK6cQ7blKwsUbI6Q2/Hw2a
         X/jtRitZXZaw+zIAZkCmyc9t4TBPMO2YkoN36fCT5LKeOf07qgovYEC/W9nelGrb0MS+
         rA5IxQuRKfNihxwGgzuoVMsQU/hJYtJzutLBGBU4KLApwoG5BPGBjZG6b63XxBtp7fP4
         b3Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1779375233; x=1779980033; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
        b=ahChxbWMBoxPhzDeOQWO6ISlRddvEuvw8+Tkue06BzmRgs7KViSOpY/7wiTjy02Nno
         YtR7KJ7q1b2rSe75tgOWUtK0gmkwJixEzmYvNkxjaaAxEFcpeFOQdjDILQN5KLj0hUaR
         N/Nty8shG9slJpFOGtE8ZaV6ckEcUUCQ575uUyFJWYZNKn7PSIUeAo/OCSlfFoxcDweZ
         LYBduiUew0e+y3sRoUA9zxw4LgY7ujil1xE4/t1z1zg1dECPgK/BQtNcE33Rtj+w8wuI
         ITte4PpYJoOjjbrIcL4Im7FmckFx0lpMnYYYNPn8ZPX/cW+1eid4coSjBzZ83mCVie5F
         mneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375233; x=1779980033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA/ypZiwvOF7bLYV81VPBE2mEbMWo9wKAEc1kqSaHPI=;
        b=GkZw7BvhWxQMHVkvn4pwKA/P27ln6HpphBOVm0OXYMQJT1itXk+Srks4LKM08um/W+
         7fU/Idcq8u5gAAf947LVwFmB111wPdzH7IphuudTikjwA9yBJkgTU4ugvFa0Pi0153oM
         zi+kaVNyuUNI0+ex9Rb36iMf8lGEVR5vydrYAkor5nFvIDpT+OCgtzNUV0eZXr0jVqrs
         sLijpzbf74PCgl7ojuSgfaVohMeI/uo9FGa1w2WouQwFHCubdrLjIWpKFq5XbtczPlsO
         aelC6sYVyQnHjRbYifCecijIzaTo8IopTM3vpv0RnZ68juVHuCwAPK0/vlKsZXOOwi+6
         mEFA==
X-Forwarded-Encrypted: i=1; AFNElJ/okqa7H7wPJrVjiV1S85pntQdm/pBdkMGWs5eSU9UHnX/2n3gypIVPxyq9ajZKRwlD1wkKbOpHPT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYN2fLylXDhZvVys6s0qGVCiZqKb/9I6mDEVu/HMrZA7/axD0V
	cxgQNmWTuwJJX+oZl1tjdeZp15WRI5yS73LkukEOgPo8NZhg4l5WcdGT5mGRktJGM9PfSqQ3IB0
	rhpQCstsgLj+RYfVnHcbTpqILWSOOP4mVm4ZphMpTyg==
X-Gm-Gg: Acq92OFcDkqZkPpGm/uUR4qG0ntD/ZNAC5sH3a5pKbeI/41X8nK5hJ59rlwePB90of8
	jXlyIgoGgG9hkYhIuGg0Wc6YPOreeGOB8qy4oaNRJ1tTJDlHEXdbo1CmFWBuHpON77tbcGV4J8R
	fRYVL8GfMbZyTJ466JdC9oVgRM/uA08DwrMvRV+5INhwgXIs+T0rU13am+l/M5Tt4IcqbS+LpsR
	7Yjh/m5brz3w6de76pHLTqF0kQmWSgONGpBV8eqe6DpZgTxrbwPEePklH3eU72zIz6rEX21apbP
	i3eQN50VcK3zwTctQ1q/CtmBLn/pMdD+VbeAz4w=
X-Received: by 2002:a17:90b:2d50:b0:368:78da:803 with SMTP id
 98e67ed59e1d1-36a451816e0mr3680773a91.12.1779375232901; Thu, 21 May 2026
 07:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:53:41 +0100
X-Gm-Features: AVHnY4KPQYYiaRNDiAsU-wmS8JuOZnjSnShN4CXgg2DHzWx0LVSgQ_nHQROoprA
Message-ID: <CAPj87rOFnB+csoswOOSBR2-=abtCDbsKq2uJ_PgYKPWh-G8m9w@mail.gmail.com>
Subject: Re: [PATCH v14 00/28] Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
	Andri Yngvason <andri@yngvason.is>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Marius Vlad <marius.vlad@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"

Hi there,

On Thu, 23 Apr 2026 at 20:04, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> We have an implementation in Weston at
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1825 that
> adds support for this property. This patch series has been tested
> against that MR on i915 (HDMI, DP), amdgpu (HDMI, DP) and on rockchip
> (HDMI).

This MR is R-b me.

> General notes on the approach taken by me: instead of silently switching
> to a different format than was explicitly requested, or even worse,
> outputting something to the sink the sink doesn't support, bubble up an
> error to userspace instead. "color format" is a "I want this" type
> property, not a "force this" type property, i.e. the kernel will respect
> the limits imposed by the hardware.

Yes! If userspace wants a fallback chain, it should encode it itself
through a series of test commits, rather than adding the sequential
logic to the kernel. Doing that might work for one axis, but pretty
quickly disintegrates when there are multiple parameters to perhaps
fall back on.

I had minor comments on 03 and 20, but they're Rb me with the obvious
fixes. 11, 12, and 19 are Acked-by me, as I don't quite know the
hardware specifics well enough to say. The rest are Reviewed-by me.

I suggest you merge the common code and VOP2/DW-QP implementations via
drm-misc, leaving Intel and AMD to merge through their own trees
whenever they're ready. We'll merge the Weston implementation when it
lands in DRM.

Thanks to you and all prior cooks for all the work, and to Maxime and
Dmitry for the help and review as well.

Cheers,
Daniel
