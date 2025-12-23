Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3312BE02D
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498319; cv=none; b=nSWqSR/GoWeM1LO5BMgDtL5+k3q3LFUtObUgQBxhLc2MTyQskAgodR5RtscLVOxds/0wM9x3j3eEt5IM1F1brciGYScMmOCfVyAm7QhDDmfoN7EVTVbrm4zB2WPsAo5a9f/zRqXfijZjgKUn49U6NAmerTfgJcmZ0QmMnlFOuYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498319; c=relaxed/simple;
	bh=ZsuiJEzC+EAyhMKCWm9MMCp3zzFH8BSNkJ+cQhqEnaU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=eAlDqaYNhM9DP6rrsb44yiYsHmFAgkZzzEwLlupEV/Y0STHcYSTapezPPA8+89HZ1SyBefdyTRgwEGsA7B54IGGve3qH9IMkXNugdn4Le2b3Fdpug7t4QYHZawuke9yUL0lbaQL0CBufOKcuQHXLNZfHtMCu0H9NaPSL9AnYM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l1L6mxsa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l1L6mxsa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C2881A22CA;
	Tue, 23 Dec 2025 13:58:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DEFF60716;
	Tue, 23 Dec 2025 13:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0373F10AB01FB;
	Tue, 23 Dec 2025 14:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766498311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OKaoNE2kG2LGETGezyB3qQSBG77m7FSpf0Xy44rSniQ=;
	b=l1L6mxsaUAmLs1BWHOR13oL9JBBJGQ4TBKx51AoePG6cP6EDR3DEZ7pNVLFhKZrangavJe
	xpJeHHqklbUdGhARIbCHlAPufz05Ej/Naefr2EYeYCFihGX5Ar39Y6TEXXqVEtwqPFRt0u
	Z/kDOLhFmQIMUQD/hfNMMwm7nMr4QS7NMEArh0HGRQoMIpLccyczsGen2q9eM3lUPNlXti
	dLOHgpN3OgfYHs/sOIj6fku20FoTQBvjWN//WD7t3mLIUZCwwxAHUTM0moJuusM5WuSVCs
	i+PP7fO3FgzyUIsPXBxbxZEJb5rE/NyB+U6nbglmo0J8yASLl8lbqjKnfRIY8Q==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 14:58:26 +0100
Message-Id: <DF5NDYOIZB26.1GQDHWE4ETZLL@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 16/33] drm/vkms: Introduce configfs for plane color
 range
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-16-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-16-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color ranges per planes. VKMS
> supports multiple color ranges, so the userspace can choose any
> combination.
>
> The supported color ranges are configured by writing a color range bitmas=
k
> to the file `supported_color_ranges` and the default color range is
> chosen by writing a color encoding bitmask to `default_color_range`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -138,6 +138,21 @@ Description:
>          Default color encoding presented to userspace, same
>          values as supported_color_encoding.
>
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_color_r=
anges
> +Date:		Nov 2025

This should be Jan 2026 I guess. Same for the previous patches in the
series which I already reviewed, sorry I didn't notice before.

BTW I wonder whether it is really important to have a date here. The time
before a patch is applied can make it quite wrong, but mostly I don't see
an obvious usefulness.

> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c

> +static ssize_t plane_default_color_range_show(struct config_item *item, =
char *page)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);;

Double semicolon.

> +static ssize_t plane_default_color_range_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~VKMS_SUPPORTED_COLOR_RANGES)
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & VKMS_SUPPORTED_COLOR_RANGES) =3D=3D 0)
> +		return -EINVAL;

As for patch 13, these 3 lines are redundant, the is_power_of_2() below is
enough.

> +
> +	if (!is_power_of_2(val))
> +		return -EINVAL;
> +
> +	/* Convert bit position to the proper enum value */
> +	val =3D __ffs(val) + DRM_COLOR_YCBCR_LIMITED_RANGE;
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I wonder whether this should just be '+ 1'. After all it's just the __ffs
semantics counting from 1 as opposed to the BIT() semantics counting from
0. Any pair of BIT() to read and __ffs() to write will need a '+ 1',
regardless of the meaning of the bits.

Same in patch 13, but realized just now.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
