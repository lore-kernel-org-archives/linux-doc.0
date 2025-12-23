Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904CBA34
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766485865; cv=none; b=Cvy3TUlIhjH0w7qPbM+zQNY5KEpgbzZDbv6bWztSOL4MOpTL2h2W3rVYxglpXwFhoUQMIqOnsQJ6nXzEuUAb5dU4LdfYyXi+atY0P9ydaurgIwCbx3XfQcR/EuHHO6YwE7uSbC/KbFrB6Jr+4yOx5wg+lOX9hOygs9EuSFh7SDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766485865; c=relaxed/simple;
	bh=2g1qXDZ8qC3enLzm06mnRisnivOXR8McVYT5wHnULDs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=FHcKDQLFkGSBu47ggrQUTqFG18GypiC9YcV81dqDHP/dmzqX59dR9m/VA64rYW7yPUcmWNiuB+witkTekXa+V3l0/FNM61n0mdHH/Z80HGPzfkpFtWbWFK/OFT0UzGHammheqTW32qz19E6juyyQoyEhF+KA3B949115WIRyfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H82h4AMt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H82h4AMt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 382E41A23A2;
	Tue, 23 Dec 2025 10:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0961960716;
	Tue, 23 Dec 2025 10:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D8B710AB0177;
	Tue, 23 Dec 2025 11:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766485860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2g1qXDZ8qC3enLzm06mnRisnivOXR8McVYT5wHnULDs=;
	b=H82h4AMtc0zK44p1jGc1xgNRn5y90UO5mxI+/c87p5QzL/7GYKg84lCFGfjsvZAYVIzYJD
	N9MvxKpw3LRKsIdQSX09aDRiG+96oDTA43UIKnTZaIoSvmRRVGx2nIs27whksDUIU6+z4m
	MGl5pGBkIsqcLZOqisCIpLELjP1scG4WDvpbDQjGeDu53Obc42fx4wz7Vl9zM8B17Dbz6N
	YIRj+zepv1o+CIIF4D9Jvef5ivuWSA5CY9Fval1igrBz6ZEBs7O2edIgY17T1re3Yx7a+d
	DvnE9nucheG4IYP1FkvvblSA7a6AYNPyGm49xdVCVLz0PVrtiiAP2/fQf2bbgA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 11:30:54 +0100
Message-Id: <DF5IZ2FTYT6J.1AEBT9D30GZYM@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 00/33] VKMS: Introduce multiple configFS attributes
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> VKMS have a wide range of options. The aim of this series is to introduce
> many configfs attribute so VKMS can be used to test a wide range of
> configurations.
>
> PATCH 1,7,10,13,23 are to expose human readable strings from drm core
> PATCH 2-4 are to expose human readable plane type in debugfs
> PATCH 5,6 plane attribute
> PATCH 8,9 plane rotation
> PATCH 11,12 plane color encoding
> PATCH 14,15 plane color range
> PATCH 16,17 plane format
> PATCH 18 properly use zpos
> PATCH 19,20 plane zpos
> PATCH 21,22 connector type
> PATCH 24,25 connector supported colorspace
> PATCH 26,27 connector EDID
> PATCH 28,29 preparatory work for dynamic connectors
> PATCH 30,31 dynamic connectors
>
> PS: Each pair of config/configfs patch are independant. I could
> technically create =E2=89=8810 different series, but there will be a lot =
of
> (trivial) conflicts between them. I will be happy to reordoer, split and
> partially apply this series to help the review process.
>
> PS2: I will apply the patches 1..5 after my holidays, they are reviewed
> twice.

Be careful: as of now, patch 1 is not reviewed (it's new in v3) and patch 2
is reviewed once. I'm going to review this series however, so the count
will hopefully change soon. :)

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
