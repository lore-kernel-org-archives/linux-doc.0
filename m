Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC51D541
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705436513; cv=none; b=FteO38AteEizdCpovl9eEtFi+im/i5k6lRTUUfcSw7s/QwOP+gwMqSoNOVtkULZLnnntS35NQQh07L9DerJSQHDPFp/Yd7jIgfSaB5e/94uStKEeMkTRtO+Y71NRklZAPQTD53lDhdY7tD/EFCJb/lRhHc7e8KQrqC8DYddVG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705436513; c=relaxed/simple;
	bh=kC+iPZLjYfSjTMY/S2xakLwXf6QWu6TlBlmnyEa+KMI=;
	h=Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	b=qM8l4Oh7u3KKxw/hknErANhqpTnqYhMbR5sKOVrl3x+jVd+80QnXTTGew0RajY35N+BWmRUB76hfqJNiFyKm+cSmQk3RNmDTIPfYYJv/qb/WAh+3d8nO7LZPLPz31YvNIy604UdE+3zYPLpYcoEelcM5ZLa5ccwLeH6grwYwnU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sk39+T4f; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sk39+T4f"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C84757A19;
	Tue, 16 Jan 2024 20:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C84757A19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1705436511; bh=mjUubSc+Pk1IY1zeLVlXrpbRyinX0rbAJdSd89eJBEE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sk39+T4fKsdw7FgG8zI97E3iCg/V/ekNT9LZ6RP/htVrBbTjLFCgNwFfxnlBeO5NK
	 JXYSIlGFh552bwhTpL8NAowEmFzWmwUiQYyrrfgQTd9jh7Yn+yjH5iwZGgPwuBF9bR
	 Lfv0+qFPg2qfXGun09rXFKD28QAeGZDuxYKFXxqw9bT3Df+vutz2Xi6/95whx2Z7Gd
	 xJkmrw9bzm7u0DYoqfDh8SGu3VQyB2oJWDHTWuM8tOsk6rxlzVrpxpMt/Tt+f3J+W8
	 yO8JhCckignuWVssK2YOslD7ycvCa1eBp8dgH3Jvd0r1dbkFwcqOd1sBwSSGUL6gPW
	 gFoMsoqP5GMlA==
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [RFC PATCH 0/2] kernel-doc: Do not pre-process comments
In-Reply-To: <20240116151456.48238-1-anna-maria@linutronix.de>
References: <20240116151456.48238-1-anna-maria@linutronix.de>
Date: Tue, 16 Jan 2024 13:21:50 -0700
Message-ID: <87ttnd9ggx.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> this is a RFC as I'm not quite sure if this change has some subtle side
> effect.

Turns out it does, unfortunately.  Consider a hunk like this:

> /**
> - * drm_gem_vram_fill_create_dumb() - \
> -	Helper for implementing &struct drm_driver.dumb_create
> + * drm_gem_vram_fill_create_dumb() - Helper for implementing
> + *				     &struct drm_driver.dumb_create
> + *
>   * @file:		the DRM file
>   * @dev:		the DRM device
>   * @pg_align:		the buffer's alignment in multiples of the page size
>   * @pitch_align:	the scanline's alignment in powers of 2
> - * @args:		the arguments as provided to \
> -				&struct drm_driver.dumb_create
> + * @args:		the arguments as provided to
> + *			&struct drm_driver.dumb_create
>   *
>   * This helper function fills &struct drm_mode_create_dumb, which is used

The change to the description line is fine, it handles that.  But the
same is not true within the arguments; kernel-doc seems to simply drop
the continuation lines entirely, for some strange reason.

I think it's fair to call that a bug, and it shouldn't be *that* hard to
fix.  But it involves wading fairly deep into the Perl swamp, I may not
get there right away.

Thanks,

jon
