Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CE194C8B
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958256; cv=none; b=PheccdM6VxDIQVYnz3VI6SHT/vodbLGSJGQufyFQLp1HG7yRxgxD+J8rv5T6logseUqxlMsUj1ixMtPbM9n+Jp2A/05f7x1O/zL2+VGn7H7z5sP4IB7TiLGAD9CaktQZDD6+RI10ofwaCbU5YIpaqAAk0csOdZ97A7V4YpvLTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958256; c=relaxed/simple;
	bh=bZqUukp4Lwbw/Bb0a5YAqVn8sl2tEBIm7JDA8kCrABY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu8jy6cJHoWZ3c58aa1yDf5rwA2SSqJKYtMZZkHGZiD1c6hmvCi4lW5TLG//BF3iywBML0Qz/c1ew7C0y4Az1R0nOFEOvsPUSabyK9pEm0sIKFEMmAIxjoxt4THLRzufSwRgzHjgXP5MLEkR4doHPFQymNclEOdu8FRNZBHyf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QxbdHS+V; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QxbdHS+V"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-544ff616032so585599e87.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 11:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738958253; x=1739563053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=;
        b=QxbdHS+VRJ5N1lmYmdTvcplIhXuKWoTs8x1BrhVD96u6oIV5PUgqXlhmaox5zHQdyl
         1xnLSJVJkd5k+f+xClDmPqMgG9MORn8i5kq8fQpRbe7uFWFyQj7c6IOvuJPvqhOmL1My
         aY4GRc92aXnbxuIXGW4Frmylwny8TbNTaaC8QqJgkpng6jRQpaKHr4Tk0DtU1V6phbcX
         2FAzEgUYRaKV3IMXNyDJ5Tp42rDM33s624lkWHf9yLgU5WMHERc1gRfTtmWeh6jyKsFZ
         aiTQ/YbHTmVmFY9WrbYH0hGMr0OBYeWO0ynlcgBLnL4LwQX9x3tZtB5PyawrnjfS/zdr
         3gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958253; x=1739563053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=;
        b=E9DTjvk5ZRvyEjkICla0arW9lRA4jeRTj+fpTbb5yhVALtJhiukH1qULxVMSR/rj4O
         G1eZbDhgRoo5cEvl1qEp5eMxEsQ7BFslWwGvI8h5ikCGY8VrDduyQxJ1KOMC80du1CH2
         tsjWRYspD/c3SivU1ru2BkfrOm6dQDqG/Rk8D4eKe94aAKZ4/rwUsDYKYro3JVJqmpgM
         1BoyKRRDPYV1sJoVkHdXeT59Ncd7n9kTAk0SCAC7alEEwBBr1zDNJDXmkhypOAR1n8CC
         6tgGTeSrsLL6l6XFpjpaOqIMnOyC6Q/H46/0I+bV+aWz6+vr/CqquEbxi7LlZcoIeXMh
         6lOg==
X-Forwarded-Encrypted: i=1; AJvYcCUCuIcUwMA1/y4E/lO8AI42SNJUN1VvoQzlHo0axjCrr1ig/KpC6Z0k1vwHnIq+dwapoHyju/eTV2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzPjM9CMFw3xES7JohucBwQ87bJ5YZ+V9vJmwWK31X/7aXyAl
	24X4P8kpNwlnjyy1rBhjCb86Xg8kNRLi6J8ZMKHGDHnIxvlzwYh+rXzZO565Fzk=
X-Gm-Gg: ASbGnct/fBDsgs+iEt3U3oMZGrRvoVkZcn8SGjaTrawG9PEDnXdF+H7UXkPCsO82QSz
	FYBSnAkYxDnEuH/tQFvNMQV4ZRQTd/gG03Bnm2RdpoDLyweWKfe+rRLq2Ny42QXnIIga38HtHG4
	i+1Uv1KMHHvuWK1cDjiN0p9PyU+b/1RJ4GFz6tCMSzrEdHLfLJ5xxPPkOKTwvzGWyfA1WRbqwI4
	jEWASBHfx6uSNkQ8oP+7s6oQlIAcEO+sNaLVDi7B7nhDevlDku2s7e95yEA4E4Vjq/UUEXapk6d
	rzBP145hM2Ms4RMgPNnn0RRgSlZiyi5fA7Sj8UIOOj/+h57Sjg72XFL94MkT07QRqrGyJUQ=
X-Google-Smtp-Source: AGHT+IGHcoDCGXH/LL0Tkb8Pbbsjc+ii5rlqX6YsqqRGWi5SEaXype8ZThbpCLSTDmjeyW4IMVV6kA==
X-Received: by 2002:ac2:4e07:0:b0:540:353a:df8e with SMTP id 2adb3069b0e04-54414b052a7mr1658512e87.39.1738958253085;
        Fri, 07 Feb 2025 11:57:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm547105e87.3.2025.02.07.11.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:57:32 -0800 (PST)
Date: Fri, 7 Feb 2025 21:57:30 +0200
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
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
 <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
 <20250207114401.7869b422@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207114401.7869b422@booty>

On Fri, Feb 07, 2025 at 11:44:01AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 05:17:43 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:
> > > Add a devm/drmm action to these functions so the bridge reference is
> > > dropped automatically when the caller is removed.  
> > 
> > I think the get() should go to the underlying of_drm_bridge_find() function.
> 
> It is done in the following patch.
> 
> Indeed I could swap patches 15 and 16 for clarity. Or I could squash
> together patches 14+15+16, as they are various parts or the refcounted
> bridge implementation, but I felt like keeping them separated would
> help reviewing.

I think most of refcounting should be introduced as a single patch,
otherwise you risk having memory leaks or disappearing bridges.

> 
> > Also it really feels like it's an overkill to keep the wrappers. After
> > getting bridge being handled by the panel code would it be possible to
> > drop all of them?
> 
> Do you mean having only drm_of_get_bridge_by_node(), without any devm
> or drmm variant? I'm not sure it is a good idea. Most DRM code (well,
> all of it, technically) is currently unable of working with refcounted
> bridges, but if they use the devm variant they will put the ref when
> they disappear.
> 
> > Then this patch might introduce one new devm_
> > function? Or are drmm_ functions actually being used to store data in
> > the drmm-managed memory?
> 
> Which devm function are you thinking about? Sorry, I'm not following
> here.

drmm_of_get_bridge() / devm_of_get_bridge(). I have a feeling (which of
course might be wrong), that they were used somewhat randomly in some
cases.

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
