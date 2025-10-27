Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9172566DD
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578547; cv=none; b=rEkK9bkep7bPzeymqJd52PXmMq6QEBCXBXyVS6XwWy/tmS4AWsR32zOC9RQVqCbx1sCOP+qbWlczgBfdz3EnaApqVGL6Y6gVFrfDz0zSwlrfDQ+nnhrAjvR4BaPYw0qzFhPpSZN6ndRBpdCvMMMhYa/iYwtDB4r5a+7bk6q6S3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578547; c=relaxed/simple;
	bh=wpZEfGFYOdtNrrGr1kwpChTEln+IkUmFv0YvSn0dThs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/I9+nZ1bdd5EMRvrE3lIYdoQ8ZCuPtIbqVt1MfG5G53s6KYV00SEZYRcRC8eGtpUfWTjfnF2RkKuMZt4e0QVz2dfC+0uIEz3fD6c/hP3IORko/F3IYQNT+ul1kWwKpwmTY3SPrJsQi998A5Tdc/1P0Tk1bHtsjGAqYUoHrS3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoG7T0mL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoG7T0mL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso30714455e9.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761578544; x=1762183344; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kibxRwusq2NlpM14UnWSjenfIHlfccoVL0z6GHhRmCs=;
        b=hoG7T0mLBTcXdtPk2ZBI0rvK6wRXrqI9/JJnrPE95jJpPdvEKcrnp15FcKkaFwT8tB
         8AlrGtqgOOxFID/LBDAsk0APsbyAf0iRedzOSE+7/VGWDcsBWhoLewFuYPUFds9UUk4z
         3X8YTOns9/BezBDmKn9uf4+YYr4KBXtHfhjDrex46Bo1qV/CRrUXkBaIxO0ehrTd8mii
         ZN2Q+C/FT9dOxlxyP0bdeA4zNQnYlUj7Wl9g9pQcbDtLxnn8ViM+D3Rs4oSVdea+obNE
         QmXpW2hES2xjYFqsQpMXNk/INiDbCtL5RSzuWvuOKB8lhJ6UV0JOboED6ik/qa/+p/gC
         NJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578544; x=1762183344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kibxRwusq2NlpM14UnWSjenfIHlfccoVL0z6GHhRmCs=;
        b=fqgVT+6B4E22UeUNERrdSpZrotKN7YIcxM6cin5WvW1MZDfDWEg4/0XAlCyTCDUBhe
         e9bvORH6Mfnk4XAFrPaQVotQgfh1ZtgzIJ5hqR4zhX/o3sGldyKuz2lsA+lBOowNr76x
         Unn/7v2MAdaNTXQqxjm3HpwQlRSxVvXKMJJSIGGUqFXiT1qzDYFtlnpvlKVe5cqjt4M2
         emJRjUhLnIUyYiDdS7GQQnCfMSPDL5Wcu9r0x0sM7F/IkY90sE08VeYfILWommyqZYI4
         QhvHaxScl/b1TxQPIOpTtG3nn1ukG6O6FnVpt+ux7e3j6vef1ocQo+0b6aUdobIi464A
         tpMg==
X-Forwarded-Encrypted: i=1; AJvYcCVAY6oCUI14jZcZpktb2GbvcvgQ5jGPHIYSVAJAzdfMjDpuyIe0ByDHYPL2L1IF3MWPz8dmyRXU9Q0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzti0EqjeF5D/DlnsxZmACu8jX2+8gJfOpP7vtOwv1+3upgrmFC
	LwOVOzF36b4eM3BDB7dR9fEwVWSomS5E5eW7QRsEiMGxac5GAum1+1BA
X-Gm-Gg: ASbGncs8ULofQ+xA03d3ZJRMVYMdTg+aEuQ8o93Y9wdBM647kEs0ivD/v1B36OIPtou
	zJVjyMuFEbYGPwizw4n+y2DhttjPXwMejO5MpVAC0qGuUtgDw6uVX8ejhbDRnHQ8z1grF/HSe4w
	4JmiUBdJseEUl92TJqUT3qlUx0Dpv3IokRve6jXWLlzrhKoHqAAHKS3eksx+D398466vP0KIZVS
	Y5dD7xGqz4lWmssXJIMbUCloOs4IpheFdr8xU2QQnhBFFQhMHk/DlI425dNqNpFUcKDhVPNSfKy
	xi8Y/V4ymd8wHhXFWUrf8NhGLIZ/om8tA412au42zIeogv+AIip56jQf/GyGbRSGvwe/FcopWBw
	UEGT+lRr2f/5it92O+JKKsfFimonHutADErY7+W7Sg6pyjyKBx0DOqX7FJfFQYoSQzIFScxS2Ov
	NdEF+CEFOv
X-Google-Smtp-Source: AGHT+IHJyShjEeha+8pyivXmguKhbTNjXnS9Dy1xlYP2LhyX/WDenAnEnT9Uhw9/OaRXhnUly/OvlQ==
X-Received: by 2002:a05:600c:1e0f:b0:471:5bf:cd02 with SMTP id 5b1f17b1804b1-47717e03739mr322125e9.11.1761578542153;
        Mon, 27 Oct 2025 08:22:22 -0700 (PDT)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e41sm143262205e9.12.2025.10.27.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:22:21 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:22:20 +0100
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
Subject: Re: [PATCH 00/22] VKMS: Introduce multiple configFS attributes
Message-ID: <aP-OLNFQA0M16xuy@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>

