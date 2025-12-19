Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3F33EAF2
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170628; cv=none; b=a8DUPAIVGE/FI0e006TVYa3BJTjwv9F1VvuD1TiA0VRjJPVcnGU10dG5vNnMppIX+UE/SjSYEh8o0KqykcDKAm67BZGEYwYLefwkP32Cb8gGAShL0LaXlixle/QITEJ0cewTTZBwu8B4hjCM9wKK4TjyhyMtiQ4Dj/caXMRl7Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170628; c=relaxed/simple;
	bh=Vzlf9gQ+toeXvNt6iw/qzwWao3T3nlIl1TiL+5B4U+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DeLph+GmVKvL9feoprCv6vjtdQSYq2OYla0jLMauPV4ISLGdIf0aDth74noOg4Xj1dABhAtjfeUZE3DoxKoWdDdkMa9Z3AncuP7RtdqeKQ6/XoF/Tg3onHoYrzgyZuSs1VUs5DwyTYVce6w3Z+XzwF1N4Fm9BQOG72LDnc3Jvvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tJmXhadt; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tJmXhadt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B473C1B20F;
	Fri, 19 Dec 2025 18:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAF676071D;
	Fri, 19 Dec 2025 18:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F03810AA97F3;
	Fri, 19 Dec 2025 19:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766170621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RmCTYOkLyMFlEpQTZJwkNePqb1kEiFRaGXXCzKCVgVI=;
	b=tJmXhadtAXW2id6tPw99/G0Yz57W4q+RW+QWfu1InNlZ4uwINdN049i3oscEQyEq6ArX5m
	Gl0de0nT/R+O8jKgGRKll6Y4JujykcbjIXDSEqr60mv/MQvc7vqtd4fjft82f5B8DhQsCj
	2Rcc+9awHC8DcBUBxfA46B4wPR/HbWbjXBhmphL+31SzkEtdmSVUEHWFF7bzzFDyE+4Sgk
	baFzjPT1vXyWk+Gnlm/SYIAYv+WlnsAGz/g6gczDJDnWq34lBQqEbHJ+xb+fITfyUg2tYg
	/HgLV5Kmn0f/SGJmLrUZy1bh25QmLEoA6uyuK8pQx8Cp0WcVbTsgvOp0UaJkRw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 19:56:58 +0100
Message-Id: <DF2F8CUZLGAW.ZFYSFQURBISD@bootlin.com>
Subject: Re: [PATCH RESEND v2 27/32] drm/vkms: Introduce configfs for
 connector EDID
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
 <20251029-vkms-all-config-v2-27-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-27-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> Introduce new attributes to configure EDID of a connector:
> - edid_enable - chose if the connector will have an EDD or not
                                                      EDID

> - edid - raw edid content
>
> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
> x86), it should be sufficient for many tests. One possible evolution is
> using a ConfigFS blob to allow bigger EDID.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

With that fixed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
