Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03A13D29C
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459782; cv=none; b=RUn1z+3lo3ww4oiTTJ/7k1PXjV2heX5r2+VH3dITzU/awqudD0R1QPjUpsbVjIAb8Lmg4wYgdQqv3+QaBxLyBSN7bBxoyBHP11EGP0qmhNud0Yjje31O45gw7IhnYSrmwS67p+4o9KMyZ8JQKpPVQNtbMkfuUo8eJ3hWwvRtg3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459782; c=relaxed/simple;
	bh=4FADG5CtgDgZ0nIGhxXBr21dhRNWj/4o2A+QCOzfNN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uesIBRxDXqSZTwPyx4AnVjvtK9Y2wGAFZ2O2F80+vnSvds7urVROH0jyftPJsiKc4TK2qIAbvmQaydaeOvyIg9CvrgYnBoQv8SVFJ6P6fUotGMO76n5Mv70JauxLh40ArorAJ7uiVNr6zgWOJUnIkVXK32uy3YVef4HN45mM2fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yat3ExrS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yat3ExrS"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52327368e59so8372455e87.1
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459778; x=1717064578; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yHQzcgh+wt+86lDxNvmMSEbfCa2z01pUSJ+bgewkqHY=;
        b=Yat3ExrSEVuOMZh0FORKuCGPXzLkvnVcrFPvqkYFywgyZBO9vhhptmjd41emHpzHlN
         nFWw4INv7hN/N8hF0FIvqY6U/xXaogMWBaMhZ/jYQNXtSbagWWMzWiK7xDBv+XEhEShc
         3E5yUQVoQ/ZgUGDmp8D7IjvrDlGLDPqULOFnWcvaolFaoyYCeUj55HsR9360Tis9Fhd5
         9ILn1hM7LodOsfOkyN3vgAlfXPmgLr0VR7lPmq2kgIcHMUd1WiSJtXKiOKQmM3xdP792
         JUw+OLRh1K9lxMo3lCWbEn2ETmSr8vg6vNv3oe9kn1oblxgXIAOHeKNi8rij6I6yAugP
         FTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459778; x=1717064578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHQzcgh+wt+86lDxNvmMSEbfCa2z01pUSJ+bgewkqHY=;
        b=V7vmNte3ijiBhhjNMYk+STAif6LbjQR7gv5U+Pwr5r274jRPhIzYDzV4LSLkfcoxtX
         Q+qRCdF6x++8V4qlOeCEmtWW9vBXYqWRbte+JrDhvCKsKL5/C/tAEl1+lPTWwW55a2A1
         CwDN3jSwtiEyWWDY6FNOiCM0JitsdiRMBe3OXgkKKV9cEiV0TtWy4bnn/t8Z0C9NY/gz
         T+3uuP4Pi8qA1o/TOW25FgRwxZVKNhjTXQgt9ei9aRvIzVtFAlhdeHo/w98tZQhVR3zP
         BmPdoAsHngk/W1vCSJorQLW/k4xx4uIoz0qim6LYEJU9Bj/uc11hJPFOt0dHbudxC5gn
         gwhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd09cFjn5kgOeWv3H9QEsR2H2q0euxUdCKtNes5R+gwLrcO1nvmbodkERO0awi58+fF80MDvOJpuozu+PjWGKaz3Ll7Ace1OFt
X-Gm-Message-State: AOJu0YzdfBxB+rGHNkCnaYeWL5/Co0IsOCAfFATeSXKJ6lTgaKXDNZy6
	WrzpiyE961XgPwoEIBmLaM6IupJkBkNAhyYmI6gPhTnTPMcFm3Qwcb71/Cil2jk=
X-Google-Smtp-Source: AGHT+IGaIAjJQzrs40kJxNB7OiB13JCw7thzg4cpmesH+f4K6m+C9dDIXqqPiTDnb/PD63DiDWKJ5Q==
X-Received: by 2002:a05:6512:4cd:b0:51a:cc00:951b with SMTP id 2adb3069b0e04-526c0c544abmr2482181e87.49.1716459778462;
        Thu, 23 May 2024 03:22:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d90b2sm5326325e87.242.2024.05.23.03.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:22:57 -0700 (PDT)
Date: Thu, 23 May 2024 13:22:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> The i915 driver has a property to force the RGB range of an HDMI output.
> The vc4 driver then implemented the same property with the same
> semantics. KWin has support for it, and a PR for mutter is also there to
> support it.
> 
> Both drivers implementing the same property with the same semantics,
> plus the userspace having support for it, is proof enough that it's
> pretty much a de-facto standard now and we can provide helpers for it.
> 
> Let's plumb it into the newly created HDMI connector.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv            |  1 -
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
>  drivers/gpu/drm/drm_atomic.c                    |  2 +
>  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
>  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++++++++++++++++
>  include/drm/drm_connector.h                     | 36 ++++++++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
>  ,,“saturation”,RANGE,"Min=0, Max=100",Connector,TBD
>  ,,“hue”,RANGE,"Min=0, Max=100",Connector,TBD
>  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
>  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."

Should it still be defined as a generic property?

>  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
>  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>  ,,"""right_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>  ,,"""top_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 93cb30dba86e..888fe1fe9594 100644


[the rest LGTM]

-- 
With best wishes
Dmitry
