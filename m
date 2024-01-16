Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E6200AD
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705439604; cv=none; b=sGyjeywX+6KS9fc2mNbBIBFYK/X+JjqfVhHNT+XVBq+HFzg9nPB2WnamvP72wKf9IkRen13DPe+glDYmN/QF9m8PWn0qMFWe0zhCxPUA52NJeqKaHcR2hR4he8BQD5Va/kjSlHG21Y5ETFPaa4RBtmnpoXHW8D25pnM9gLorFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705439604; c=relaxed/simple;
	bh=X4vOeCblQvG4jgqeZHDisVJGXL702zGcKJGNwLIuxFU=;
	h=Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	b=pYd2ATO0tAOxlkY0m2IGcpVORQ9T6EKNb62FduNdYe5I9b1gMzMRN2+liRnl9H7RL340bYy152XXHn2U3CikrYvqnkV9zRlLQZFpEp0axGJN4ZURVRghSc7YDP+twN/zhj5sXRUaR17MPYUZfUkFFF2A+aPC7Iud/gbkiWdoick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kvQfB4fR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kvQfB4fR"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 63B0E7A25;
	Tue, 16 Jan 2024 21:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 63B0E7A25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1705439602; bh=Nd8k9XoyreXJylVxOAmlHoFisbEcu7KH1s9p7RBUQ74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kvQfB4fRHyA+R/sXl+YFPaA/VeHHCR/IViIMfVc/v5M1NFBn9F9uY+xGhkwCvFSTp
	 c6gtwTaeXyjKm3dXhMBHrMcpSPr2CVy2JXr9DQ5osuyCtb8QA0cyDgz/Jr1whmKX5n
	 iEGEbMyWJKiONeJZAvSKqhiE2qkh6BIFBxwbZbiKue5crEXbS3pNlqYXgu+5R6JaK4
	 3+CdZJRwAxefxpq0UbPPLHQHLXxTIDv3idnTKw9t9er3sp4VmzIumM/P0AxXwRQrSj
	 uXkg4HLWjquK+ijR9GrL5ibZwhZLaU/B/Mm36m+bp/F7zz/shPP2PekRYJ//s73Zxa
	 MFqCq4TA7qZ7w==
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [RFC PATCH 0/2] kernel-doc: Do not pre-process comments
In-Reply-To: <87ttnd9ggx.fsf@meer.lwn.net>
References: <20240116151456.48238-1-anna-maria@linutronix.de>
 <87ttnd9ggx.fsf@meer.lwn.net>
Date: Tue, 16 Jan 2024 14:13:21 -0700
Message-ID: <87le8p9e32.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:
>
>> this is a RFC as I'm not quite sure if this change has some subtle side
>> effect.
>
> Turns out it does, unfortunately.  Consider a hunk like this:

Actually, I respectfully suggest that you ignore me completely...I'm
having kind of a scattered day.  In truth, this all seems good.

There is, however, one subtle little change.  Consider this from the
comment-cleanup patch:

> /**
> - * drm_gem_vram_plane_helper_prepare_fb() - \
> - *	Implements &struct drm_plane_helper_funcs.prepare_fb
> + * drm_gem_vram_plane_helper_prepare_fb() - Implements &struct
> + *					    drm_plane_helper_funcs.prepare_fb

Current kernel-doc preserves the "*" on the continuation line, with the
result that the description is rendered as an itemized list.  You can
see it at:

  https://docs.kernel.org/gpu/drm-mm.html?highlight=drm_gem_vram_plane_helper_prepare_fb#c.drm_gem_vram_plane_helper_prepare_fb

It's a subtle thing that doesn't really affect the readability, but even
so, somebody clearly ran into it at some point:

> /**
> - * drm_gem_vram_driver_dumb_create() - \
> -	Implements &struct drm_driver.dumb_create
> + * drm_gem_vram_driver_dumb_create() - Implements &struct drm_driver.dumb_create

A number of the existing comments leave out the leading "*" on the
continuation lines, presumably to work around this weirdness.  With your
patch, this little problem goes away - a little unadvertised extra
benefit! :)

The kernel-doc change should really go together with the DRM change.
I'm happy to carry both with an ack from DRMland or have the kernel-doc
patch go through the DRM tree, whichever is easiest.

Thanks,

jon
