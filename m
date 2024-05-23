Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADC13D24C
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455558; cv=none; b=UEI/zk2d2oO9TcpT1M1PUcytlUFeQBHlRZ+sa9DnszXkXyw4cHSNDpTU9ONbindhZKS/v3qsG2v4MNZP0UHgQH/x6F/xZVhp5CSVLAJNZXyGJdrdrUzBeEx6l7zT6dY0uTJ0LbGYkt7lecA2Ar2F8Wm269FXbJ5VXzyPz/YqJrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455558; c=relaxed/simple;
	bh=ua1ab30hbc2oLjmJi5p/l09P2vR0shXcHuLe8ZoBnaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5k7ArDB8CURjjVV+NuindLK2jQCOQyGbbE/zrxl0y2nxSDfl1yQ783H78ntX2jdxbaiFGSH4XhTvuWU5B0VkXDKg6jMQ3ltqYtOHniTb9T5HOL9ZHOpzz+8uwDSzpxPkvMOv4UmLTrI9XfhCNiwZCcPJRiNhIfMcLv/aHmCinc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBIkKc/u; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBIkKc/u"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso32281961fa.3
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455554; x=1717060354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
        b=CBIkKc/ueLGFzqk8JzZPjPm9nqrQpj/XZd8m5V2ab+7MdlauhtamJYKM45AI81/yeP
         nugIPoG7gYqisjezrxg5dQwTW8BuwLLWy5cXnPICUB3w/SMYAxsLJ7iB08US8kWFobWI
         2EODEUTkOhikG8312W+dxZsqgOh05/7hZwhdxz0fc9i/qg/FLu3DxMiEdD2z57JZ/p2o
         ZgPM0KsTzYaICHKCuVHj538clESqcavf0GXPjcR/fmP2J18k5xD+Jz4HItSr2zCSHCgg
         y+c3Jqk6Pu3qOZs57sKDzMqobW9pbA4VK6sEnle3wbaPAURJ6lI6gm0BrD9DvlESR0ve
         H2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455554; x=1717060354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
        b=FWlODvn/5LIC/3EhQMZbeu4wlSE7Y1mX7HEdC66duN7DJ3FrweNDpQM26ERLdiz+W7
         dBlO4Qqr0hCnWWDoMCQrKF8/NFr87mnuVMGrFvbvHM9lFO12/+XnpOiUcphpdJ9MgsdA
         Jfqcd4ABng7YDz94F7HCzIsMErmyxc80XNPkTqPjNANX78Ht6wHaMQGF9DjPyspJBq1F
         +fWND3W3gz+V8JkkSHt5h7GoT6+qgujhl2eEWCjhSwCe3XrVoMlO4nbmcWySEWRpgaH2
         hC+8Pw589uB6hbChhtpLKSE91d03KEQT0AJvFr+nW2H7TCNzq1DeHIW/DnYWQRPYq1rk
         sqaA==
X-Forwarded-Encrypted: i=1; AJvYcCUwpfXtd3TVV3q+kCsHGaBEaSqGKYDrKLNPL6SRao82iJsDVBt353hokZ+xEUO+nAVlXOdemtOwFnWb+VqkzaBoDrfAD/6CvZhv
X-Gm-Message-State: AOJu0YwZtcRMzLOrERQkU/YHomtmyVwSnpXawnDMnx+vJ9fAtbacGGXo
	j606vOqm8aiWm/DbFQhXCMCooDHW58tYxsLcpxI0Ys3RYWgDLLvC9tGq8UJIAHQ=
X-Google-Smtp-Source: AGHT+IFRp9kSkZyOBZ37uKA0zC3RicLR9A71BI+sImuk8bVozEkI6NVn6ruWTcgBILxGVWLUmvKCJg==
X-Received: by 2002:a2e:8797:0:b0:2da:9ed:9b43 with SMTP id 38308e7fff4ca-2e9494bdbcbmr26440181fa.31.1716455554344;
        Thu, 23 May 2024 02:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d15158c4sm41368191fa.73.2024.05.23.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:12:33 -0700 (PDT)
Date: Thu, 23 May 2024 12:12:32 +0300
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
Subject: Re: [PATCH v14 07/28] drm/connector: hdmi: Add support for output
 format
Message-ID: <dxqf6n2gaksc66rksmdcaky22nz226veex5q6mw4c6npsuobut@m3vuxyai3evm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:40PM +0200, Maxime Ripard wrote:
> Just like BPC, we'll add support for automatic selection of the output
> format for HDMI connectors.
> 
> Let's add the needed defaults and fields for now.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  3 ++-
>  drivers/gpu/drm/drm_atomic.c                       |  2 ++
>  drivers/gpu/drm/drm_connector.c                    | 31 ++++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         |  9 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 +++++++++++----
>  include/drm/drm_connector.h                        | 20 ++++++++++++++
>  6 files changed, 81 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
