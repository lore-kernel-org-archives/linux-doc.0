Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76F33D6CB;
	Thu, 18 Dec 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080750; cv=none; b=tucxUBryP+jleXMl6rlmtqCWa1uD86hSN08fapJ1xAg///tMIlWmK3f2saVSFl7uhnrN2QFPWQMS+yJpzh5vx/KZ1Q7d4/byWhSiu7gfFiJbcbG8bZvLeS7RAt+gTEmkac+m3HJPnaWucld7bkkiw++WAcmFm0O3TtZ5FiaoHOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080750; c=relaxed/simple;
	bh=kCTFPsY/xxbdCRxmb9fo4DM+SX7mJw4MvG+WaswH3ZY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DdcUrCbDw2boY1/N34qCv7pn0mJw604bOPoodoaSm0hl4JL+kBcN3CbpuiZKh19smDKD794+KlHJIDiw0/BThV+PpXyOPOYLoayhMCnApXQHhPEt9E91abZjfssWJKkxRrQYXVqt9fhfe8Zfl96N/t97ou2lsTrSY2L+2p0SWuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NfZtgUNc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NfZtgUNc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 926244E41C90;
	Thu, 18 Dec 2025 17:59:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5BF6660715;
	Thu, 18 Dec 2025 17:59:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C798102F0B31;
	Thu, 18 Dec 2025 18:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kCTFPsY/xxbdCRxmb9fo4DM+SX7mJw4MvG+WaswH3ZY=;
	b=NfZtgUNcuugHOIQWg/L7ERsgPgTT2iwLpVU5Q388Fq+iTJQrkEdoVDgDunGjLMgjeVxJH+
	n2u0RcqDIXFEb9K0j3J2iwrIIGnKAa1YVcU5CN/H6NTP04cy3+3aZGvJgVxMjDOmLGRSZt
	f1eHdmjA8VMMSfhX3b6kfYwafJ/JZYTvcy3BoM8I9OKLlAp873/aJ8LMYTFb0HPKxd3oya
	aw0YR6c2H1J7Q4OKxr21kNPLCtO1wycy2mPndTIflZsO0qT3vgI5ww7snbHe/gCqA0aAQ9
	Hgpu/OSbunRbjfhoVS8ctq01rof+FNhuyeIAxW4QxG07ev9M/uPEDXqtmcg/dA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:04 +0100
Message-Id: <DF1JDHC3NKQ3.1QOR81AYHTNQ@bootlin.com>
Subject: Re: [PATCH RESEND v2 08/32] drm/vkms: Introduce config for plane
 rotation
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
 <20251029-vkms-all-config-v2-8-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-8-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> VKMS driver supports all the rotation on planes, but for testing it can b=
e
> useful to only advertise few of them. This new configuration interface
> will allow configuring the rotation per planes.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
