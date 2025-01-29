Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00301B0405
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738153358; cv=none; b=P8RzNgT0SGnZUr8t9JtDoFaffF3Vwu9yoVpuXxU6fwVbBfyTFAIrOqfP1aSdvcFizU8+Il7WFq0Xbplej/ze5K++g5pVPS6wX8aaIIEzEqYhZImOisk3v/9Oym4Jd0YfDiua8oxXNBm3VrCB7iT0jmrS9s5Zb6+a7LhhjkqiiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738153358; c=relaxed/simple;
	bh=u/AClCSb8vmTeejgZG1IlBafEygVaQUVkNALcrBLrvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgeXjcczrk/SjFwgXp/KmWPhWnGBEQAWLUj5aL/qsB2CMJ6MtY9OrbWZOf3PjPYyXrNIhoE4MIUpRXDL7/V+N5kZe9b9tZTdPO1HP21hgLvKd1E9q2oibt12A4PKPBxBGqgIA2Vx1cMdJOjwE22IDK3BUlTNLGfrP7KZVTHMz5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hFgRDMSF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hFgRDMSF"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540218726d5so7182347e87.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738153354; x=1738758154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRDMdrR73gUJ1Q4/o40XdsAUzR8OCpfjUSMlmEuWmLc=;
        b=hFgRDMSFSVQny4g+9DsE3DG+/uvKo6hZvqViRI92KAID+4pT9Py1abMOTxpOmtoz0P
         3ZStOfje4xljHNc/HghHkuK7NNls2dsInDSEQL9PhV1FqfbpJSId1uZzuthPqy5HovMk
         KQRAIWFj59LpqUlUNo3ZgvXg1luEGvSinIFWWm5NqSNSJvmLktLHf3cztlvAG1fwuKP2
         oo/yFsxClNXujWdL9aaDcDvevAS95P6V6yf/51bYRwayqSql1vVhUV2X/Y0WiEzeP5wj
         0/vsh8URgRahNvMY1FTHIiN5KWYhqCxOou+Mk+8RDZltWvfqPBrsuCOyD6VWbgZr84r7
         Q/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153354; x=1738758154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRDMdrR73gUJ1Q4/o40XdsAUzR8OCpfjUSMlmEuWmLc=;
        b=Gj2jSmgwLKxEv3uMh2XxDE+z0CWP+FKY3lrp7vpyXQR1imQ/op1D2vLkK4MxryDebs
         a1Ep3P9x4TjCjZvQnNLV/FQf/VQVRdF619f82TIoKG+seyKSzWN9vGjt9kXHggbGdrDF
         iTwQnOUGmEmF5JXHXla1D1YgxAZ5PKawaRu+1sCZZAe/CYVZlhrBqAQrlUUD8o7+WFhX
         RXEFfjfbaPUJ6Elhc1nnTlyJWKxfviX7l3w/UK0WdQKDBCkQR+LqDTvaYzxocV9Sb3tR
         7xJGVEi27aw7DOTbp0vpTeCaPHoHFK/ZIWMDXit/xBZR6i/XO6WzWKCSXqmF/A3JsFy3
         OfEw==
X-Forwarded-Encrypted: i=1; AJvYcCUNK3P5gqs7rQJM28pOBGUwPHXNdoNJLX05oyjVpeWijCRLDKZgrZt+QGPdGo1mBy18WX031fxq1WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1Rd5xXB1ZKJJYfQL4F0+FrBA375yuYZ2w99smoXRI2MN2cbV
	il0TWo7RGwvn3uKVtcr1TCEPitsOlrPpaJYnjMjsHin+wATHnVlZCKgZetKrchs=
X-Gm-Gg: ASbGncv6TDre6Y0AUNZDD9+vpLiKEW1Zo8MkwQyXXedhrSfg+/tHzuQ+c2W9jtvh/jJ
	KzhLfX7opSyjeVm8jccpBJVH0TRKNCYQtxgkdfJDqxl9AOAkeuMbp5FsWwjxowrK53a//dunhWb
	Ax3wikH46EC9ySWBBZr6EVole8NHHxMfQbV2JrXvAROK+dt3vGFjm9Hf/q35FdlC7M03vAlfrLW
	SVB7cnoPfUPfJnELF4t7lSiWxg8PoT9mWua+5iZSbBf/Bg1Sa/5Vj7TEvs9k9F6eiYVS79f9zQy
	Mj8UI6PUJCc7B44BUWOfYgiBU3G1Mzaq9jRQIj/Gije1lahcrUz/T7ncYKYvZsHHg3PZaWw=
X-Google-Smtp-Source: AGHT+IGvBOgV2ZaaEvAbq6mS1qgCJfJWEc+POw07Pf84KnH6OU2QSM8Lwr3ZtXvI91MJz/jrtziZ1w==
X-Received: by 2002:ac2:4e08:0:b0:542:2a29:88ed with SMTP id 2adb3069b0e04-543e4c3c238mr992245e87.44.1738153353797;
        Wed, 29 Jan 2025 04:22:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8228943sm1973304e87.33.2025.01.29.04.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:22:32 -0800 (PST)
