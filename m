Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13EC33CE95
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164146; cv=none; b=TEgn+LPSN4WO60TA251sY3ND1zdFUpeT4MuIJVrNscO/5tWZxMBT14g7tjtxMCaD4cvN5uuG/ZpcvBwTrGpLnOxNb2uu3SHSDir2xOyLVxvw93EpKCUVt++gQqgDkfTBJ48ZYg/gg3b2S467dkKrNowoKhDt4fnmm9kHjj0/Jgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164146; c=relaxed/simple;
	bh=ADIO2w6EbDt79sgU4Mep9kZtcpqpRoZnzcA7zgIRGjc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=lpmYXS0TXdBiBAWjoIaoQrRU5esZs3hmwiz66QfiFlgpD76ys6xVNa66AIc5SG0ZMf4AjDW0MrAS7H6qC6AVwgSp9VLnU9l8WACikAOLvWXmkBHVF0Fq6P97a0669Tlz3pL55fK3eLhZC0ng+7Xso4jG6nm68nUioYJTEf5f6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rAKFFDAX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rAKFFDAX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 704A5C1B20C;
	Fri, 19 Dec 2025 17:08:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A2256071D;
	Fri, 19 Dec 2025 17:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6014C10AA95D9;
	Fri, 19 Dec 2025 18:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766164138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ClEy6WtcmlKP3pzmylHb4tVl/LC3l48kBxppr9SOblc=;
	b=rAKFFDAX4lhIi/pi61yIJOq1ZDwWw4gAMtRTJR3AbVLehWaencDuxnx8Y1o90QXVQ5O2Pp
	Gsug8JmMjLp28zoJAmEPMBNWtfubCpUTLavJQjS4XHj4Uc+1x4iB3ZCfCSFEerVwllvfXh
	Zypr0KkoSfBp1f5AobtVZNlGpPSIFzJwVnjnGT5JMEpahyuY8NUvkyV9cJSfj+7kLCapiF
	NfqMaZr5xH7KL+UfCv8/+T2FQ3CAUnurVN6wr7RaEJfZE7ZFiULhczGyst6GeJrtk08V3I
	0MsR24FGLVV/UUUf5H7WejXNXKQr/BUwbiIng1AaCNlpLmAiSn+wfQup4M5U8A==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:56 +0100
Message-Id: <DF2CXN2CODZZ.14PL0961FZLGQ@bootlin.com>
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
Subject: Re: [PATCH RESEND v2 24/32] drm/vkms: Introduce config for
 connector supported colorspace
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-24-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-24-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> To emulate some HDR features of displays, it is required to expose some
> properties on HDMI, eDP and DP connectors.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h

> @@ -241,6 +246,31 @@ struct vkms_config *vkms_config_default_create(bool =
enable_cursor,
>   */
>  void vkms_config_destroy(struct vkms_config *config);
>
> +/**
> + * vkms_config_connector_set_supported_colorspaces() - Set the supported=
 colorspaces for a connector
> + * @connector_cfg: Connector configuration to modify
> + * @supported_colorspaces: Bitmask of supported colorspaces (DRM_COLOR_Y=
CBCR_*)
                                                                ^^^^^^^^^^^=
^^^^^

You're dealing with colorpsaces, so this should be DRM_MODE_COLORIMETRY_*.

> + */
> +static inline void
> +vkms_config_connector_set_supported_colorspaces(struct vkms_config_conne=
ctor *connector_cfg,
> +						u32 supported_colorspaces)
> +{
> +	connector_cfg->supported_colorspaces =3D supported_colorspaces;
> +}
> +
> +/**
> + * vkms_config_connector_get_supported_colorspaces() - Get the supported=
 colorspaces for a connector
> + * @connector_cfg: Connector configuration to query
> + *
> + * Returns:
> + * Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)

Same here.

With those fixed you can add:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
