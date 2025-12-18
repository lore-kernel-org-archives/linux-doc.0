Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86B3446D2
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080772; cv=none; b=N7iMFIACaaiGAwoR/9y5S+jn0O+OLYfu1g7V4xSrVEraJnmVuQj3JPlOS9Qx7I9hZcGxbt4z0pkG+Uy0qGa+0e+ND3TqYhbCrQ/ZNd3jZhEO07GtPDqJhIz+W9ZqhtDlt36Z5k4plqvMIG4Ns55BEO5KSn6r62Kch6IJfGN+jhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080772; c=relaxed/simple;
	bh=5oYGYxisOzoEq5aRlJgSUMLV7WFC/7cm2n/0HgYFTbc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=KgMs/iZIu7Ryek7gh8HdCJrmcHkTGguwsuGcsZwUCGV2gcJnIjl+4o6sg7JGL5XgexH7TrOWyM5QZaFePyo7uUYrZGwmRZazfBQf8ENJSmtVCQ12e+RZB1PtalMXGNRLww3f5+6jCk0QmBfJ8ns36XH4psWTSyAo6aTPqS+KvXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oGX++cur; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oGX++cur"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46F314E41C8F;
	Thu, 18 Dec 2025 17:59:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B77160715;
	Thu, 18 Dec 2025 17:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43999102F0B66;
	Thu, 18 Dec 2025 18:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4bjzW4uXNOa39QeZlV0YpEftDeMR2NUgsHXxEH6On1E=;
	b=oGX++curDRkjL8ngEx/07LmtFQGaIlfnc9aPNRYEsPFg2FoZ2epQ3KFvcEVtGFQ1VX7i21
	Xjg5FxuVd/WqWvVEpp/NeSi3gtuYp2FU0kvSyl6Y15EcYxMy9SVX+tr6yjd0d5AENYr4TI
	phxWrSMOlLZB9qljJ5+gWEthIkli6kD//paRoMdWT6UMUMcemR8zVmufAJed1ajBWvFff0
	uToPf2gYmLqaFbRJ6jwHYxa0FMbzRJEjUnzPqS+ZvMVJzuIYPAb5uuKV2cK5n/4vxs6gi3
	fx5qQukjLoT84w7/ZXVy74gyGZ88PteakV2RBpOSAsJdAk7qKNhK9xUkb4yyZA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:21 +0100
Message-Id: <DF1JDPJ0143G.299P6CA77L8RW@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND v2 11/32] drm/vkms: Introduce config for plane
 color encoding
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-11-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-11-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> VKMS driver supports all the color encoding on planes, but for testing it
> can be useful to only advertise few of them. This new configuration
> interface will allow configuring the color encoding per planes.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -45,6 +45,8 @@ struct vkms_config {
>   *         It can be used to store a temporary reference to a VKMS plane=
 during
>   *         device creation. This pointer is not managed by the configura=
tion and
>   *         must be managed by other means.
> + * @default_color_encoding: Default color encoding that should be used b=
y this plane
> + * @supported_color_encodings: Color encoding that this plane will suppo=
rt
                                        encodings

With that fixed you can add:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
