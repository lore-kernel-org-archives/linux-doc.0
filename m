Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E03267B05
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503090; cv=none; b=rs2lGbQLOdrUXcH2ofUuENiliwsrRCS91b61vvxtQbEZp7fz7DBlxY08EPO18/n2dDCIo4uWS0CypqbLEL2sdjVqvs8jeBbUePt2zySTN0EI9nhAWXo13FThR6hzxyzjuMmLb5kuhXEuWMiQ72m2KGznL2tMvRgnhfFjaV9OEY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503090; c=relaxed/simple;
	bh=l17IXlMrQZpijNDPP07eyB5H3eStpTORx275j64Bud8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YhXQrMJ4xmy1HYU/bcMi01bKpdUKl99L1CuYFN4KeAezdB6zV3oaRKPVdQbj2M3GvPunTBXkK3OjDvtPvQ+7BF0bpC2s9+kuudeNmGvKzlz47sbXkLTh4/l+88VWalDfVvTVMUMznYpAJqQPmLF6o/L/xtj9fUqdBqmVhVWs3Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M1Vah7pz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M1Vah7pz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51E2C1A2399;
	Tue, 23 Dec 2025 15:18:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FB2860716;
	Tue, 23 Dec 2025 15:18:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2597510AB0B77;
	Tue, 23 Dec 2025 16:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766503083; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HKntYVi35pyEVeViH3hVSD2BnvvTIn+UnG48LkKSRYI=;
	b=M1Vah7pzguZcswFNojTFCWl6ZC58I63uRcHqIto0Zw2jYnWzGvVJKfr9r/e3mLp1W0uw/Y
	uTRXH9+nkfPJq2RlJQPN65DPbtl64f9UH4KiTIFiMykNkFij91gfz89Aj+xK/zOGTQqUvB
	jIJ4VSLMuDA5tsDLhxnXpNn1A/Lg5QN1ZdBgVnQsBemW7D3KGkNiOkW0xddrRIneE+mX7a
	QR+04Ygc9q/5TkE8fHFJHYi5XjukyWOfYmq2ruF+IX6dPKpHd79JR/49ZbsQKyGZ4vBzxh
	/wF8gXNq6qfNihm9Otvmrq0ZkcZ4bliDwLrmxPjxyVr6GKyTWeTTUOWdS4fs7w==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 16:17:58 +0100
Message-Id: <DF5P2UXQ2SEO.28VDBBCPZTTET@bootlin.com>
Subject: Re: [PATCH v3 33/33] drm/vkms: Introduce configfs for dynamic
 connector creation
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
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
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

[...]

> +static ssize_t connector_dynamic_show(struct config_item *item, char *pa=
ge)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
             ^^^^^^^
	     dynamic

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
