Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512F2FF676
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764166829; cv=none; b=AOnBYzs6gyNbBbFPWg3OU3AAAGNYaxThC2f+YZhY/XWOtXOn1CRwzvJ/ljGEk5rRyA/k41dNw3PsoXU+xy7bIsbRZ2Monvw5aqufSjGs7GUjPiCpamP6IyUdKlCqtOxWqxQCAwnJphR/W/U32++RRy6zp9LF+qHemrU0p6dYO1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764166829; c=relaxed/simple;
	bh=kR8KCrtjkrqH0dCBDtoBNt6Co87mHfxvKHk9SsvTfbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuH5bJCHkE0te4Qo3MhGxkrmJQyRENpRTM/xYmqGu7wYbqjCdbDYFcOT8g8FiclvyQkE4QfGOySBIlv9Ek8/o2fq8/NvM2esMqq6meqMnsMiTch/GQNFMRUvKogp1rTUmjCQ55S8QjbWamzDTwTgZaWENg4XPNNhF2hTDd7EclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cfWqkOAz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cfWqkOAz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso3989534f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764166825; x=1764771625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+mX3K4EZWXpumEvNCBx9+WunDYcwtTk4SgV9tqSlww=;
        b=cfWqkOAzIgRIvSUFk2ZXxvBtX6kFCDRmxCScKsEwEs/GRFYn151TfESN84/7yH6zHG
         mHs5ziMnku2mhDGIfMdWabn5I48clydmj/EIL0aoNFr6lqKLq2/oaAJDd8IEYjZBp5c/
         TDeX8TYXidbaGOt5dkDlSNm41tAQFMLZ5D31FfmrqzkMWDZlaZKF68ejEf4nAnaNBn1s
         0qL35hVyrbn4/hsiczDrcyBS/lpqzfg/HijqhKS004TA7ACMW2NP4M202zF4tnffR4qe
         otxi1B7cVo/9JOEDv4tYhVk4+0AK/s/eZ0YLPi+eH9UK6flufCAiryQvgFMjL0C7Jbh9
         DP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166825; x=1764771625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+mX3K4EZWXpumEvNCBx9+WunDYcwtTk4SgV9tqSlww=;
        b=hBDYBfQOr4VmGAMoN6BSDmkHRXZnoYKHHPWRcUGBlYoMYcxUO/Xy/rpDqk+mkU4gei
         HUVXydhEhK73wi/nkMdDdkklT4AQ06Na4t06EIyJWxh090+4f/zXwmXM12WcgFyORUEn
         PG5hW1w/Lja027WTH0FfjDafQJJysJp1vllg0DN3fY4CO/zHpSV1KlDnZTqpcoYNmQU9
         XKquB2NygxE+/U9aAenmi5ibKDWtlPzp1jg5uAPKfA1U3+CyEuOMFndSFs5ZJn6FKvfi
         7AcoYq5ip55g0F334i4DPw9VSxhTut6ykrxKV5a/q583FIiUWFnrD2pToHsdeEAkmAJv
         Ce9g==
X-Forwarded-Encrypted: i=1; AJvYcCUhlTkhl6z1xVcWr2+fjF92GaNqCxKdxIKR+2c8KqOc4ujXF4+uDFRAfIBqua64i328oKDGdGBU+48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8RPF+8GlVCnE8j13mRvUyRYuHTaIcRG+/HxEcmPyLcYHr42Q
	I8KTEVkSXDtmpMNzHhvi7gV7GXuMIsC91cpYQM5Ab7GVItF2anDo7BHP+dwciW26LdE=
X-Gm-Gg: ASbGncvEYc9gAZFTTsp6p6sGi7OlEdMwCNE1pEW+0egbB1mELj8pWpduumIkEgz+IxA
	/c4PBOxI6zTPLoEfDGLBFaPGTHoVhTI6mN6Ab+U4h0DoT1S+hu0WvNEU4GKN569a8QmhlhgFHhs
	t/FjQLCrJ6OMO6Im1DZ03eMYMgOgGNGVZq3Okuq+mGg+6uKzpEbNXoWpb/4gqcnvbYeKrRVFwIR
	TvJAph+Ytx6eKun7T+MBnmsMTTk0TNoAbP5mt850w4KsRXiANAMUUa6XbtDzmeXEWpb/GiTDpvd
	nEfZkHnOqqd88RysL+wTqOKOoz6h01m6GQvufrC9QeMplITOWxl9+ambwEa3s1tQuJi1qfwLi3S
	CASEbf5a2QKuBqnE80y/6jM995/ep4JB2WjpH6SYhN9n8IkZmNAnGHIgUVvMyCMs8KyQFptzpkh
	0uTN40oNKXT4foXtCd+RoTQ1aoF0+iYjWKZUpVQmw3OroIci1OJyJrMX7MHb0baxggI0Ee0A==
