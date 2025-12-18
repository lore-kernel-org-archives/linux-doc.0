Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F9233FE0C
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080759; cv=none; b=OdZhkjIqQ5TtQeyz2Y1PrvCmzVsadVISDT/G7jLhbyosD+Np7xXZwRkUgVQy7igt5u02dFUUVNhZuK3RJjksUIvrDSUsK8XEtB5lpLEkIAN6w7hzaJ881BfnSbjqXLZSwyX3l7L4HGly/pUCY2wCj8MtEXRxhxKgSDzC1VYIH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080759; c=relaxed/simple;
	bh=XMPhxfipAYtTVCDmtIZyvLoBoavecQOJCYfin3yycTU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pbUaiK4xd7djFgB5IjkzPfTBFbJ501pYZ3Zjj+d8WBS7CmHigXaz54DBBzledPZq55ZTQ1WVdgQ9EeMWLIdJnEJEG7UW7PhLFgIaTIX3mDNUsIpH7Zj25sfbAr0Wg3hMWIMmnUGkAZEx+WZwiURmsPmuNuO7c73nhoAfVmmjfM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XXJmvNdm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XXJmvNdm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0643AC1A5B5;
	Thu, 18 Dec 2025 17:58:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A617560715;
	Thu, 18 Dec 2025 17:59:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DCEA102F0B31;
	Thu, 18 Dec 2025 18:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XMPhxfipAYtTVCDmtIZyvLoBoavecQOJCYfin3yycTU=;
	b=XXJmvNdm00Q53jxia++onqKR4YOeLlwUPrsEbcjbJi2dx1ZxS0CzQBJkzV2PY0RZCJotmT
	cGph0UG36yLHcHPje+v8tgy6bFYq+pPJGiViqO6k+Ng51/A4aajbD2orgtrxw64zYDG/1J
	eERFkn2d33dd8xd5IgEXgTX0eHwEM66Y192ABHgk+fRdT+PvYUnt6uOFmyfRX96wpE6ntv
	r/5/G3GBaMJn45DzwNUyDC76zSGkp281AGucJVDYayAo94ImwNa5sqG1zq75niKqViFmh8
	qfxVAGL2B4RuTyzJdGxeuRf7J5/21tS0JvGKzPNPdx7hnbIs9JtvElUMUKwDKg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:12 +0100
Message-Id: <DF1JDLD37SMM.9UBFXPQINSEF@bootlin.com>
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
Subject: Re: [PATCH RESEND v2 10/32] drm/drm_color_mgmt: Expose
 drm_get_color_encoding_name
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-10-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-10-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> drm_get_color_encoding_name can be useful to display debug information
> outside drm core. Export it so it could be used for VKMS
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
