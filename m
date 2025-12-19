Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C533A013
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164102; cv=none; b=gTwm7TYPJAjlVXPrwt9w9oAUeZJ90EMGO6eeFZz1ys8kCYSN/RF+YaTbqYmSBfYsBird7MCtxhBRn8MjbwVbgLUWXXg21jaibWilmPIq/ouOsRNedPMdGeqLT2mOmFhd+VqJXjZRAd0rtGD379KK7XPWx1/TRIZjXZn0pyXt1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164102; c=relaxed/simple;
	bh=Bfp9BY9cMWF3UTAEiW+vuNC8Hk01GPMQGjyXPaOSzM0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dZRceGIGPcEmLF9IFzHQIU7X13eauZmJh9XzB06gQY5p2TKSuAtIsonxgi0AMEZnMuR/gwj8podKYOFYAcUz1sCfKegRNGy5YxJkJ13gsZBYVlRuuxgBClnVraeMaeDtzkt2Devwb3k8pgbeWPYpTWi03IE8rCVBbwVkO3CWoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QfQYYRuG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QfQYYRuG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 124444E41CB8;
	Fri, 19 Dec 2025 17:08:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBF346071D;
	Fri, 19 Dec 2025 17:08:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A62C10AA95D6;
	Fri, 19 Dec 2025 18:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766164093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bfp9BY9cMWF3UTAEiW+vuNC8Hk01GPMQGjyXPaOSzM0=;
	b=QfQYYRuGdOinhxJKPwQCy+wMA3/T+T1qML0ii978ebQg8bfKULEyvB3d+C3Q5/nUYL+KQV
	lVCGmVWhzVptSmmAF7GMEQ5y4uw08SZngF9PlBvHzKb1+dlJKJBq/L1VtrX74yJLjZEN7D
	bwHVdAK1ZXZG9JZ7EdANEJspIEdSiAhiTJ68laOkpJl9t6LxCk+jOMuAd6pgkJnftOQEhy
	Lc4WpZAvZdi6FNl4r7/Iv3Z2wVhGriHe/gzS1xeKpB/pFsy0Ma7M3hC5WLccAGNMDIDZez
	CGhChIra7mn4uPau6c5CuKb60dB0zqnw0lvFRqMnxp7n585/O75J65Coljwdwg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:09 +0100
Message-Id: <DF2CX1X8BDJI.3FU896WV87QZI@bootlin.com>
Subject: Re: [PATCH RESEND v2 18/32] drm/vkms: Properly render plane using
 their zpos
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
 <20251029-vkms-all-config-v2-18-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-18-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> Currently planes are rendered in creation order. This is not an issue, bu=
t
> with the introduction of new zpos configuration, it is required to
> properly render planes.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
