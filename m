Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8962F8BF0
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 20:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177275; cv=none; b=GIoi6P+drNk/ju7hYR9ZOZNcFuccz75+Lcbzy6U/Z9EYeMEt5bGa3BZ6tsJOYarxu64nMibD1omqhSSS4xPoZ+d2F8ZyqTPdPkEt/ozaON1sHFuQiSTEJYsfHP6JHfCgOSGUH2pOyyecMEPdDXodvMNva3izOeypOhB64UKoltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177275; c=relaxed/simple;
	bh=QmKCwA9OiMZoZoLMNkNi6moVnZc7AFF6KOUlW7rO9d0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=r2ESNHW92CRhoRe7Jtwo8HyW/Y7sAyYXOCRTgbKO6YGlyLHMKL1rZT3CJ/AZq69/GW5Ccrge4C4lGTvtASVXhMDQ4iWrpkEdsAwapv+9FWp0jazpuDQ4zgI2ymnpGEKhSBydZoJiAqeAS/98GwREvuCOIPgmnSnDter1XeoOjhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=woMpxApf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="woMpxApf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 343B94E41CBE;
	Fri, 19 Dec 2025 20:47:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 091AB6071D;
	Fri, 19 Dec 2025 20:47:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EA8510AA9874;
	Fri, 19 Dec 2025 21:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766177267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZPEqfLqdo5J8DXEk0J+Okhr1M8II1hSBSmQl5uQm7xI=;
	b=woMpxApfwuqx5dBF50MGRZ8LZyXB0Oc2hshn2/ds2WkY3r6lXhQOwwRs4XZppQJSeegDvF
	FIhjilWrgSKLz1bP7hRvL118edVOxWT6OTniYnIleqNmzFSMgJ4vduXzu0SbkDHR2lLiTY
	PmqGs+nwm6glXb+B9bPLBJzfqKqIcMlQAHqfYPok3/oEWe5AwDNE9BPt3z2eC8Amqi40jN
	+o9NeCXeOE5NgWf/pEAwqPh7pceq18EUF5HGtTaw2005K0h0HWPBrOTY6i8zkxZBukIH5N
	d/C7SKzVbWN+cMswR3FNOghd3lM9PvFvx8N7/glC3Wkn/Pv/LCMitBdI/jsr5w==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 21:47:44 +0100
Message-Id: <DF2HL69KF83U.GX59AN7IN8L@bootlin.com>
Subject: Re: [PATCH RESEND v2 32/32] drm/vkms: Introduce configfs for
 dynamic connector creation
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
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-32-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-32-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> DRM allows the connector to be created after the device. To allows
> emulating this, add two configfs attributes to connector to allows this.
>
> Using the dynamic attribute you can set if a connector will be dynamic or
> not.
> Using the enabled attribute, you can set at runtime if a dynamic connecto=
r
> is present or not.
>
> Co-developed-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c

> @@ -1215,8 +1223,10 @@ static ssize_t connector_type_store(struct config_=
item *item,
>  	}
>
>  	scoped_guard(mutex, &connector->dev->lock) {
> -		if (connector->dev->enabled)
> -			return -EINVAL;
> +		if (connector->dev->enabled) {
> +			if (connector_is_enabled(connector->config))
> +				return -EBUSY;
> +		}

You are changing from -EINVAL to -EBUSY. Why? Was -EINVAL wrong in the
first place?

And you can avoid the nested if:

		if (connector->dev->enabled && connector_is_enabled(connector->config))
			return -E<WHATEVER>;

> +static ssize_t connector_dynamic_show(struct config_item *item, char *pa=
ge)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
             ^^^^^^^
             dynamic

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
