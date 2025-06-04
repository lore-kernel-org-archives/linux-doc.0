Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5A2AE74
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047854; cv=none; b=NG8qRiVIAgQ6xE4LSgKCMIdL9562Lb7V6rZbGP4J0Y7AkoJe8FozZKYIYM0Hq/6fROfh9Brw8jgoBw3YdbF53LOCTd4yjQqHBN8Z1qxo6NEXRLYmil9K5rlDQXIZX3Ee3lyecg/8MfcsOKWRt3hjH9S3ipi1RgBwP81aRJY38hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047854; c=relaxed/simple;
	bh=U5I5Ahe6JecLKWF9dMl/WGN9UgS8Owuf/L8FewTRsgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqDJn0YocdS6nxPJhJ3xgSXKuYmUbnl4QjLoZKzJVaWhIVjjTFS8Zq2CEyvWkrIRnNTRcmufnAKVyWWKAuG5PPngW37FA++Q0KX5wi8RnnC94drEX58lHIxp5gfUEKlJdGxj5M/jbpbgSgtpfEHmGgPtK1SfKzFptddxngrM/IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=LO1AeMzu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="LO1AeMzu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so13788935e9.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1749047850; x=1749652650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZUBKc30vw5SwfnkHXPZNMm/Ylyi+Jo+Sq09IMYtHNI=;
        b=LO1AeMzuOypb4avrziNOuqWjBGHZdnTOUfLUdLhBbH+YZDmXNqRqPJswTxup/T8ZE1
         +oPMwKvvXQ0fKiwJ7dnZlhQEWSFn0U66WBDGAmMFE5+aAK94OzjMqXzKel2xVti9RF7L
         YJf2IHtGfA59rJTn9oP7P6ESh3fCXerm8d8LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047850; x=1749652650;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZUBKc30vw5SwfnkHXPZNMm/Ylyi+Jo+Sq09IMYtHNI=;
        b=RSI3KOuzKvAfqA2144SlrmkmYw/1kxwSVopGg80OWbPMnHtbgq5K6QKcmXyPv5ZAoe
         GDD2PSaIut28w8bloRf0nDoTKUe2hjuW7zz534AP6sEuJQmAMqXlY8DYRNV2MiNj5PEM
         ib5R65mr4pzn4jlkGSiOk8FJGYUudPG/OIfRU4BXxsWSLngulggM+EV4qPm7TX/PKMDR
         trLTxF3depCk6pECt4cSPBDOcmXWLHYdfm85XDauEHFEiGOJpV00TgroIVtyTVFWRbqV
         juXUFAr9kRUVkLjghp5xrFUFxU/7PTZVMlKmIosaQthwnOgVo/t7NL3AesfnzD+W1Loo
         ZPww==
X-Forwarded-Encrypted: i=1; AJvYcCUOrAJDoWxd6XnjNL1UnAOkmY5ckH4ibXR9Xv8KoxrHAP8F6VchJtnNMVdWTcQ+kUrqCn4pea0F3TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSNklYaw9+S9ECXxkrT+bLUK8a2923/uZp4FpOedjC1IH0EU+
	8C+SWZBMnpkFBIAdCVW4tQeDtIitjegbMqRcioQUr16Aohqlx0Q3fnRo04tZvzSw4Cc=
X-Gm-Gg: ASbGncuu9xsdw5Rebalzrde0pM4Ld2NnzaTFtXTLkrq2XSOxShNtjQAB0fnNaXYt+LV
	wC+Q8kikvKLCYN5KtEKELFB+uVDNNrxwdzcInOgWPfvVSY7oayMlw/QWq2JiwRgSU9p63XsK/oW
	sF/bYg7BLSt0qqOsR0+uT+fgKzrOwwLi4qHlnT69InzRukqw4bWPbNhWOVXo/G25JsF2HiXRnx2
	JsKShfbICVIHI8dPfqUd3rmxDuS/JRf10c3NiqL1ONLQ0DR/2KMC+gvot96DiA0KQ9finwr9CoY
	IOY6PiaKMyzIySQiFwE9uw/FgM3OmKf2I/oXTsTLIODFUNweSsZy0EJfy6LK4lujqO0S1dwmWqB
	0P9Bxp7eg
X-Google-Smtp-Source: AGHT+IF77XDVBkS67KTLmSK0T5wkUceKrc8aauvlRs0sDvEgKEf7a7UPbdimhlaAcpzc3R8z8tPcyQ==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-451f0a72bf1mr31835005e9.9.1749047849792;
        Wed, 04 Jun 2025 07:37:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f90c40sm204287965e9.2.2025.06.04.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 07:37:29 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:37:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
Message-ID: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDz-Pq4eMAYmzqsJ@archie.me>
X-Operating-System: Linux phenom 6.12.25-amd64 

On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > Add an overview diagram of Linux DRM architecture for
> > graphics and compute to introduction.rst
> > 
> > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > ---
> > <snipped>...
> > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a45d0f3f4561424e0 100644
> > --- a/Documentation/gpu/introduction.rst
> > +++ b/Documentation/gpu/introduction.rst
> > @@ -14,7 +14,45 @@ including the TTM memory manager, output configuration and mode setting,
> >  and the new vblank internals, in addition to all the regular features
> >  found in current kernels.
> >  
> > -[Insert diagram of typical DRM stack here]
> > +Overview of the Linux DRM Architecture
> > +--------------------------------------
> > +::
> > +
> > +        +-----------------------------+
> > +        |     User-space Apps         |
> > +        | (Games, Browsers, ML, etc.) |
> > +        +-----------------------------+
> > +                      |
> > +                      v
> > +        +---------------------------------------+
> > +        |    Graphics APIs   |   Compute APIs   |
> > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > +        +---------------------------------------+
> > +                |                   |
> > +                v                   v
> > +        +---------------------+  +-----------------------+
> > +        |  User-space Driver  |  |    Compute Runtime    |
> > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > +        +---------------------+  +-----------------------+
> > +                |                   |
> > +                +--------+----------+
> > +                         |
> > +                         v
> > +                +-----------------------+
> > +                |   libdrm (DRM API)    |
> > +                +-----------------------+
> > +                          |
> > +                          v
> > +        +-------------------------------------------+
> > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > +        |     nouveau, etc.)                        |
> > +        +-------------------------------------------+
> > +                |                       |
> > +                v                       v
> > +        +----------------+     +-------------------+
> > +        | GPU Display HW |     | GPU Compute Units |
> > +        +----------------+     +-------------------+
> > +

I'm a bit late to the party, apologies. I'm not sure how much use there is
in an extremely simplified diagram like this, least because it's really
incomplete and leaves out the entire display and compositor side.

My idea was that we'd instead link to the large pile of introductory and
overview talks further down in this file, if people want to get an
overview over what drm does.

If you want I guess you could add some links to the relevant wikipedia
pages, I think they also do a fairly decent job of explaining the big
picture.

Thanks, Sima


> >  
> >  Style Guidelines
> >  ================
> > 
> 
> The patch LGTM, thanks!
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> -- 
> An old man doll... just what I always wanted! - Clara



-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
