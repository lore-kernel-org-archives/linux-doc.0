Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896D1339B4F
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164134; cv=none; b=kvHvwweA+tTzfHM3m7I+ekqgiiC+tNfWh3UOADinEICpuVWhIYMlQLJNH0eD7lEeymFku/paA+XmCJZW1/s9360JJl8s+sZI9m6DptgWZ7UJWPnG3uToHjggROfbr7vuVlfHMdcd9hyFAjvVxRWAbH18lgj5Xw+VbGImTfOyHco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164134; c=relaxed/simple;
	bh=9AMqqfkPNq7GtY9KYq47zudI44fcooxnq+Wf91zke6g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=sBNEA6aNEffj1WKmELlYk2FydyNBulyxLwHmm1QRoxcstCVR0aTZ7bzl3PVQyVve2hx3dGjm+cbO/Vtf9E5jOX+UgiUTXT4uQ7V3ECYazMJp/xDjujA7U1AEUGFDsRvetOgcWChKMDYliCaYQRnyYFhE0tafqrgBnwWk9W7ugKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BXjhpsIJ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BXjhpsIJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B52844E41CB9;
	Fri, 19 Dec 2025 17:08:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BDC46071D;
	Fri, 19 Dec 2025 17:08:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5ADA110AA9172;
	Fri, 19 Dec 2025 18:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766164129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9AMqqfkPNq7GtY9KYq47zudI44fcooxnq+Wf91zke6g=;
	b=BXjhpsIJXcojRWNtKVySypwi8/3+wDGAignhHNKAlJ0AdGy46cAwWHiQTmQbYZul06RCd0
	dFoKBVBvwrEAbM84cUQPoVIuOLpHTQIAgfCiSG/TmeDu7vEpzZaZL5iRbdE5bmK/MTOz94
	MQdUS95Aeax3O39VYZfDX1QY5BkKsppilcqLeKDt7QmTHboKaAB32CsDlgeKaAl+5prUp5
	mWOGoW8uKIWLvEW6H8K41l6GjokWAWIFEnHAUyatzgOZjNNxQuRmz+0uUgn/PwlauOcdl2
	IS+yaoVbpsoRIZtIw+qDcyvuZUR2tfSvPYUxaIkIp4FslNEWZ2m5DGSOigCwNQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:45 +0100
Message-Id: <DF2CXIFJGXPT.1K44S25DMFUS8@bootlin.com>
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
Subject: Re: [PATCH RESEND v2 22/32] drm/vkms: Introduce configfs for
 connector type
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-22-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-22-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> Add a new attribute to connector to change its type. This is mostly
> cosmetic and don't have direct effect in VKMS behavior.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