X-Google-Smtp-Source: AGHT+IHetDpaeSCLD158eeBfnLMa77d0GWcu9KkUU/dpWWOreiarVBFn16/gIezMUQj2z9CZm6a8yQ==
X-Received: by 2002:a05:6000:40c9:b0:42b:3806:2bb7 with SMTP id ffacd0b85a97d-42e0f1e35c2mr7360017f8f.6.1764166825367;
        Wed, 26 Nov 2025 06:20:25 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba20esm40814603f8f.37.2025.11.26.06.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:20:24 -0800 (PST)
Date: Wed, 26 Nov 2025 14:20:22 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <danielt@kernel.org>,
	Doug Anderson <dianders@chromium.org>, simona@ffwll.ch,
	airlied@gmail.com, alexander.deucher@amd.com,
	christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org,
	deller@gmx.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, jason.wessel@windriver.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nir Lichtman <nir@lichtman.org>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
Message-ID: <aScMprMh6Eh4JU5D@aspen.lan>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
 <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
 <aSbwWLTLe0bMhOKV@aspen.lan>
 <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054f60ca-b898-488f-81f4-14eed0a1360b@suse.de>

On Wed, Nov 26, 2025 at 02:32:32PM +0100, Thomas Zimmermann wrote:
> Hi
>
> Am 26.11.25 um 13:19 schrieb Daniel Thompson:
> > On Tue, Nov 25, 2025 at 07:26:33AM -0800, Doug Anderson wrote:
> > > On Tue, Nov 25, 2025 at 5:06 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > <snip>
> > > > Therefore remove the remaining support for kdb from the DRM drivers
> > > > and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> > > > there are no fbdev drivers with kdb support.
> > > >
> > > > If we ever want to address kdb support within DRM drivers, a place to
> > > > start would be the scanout buffers used by DRM's panic screen. These
> > > > use the current display mode. They can be written and flushed without
> > > > mode setting involved.
> > > >
> > > > Note: kdb over serial lines is not affected by this series and continues
> > > > to work as before.
> > > >
> > > > Thomas Zimmermann (5):
> > > >    drm/amdgpu: Do not implement mode_set_base_atomic callback
> > > >    drm/nouveau: Do not implement mode_set_base_atomic callback
> > > >    drm/radeon: Do not implement mode_set_base_atomic callback
> > > >    drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
> > > >    fbcon: Remove fb_debug_enter/_leave from struct fb_ops
> > > Personally, I've never worked with kdb over anything other than
> > > serial, so this won't bother any of my normal workflows. That being
> > > said, at least as of a year ago someone on the lists was talking about
> > > using kdb with a keyboard and (presumably) a display. You can see a
> > > thread here:
> > >
> > > http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org
> > >
> > > Daniel may also have comments here?
> > TL;DR - I'm pretty relaxed about these changes... but I'd like
> >          to know how to test the changes.
> >
> > Like Doug I only really use kdb via serial but, since I'm maintain
> > the thing I do occasionally test kdb works on the qemu console. I don't
> > do it very often though because it's a manual test!
> >
> > I'd assume that will still work since it won't involve any of the
> > drivers above. I'm afraid I can't double check that since patch 4
> > doesn't apply cleanly in v6.18-rc7 (nor to linux-next... and neither
> > does the base-commit appear in linux-next).
>
> To test its effects, ignore this series and simply clear the two calbacks at
> [1]. This is where the debugger invokes fbcon. The series removes their
> implementation in the final patch.
>
> [1] https://elixir.bootlin.com/linux/v6.17.9/source/drivers/video/fbdev/core/fbcon.c#L3202

Thanks. Explanation in original cover letter was great and there's
certainly been no harm to QEMU.

Acked-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
