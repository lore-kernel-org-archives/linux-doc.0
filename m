Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820579F6
	for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 01:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858108; cv=none; b=rJ07/B0EjnCVVGwuCMEYsvQw/dYR7yQtFQr3hvyOD3pf4lECZuNqKrpni6PU8zJ1pQBcTiQ9IW7yavmtvxZznRiKj/flym8WReVFeMjMWMRR+QajLoQzqpFp/rQhddtOEBA7oCds+WksRKutabVzn35l+NgzKOv6VC+hY5D3BqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858108; c=relaxed/simple;
	bh=jsfEKK2/0h6s1wZzf2U3f8BROR3XdQtn/aKqRUIcApI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEz6knyx1AE399t908LLpxOuSPNt8rHD4L8XXrGmxO2BgjFh4S65uX3pscWDKKI2BQxH4uK2WBH5ehTb22+pG1+qmRPkCX3cx0Jynl29doZUkedfJD5fWoJ2AVQLsYj1dxalMfYILWUZpyDqyAMDO0XHTlZ8OlWHHZ6Yupwp3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3AxBnO7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3AxBnO7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e95a7545bdso2081251fa.2
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858104; x=1717462904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/n2HPYcfVAMa9viMhIlGedEXMDJx4RNXfxIzwMIkJU=;
        b=X3AxBnO7LxVLA4C3oJLnRMRUOIR1N0O9I70fdylIUtWbKD8RQzeUQYKGKbFB/98C2y
         o+0JLjc9yiNrspRmv/F8SjeILWZRVnqcxEVNH7e2EWQJM/WotwZ/ig0Uvc/AD8w1Vkpd
         LROih5MoKWrgFqfgMjm7oBEPpJgU2A7Eb+ydtMEslKza6rtZWHyMr4nJcXEBV3Un+rLz
         +79q6O1VhUNNTQ27F2pt/ZFxDRbGCpZnKd7qom4Y8baatLuchf11aSdQKZkPOANI5wXY
         4XXprVIBhJLSuHiT/ZiQJMqMxYrg3SPHnZ5YlvXLCxOLE3FIdvdEGWUpBZoTDQNEY/tm
         4CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858104; x=1717462904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/n2HPYcfVAMa9viMhIlGedEXMDJx4RNXfxIzwMIkJU=;
        b=EOIAKkLJN+syfkhVCiPdAiZ7gmezB2asadIMYqME0fSBrx22/JRfKxHs38uLNdZ7BE
         JAv9YPzs/7FG8e4eFcCwN+H9nhm+cQJMuGnC9XHIxb5+3FCIqdJMRjqmi4xe9xnkbWSt
         6rFBKEydQ9MgSrMc7mmLWRd5fL0+2zlHCmkpkR+4kbco6DFTGb17GO+gjUHZugSzVOAq
         Cu92x4pqxQzWg8bPr/hhAPXRl2xclXySowlfMWQt+7fdPzKIqJmQ7PFwjbmQt8GEMdlA
         g4ociUbxBvIgbFJK3qyy4jjdSPb1+t6jDEpOhOVHJ46vnS9lqq0tzwQeBb2jJbWKinV9
         vHxg==
X-Forwarded-Encrypted: i=1; AJvYcCXM5uVg3Z1r58QavfeDRwepOYz/RFcHR4+n2JfP4U5O5cnFImtTmTsNERbsU7qmsr5Ha2XRPdkQTww0MUK4Yd47soKi2tCG6sjr
X-Gm-Message-State: AOJu0YyxmvMyveyEzVEJpYoo7kcHn27V95SPrE4zj938PFiusWVjnsA3
	Z5udm8mYzB+w/gWzlLrRbzepdXLdwhjpJA/b8wMmtVNDZvAwJfqEodTcXHkJVXU=
X-Google-Smtp-Source: AGHT+IF9DeTXOwnwxp4rQ2ox7OoaNgJ/aFfsN8eoykusp3USaYLBAH6PtRIs6CcigKQqs8R9SXPflA==
X-Received: by 2002:a2e:9092:0:b0:2df:d2a4:439e with SMTP id 38308e7fff4ca-2e95b0c232cmr60901341fa.27.1716858104135;
        Mon, 27 May 2024 18:01:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf2866dsm21078741fa.139.2024.05.27.18.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:01:43 -0700 (PDT)
Date: Tue, 28 May 2024 04:01:42 +0300
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
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v15 15/29] drm/connector: hdmi: Compute bpc and format
 automatically
Message-ID: <yas2tp7anjplld6fxg542i6z7e3mrowy3ex2mb2nohij4kkchv@fp4oi3or67i6>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-15-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-15-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:58:04PM +0200, Maxime Ripard wrote:
> Now that we have all the infrastructure needed, we can add some code
> that will, for a given connector state and mode, compute the best output
> format and bpc.
> 
> The algorithm is equivalent to the one already found in i915 and vc4.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 217 ++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
>  2 files changed, 230 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
