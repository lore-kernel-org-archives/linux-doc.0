Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B733BBD6;
	Fri, 19 Dec 2025 17:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164136; cv=none; b=tTq/DFGMitrDAY3fRF6xwhKYe/aE+mC6LCEH3aY94/PcYCkG3syeMv8o/8UNU+MfEnfgVYUZOve00Ah3ZJTr8JRuPdf3ihW/37Hn1yqXxQZjRvoOPA7hrIBnWVniIIJvsR5OMG1DRq63NcuAhaeWDjhd9K616WE51Y8u4bi71Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164136; c=relaxed/simple;
	bh=jPlBwGDmyHHo38M6BPvQJcitg5n4/T853sXqOEJQiNc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YVHoG9/0++FprWo647X7m7dS4T4A/SuFJ/HQ5TUFXgOsJULAUo28gLqok2kTJjESEbPPFsyr6lNxhsBmfTCHy2Ri+ZsqtgTw9q8YxaNpVrjcX8QY8DAKDhdnKEhQyk9Z/+LEvyOG9/JX8/vlFR5yqG1lXZcFCgZqlxwh47rkASs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2yc54KSb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2yc54KSb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4065C4E41CBA;
	Fri, 19 Dec 2025 17:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 178E36071D;
	Fri, 19 Dec 2025 17:08:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 654A510AA95DC;
	Fri, 19 Dec 2025 18:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766164132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jPlBwGDmyHHo38M6BPvQJcitg5n4/T853sXqOEJQiNc=;
	b=2yc54KSbLjYAznoTrhrNYGoWX02cfzwJWeIwtjT3YrqXwilOreKJTqVAivIRFhASonBcs+
	zSckwyNIqTxeFxsaVrBrjaiBB5+ZpNBpdEVq3z/kL9gdQFDTGccQkQzqE6Aa4Jt5DM98r6
	POix4S6G0AD5cr2sBrSmhRl4OY37+XtwveCovuotR6f9bzyBKKd+H1sEdwDiZA8OxewEPA
	22prziaN9uYVGONZt7HNPREVeCQxJf6qfuYfPwIvqotflQTV2wGP0C4WLWAW04kPUVGJKP
	CgbiP0wyavktUWF3//hAVMt63dm08jMKWoGz3FKdY2h7bEVZ+9AHq495dQgWaQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:08:49 +0100
Message-Id: <DF2CXKADGUKB.2TBZV98GE9ONI@bootlin.com>
Subject: Re: [PATCH RESEND v2 23/32] drm/connector: Export
 drm_get_colorspace_name
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
 <20251029-vkms-all-config-v2-23-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-23-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> Export drm_get_colorspace_name so it could be used by VKMS
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
