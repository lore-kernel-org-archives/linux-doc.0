Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04D4312820
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304832; cv=none; b=ml8fydMdnDHuMotA1++eHKJHWRIhD+z3eikT5tz4jYLuW+/vt9/fSoc/CS2AXZbviXqMB5NE7t0aEyqfZJGGSfpwvyBctpUFgsNDfuGE4ULy07oxm7yAKG4s9fovOZb9ckfwKMfV3sOiqWTPI+AIAyMPnCDlMB0Nidk5KH6KdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304832; c=relaxed/simple;
	bh=ibL0qXphvFLNBhgkIrZxCh+fRmRXwYDXApfQvVASh2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0bca+Y+G6t9BJd3BOjUBVq+A9/QJ3SLDJoZy+QOBYZBst/NdQxyFpw0HvRoL1OtMvKPnfwv10Gz/fvagTZmQU0+ehF2075GjqpCmIZhI7vnO3tuXKuRvzBRZA3xFchPa8hXfri2RSmlBfKINxXG0YMmaJo+7v2o9rvzHDJVujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+sFcwOm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+sFcwOm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475c9881821so13052925e9.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761304829; x=1761909629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTnCOy1eHrQUiIAhpXZ/ug4Pk50ITgMgot9TQrvcHTg=;
        b=Y+sFcwOmvkJAPJzth7SVhksRWLTSx4tIwdn+tSVbe64M82aXSRGDiflGBDEIyN3ofP
         1FC8sRkVWVPeQw8e3qhehSRntdzBdLMjztR+3iA633Y2Ngd8JHcDiXQSFYrFaqNoRmLj
         zZnuRF9weO+x6NSJAPYO5JcCGGrvyFOx21422BylqbeXY3BRlW1zj0TZVK5MdBCo+LtQ
         PVpkqHCduRUL+MGi7jm0OHuvfeH6jPP1EUFwsdzViFOVrwTqPxw8ijKNH2eyfww44bVq
         +R/K805yF6V7UppfcozX54Ub4yV9DqDPpu/o3RF8nU4N1pmHsxEItmvCDHJ+Izd9I6+T
         L6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304829; x=1761909629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTnCOy1eHrQUiIAhpXZ/ug4Pk50ITgMgot9TQrvcHTg=;
        b=AlXa703kJ8MRCqe8rhr2V3YzZIaEESK0biLJoxXPQWJwvVWBDeoKa/a3VJHQdXIM0b
         m3cXkk2T6JQGtujcfOgdt70nTPdJx0sysEtOTd15JwU3TJFwsnaZ8cxMZ2OCRhyNC4nE
         NyGr/J9ffaqf9c1npg0yDW9JhPJxgy5WPyO9kvZXypg/HXhKLcvKkavAJYJw0CMUj0gT
         swHGfILA8TYoYlBx/Of9thtuerW8xDVnNuV3mnEZyip44Gq4BLTttjoG7ZeyRz91pK/A
         Bq5tJcZzOFWZl8cQCZpi5y/DwgjRNjwe+JCqY/v/9U5U97fWoYEm7RPKMpnBHAQZbLFh
         L1MA==
X-Forwarded-Encrypted: i=1; AJvYcCXZG0M4luCEMq6Z09srxpU9LelKw9KtYI263/A4mCLyHIPe+7bUQldxvDiFk6iklnG6xULuTyN8ifw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38Nfos2qHYDdWgd7NELZv4n1rqPOeHXGos1M7qhff28wb2n+T
	L2hCg94rvFeQvUW9s1iMyADU8MIPwkbCnY0BUAoea8/mX3q6SGxZsggG452kcDpE
X-Gm-Gg: ASbGncsIlfjAJO2kAnXGks7ShiQnyJ2e1xB8qlBGl2P7FwrqzZp/YnfiiOr3fPIHFnh
	cA7mua0n1GiSg0wv6iOcYsUv4jfpVGYy/V+he/B0fkd2fgs9TFTm8pKUdlMOGnEzm01os6AXNtF
	DxrdjbxGMnKRfNAAWh8OITkgKndSyIH55u0f3c2KUyaFXPzjDPpkVt+iFo4S/3cezQSvgua0VE+
	oe0o73wLd4v01QBuBTeCDFeFcVuJM/Ge9GRnp33kz1alqHfQqclZVAXirO7xZMW/WBkVMhu1eFa
	JrnVZ6lz+Nro9Daa30LsBL+KPMFvqIYVsYMqz1n7pg2tMw7p8qi+apU6Nlrysf/rtqeFmtGaWZt
	M6AZlWBw3RBk8JhbM5TqSN64gxc8qgIWbH2i0PUPB13L6AmN/ty28szrCGQdDkQsORMuKnnL8jL
	w=
X-Google-Smtp-Source: AGHT+IGe6elZkVAHh0p16ObU2d4NFjdkgPKJgZC3rlEc6qKcM2kxG+6kZ0Y62hj18nRKDU33xe6X5w==
X-Received: by 2002:a05:600c:64c5:b0:471:611:c1e2 with SMTP id 5b1f17b1804b1-475d24088b0mr22106845e9.3.1761304828970;
        Fri, 24 Oct 2025 04:20:28 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae92067sm90537365e9.4.2025.10.24.04.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:20:28 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:20:25 +0200
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
Subject: Re: [PATCH 02/22] drm/vkms: Introduce configfs for plane name
Message-ID: <aPtg-U56nmP2L1vH@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-2-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-2-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:02AM +0200, Louis Chauvet wrote:
> Use directory name as name for the plane.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 07ab794e1052..ea245e2e2fd2 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -376,6 +376,7 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			kfree(plane);
>  			return ERR_CAST(plane->config);
>  		}
> +		vkms_config_plane_set_name(plane->config, name);

Could this break the UAPI?

Until now, the name was NULL. In __drm_universal_plane_init(), when the name
is not set, "plane-%d" is used to compose its name.

Therefore, if we now use the directory name as the plane name, we are changing
a bit how VKMS behaves.

It is not a big deal, but I think that a "name" file could be a safer approach.

Jose

>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
> 
> -- 
> 2.51.0
> 