Date: Wed, 29 Jan 2025 14:22:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Kocialkowski <contact@paulk.fr>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <yipjwosmkqsadvhulzh76ydqbfvv5npdafl3yzdjmikfa2yq4y@j7nj4audwxl7>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
 <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
 <20250122171230.30cf9b97@booty>
 <jiwexbvzcrq7hywl5t25cojrgjnyv5q2wnb2kvgriucal6764w@hhrefcftcjza>
 <20250129125153.35d0487a@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129125153.35d0487a@booty>

On Wed, Jan 29, 2025 at 12:51:53PM +0100, Luca Ceresoli wrote:
> Hi Maxime,
> 
> On Tue, 28 Jan 2025 15:49:23 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
> 
> > Hi,
> > 
> > On Wed, Jan 22, 2025 at 05:12:30PM +0100, Luca Ceresoli wrote:
> > > On Wed, 8 Jan 2025 17:02:04 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > > 
> > > [...]
> > >   
> > > > > > > And we'll also need some flag in drm_bridge to indicate that the device
> > > > > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > > > > because now your bridge driver sticks around for much longer than your
> > > > > > > device so the expectation that your device managed resources (clocks,
> > > > > > > registers, etc.) are always going to be around.      
> > > > > 
> > > > > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > > > > drm_bridge.c will need to be sprinkled with them I guess.    
> > > > 
> > > > The users would be the drivers, most likely. There's not much we can do
> > > > at the framework level, unfortunately.  
> > > 
> > > Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
> > > be consistent with the struct drm_device naming, and
> > > drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
> > > a question.
> > > 
> > > In case:
> > > 
> > >   a) there is a notification callback to inform about bridges
> > >      being removed, and
> > >   b) all entities owning a struct drm_bridge pointer stop using
> > >      that pointer when notified
> > > 
> > > 
> > > With the above, there should be no need for
> > > drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
> > > a bridge that is being removed.
> > > 
> > > Now, about a), patch 1 in this series implements such a mechanism to
> > > inform all bridges when a bridge is being removed. Note that the
> > > "unplugged" flag would be set immediately after the notifier callback
> > > is currently called: "unplugged == true" will never happen before the
> > > callback, and after the callback there will be no pointer at all.
> > > 
> > > Patch 1 however is only notifying bridges, so other entities (e.g.
> > > encoders) cannot be notified with this implementation. However a
> > > different notification mechanism can be implemented. E.g. until v3 this
> > > series was using a generic struct notifier_block for this goal [0], so
> > > any part of the kernel can be notified.
> > > 
> > > About b), the notification appears simpler to implement in the various
> > > drivers as it needs to be added in one place per driver. Also adding
> > > drm_bridge_enter()/exit() can be trickier to get right for non-trivial
> > > functions.
> > > 
> > > Do you see any drawback in using a notification mechanism instead of
> > > drm_bridge_enter()/exit() + unplugged flag?  
> > 
> > Yeah, because we're not considering the same thing :)
> > 
> > The issue you're talking about is that you want to be notified that the
> > next bridge has been removed and you shouldn't use the drm_bridge
> > pointer anymore.
> > 
> > A notification mechanism sounds like a good solution there.
> > 
> > The other issue we have is that now, we will have the drm_bridge pointer
> > still allocated and valid after its device has been removed.
> > 
> > In which case, you need to be able to tell the bridge driver whose
> > device got removed that the devm resources aren't there anymore, and it
> > shouldn't try to access them.
> > 
> > That's what drm_bridge_enter()/exit is here for.
> 
> Let me rephrase to check I got what you mean.
> 
> A) On bridge removal, use a notifier to notify all consumers of that
> bridge that they have to stop using the pointer to the bridge about to
> be removed.
> 
> B) Internally in the bridge driver (provider) use
> drm_bridge_enter()/exit() to forbid access to resources when the
> hardware is unplugged.
> 
> And also: bridge consumers won't need to use drm_bridge_enter()/exit()
> as they will clear their pointer before setting the unplugged flag.
> 
> Is my understanding of your idea correct?
> 
> If it is, I tend to agree, and I like it.
> 
> I like it, except for one point  I'm afraid. Why do we need enter/exit
> inside the driver (provider) code? At driver release, the driver
> instance won't exist anymore. Sure the private struct embedding a
> struct drm_bridge will be still allocated for some time, but the struct
> device will not exist, and the device driver instance as well.

You have to sync several possible kinds of events: bridge calls from DRM
core, from HDMI audio, CEC, DP AUX _and_ completely async device
'remove' / unbind callbacks.

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
