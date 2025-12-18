Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071DA32D435
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080748; cv=none; b=cy9O6wR570Hzns+z7uY4ze0KgEdZf9pyNzD5JBsR52VmRiOOBXFdYi7o1Fw55zU2XMhOyGYGdh6Ox1ky4zCylbBwK4Xw2QvuWM89vCrMqBGRHqvU7LZyRKj+VI9g+WOFKc6oxbtYIS9P5CohCn3D2M3ZqBWcE/YoR5jwHhB7WFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080748; c=relaxed/simple;
	bh=xpb4lkuIGhl07jwiwj285L/G3z+UIycSMQgXC2NnDSE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=b3OGdgIZKxiKSe9NFV7/BHIdDRQCq1ToK2WCP25xKCXyZSF00bG0zRrjzkw6qbOn5/7ZZqpgwlCl0sIvSs7apnjewUYV/e8ALx9hURyD24wqgpLL4nmPB3xHgIXZwy/Gwc2Q37tsVF+LMZ+z9tNV1Nsn4eUgjP+utKt7HFFCZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UAAv7y6C; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UAAv7y6C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D0B81A22D5;
	Thu, 18 Dec 2025 17:59:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A47360715;
	Thu, 18 Dec 2025 17:59:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89406102F0B6E;
	Thu, 18 Dec 2025 18:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xpb4lkuIGhl07jwiwj285L/G3z+UIycSMQgXC2NnDSE=;
	b=UAAv7y6CEY45ULdGbBf9q/wmx+2WYV+IZfeNCSF5MrmON9IhcQHAFsfVD5Uj1Dz5Pdl5pK
	aldj4Gpp6sYvT56UKYfybCTjXiPh05FCYmEvgk2GimOmxwTTuww1ynYtbTmEEIuJ0sxjcS
	7cCGud/8oP7Bw1gIAqliBAF+JZnmiroZSE66swVPVv9lLxxGuWFkFaTjaX/tpJl9AjvAFd
	0yAHmCx+81AGgEPol8XT7ET0CYHDJId777p99/OMlq8rX+Ggh6W92BWGU59h2pGC96CHkZ
	1gNTc7pPJp315bs9gANwe0CuCwLp+rmT2BmtAqVgNcoL1WmlUmpRy/q9sbhiig==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:58:58 +0100
Message-Id: <DF1JDEMLHD1K.1W88T6LEHMI40@bootlin.com>
Subject: Re: [PATCH RESEND v2 07/32] drm/blend: Get a rotation name from
 it's bitfield
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
 <20251029-vkms-all-config-v2-7-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-7-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> Having the rotation/reflection name from its value can be useful for
> debugging purpose. Extract the rotation property table and implement
> drm_get_rotation_name.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
