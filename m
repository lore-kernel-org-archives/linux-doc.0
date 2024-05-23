Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA113CF9A
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458644; cv=none; b=ImBbWqZzadNU14EHuO+AzSZN+YWR5R4SVERuNT2fkEh0RghrKCbz0uArIFV1npaBTXgzvCSClxCeZ4Bp05lfQ6FEpRENGGi4dJeLUh4YYhPljywuibE9wru48V1WgHxElh/kA+QeSPagq5lfMEvNZYmJrIjaVB0hHdeqlL3mzY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458644; c=relaxed/simple;
	bh=BHP9XT/mVXwqm4ETOekupe344ZcCjtfN+SBGF641Vc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zfwqt1+E1igXdhw4bIoZbzcu3IofVJYhHMEGnjJ+dZiPdGB9p+yPWqniUsJ4H3uR5WJt7jYQOoIa2blIatCEkLKtKIRuQAouIe42Xpo86cgYa+ePvNtLWtW4Y/ZgA/bq1GeTMXvpKN37QSVtS0f5YEL3FdqF1iIosV++eJ0bUuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/i3tPBA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/i3tPBA"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5238b5c07efso6846158e87.3
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716458641; x=1717063441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TH/BUWVtxkmUJ13gtzS4sCxD7fWyObo8iOIYwJa0PIw=;
        b=x/i3tPBAJ0nIFSNZNVwvRgUGI9xLp/XgaIQo8VX18/hCsQ8IfU46o5PLInDkgfDTSp
         NHtqMNi2ez0QsLApxRYuEp0WhN3X1kYxP+Buo1Rl+QgKSncssA37m4cI1JYF22YL8Nzl
         ht8C8XY+gUhqnpB0NGgE4uOLXSK1NztO8Kj+2WYIUD9IZ6hS8uU7abIZiJeADkBxiQsf
         2d/VKh8bDToR+uKWNBkO1LoovBEcxevMiI2gtO2UPRCJpA3wH9EmYqKM7s6UuHHMVJf7
         +ejj7UDOAxyPhhWHQVro65mVmhGO9CHdKLery7RIfnVFU0kI+ejhTFeVl2qNsUsTVOw4
         lhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716458641; x=1717063441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH/BUWVtxkmUJ13gtzS4sCxD7fWyObo8iOIYwJa0PIw=;
        b=EIN0T7t3JC0nge3Hpl7x5o9nLbogRw7V9i0iGC97r4n8TUjSriM9xLlZ9KSoOdKu6O
         rzvxmmx74egA+z1mTNYR49fB8TWrbKuCVu9tZhEWDgbe8HpbxtxXuuZW3bvi6hZ1gpGd
         FuXvWi9gMd2gciqpt2Ed9ccId4NR3hN6B9zIkbkJOjCnwE3Cf3GGpNTyXSZY7qKTx5cC
         nSedXkxXeJJcnCWfuXwk/QJzbTwuPfSDr2Waqp8RvuwQQX2GfevyNk0RYsDgJwnuCi/d
         wYVR9iV3BHIQ8hfS06c3vX+InG9w1t7P3OorGx+eQ9LbdLw0Zw+Kejaa5Gd9fgWvR9Bz
         AP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrE5kFX1OigjsgGpvJYsnAFXeVZSWcU3+rhod9uQtELPsBq0cL+ummbySrJL06uN7dR4hI7tfyfYBUJ2ygbrnvCWXjrr1XqLw3
X-Gm-Message-State: AOJu0Ywldc1JR22OIRVRddNcdc5FGSmFcdaA8iG26SMlgxJ4gw9OnxhD
	cp6Zi5snKN6Mbi/rF62MDAcYuP4lxALP8ma12+y3p0wAN9xAkY5dJgCnSri+QIw=
X-Google-Smtp-Source: AGHT+IGlpqecDFsJDGKpUD/L/07fSwQIVn93IEsQGl4tYZ0BdBGomkd7vGGiht1/7leKlSP/ZRYLZg==
X-Received: by 2002:ac2:5930:0:b0:523:89b0:9b64 with SMTP id 2adb3069b0e04-526bebb45afmr2452653e87.7.1716458640738;
        Thu, 23 May 2024 03:04:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8ae2sm5423836e87.204.2024.05.23.03.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:04:00 -0700 (PDT)
Date: Thu, 23 May 2024 13:03:58 +0300
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 13/28] drm/connector: hdmi: Add custom hook to filter
 TMDS character rate
Message-ID: <hjz32n3wokppjxdpzu2lsoypno2dy6thi3tfrkhy76g7v2a5aq@5hjjd52fsqup>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-13-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-13-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:46PM +0200, Maxime Ripard wrote:
> Most of the HDMI controllers have an upper TMDS character rate limit
> they can't exceed. On "embedded"-grade display controllers, it will
> typically be lower than what high-grade monitors can provide these days,
> so drivers will filter the TMDS character rate based on the controller
> capabilities.
> 
> To make that easier to handle for drivers, let's provide an optional
> hook to be implemented by drivers so they can tell the HDMI controller
> helpers if a given TMDS character rate is reachable for them or not.
> 
> This will then be useful to figure out the best format and bpc count for
> a given mode.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  9 +++++++
>  drivers/gpu/drm/drm_connector.c                    |  4 +++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 14 ++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  4 +++
>  include/drm/drm_connector.h                        | 31 ++++++++++++++++++++++
>  5 files changed, 62 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
