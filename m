Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5D1362;
	Sun, 26 Jan 2025 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737911207; cv=none; b=Bf5jRTA/kxOldQkvqwSTdhhRpKMYjmH/kNeS3xzKQVIdO4wtSPOEhQTeyNoCswFk+dXJ0SOTFuxGm2oD4sewVc3OTr+T2SE3XUqaA9RuRnwx4OXIMob8z7xvEXglAr29KBXfSPxvVHq5eBurDdW/e2GL/0IOhaPl/a/4JxLHXkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737911207; c=relaxed/simple;
	bh=URhgw1DKZdJOfSvgQeHDWWQZh/kF6uZLUJisynp1iOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa+ei7nd86DQyZ6sZZ57NsOJLwxM/uSapUzoQjVBY67GGgta6aKUk0hQV0wAHAvNUAG0I8g7PodMvTtxqSy5ynpZZ5bkqk5QDNHCnJfwYjfnZZBYL1MBUfenEcb8jx2Rmko/E+skrZex6IQ82suKW7tAr/VtvlApxHpQuEq4eMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAm2R4pg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAm2R4pg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0F3C4CED3;
	Sun, 26 Jan 2025 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737911207;
	bh=URhgw1DKZdJOfSvgQeHDWWQZh/kF6uZLUJisynp1iOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAm2R4pgMehqQG6sGCdao50NHjXeNzsc85p9i27EO0jpcvRtRUaefM+glv0Y5hgiw
	 ifSL64CjKrVW2RPjA4btbNHQzlqgnnyZ+AjWeJVcgm8tXxIi3QsYyUl32ota/vy+zz
	 ynFVARy5aWSa6TMWsyxV+WBwa46su+26ifqADi+w2ZFtN2q38/zgi0lCdKAdk8vA/i
	 iGsBxY0hOB/wUQiFjXb7zM25iygFIPVR+0+LUIX+iejQeVVu/3Nggaw9+n/ki/Raxs
	 4uzEvRwOp+SEweVRxTbBnL3A2IWfMQCayynFsPFHzI5ZmXwOe/7/M/9xRaKuqm2DaZ
	 HDVe1uLr47SDA==
Date: Sun, 26 Jan 2025 18:06:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
	Melissa Wen <melissa.srw@gmail.com>, =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
	arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
	miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
	marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
	Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <qwym5wty72f6o4dfz2iduamkpuom6jt5txskknovqxzagruusx@zuytk7awe2uw>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
 <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dlzbemnndt5pqfg2"
Content-Disposition: inline
In-Reply-To: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>


--dlzbemnndt5pqfg2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Tue, Jan 21, 2025 at 11:48:06AM +0100, Louis Chauvet wrote:
> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 *
> +	 * Test cases for conversion between YUV BT601 full range and RGB
> +	 * using the ITU-R BT.601 weights.
> +	 */

What are the input and output formats?

Ditto for all the other tests.

Maxime

--dlzbemnndt5pqfg2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5ZrkgAKCRAnX84Zoj2+
dgf7AX4/3ojQzpaWS6I2+Z5m2w0ZAieeeoXMx23/OhsYnBApklD5lg95VlTNmmC6
IBWzj5oBf09HNYhyPnjoqVlWyN12/uStwZhRkND/zlbXihVKNu84XSqZ5TDdPx6/
fkSgZ2yf1Q==
=Rofi
-----END PGP SIGNATURE-----

--dlzbemnndt5pqfg2--
