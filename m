Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD283806C1
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374463; cv=pass; b=BIQaf2jvtjrNUZuUZ/PKAQ1Ky+AogSMjGtvO8djT04Pbdy7dImJ9EYV3gl+OW3MDHBSd2jA+SsZ3hVbOaPajj98tR+phYz8FDXyUjCR+6V/6K5MjBnAE6L7hYCHQfG7hIXo5VINdG83JQ/ZzkGUgM/4UisRz+1beIOEeKb3rxX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374463; c=relaxed/simple;
	bh=C5xgXMrPeweMUfBIT4VR8/HRGYv+heVrESlsBEK3zv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rfl0TMAe242bTAKm/wmeX8f7qXtJRtzWXbajzTsQv7IOEcsFbHj85RmbrqXWpoJZ6XhG/qG3BR+6cXpGwLcZ4lsI3WcYWETZ2UqGxzP/RfY2LASvw5Qnfh7Iq0iWlZigICh3UzD9e16PMniCoic1zymOQ5mnc1PcAx8tQEduNOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=UopnBg+U; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="UopnBg+U"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bcd730e090so48105655ad.2
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374461; cv=none;
        d=google.com; s=arc-20240605;
        b=PhVVLen8d9zUWwzphzcuSvxbCaj8guX3/lBu9hqye7NHvy+fQ4eMJEPLvKlaeZTPGq
         puTckEg9Z0KA/4UmGaHyO938o8w5Ifk9UZeiWQr9yEY81MlzGkXOQgPxkV3cOo0HpzWG
         J/+i2NzLJA/KGqEAlwwGfu1d8Saikra6Igi2oh7J92cpy3udzP/5vQBDMyRXZlEUopxW
         1Ul1NcFYxkW3Akfve4f9IrQ5izpPDsuYerv18MWfPbzr3lk1lW2AOAZh6ovcIq2k7u1W
         AsJf2H8rWX/ww5xyb4QKpVJMTJrNTV7dm2nlkQlZP2RhI9ZMIMzDu6EnceGwT+k1JqEP
         FYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
        fh=o6wCiLlmUiY0P0e/SZfjIDzw/yoPZkhQYf+5U/XzdFQ=;
        b=NqGKOnJ3K9Rud4Jg+qZH35z5+7F2SUoqLU4z/9+9xIQjihjB11dyu/zPpWeBU+thAY
         awEf1Z+XGCafIbXIp6mJdw4wDZgnVNyXGqlhfFi8wLT/eY+8oeeeK2bKJbucPOFnMxfZ
         ecSoVoRO70sWUdID8H1O1qB0a5Hvh/c5GUNRjZ7l299G/MNBXw2c2XuApdJBSV4wpqy1
         M8Ri4Fi3r5mFoh/4M2cjqTLLoD+hsMvPTq1pC6JOiMjlq79gz2xswFGqZeETU9TO/GMQ
         W5gbvRtxQ/cNkcbdkiBhvBr7h5ClM1UGWcKokHjuTsovS59CR6ughHx65aIcRgHerJDm
         tkqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1779374461; x=1779979261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
        b=UopnBg+U3cY33gVRBQelzYG7Ku9Swl3UKE3xqbmi7Syc5pC0pJ+TZM8IU7ZrwpFGnb
         swDsaJrsfbOkaubph7hDXFQZlrEr8hypMtPSpPdLnJje8lR9N1XSxpemDq384zauoF3M
         lcQI8whCG0xnGq8KYzZeJe8j+Bquc2SDeD9XNB/NNvklUnoL22njmAU3aW8esZ1dkZ4v
         pVUgeIdAex2IVz/rlYrQsOOEBye/Pt2X85Rfe20RZWXRhxkcqx2HXyEjsuAOrPTG3/TR
         vz5rMJmhmoU/kToU0h5HJSkF4Q5Rt+8FNpZoR7gPLwwJRfXpTjxffLYm+3PIlFdzvMMn
         /FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374461; x=1779979261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI8RcJrMlrGpgo/P0j5rPAmC/BUqQ0jZHOTebzV+Hvs=;
        b=JcKkfKQL9yhaZaBymUyYH6WWBj/uCi5/SQo2f+JTM+m9cDm9UhA5PVACjVZGsT0syT
         cfPo5XKzAWsW8U7hQRA1yx9RFwmmms/N7hNEwkZLKu5/PL/Wre52AqZoTywr35ylMay0
         gFDcXoSCcnzmoGr+agMmBidKFWSwJhTifCx0OXOcJBFUb9Vh30TJ9T0x2hhVIivjbri3
         HewVaIZp8kQ0N00Gc3OwFXxDxFZl9L1SDA29YWzYg524c7KL3pKJ3LjDsZxbo6vAbChM
         h+4y1CBy/EFTjGIzeAaXIpfGNm+NMMGJBZoMAhvStbPZlNpimL/Q61MErh6VFIhCTswQ
         bX+A==
X-Forwarded-Encrypted: i=1; AFNElJ9/S/kOQAnTEx+QCe0MfELlzbwdOrONCFhts6ep1NtWiJ6g9Y9xwElYWT3H4nxjH+kCI7EN7+s12Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqmYfT06acwBT2HzAIAAS0llUGqt4bgLJUW37GFMsSnsV+rKIQ
	dMmHU+2Qwi74iZ4sKdaqA5hwi6vK/1mmMVcicLYm2ukdXddSmPx5dT/j2t8BnvSX7/hgUkwCt+j
	FMmxJ+38Qy/t/ncp3fg4h2rvRT05Ticm/z/L+7oClig==
X-Gm-Gg: Acq92OEZt17FPmCS4JI4G8i0fNvYnCVIbqNEfW1kg0inXlqPvfpqsK14IzljOS+fUL1
	3tHn9rRxfVZpmz1LUAbffUF0IaXL9C+kdgsVf1AJ9aCilEvEFCy+JYiV+Y6taiVQKjOHqxZqpVZ
	m/w56CWg/A5ExAKwEPduTQ9oGDhCZS3gt4oXEonJ/3k4pDLGrnBtDLYTM4w8mzKeB5P6iVCNhqL
	4xn/XM9grlhVvO0/wkkNZTotk76NrLjkkqGjOP3V7S8tf5hqRdzgdBrWs8xy6oN68lcY19ghb1G
	v7+J9niMaJb9osJ0e+exXp0WZmuLjJ1cD6LwrtT8Yb5FVOf7Qg==
X-Received: by 2002:a17:903:1b10:b0:2bc:e62a:979b with SMTP id
 d9443c01a7336-2bea33d166emr36661465ad.30.1779374460988; Thu, 21 May 2026
 07:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com> <20260423-color-format-v14-20-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-20-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:40:49 +0100
X-Gm-Features: AVHnY4LM5MR-pydhp54-iciGhQnPfxKOlxWC92SZdhfzMOyTtShVga8wCcjC3D0
Message-ID: <CAPj87rOBvjw4v+PER+6+FMuDRajXNnPSKAke8a=tVgiSRg8QTg@mail.gmail.com>
Subject: Re: [PATCH v14 20/28] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
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
	wayland-devel@lists.freedesktop.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 23 Apr 2026 at 20:06, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> +       bridge = drm_bridge_chain_get_first_bridge(encoder);
> +       if (!bridge)
> +               return 0;
> +
> +       bstate = drm_atomic_get_bridge_state(conn_state->state, bridge);
> +       if (!bstate)
> +               return 0;

IS_ERR() + PTR_ERR()

Cheers,
Daniel
