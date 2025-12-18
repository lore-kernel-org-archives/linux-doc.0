Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADD2FF669;
	Thu, 18 Dec 2025 17:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080600; cv=none; b=Z/v2isiTxS0YWVyx6xol0YOJD2RG3JxlaNXQFXXcVzHJy0V70k3gEbsw9GVUYCyU3nHNWmvWAQNNN3ulYv4Ysabj8Zs9Ee9YP0zOYw3Ii0r8Pe368JUH8v9aaKZYchPf47RSht8OgARqyCcMHZRqO9fuAA1ozDmcTosghLI2iTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080600; c=relaxed/simple;
	bh=0Xp7gkpflePA3BG+17uECNNMKEDAlimmV9QL/XtMfXM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=k+2pTJ1/puo0TrFFshB6aJkvUBhEgQ1wjIEx42LztlX34LP34X85PItlbHkl2hny+y24PDcKzkafZB57I6OR2snbV/hI5b7jbhldCw4LFI9m5P3S5/XwROnFq3TH27bn9HaCkVf5YV2Nx2eOnNMrQadJA58951p2E5wLuYUTG2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ggJ0w6ey; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ggJ0w6ey"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C444B4E41C8D;
	Thu, 18 Dec 2025 17:56:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80A4260715;
	Thu, 18 Dec 2025 17:56:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE7A0102F0B31;
	Thu, 18 Dec 2025 18:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZTLcDk8d5i3Rexvj7YyN4SglVlwj+gSdp24i49y8hqs=;
	b=ggJ0w6eycHRM8Cv+aeVg6/a7Gwsod8uL8PlL9YF0NPxoTx+ulCQH1dtQUZt4MvmoX8/ycW
	bnvU8g2b4x7PEuupd8wfwGVx9urI4YGoZTZfUY4D1QxgBx2a4q66tMBh4CO0P/s87jWnHY
	9KEXZSfuwi/fCArXRtVim4XSkWrQp0QIQ1/amYQCtWWUZMYlRXkCE9iskxFNrVCPE7eSdz
	tWOIzsGwe1Uv45vAYVedWmvnQt8lz2O5/+P1tdWF9MJj9dGm9wRhfVKPehsmEw3nbkv8Jg
	cTqQf73LvjRBRX8616husu0PJGVARI9hmsEybEZlQJmNREZnkSaUVZaMZVm+dQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:56:22 +0100
Message-Id: <DF1JBF0STHG6.2KNTJ0BZN168B@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND v2 01/32] drm/drm_mode_config: Add helper to get
 plane type name
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
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Louis,

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> Create and export an helper to display plane type using the
> property string. This could be used to display debug
> information in VKMS.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 13 +++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index 25f376869b3a..1a1a3f43db4d 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -226,6 +226,19 @@ static const struct drm_prop_enum_list drm_plane_typ=
e_enum_list[] =3D {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>
> +/**
> + * drm_get_plane_type_name - return a string for plane name
> + * @type: plane type to compute name of
> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type < ARRAY_SIZE(drm_plane_type_enum_list))
> +		return drm_plane_type_enum_list[type].name;
> +	else
> +		return "(unknown)";
> +}

AFAIK an enum can be signed, so you should check for >=3D 0 too for extra
safety.

Otherwise looks good.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
