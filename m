Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6052BB13
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896820; cv=none; b=mDTmdqEaqCW1Lf17N5lO68Nmc+FUEZ04s0bKlKJEDEMbI+82Eb2pN2Vi0pb9w0VTwDt45+zeElqcivNj7vFP2muj2HleNH0qUEQdiHUgW3N8nfY0Xl4QtrRXPMiG5hZiXeasDBS2At0vmJ+hyr94c175wuaBiOIj5coK+6YaEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896820; c=relaxed/simple;
	bh=FWObD09wPydBKoV6ACkAADFpWWvg/nMFUk18ZJYy+gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbFdQlCCl/NeemEgkAs4D2OWVXMk8kROK/SlUEVgtmvGuI4MT1xRLRCDNrjysFYBh89MXhv0N9FS5hD1Z4s0E5d49oWZrPb8KZWfw1GPiaawJb50CfiUEyBN/P0bBDfRnyzm5qHAXBjtUSuLGNlHcqPwFG3DJF9yG/wjhPtKKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YENicMw/; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YENicMw/"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a6bso17817611fa.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896817; x=1739501617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=;
        b=YENicMw/hWJ2do7pUZi/5YDU9N/8HbzHeQP5DCdSbdM6E5E65WhGFtY9QoWVWlpRRQ
         PsNQyw/H3THm9N32lp9J1XEW834Z0wix5V2bmAjimKrLp/A4FxzyPYgW0wFfipaizwsu
         nbxtlwoR+Gxx+2ge++7A+qJr5rBN1vsCNd9eFRfO/6iJUSsxkrwvAt1tSMGGvkjDoJvA
         8i7Qh1l/yXz4blT1cnVpiR+kv2RBX4Yqcj5YCTME9B3jR8r8DgyTO/EjzyyFal2TgwbA
         VteZacB0uAzOk/DsGLxZYlZfFGpy30sXDta6mUM83AvS4+x5BpO0NN3Dwaaf0McFwWO7
         HRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896817; x=1739501617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=;
        b=lHmkpg/Di7FZ5FPjl5DTs9WhLlnwdyNr9mE2CQnFESgQdEXlPwIL++/WjJSkooRIKG
         SfkYYEUFiuhMN8fy0Mj03mYGRTR2+3AEeOGYTJTMMRGZAFMfVHj4+dMwXKaGi1o/BBbJ
         HN4jtBfbkc7yocZcY7VTzkxnazummtsAt/FN8l24IgVvad+dfXinkP7Gmn000av7oj69
         DU0qK7jzmuVs0yCZ7H8YE2FVC/6lGHWchmbBDCo4Nas9CvRYHQrzfzFrd6azuY/QZT4L
         fE7N0xpwEtSO592cAPHu0lZbs4Lr1W3SCjH7d/TH2bre4vv3jU/eRvV0WBaIqRC3v3Mq
         S3qg==
X-Forwarded-Encrypted: i=1; AJvYcCXAzhfcDFP4pBLwtn2C4aqrOds5Zm6MKSdo8WjgJH5tbhJRUU9vs6de6lwNRDruyn0s6RoH0vuqBuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLbysBFqu0RDGC5LNgPKGjp4hT6EdazEGwc6mnyPfVnRfdu2C
	3Q/2lXmLrMDZiOcsxr/BuiBoFFmk0OV1xLKSRDvNJvhsO5nBE7xf17kyztl/LkY=
X-Gm-Gg: ASbGnct05mJK+FwhEz8BedLG/U6XokWvSTFw2XHRlmfZ4qC/QNmgnUiIITtuED8NQUf
	8F/VD/jEF22VXpeuyd+PDHHqwNFTerkyzcyQa/IZ6Dq1aTac5jNsxOg1KtXIy00uH5zY0KZvGM2
	JvOaunTZKnUmI/CjMuKFhz8XBdY8LYkDT2eb7RHX4228LtREn9D9MgWFmwjwTLKbpV+X56wHFaS
	00G9VWaNAckmdaGHqQu7r1rzT+2aFD7HK6hwhlU5E4YHVrmZNVGKf60B/HZHa3JXQDLF4L02Uwj
	4LOTaklYZoqNrGGvEaK0YCoVnBy1ozAvqqEE9rCKJgjOfh+aowABWnQ5RpHzcx7nfRtvam4=
X-Google-Smtp-Source: AGHT+IGImw4t66PXbBcvSoL+mAUZ3Fy9NEnPZ96ZWlrP0JGkhsvbwS8pOJeFaustkGSW8P8yeU5gjw==
X-Received: by 2002:a05:6512:3052:b0:542:21f5:b9cd with SMTP id 2adb3069b0e04-54414a9d1d0mr367128e87.17.1738896816663;
        Thu, 06 Feb 2025 18:53:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105558fbsm308903e87.76.2025.02.06.18.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:53:35 -0800 (PST)
Date: Fri, 7 Feb 2025 04:53:32 +0200
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
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Message-ID: <5izgpfrkxrcbcbzr7w5lpm6tidwl4lj66tmnm6l6xmncu6t3uk@2mswjcmi34el>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge(), which is based on graph links, is the recommended
> function to get a pointer to the following bridge.
> 
> This is valid even for panels, for which the recommended device tree
> description is via graph links and not (or not only) panel subnodes of a
> panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> subnode).
> 
> However there are drivers supporting the panel subnode description in

I'd say, name them here (at least the one which we looked upon).

> addition to the graph links. For those drivers add a _by_node variant that
> takes the node of the target node.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

-- 
With best wishes
Dmitry
