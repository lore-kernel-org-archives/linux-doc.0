Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D85224EA
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894027; cv=none; b=dhM5pMJ2bCz9KdP3V1wa62rXM+8oQ8fpUWaINqYyzKi9WTLZYfh9lCgL/Pvo3D0RWAAK3jXmEkS/crl3Dbb1ogXglB34dY5w4pzExLaDqi1iLbPKn6tuAW0UmsZ/l5MWveQmk/yVahMvIZjuRQ26HWDRok48KS0EwN6txlVI/Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894027; c=relaxed/simple;
	bh=T88ScYXJqgxQSfLGWMZ4xmJDvZQgeWbChnGw2+KfG8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYDrfvPpKkO4/XvTzJaPADsHUIB2w0aUiTCRuBqR4AZny7ssxo211bzmTN3nUDjCsFLHwe5McGVxzQ9gqMYEmYPPXpimTaf1c7aohFHXhOfgWP4l7u4sfWOKxKb1gOyxaUoJujbFpdFvL5oWPcrLxZ0pIBl21hEcKXBA+r6ICH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVorvurz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVorvurz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f22fd6887so1769596e87.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894023; x=1739498823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
        b=KVorvurzWQtCXvIiTFzjXCsZM0BuH9NAg0VKUxdlhAbkM4u00RLuhYsiz8t/aNJ7oc
         TYXXt5c29NLYiEtifoJG+pf0ImZsxurRpun4h1bKszS5K7+8Erzt0LAZBPN+jdoU8abV
         Jz514FSnwN5GBzqpif5RpD/zCo+4ASgiDiwl+8ivKEXW6yW+nx+xFfP8aT/a29Rj/gwC
         o2vxGWPav7B1bhs3k/mo8XaGnyVZ0mp4RvdF7iixIwW1QOEQfomBE3InXAJXT9v/hCVp
         B8Bx2UtHymiS+CVm/VBzq93J/xP7AVOD45AQ4jyqUkLMSXbtttgyvfW7hDFNl2O6rQP1
         8Q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894023; x=1739498823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
        b=rdTNtD4VxIiuCKQ9j0tvEqj6eniTvj2MprvnzjdbIs2WbDThorgW7dw3WL+NLXfsCO
         eXy0ZyV1UtaTguBGyhJZUKp6C3vugKyo3A33/qvnV3PpmyMaFnjc8So2VrM++rQWEoUI
         1VJt19OLFQDYHCyxlSdVMWPaeyG1IkPwoz6qbakA5MTCG6BYzHIyY6Hwu+hQTUH4c6gf
         bGKjq/29ObrlgUg88GJ/2iEYb4rK4joBydCSVYGOu9QXsQOq1ErwdXu76/jLAxEKR8g3
         dPw6zCAoVR1evLciMXbIZUDjQmIcZY5U0mBeSoFqmRl60192yB5f/GxNEZUjs3ftxO5w
         D0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXJTi9bCDerSIYNZBZ0wy63xTFVIMD1PRHm4z8WrX7ZypwYCKUasXpe52yidWuVW+qMsMgBBWCWyxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcsf41YUz2aWX3CUdgd+Ixvjg86bMgDdGIUd+k3zfnVR+q3oat
	yQ+aqHGgLe1+hngMwT1Pva4pXHEUi9ETNsU5O3tWt/eu9w1jDMikl9ah6RP/AUg=
X-Gm-Gg: ASbGncsHq+IWbgsec04NwnBpD/81IHaodE1YwY+Es1enlc1t32g8q3XxHtsrjOCmV86
	m1vXqCBoOGquEoeMlPUpgW+QBUvysKg47DO9mvJSyT3wBikhcmn4FQDDH7Qiq1teV71OmvP6Flp
	ZXgSW6hqnJRLvaSVnfzumJXf/R0a+HN3CzUtTxSFk7IPcxiWeUE1yuC1bMVBscGDgye7wC/p5Id
	L9vstWgIhSSfKOouxbuwVdAoOOU/U/0DQdnmERAbmETiPtwFnUv2Kedl0unLNzG750bO9WT+Vro
	Jg4Dk1sOQs/AaP68T0H51WMKjGJis8ZMnirZ/BQ5xEnjyM0ovtpAwja/nrT3NEQukaxapDo=
X-Google-Smtp-Source: AGHT+IFwAZ+OzzbukVZoC+RyK7oCA6hsn6G2MyRAFDLm/u//Zdyj+Li+eJOThMosTwozpZa/I5Wr7g==
X-Received: by 2002:a05:6512:2348:b0:542:28a9:dcb7 with SMTP id 2adb3069b0e04-54414ab6999mr282681e87.21.1738894022599;
        Thu, 06 Feb 2025 18:07:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ec09sm291476e87.5.2025.02.06.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:07:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 01/26] drm/debugfs: fix printk format for bridge index
Message-ID: <mubhj23fer6btbssvo7yqrst5c45kgqetsnh3kcsrrgqnqkg2j@dx5plvv75e5e>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:16PM +0100, Luca Ceresoli wrote:
> idx is an unsigned int, use %u for printk-style strings.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
