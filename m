Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8BF2874E1
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043711; cv=none; b=sjmGLEiKgGrHtH0FNWxTKaPJcXHyXevvAJhekyvn1N/tYeS8tJM51QPWkL4MWlBc092nhtUwBxsRFWJSmOjYjsDEU4ISXZo5zgyVH5vG8r9KQ8rREWEeZjmCs/eayF4Ja91v1glnwCQCDIXOXyE67CaBWgzAsUlfFurZnsFqU6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043711; c=relaxed/simple;
	bh=HnLlGXQ6hziyuWpD7ktGyynF2p4st0May1o0iDn8UrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG+qgXSTw3qv9XFzn5+fRIXcNr2yzrSuyh72m5aipHEiNWNd8kXZmXcceBXAZUeBH5JksT9X3xk0bnFV0GEKqW1EtXo6LYmrIOZ7KcM9x+gILNDFrcWYn96PVG9Dq3xJwi0Q4/7+XTzDo1MCo1ETUlVuYLjFmQIlbGVQ/bTUh4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWwkvqje; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWwkvqje"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b38de7940so528786f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763043707; x=1763648507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=we6ktqHl8CIb+a6ejDPrewCJowKT1E/8mfmEjuw9yCE=;
        b=gWwkvqje5prlHr562DnoKLbNf0My6FSxCFAE4aMjSfsRNLfV2xiRD8iqlrIOu0RcFy
         2uIEySPA2TnyKOeo8V9plDdZDLbS87Y/co8w7XGMEYFmC1FMkZIogP786OskUtk6ilPh
         ACO6+4bBXV0Ld2I5W0lS48PVLMh7N6KGRFvsUpl++iOzhkjPYWCBuBnmcYbTrZpegOnU
         E5SASORue5uccjIPwBpbwMnn/5FDoFimR84dDfZ35Oaie7GAerwutTF9aJezzIdFxaQ0
         CFHWO5AVxg0TcVq2Qusc5DXLQLbte8AbzDr3/F5YnOznePtH2rTpgG7erl8rBXmTszkO
         3rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043707; x=1763648507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=we6ktqHl8CIb+a6ejDPrewCJowKT1E/8mfmEjuw9yCE=;
        b=OUnwpDhklRT9QMwhv+gKXvZFII6uoGGtXJZ7NyfGJg00M0pC3WeaJA6oyN1QaNJzfY
         dUrFArz6f6LarHwYX8gEI+DmIEsQaPx1ppa12blWApLEDz2HYaB850LGoHWLTNTrgzdP
         R67tlZwaTox6WkZqbOhE46WZaXsX+qMq9qH4UFCgBnnYHJN7uGIK1MwepbYJ9PnSs0dS
         j5lC1/LubrthsZv1vDAjifMJrupRe0m8RNS7Pm797OBoKVt9wniyFWpkh70iX94jRT7M
         8/Gau0+YW24dQ0MVh6lkrRJ85EaFwuyFsdz+5J1wBgx/owhJNyVIQkg4v8/28T8Cv8G3
         6PSg==
X-Forwarded-Encrypted: i=1; AJvYcCWj6Igt0sPB9t2VUDCzw40augCTYnuryjZdr8zcFcXPRCe7BlV2HDYAPg7yf5Y9iavklavwrV+79kM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xVF7AwfmN6YYhHe8zJTKH+WBFk8xoavvkRkeP/NQ8MAnr2px
	xDpc6f/jhRSwMkSe8x1fmADInaYQUtZqJ26cg7patB7Zxee9GlQi3wLt
X-Gm-Gg: ASbGncuJYSIiz88fWR4/IyAzrOgeYjQIYD6FORuCQOF37CcRmYcXbgpIGy1sEy/TXpk
	j32ICQUwChT+Jw+NJcEzXnKJQA23SzshksW4CxfXmi8PH2bYTFunt69ZePiiHloRjrhDEw8FmJc
	AjD8kEPY4Afb9tC01wy9JS+VHnHnc6QiRDY0005LZTA1v6JQhtf7wCGlCaZrd3Zm8oSrROdDvRZ
	y5f0mXJQLDTm9Q5DGvQUPIwfbH6eqITx3/Tjc8kZwQYYXXwTooP3CU1i2x/5oIm7edAEn3b2LzS
	7R+42LOiIW8C6DRUAFavhzmgGUKUkbjuHDDH5k7wHyvWDZod9r1iIY9h0AcxNps31OCKoE9CQF7
	buuSneDbKkaaipHhKE6uLExm7czLScRapavJ3bezk80TW+cQqvUGoIzW4pykep0RywgEjpYUVIA
	==
X-Google-Smtp-Source: AGHT+IGldfDXCrb7BH7hy572KrLOiAR1Lp75or0+sxa276AqeqbFud8+BeO55XZxpLa7Ug0Up1nVpw==
X-Received: by 2002:a05:6000:40cd:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b4bdb44c0mr4800835f8f.43.1763043706616;
        Thu, 13 Nov 2025 06:21:46 -0800 (PST)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm4239920f8f.43.2025.11.13.06.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:21:46 -0800 (PST)
Date: Thu, 13 Nov 2025 15:21:44 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 06/32] drm/vkms: Introduce configfs for plane
 name
Message-ID: <aRXpeE2fCRj4uyBY@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>

On Wed, Oct 29, 2025 at 03:36:43PM +0100, Louis Chauvet wrote:
> Planes can have name, create a plane attribute to configure it. Currently
> plane name is mainly used in logs.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 3574e01b928d..1fe6e420c963 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 1 configurable attribute:
> +Planes have 2 configurable attributes:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> +- name: Name of the plane

I'd like to mention again my comment on limiting the name to a set of
well-known characters [1].

The reason is that, in libinput, we had a format string vulnerability
due to the kernel exposing devices with names containing strings like
"%s" in the name (CVE-2022-1215):
https://gitlab.freedesktop.org/libinput/libinput/-/issues/752

In my opinion, we should avoid surprising user-space too much and allow
only a set of "safe" characters.

Maybe I'm too cautious, as this is valid code, but I'd like to bring up
the discussion again to see if someone else agrees or disagrees.

[1] https://lore.kernel.org/all/aPtgCUX5kixTh2ua@fedora/
  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 07ab794e1052..be6c3ba998b9 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -322,10 +322,42 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
>  	return (ssize_t)count;
>  }
>  
> +static ssize_t plane_name_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	const char *name;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		name = vkms_config_plane_get_name(plane->config);
> +
> +	return sprintf(page, "%s\n", name);
> +}
> +
> +static ssize_t plane_name_store(struct config_item *item, const char *page,
> +				size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_plane_set_name(plane->config, page);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
> +CONFIGFS_ATTR(plane_, name);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> +	&plane_attr_name,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
