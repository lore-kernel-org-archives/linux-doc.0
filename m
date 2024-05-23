Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B913FD8B
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459885; cv=none; b=d5WiYDjYMu5YKPCOpw1DfzAh/qLYjp9cW8nV+rH4oOcMh5zxOb7MSAZ6/J+7OnYTvzvt/OE6/13vQLsfw98Gvh/QA4Y76Az4KkMfyZ01F2xt3BHgM/TDSRC222smskwhX9JlMB3cgRlvD6HZW/Vu6UPQNiRgCqhhojBCQ1mIt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459885; c=relaxed/simple;
	bh=GesYYDL0RueRfZ/lYstvElMRwIUq1iDUssl+48qnt7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egUa7ChyrpkH5gUfRju2Da5UsgN0dgOjl4TwHPrIedUBAkFWwGpnoESwq/FP2d6CRmc0o9UIIlJgu82PEPyisFl8of0FNda2SV6EG6jaY+QBaN+Op8h/yNBsVYhneakhgtIe2vcOGhLoNrQX+reD76z26llBUhJrwtKqTiu+iQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/A2nphT; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/A2nphT"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5238b5c07efso6866647e87.3
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459881; x=1717064681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
        b=M/A2nphTN23OyaAeWYrIVzB+X4D1yAzAtE3o6ReRfZMqpBKpl/Vx059axdTTv0xtXL
         izwm8xbNIslKXCy7Ci2pu6fd90hHxRx9UNDxMMZXTU9O53OKe3Ev7qTdJQ0jGu3MFRJ7
         +wxKlSEeZyaZYIdYqyQGM9Hg7RW/P6xG+9dc482Df3bP/XChFL8jtBe1jC53vUfYP03K
         OqrUe1G73bt89Cc/IosJCwJX4qfB1TGMKGmKfdlMEayJeup8uiWgqhmYgpbadiX2WKEk
         eQlMwOafMO8mRzJJ1oyMVXqzn+mNPqOYNRUoQmH8aP3zFh2eX4SPYv+xjRJHXP1MJqYV
         lq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459881; x=1717064681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
        b=eGDTSN6AwXYYpdbUFbnCbV4G12asmUZkFyeE/1EUN3o7hkt5i1dZzPB2tp/NIc0q84
         uTy1tEqSiDf7lc3ECsdrP+XDVpgFN3Iexd3Ms08lWd+6IGYlGZtPgth/kFONc45KNQLK
         1zUjwoIt9v06iLnZTb4lgOTcGTGHUXwUPLnrzFEkk5pM4H49KXVPYMhNmMArB+BoOq73
         bNDTCYm8CfAaMHaXyOEm08BWrI4sN4YjsHikN5I1yxiFd208ht3PQQgV7RxGrRTkOJMI
         mghgcJTf2AIiT4IXv0qnwI1WnvfFPeNQXuTeIC/f7Zsa+cKYLOzrDkMv0I5JmJvlmJCY
         7M3w==
X-Forwarded-Encrypted: i=1; AJvYcCXVnc6zge6eayFNQczsuj8cUFkeLolPvAzKBXPeU/A80CCxfNnUpvkIeQ+D5ep1MSnLATM2vhk4KF1hIEBlOh0G537CAsIeD3Et
X-Gm-Message-State: AOJu0YxETm91ewMKsZxAlr4JU+tSMSd2Kg4hJzD61TAFPoBIySWiK0Wg
	6JLl1u9JE+43QafHscMsNFQKUEH8muSRIZ4d6o2T+m7Qn6Yq0wHaQ+XvshTHaNA=
X-Google-Smtp-Source: AGHT+IFh8tvpeC+TwvjC1fPxZfM+UwuyED0DKgyl3oWL27XorJPrG1npFHJwvig7HdSlbfPLtqhR9Q==
X-Received: by 2002:a05:6512:3141:b0:521:9207:189d with SMTP id 2adb3069b0e04-526c121522amr2191728e87.65.1716459880614;
        Thu, 23 May 2024 03:24:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad526sm5387014e87.54.2024.05.23.03.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:24:39 -0700 (PDT)
Date: Thu, 23 May 2024 13:24:38 +0300
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
Subject: Re: [PATCH v14 19/28] drm/connector: hdmi: Add RGB Quantization
 Range to the connector state
Message-ID: <evhxta7gk6mogntoafibz7kxcgziikrhitrjg45t3p3lhify2k@uwwdo6i4bqbx>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:52PM +0200, Maxime Ripard wrote:
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  1 +
>  include/drm/drm_connector.h                     |  6 +++++
>  3 files changed, 36 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
