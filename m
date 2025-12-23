Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1D330327;
	Tue, 23 Dec 2025 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488459; cv=none; b=FHsIvl2QpG1+Ckt3orCRFUN/PG1fk1LhjEFHqsH2XFgwg+zCNHycbl+sfxV/Bo1PyG9iGIUcN6zTpp7kYDgPDlSTtlu2Fjm9e2U5FMi/ZK5/smlXHYWxDL54mkebg/Hy1aIfPx13nDEQYJiK/BjAm6mbAevjEZIh+lhKyRQ0ZmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488459; c=relaxed/simple;
	bh=dD3U/ND2gJSVHaldIS40GbGoDWlzf0DH5jd6WVo0ZM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZIolVfBUn9egsJp7b5MPHCqUPuCXMdxae7sXpa22BE1C8wa4G/w8sHo7VhX4gtumRnjIgpmOn7aahuBHA9gaZnkol8LL6UWto4cMBSV2CjdxnXjcDf+LDe07TTxzol0qkJcBH1GJG5szlzunI2kUw8GX9NIzA4lTEMiOMzQll30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CIblix8o; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CIblix8o"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A40814E41D5B;
	Tue, 23 Dec 2025 11:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A52960716;
	Tue, 23 Dec 2025 11:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 575C410AB09D9;
	Tue, 23 Dec 2025 12:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766488455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h3o+jYMgms8cRmesAzwy75E53VOTuMFwQGWtFoC/cuc=;
	b=CIblix8oQGNkFwa8tearxS9xKdlkic349PmeDnYyPm80lnKO1tsDzmUcEYjp0D7I/ZzokA
	l/CMR6b3ZKZO/8dsGBrElGdYOFUYXN50dVHdDMWjVytXobkueHKMy4fKQszX9qi+mzI1MO
	FJv0eOwM53drKtzyfRsMaGvY0p5dSfaWDn3GXclPGIupAHXZoT/uCEWq9F0lDN+XJi37RI
	gu97J8ss2UhhyN6aeXKY4P3a4NE4350q2CVFPAeYkUr1+8qcq0vwg7dFP/3t6B7nP2QxyM
	WOH6E0IgFrRBcRLNw/4QeMTouU42HoX+4wGzxfAs3SnT7J1u8xBSpBRl4UBIKg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:14:12 +0100
Message-Id: <DF5JW87258M7.2BEL9XFX1RMTW@bootlin.com>
Subject: Re: [PATCH v3 10/33] drm/vkms: Introduce configfs for plane
 rotation
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
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-10-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-10-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> To allows the userspace to test many hardware configurations, introduce a
> new interface to configure the available rotation per planes. VKMS
> supports any rotation and reflection, so the userspace can choose any
> combination.
>
> The supported rotations are configured by writing a rotation bitmask to
> the file `supported_rotations` and the default rotation is chosen by
> writing a rotation bitmask to `default_rotation`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -365,24 +365,105 @@ static ssize_t plane_name_store(struct config_item=
 *item, const char *page,
>  	return (ssize_t)count;
>  }
>
> +static ssize_t plane_supported_rotations_show(struct config_item *item, =
char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int plane_supported_rotations;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

You seem to have missed "assign on declaration" here (but you did it in
plane_default_rotation_show()).

The code added w.r.t. v2 looks OK as well, so with the above nit fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
