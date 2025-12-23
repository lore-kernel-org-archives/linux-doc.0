Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D81B4F0A;
	Tue, 23 Dec 2025 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488455; cv=none; b=MNscUIZK3gj8oDsHYKsfBSJw7v8dgk0t3MLFroICNew245Y/TNdYHIJMAzi5g1V8zjGQP0ZKjatZ5S0c66iAjOcpccawYO0Ra7/GnGT4NbyMyXnKNmhl1E9Gw8tC6r8xrd9zZd+2vMRC8Hm/6j4BCrNndD/TEd9nN9C+9Ey1Qf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488455; c=relaxed/simple;
	bh=yXqN1jXDCaiUMeSyOsXbPjahkw+41JPqOzfqQl9MQfU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pY+DljwX08TSt1L7B3nfMnU9z6VZwbF+7kzHiZeL0UtEU621zjFh3n5TUtMKrY8M2r3yoo/SzGpFYictgteMwFWKXXOGd6COYdMEIrSM20gwlbbR1eGSRVeSPgjb1QOfRX3qvg3zoB4etHp31ixL3KAgQR9ril3FZbWy2hsDYPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KGVSWw1r; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KGVSWw1r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8CF614E41D52;
	Tue, 23 Dec 2025 11:14:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63C3660716;
	Tue, 23 Dec 2025 11:14:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 848C510AB09D9;
	Tue, 23 Dec 2025 12:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766488450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RMeWiQLtC8z81CWpNUNys142mAXsKBlKoEVzqaBndRU=;
	b=KGVSWw1rkaRsmCS6OVM5lg/r8LoszJNV5mvzY37ctLHf6wFE5Fj0cIKWvo4G6AC3BUfFF2
	J8KncgSvPG3hcpgw4Cu7v8GLWg6/4jjLDmWJD2a2UTRF3NxwpA+KGHyS+4bgkzx3icTJHP
	v+wGZHOkZ3JP8abWSRxWn31JFd9yS9Wh6sJOTdW4S9UQTbRK/cMm5rQLuzGt5/wQ/O6dMu
	6zox5pFrKNCf2wGBDpnsI++b+4X7toKuRc8k9rEPMl/ijYmM2g3V7OxHET8jA5zCogxnKV
	Jpm6MNxdOBvPqnQ9usQGAobF/CgOxB/uIenwXu7/7q+s8GKtWE+z460yizGajg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:14:08 +0100
Message-Id: <DF5JW5Z5K9YE.2PCYFIFFMT6G6@bootlin.com>
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
Subject: Re: [PATCH v3 07/33] drm/vkms: Introduce configfs for plane name
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> Planes can have name, create a plane attribute to configure it. Currently
> plane name is mainly used in logs.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  6 +++++
>  Documentation/gpu/vkms.rst              |  3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 43 +++++++++++++++++++++++++++=
++++++
>  3 files changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/=
testing/configfs-vkms
> index 0beaa25f30ba..6fe375d1636f 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -103,6 +103,12 @@ Description:
>          Plane type. Possible values: 0 - overlay, 1 - primary,
>          2 - cursor.
>
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Name of the plane.
> +
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 1e79e62a6bc4..79f1185d8645 100644
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
> +- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
>
>  Continue by creating one or more CRTCs::
>
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index 506666e21c91..989788042191 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -324,10 +324,53 @@ static ssize_t plane_type_store(struct config_item =
*item, const char *page,
>  	return (ssize_t)count;
>  }
>
> +static ssize_t plane_name_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	const char *name;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		name =3D vkms_config_plane_get_name(plane->config);

vkms_config_plane_get_name() returns a pointer to the name string, not a
copy. Unless I'm missing something, that string might be freed before the
next lines, where it is used:

> +
> +	if (name)
> +		return sprintf(page, "%s\n", name);
> +	return sprintf(page, "\n");

So for safety the above 3 lines whould go inside the scoped_guard().

> +}
> +
> +static ssize_t plane_name_store(struct config_item *item, const char *pa=
ge,
> +				size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	size_t str_len;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);
> +
> +	// strspn is not lenght-protected, ensure that page is a null-terminate=
d string.
> +	str_len =3D strnlen(page, count);
> +	if (str_len >=3D count)
> +		return -EINVAL;
> +
> +	if (strspn(page, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0=
123456789_-") !=3D count - 1)
> +		return -EINVAL;

I see you effor to make this as clean as possible, thanks. Still this is a
tad ugly, and should be moved to some common place at some point IMO. For
now it's fine, but if you need to add more user-passed strings, that could
be the moment to move this code.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
