Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FA23EAAE
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164133; cv=none; b=OPO6kaqKxsJhjD3TaACB15aS97Tn3n3/0ixGFs6LyLAivMkROpONqFHXiTvAGzr0o8G+x+CdXPeum4ClB/AiHH0Wm3rHujfmSx0SZOS63isScxkfjcM/deTpGuxs6kl2UjDOmi7qzl3r8l7gCounl+SnLlBBgLX5S1xtCwAJ1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164133; c=relaxed/simple;
	bh=7abNGbw5UNKpuKUah2JD1yajzn2jFLndllfRfZdg3DU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=AWFSUelwCpDOt+rauRikdc0OgfZUKv+ROioyt92wdsTwIOG70JXBjJJTo5FjXX9S1XUJIdLDCLrY9AD79NTX/GV6zLjbUvT2kkozgM1tF7JCTGXSx35GfjZAj6jf0jWLXHDoUOgWFxQmu6Ht3BVzQu00jDuekze9rzYZRSZZwpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cvEmO1mU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cvEmO1mU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B7494E41CB8;
	Fri, 19 Dec 2025 17:08:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12B246071D;
	Fri, 19 Dec 2025 17:08:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7446B10AA95DE;
	Fri, 19 Dec 2025 18:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766164125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7abNGbw5UNKpuKUah2JD1yajzn2jFLndllfRfZdg3DU=;
	b=cvEmO1mU5L74Pmj9SHW0UBDXFemIpvq8BMExFMcK4b3Rc4ODKmjx8Rj1/jVS+FGZPixPuB
	uK9fOwjqbMmrWGf8VaoB3XNTCtGCE5khVBV5GPdb9xdt9TQ4RCFt0KjM91SQOlvfXPKSEV
	7yQaTOSz5NYeUVCgw51fZVhWTn0EngHCccN+ErLkFNTIc2b2RSBuX1Ldy0pvUVqf/l+B2e
	wsUcnIvKHEGhWx5XtcNZuij3g9kyhWWbtVp8COq7PnM8oW4xztoNrTRITWgK16EnCPza+g
	lBgDX3O8cQXOyfNuEwUvLMpdxsWFe+Tj7ZigQCXFl+701gXYeKjwg/tX1c3jaQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:42 +0100
Message-Id: <DF2CXH2V23NM.YGUUYKFJJP0R@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND v2 21/32] drm/vkms: Introduce config for
 connector type
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
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-21-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-21-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> In order to emulate connector-specific behavior, add connector type
> configuration.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