Hey Louis,

On Sat, Oct 18, 2025 at 04:01:00AM +0200, Louis Chauvet wrote:
> VKMS have a wide range of options. The aim of this series is to introduce
> many configfs attribute so VKMS can be used to test a wide range of
> configurations.
> 
> This series depends on [1] that should be applied soon.
> 
> PATCH 1-13 are for configuring planes
> - name
> - rotation
> - color encoding
> - color range
> - plane formats
> - zpos
> PATCH 14-19 are for configuring the connector
> - type
> - supported colorspace
> - edid
> PATCH 20-22 are to enable dynamic connectors
> 
> [1]:https://lore.kernel.org/all/20251016175618.10051-1-jose.exposito89@gmail.com
> 
> PS: Each pair of config/configfs patch are independant. I could
> technically create ≈10 different series, but there will be a lot of
> (trivial) conflicts between them. I will be happy to reordoer, split and
> partially apply this series to help the review process.

I just finished reviewing the series.

Amazing work, thanks a lot for adding all of these new properties!!

I'd like to see KUnit and IGT coverage to test coner cases and, since this
is uAPI, to have a mechanishm to catch regressions without lots of manual
testing.

Let's talk so we can start working on them on v2, I'll be able to help in
that front if needed.

Best wishes,
Jose
 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Louis Chauvet (22):
>       drm/vkms: Introduce config for plane name
>       drm/vkms: Introduce configfs for plane name
>       drm/vkms: Introduce config for plane rotation
>       drm/vkms: Introduce configfs for plane rotation
>       drm/vkms: Introduce config for plane color encoding
>       drm/vkms: Introduce configfs for plane color encoding
>       drm/vkms: Introduce config for plane color range
>       drm/vkms: Introduce configfs for plane color range
>       drm/vkms: Introduce config for plane format
>       drm/vkms: Introduce configfs for plane format
>       drm/vkms: Properly render plane using their zpos
>       drm/vkms: Introduce config for plane zpos property
>       drm/vkms: Introduce configfs for plane zpos property
>       drm/vkms: Introduce config for connector type
>       drm/vkms: Introduce configfs for connector type
>       drm/vkms: Introduce config for connector supported colorspace
>       drm/vkms: Introduce configfs for connector supported colorspace
>       drm/vkms: Introduce config for connector EDID
>       drm/vkms: Introduce configfs for connector EDID
>       drm/vkms: Store the enabled/disabled status for connector
>       drm/vkms: Allow to hot-add connectors
>       drm/vkms: Allows the creation of connector at runtime
> 
>  Documentation/gpu/vkms.rst                    |  42 +-
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  18 +
>  drivers/gpu/drm/vkms/vkms_config.c            | 183 ++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 524 +++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.c          | 893 +++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_connector.c         | 137 +++-
>  drivers/gpu/drm/vkms/vkms_connector.h         |  36 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  11 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>  drivers/gpu/drm/vkms/vkms_output.c            |  19 +-
>  drivers/gpu/drm/vkms/vkms_plane.c             |  73 +--
>  11 files changed, 1865 insertions(+), 77 deletions(-)
> ---
> base-commit: b291e4f1a4951204ce858cd01801291d34962a33
> change-id: 20251017-vkms-all-config-bd0c2a01846f
> prerequisite-message-id: 20251016175618.10051-1-jose.exposito89@gmail.com
> prerequisite-patch-id: 74083a8806b1f26d9b4cd2a5107c756b971c4d11
> prerequisite-patch-id: f982390487699921b625b413e8460d67ca7a74c9
> prerequisite-patch-id: 0afca639e43c8fbfea2af1bc395e489efc8e1f10
> prerequisite-patch-id: 6285108b2fd90d30d15d4cb4fdddfef953fad51b
> prerequisite-patch-id: 2eacf5ad4f25f54a60958aa7a2df633d5642ce2f
> prerequisite-patch-id: 81e98ac3aeb3b6128098ab7bab56d3446a3a2705
> prerequisite-patch-id: 973f94c4edb4a5822c84a57d4479ca40e9cf25de
> prerequisite-patch-id: 0efbaf1b0e962a1c40bf5a744b5089d8be696f62
> prerequisite-patch-id: afa0cff94085e6ab216ffd9b99cd3dc882a0a687
> prerequisite-patch-id: 3561347f2b586392985a8e3af9ed1c5c7d3eefd5
> prerequisite-patch-id: 94030044ae8d404f7cdaed9137bddd59cfb22e79
> prerequisite-patch-id: a54b483797d5ffb7ce13b56a8943025181cd0d7a
> prerequisite-patch-id: f148fe7f445cb42437e7e2ba8b59e7e0fd40da8b
> prerequisite-patch-id: 1ef2045872843670c452816c5d6187b713c9258c
> prerequisite-patch-id: 3b9963ea3ae3455ae15ee36b67042c06a2ef6006
> prerequisite-patch-id: 519ee42dfabb4de734e41e59bd07d7a723d810bb
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
