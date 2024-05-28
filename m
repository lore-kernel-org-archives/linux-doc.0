Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA615491
	for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858077; cv=none; b=PhMvDvFXMC6T7jy0iX3FoNFPPjP46AUJa2nP5/G+jKrkeop4Kap/IkvZHUZTSuTdxO27ergXdtGbdKvUCwKZ/JEmPo0sVzo9tvOwZ0h+j3TjS5tWXZ4RpIvTDp5HMI81m7WXMvFXGocwB8XABEDwuW12TWSfRqXxLriafVrDK9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858077; c=relaxed/simple;
	bh=CvD3137K3jv+Zp0e+0UTpl4U+m05RFshYujcKh12WAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0hLqYRdifXQV7g1AtMjhwS7fjiKuOF28xbIdco99IPyAUppf//3x7JrRMGYvO6CVNdrcW59E4EkQ+9xIHtdyfIWg1RV/HIhRiKZijL68Y95dCKBLxZqvgLhk19azQslnbcNzPljco218ogdeBGQZBaiG97hXJQpc2Y6O9UKBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNAc7+Tj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNAc7+Tj"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so2411191fa.2
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 18:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858073; x=1717462873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
        b=WNAc7+TjvJym6HVIxaKClsXnL+viUAagXPz+gGQ3bN33q81AbgL8f+WTZyD/NiACzq
         6bGE2L0JvXVVEvqfvtIU2ATwZrX/CogCdk+sXIXVgRYhBxZP1BuTEWY5Y0DIG2K46wQm
         BUnAFdLExaRUb18idlR7x8TYN3cvEDoojVR1D3Ne3uX2d0m4K5s8otim0IUMtL/LoiB3
         Dx/sLCT9xIdUFetA9WkkqXBznTX9s6I6eKpiWbuqOJVph2u819K+RtAx4faat3NtSw2s
         oXsBomGOu9rTN3OliQpCO9LysSlnhGjNeyS+jyZhOnrlj8rPwu/bsF2HQjEXH+s356kx
         YR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858073; x=1717462873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
        b=QJLb5/8jZ1ef2+axVhGvnFwh8eIti9PRekOwgRuApJlhDpqFRrX+f0pX6T9CzJlZoM
         aUhTvJmkpICAr/1mukSJRkIAGTHTNaFPocW2LM9FsSu3DbJeCBGDQZ5I1j+qPGVjrEWP
         KjB1r4c+L9RLj2l7KIIal9E0iXAXkvagxVQH72/rg2n9GcKIkvqt7BocEpgN/4fm2JtD
         rChamn9nnOg1QTWYTiRCxxqJ37L/4WU2epfa570ENEtCOUEGlt9Vmhc0J26wqdhuBT/d
         jJRVUzXCZ4t/9PuV6ZCQZURgFf5uhwh+Fs+sRqjDl1M08mSEeyxd+9AguNHPH/U4vPSD
         fg/g==
X-Forwarded-Encrypted: i=1; AJvYcCU/F3aDHZCkD81Yeuzou3HvbcesGhk/Csp+/EckQRP+mdJ+nbVDaBlJfOtS8uiwa/jWyVYiJxf+4rBMakGW5v1M08jfAZfbK6bk
X-Gm-Message-State: AOJu0YyI/xNtr6fFccbKhC5woLR58sAbRI8XvwUrOZLm6NgrfQenmS5+
	7/1Oz6lTfS6HLpUc55nCjnjDJJN6FJAoAPPZIJvHZlAGXTsKk6iWXg239a4lLBA=
X-Google-Smtp-Source: AGHT+IHJTgREWZz1ERTKguUSrfa2uSdH6MWQOiMMxr9ZzLrg0bQtJ+SkJaUNtX+UKWWdzgu2vkTWKA==
X-Received: by 2002:a2e:9f16:0:b0:2e9:8197:eca5 with SMTP id 38308e7fff4ca-2e98197ee2emr15410431fa.0.1716858073013;
        Mon, 27 May 2024 18:01:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf23fc4sm21208521fa.134.2024.05.27.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:01:12 -0700 (PDT)
Date: Tue, 28 May 2024 04:01:11 +0300
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
Subject: Re: [PATCH v15 10/29] drm/tests: Add HDMI TDMS character rate tests
Message-ID: <duizmokcym456fn7mpsfwrwsgazwy4q5nhtfoi5ih6ntmd75th@7yxduxya6j6k>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:57:59PM +0200, Maxime Ripard wrote:
> The previous patch added an helper to compute the TMDS character rate on
> an HDMI connector. Let's add a few tests to make sure it works as
> expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 300 +++++++++++++++++++++++++++++
>  1 file changed, 300 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
