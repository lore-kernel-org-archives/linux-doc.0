Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456CA311C11
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494581; cv=none; b=ILzuyshJm0OyLkZ5JdB/6jfGPXsp18Y7L2NjvxQawHZgNZS/iT/S9Q7CSogH9THdx2M+53/R10ClhF9ZYOBiR2/47a7d53ZGdViCQ6EhLgrUx7rL+0izXtTqE44ZG5vbdNhNaQDBcbDsfxGKyTYTc/uTLko1B62wnxypg6n7LHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494581; c=relaxed/simple;
	bh=+vNrHV00bDw+659hIS/F03Bd6EpmW6mCxIjl4rYYDVw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=aq+bN/19C7bqnxmCu0nXROvC3S1TkpEHsga3x6LfE1+3bWb4DMm1l0AAT4C5nFk1WPKECHxPhJ09euInCtWuPwrxfUag9hP4FmVJbmdzZsd9QptEyKXDvOtGmXwIKtP9uBE0mlRLXNRabTpXxNW5q/1og/yoVbmMyZT8n8o4l/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lObb7jai; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lObb7jai"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 772E54E41D5C;
	Tue, 23 Dec 2025 12:56:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3083260716;
	Tue, 23 Dec 2025 12:56:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67B6E10AB047E;
	Tue, 23 Dec 2025 13:56:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766494575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v11StIVYhZW6pNTNvm2d00yDP+Y/pPkF0IvfYZUT+Hw=;
	b=lObb7jaiJpxfKsS5jJoLgOlK4NgWwBycnaEXq+JymdWbNgc+WIXZt6hp+/qRB+2+72A5O5
	gIuqWhh3YVKUSVqnPu0Hl3nUDoolNihHzsS4nuxLxBCTQw65IWpH5AsddvbwxoqMCgrSGT
	BOANIJSp3YgSGVAn3dPXHroctC7h+izv34dpc2+vlW/pjvvT0EXfElYX8V2tXcWbLNf3Du
	iwSX7WpK2RGjk6brF6c8kY5eRBBJuKI2JTQPXEG/07AnHgoD6INeEbCHXjg7VU4Txhu0k4
	YcNJQjlvjWvJwa9ox7/aZO8LTPfnII4XnhKNqJBq8EpDYqWrkt91I5iFsw2VDg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 13:56:09 +0100
Message-Id: <DF5M2A4RT005.KU8DTLA3CGI0@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 13/33] drm/vkms: Introduce configfs for plane color
 encoding
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-13-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-13-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color encoding per planes. VKMS
> supports multiple color encoding, so the userspace can choose any
> combination.
>
> The supported color encoding are configured by writing a color encoding
> bitmask to the file `supported_color_encoding` and the default color
> encoding is chosen by writing a color encoding bitmask to
> `default_color_encoding`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -124,6 +124,20 @@ Description:
>          Default rotation presented to userspace, same values as
>          possible_rotations.
>
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_color_e=
ncoding
                                                                           =
             ^
supported_color_encodings (final 's').

> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst

> +static ssize_t plane_supported_color_encodings_store(struct config_item =
*item,
> +						     const char *page, size_t count)
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
> +	if (val & ~(VKMS_SUPPORTED_COLOR_ENCODINGS))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
                                             ^ encoding

> +static ssize_t plane_default_color_encoding_show(struct config_item *ite=
m, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int default_color_encoding;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

Set on declare, for consistency (and conciseness).

> +static ssize_t plane_default_color_encoding_store(struct config_item *it=
em,
> +						  const char *page, size_t count)
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
> +	if (val & ~VKMS_SUPPORTED_COLOR_ENCODINGS)
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & VKMS_SUPPORTED_COLOR_ENCODINGS) =3D=3D 0)
> +		return -EINVAL;

This if() is redundant, the is_power_of_2() implies it because you already
ruled out any unsupported bit. Also, the comment is wrong. You can drop
these 3 lines entirely.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
