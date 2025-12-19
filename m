Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2C2D6E62
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170572; cv=none; b=O2odeB5Y7014r/M9FTDMjCj/0EwkUrry18pJcwGbudTwVWlB5gcARBuQ0WkrgyrAU+qig79gots/JrhoGm9Rw8Om6sqxZQ0SAq68wa+KZlDhaBxBsUpQq3kC7rWQsKNx/nUnW7FVoHKamoNaXq0pLvSZlHkKokOco9jjCFOFPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170572; c=relaxed/simple;
	bh=BvFAfVYNCHp3WxYv1aHTClx58Xhc5ePojU9METf0NnQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mwJJ2iQVVGnmGJ9TROT2Ntm+bLC19pmDteYQ1nnZY6Hp8t1JcL/Y/C6TMUSUFBdthOC4vlScioDAPjhoYxXe2x72g4rJ9X17/2WtywTVtRXlhrBZDbgIZ7gp1Ta6w5VKB1A3QnQRQ7sUPAooX1l5PrKBXONbAgp01j9nJfrxQJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WcUGrSdR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WcUGrSdR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 919F64E41CBB;
	Fri, 19 Dec 2025 18:56:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53C686071D;
	Fri, 19 Dec 2025 18:56:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C27C9102F0BC0;
	Fri, 19 Dec 2025 19:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766170567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o1rt5qZOLudIeucKbuxYOv4/CLrfTi/yfvz1r/yFLsE=;
	b=WcUGrSdR/AVh+J61cDtPZtw4Qlat8vZ6s2WBZq17WGuUZMQv8CRaCwUdK8WQhvigFhYb0x
	QWinjbjnXkEg6lFvNI0GnOVk5jLxo+P+nA/iAiyO1R4t0S6qKbx85v5RC8kdo/od6ZvPxK
	2uv8ET7iviaxo80MQQkYhPMvuXDMpXuUoMdUy1EkH4OlzG7ZyKKEz2snKGk29oO4N1/or0
	BuUknAz6ImEnx98VDDcwAL9wnZRPoc4bWUtnnaiHi6ZIlK0r/H3pmiWkgMBygzhV0w+60o
	O9x2FvSFRSMH/tMSIpR8slLOg0axX4DH5Cs8ND4su/ApyAxzwvL3tmuesHIXkg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 19:56:01 +0100
Message-Id: <DF2F7N0R26HV.2IF3EN2AZU0FJ@bootlin.com>
Subject: Re: [PATCH RESEND v2 25/32] drm/vkms: Introduce configfs for
 connector supported colorspace
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
 <20251029-vkms-all-config-v2-25-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-25-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> Add the attribute supported_colorspaces to configure the supported
> colorspace of a connector. It will allows emulating some HDR features of
> displays. This feature is only supported for HDMI, DP and eDP connectors.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1223,12 +1223,51 @@ static ssize_t connector_type_store(struct config=
_item *item,
>  	return count;
>  }
>
> +static ssize_t connector_supported_colorspaces_show(struct config_item *=
item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	int type;

This variable name is not really intuitive. 'colorspaces' maybe?

With that change:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
