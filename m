Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0728727B
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503092; cv=none; b=dCltmScmg9kcKr9fw1i17qySboT4i+XlMazzcuUGAFA9mnBcpB3Cd491v4DqsiRhTavHPsFrolooxP9E4aYm51X+//ECxQdE6NDiWbrWTQoWndBX/Jz2xeRx7HrXToX8CKF9d9WEfYOi1BxUT9MaYcU6a7ZRBPKsEEk7grhxm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503092; c=relaxed/simple;
	bh=pzGCEAAeT0IvW6hmJ2CgYbSCZUsc+Ucth4SuDKOllHc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=MqLD/WVRw1Gp0G3aw+hW4xgj5maIsolpMCa1fjosbMM10bIDybAA3IPmJ9OwW0XfDCmZKPQO2T392HKBE2XRsrNM+foKtZ5jyakt4R9wNjP92FtVJAB+/JAfckTTFledmcveJUPTXl/ywHIEhD3V0+PCrjcpP4naQcAmtdIvS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zRKXlJCn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zRKXlJCn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 565D24E41D68;
	Tue, 23 Dec 2025 15:18:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 258B460716;
	Tue, 23 Dec 2025 15:18:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96DF610AB0B75;
	Tue, 23 Dec 2025 16:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766503087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A8AP7VFwG9+qWG2XQMpXTxb+nIwMe0yIh7r6Xy8+1io=;
	b=zRKXlJCnxSkbl7f0T9USRFV5RoDoKe+13sBxHBPeDxQOR1hcmjYqLpmiNORfDMM+f/39ox
	UTZDSqr2pxzI86dDU4pWCdNwKkhVYW9VwSEU0p13AJUEBwqAq6QSiQXZNVMU6S214aWL0O
	EXSXU2siLjZ87K6mQX5Ik/bOpaDRwrA4xvsRPhRp6oW1s8fz1GCxVG/ZvSXMKsxu6/2NMg
	oTnlUF0Ri0b2Au+DIYIWy0E3ZQ2Tv5ANDpAOtog7XnZuw+2zPDZYZjdJH6vXO1K3l2QEYX
	X7rT4BAj+zQDTIts30eiCRqQDzbAJzWu6WtLY3XqyZNuGvaCzb+8od/7vWagdw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 16:18:04 +0100
Message-Id: <DF5P2XO5NLXX.YYEZNVLERBLU@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 20/33] drm/vkms: Introduce config for plane zpos
 property
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-20-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-20-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> VKMS can render plane in any order. Introduce the appropriate
> configuration.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> @@ -253,6 +256,33 @@ bool vkms_config_valid_plane_color_range(const struc=
t vkms_config *config,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_color_range);
>
> +VISIBLE_IF_KUNIT
> +bool vkms_config_valid_plane_zpos(const struct vkms_config *config,
> +				  const struct vkms_config_plane *plane_cfg)
> +{
> +	struct drm_device *dev =3D config->dev ? &config->dev->drm : NULL;
> +
> +	if (!vkms_config_plane_get_zpos_enabled(plane_cfg) ||
> +	    !vkms_config_plane_get_zpos_mutable(plane_cfg))
> +		return true;
> +
> +	if (vkms_config_plane_get_zpos_initial(plane_cfg) >
> +	    vkms_config_plane_get_zpos_max(plane_cfg)) {
> +		drm_info(dev, "Configured initial zpos value bigger than zpos max\n");
> +		return false;
> +	}
> +
> +	if (vkms_config_plane_get_zpos_max(plane_cfg) <
> +	    vkms_config_plane_get_zpos_min(plane_cfg) ||
> +	    vkms_config_plane_get_zpos_initial(plane_cfg) <
> +	    vkms_config_plane_get_zpos_min(plane_cfg)) {
> +		drm_info(dev, "Configured zpos value outside (zpos min; zpos max)\n");
> +		return false;
> +	}

Weird grouping. It should rather be:

 if (max < min) {...}

 if (initial > max || initial < min) {...}

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
