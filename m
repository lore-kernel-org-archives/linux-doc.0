Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE822BE02D
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488381; cv=none; b=tPtHMM2TNnajcG8Fk7GFYbWLP/qQ1wH6gDJleerOT7KTb055zGuJGJ94BsWbs7cS6ZZJW5euxbWh+gqj/t/x0GlbY8vkxAsqdv/o9odLU01byRGwq0I+NbB/chBJlglucl7pIkBbB9FLaMq+aHQaUIMQFG2o+AYpwKVbCzGghsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488381; c=relaxed/simple;
	bh=wBT7KELJE7EF9qlJ4wJMKIprFTmgzENsOa2txiSqWNE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VKfbEHC0RLEUyJdTJt3PWN0C7vPc2FHpwt9cg7KfTHesA2pt/qWkj1z5E56cNh3NrCbUyMJMM5n8olQffcCnqB9XuPSywbEgvpHi3sD9SphEL8LxLn1TqhhEdi0twM6Ez/13WQXLxSD3j+2Lr4WZCLdpbHjKJ7CEmcRb2IF6KHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bMsmfwAy; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bMsmfwAy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 47B3DC1AE1F;
	Tue, 23 Dec 2025 11:12:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B4B260716;
	Tue, 23 Dec 2025 11:12:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4E8010AB091E;
	Tue, 23 Dec 2025 12:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766488376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mB0Qz80nHWgjnD9I+aol8xVD4b/U+N6gGueNxTCJ/Og=;
	b=bMsmfwAyPoECFEIzIAcVrxvcpScOAnBt6c2+htz2HQk99cUagpmeTVzjNb0g32k/0h2hUA
	eV541nb/Duw/vZVgVr2G8KPfCf33wdeYF872YWzp+VMQb9UqWMa6cbdcJoale8gqbVFbvz
	7OoNbxIr0DijClVPoUbCES15Wsd8gAZAJFO444+210jjbRPEwQVGY2iM641DTptZuE2mBg
	PdClYH8YwLbR4d7E9NDXG5+K6OHqLqD0Sy3d1jIrpAnW1+YqPt8Y5SUGKWYEb1Xn2ACyzW
	Cl1EB2NokaWXloTWjb5obEcoMIJzoi28zY6MbuVuphH3mP8rX76rrDg1H3hryg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:12:54 +0100
Message-Id: <DF5JV82SZNTD.2S30QYBBSO6DA@bootlin.com>
Subject: Re: [PATCH v3 02/33] drm/drm_mode_config: Add helper to get plane
 type name
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
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
 <20251222-vkms-all-config-v3-2-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-2-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> Create and export an helper to display plane type using the
> property string. This could be used to display debug
> information in VKMS.
>
> Reviewed-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito@redhat.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index d12db9b0bab8..c940a67e255b 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -231,6 +231,22 @@ static const struct drm_prop_enum_list drm_plane_typ=
e_enum_list[] =3D {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>
> +/**
> + * drm_get_plane_type_name - return a string for plane name
> + * @type: plane type to compute name of
> + *
> + * Returns: The name of the plane type. "(unknown)" if type is not a kno=
wn
> + * plane type.
> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type > 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
This should be:  >=3D 0

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
