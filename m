Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3C3328B79;
	Tue, 23 Dec 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488389; cv=none; b=Rw4nXeG7YHFusfPEByyX/gXDG58hEIWFVSKZuK5mzcRpltojAWTjAl0xRBenBKX/YWrnJeVheWZfyWxWPFwB7/cxqjB1VRK1NSFA39qPQNY2/J1wpfPrHFEjUGfdqdZa0cYgtLMWLxBC7Uun5hONlG5ysDXG6ezolEjryxlTaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488389; c=relaxed/simple;
	bh=KOAsm9xi+Q+qS0E8OoqKEMEj4HkM5P4kko1YpcfKM/w=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Si2sYVRyfLTfGdNCZzm0XKu+R7wM2zxUs/61Gw6PKzmt9X4j8salsJJxH/Dql1YNuQvMUpAigKZDjBMVcehlCE5fDU+NfUZksS7ozJ8plZ8NNeB26tq/9HfjSW7VqO28YctCyQ7oy2S/BaJS8+pjh+xI2mafFE1NhnVjzJpCbEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HEW6oteD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HEW6oteD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0E2B01A23A1;
	Tue, 23 Dec 2025 11:13:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8FBD60716;
	Tue, 23 Dec 2025 11:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C3F110AB091E;
	Tue, 23 Dec 2025 12:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766488383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KOAsm9xi+Q+qS0E8OoqKEMEj4HkM5P4kko1YpcfKM/w=;
	b=HEW6oteDCUN4wUEzmEPMpf3YRQsg7V2KBoxXmpSEZTPeRszEdorIkZyOAo5kd0Iz3d4Crl
	aXrSVVPSD88OlHveIrly6Dgpqev3P++AGh8bbiJPD/XoNDpEBbw8iCGec03NfsDV717zIo
	NohLGP60QuGXe7cJKkXKAUKF91ePwyAr+BQ1qVA8Z33XlprVVaI/tPhaDn88huHc67i+Qg
	WtX7AZqpZ3tBu5ixrSvozWDcnib/xpTgvC/fjMcqV2zp9AB24Rb7V1zaEIG6LTe1CQz7HZ
	jgbWS89g4n0cNSpvElivcVlB/j1rfYMDJcpVv5knBOqX286QKIyHP0UTGlDZVQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:13:00 +0100
Message-Id: <DF5JVB2W22DK.33QHPLGE423NP@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 06/33] drm/vkms: Introduce config for plane name
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-6-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-6-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> As planes can have a name in DRM, prepare VKMS to configure it using
> ConfigFS.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
